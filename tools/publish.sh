#!/usr/bin/env bash
# Build and publish the site. One entry point for the steps that otherwise
# live in the Makefile and tools/deploy.sh.
#
#   tools/publish.sh            build, check, deploy (the usual path)
#   tools/publish.sh build      build public/ in this checkout
#   tools/publish.sh check      sanity-check this checkout's public/
#   tools/publish.sh dry-run    build HEAD, check, show what rsync would change
#
# A deploy ships only committed, pushed work: it refuses uncommitted changes,
# pushes, and builds in a clean worktree of HEAD, so gitignored files can't
# ship either. It holds a lock so two sessions can't deploy at once.
# tools/deploy.sh then tags it and checks the live site.
#
# A deploy also counts itself: data/build.toml's number goes up before the
# build, the footer shows "Build N · hash" ("Build dev" on the dev server),
# and once the site has shipped the bump is committed as "Publishes build N."
# and pushed. If the deploy stops before shipping, the number goes back.
set -euo pipefail

cd "$(dirname "$0")/.."
ROOT="$PWD"

themes/hugo-warped/tools/check-hugo.sh
tools/goodreads.sh remind

usage() {
  sed -n '5,13p' "$0" | sed 's/^# \{0,1\}//'
}

# --cleanDestinationDir: drop anything in public/ this build didn't write
# (old drafts, deleted pages) so rsync --delete can't ship it.
hugo_build() {
  echo "Building site..."
  hugo --minify --cleanDestinationDir
}

# A worktree of HEAD with the two submodules a build needs (cdn/ is
# preview-only). --reference reuses this checkout's objects, so only the first
# fetch is real work. HUGO_RESOURCEDIR shares the processed-image cache.
WORKTREE=.build/deploy-worktree
remove_worktree() {
  git worktree remove --force "$WORKTREE" 2>/dev/null || rm -rf "$WORKTREE"
  git worktree prune
}

make_worktree() {
  remove_worktree
  mkdir -p "$(dirname "$WORKTREE")"
  git worktree add -q --detach "$WORKTREE" HEAD
  MADE_WORKTREE=1
  local sub
  for sub in themes/w42 themes/hugo-warped; do
    git -C "$WORKTREE" submodule --quiet update --init --reference "$ROOT/$sub" -- "$sub"
  done
  if [[ -f tools/config.toml ]]; then cp tools/config.toml "$WORKTREE/tools/config.toml"; fi
  echo "Building from a clean worktree of HEAD ($(git rev-parse --short HEAD))."
}

# Moves into the worktree, so tools/deploy.sh ships its public/ from there.
# The build number comes from this checkout (a deploy has just bumped it);
# HUGO_PARAMS_BUILDHASH reaches the footer as site.Params.buildhash.
build_in_worktree() {
  cp "$BUILD_FILE" "$WORKTREE/$BUILD_FILE"
  cd "$WORKTREE"
  export HUGO_RESOURCEDIR="$ROOT/resources"
  export HUGO_PARAMS_BUILDHASH="$(git rev-parse --short HEAD)"
  hugo_build
  check
}

cleanup() {
  cd "$ROOT"
  if [[ -n "${BUILD_BUMPED:-}" ]]; then restore_build; fi
  if [[ -n "${MADE_WORKTREE:-}" ]]; then remove_worktree; fi
  rm -rf "$LOCK"
}

# Refuse to ship a public/ that came from a dev server or a draft build.
check() {
  if [[ ! -d public ]]; then
    echo "error: public/ not found; run 'tools/publish.sh build' first." >&2
    exit 1
  fi

  local hits
  hits=$(grep -rlE 'localhost:131[34]|livereload\.js' public 2>/dev/null | head -5 || true)
  if [[ -n "$hits" ]]; then
    echo "error: public/ contains dev-server output (localhost / livereload):" >&2
    echo "$hits" | sed 's/^/  /' >&2
    echo "Rebuild with 'tools/publish.sh build' before deploying." >&2
    exit 1
  fi

  if [[ ! -f public/index.html ]]; then
    echo "error: public/index.html missing; the build looks incomplete." >&2
    exit 1
  fi

  # Drafts are preview-only. `hugo list drafts` gives each draft's permalink;
  # none of them may exist in public/.
  local drafts
  drafts=$(hugo list drafts 2>/dev/null | python3 -c '
import csv, os, sys
from urllib.parse import urlparse
for row in csv.DictReader(sys.stdin):
    path = urlparse(row["permalink"]).path.strip("/")
    if os.path.exists(os.path.join("public", path, "index.html")):
        print(row["path"])
' | head -5)
  if [[ -n "$drafts" ]]; then
    echo "error: public/ contains draft posts:" >&2
    echo "$drafts" | sed 's/^/  /' >&2
    echo "Rebuild with 'tools/publish.sh build' (buildDrafts must be false)." >&2
    exit 1
  fi

  echo "Checked public/: ok."
}

# One deploy at a time: a second session waits up to 10 minutes. A lock whose
# process is gone is taken over.
LOCK=resources/.deploy.lock
lock() {
  mkdir -p resources
  local waited=0
  until mkdir "$LOCK" 2>/dev/null; do
    if ! kill -0 "$(cat "$LOCK/pid" 2>/dev/null)" 2>/dev/null; then
      rm -rf "$LOCK"
      continue
    fi
    if (( waited == 0 )); then echo "Waiting for another deploy to finish..."; fi
    if (( waited >= 600 )); then
      echo "error: another deploy has held $LOCK for 10 minutes." >&2
      exit 1
    fi
    sleep 5
    waited=$((waited + 5))
  done
  echo $$ > "$LOCK/pid"
  trap cleanup EXIT
}

# Uncommitted work doesn't ship. Untracked files inside the theme submodule
# don't count.
require_clean() {
  local dirty
  dirty=$(git status --porcelain --ignore-submodules=untracked)
  if [[ -n "$dirty" ]]; then
    echo "error: uncommitted changes; commit them before deploying:" >&2
    echo "$dirty" | sed 's/^/  /' >&2
    exit 1
  fi
}

# What goes live is on GitHub too.
push() {
  git push -q
  if [[ -n "$(git rev-list @{u}..HEAD)" ]]; then
    echo "error: HEAD isn't on origin after the push." >&2
    exit 1
  fi
}

# A dry run builds HEAD, like a deploy; say what it leaves out.
warn_dirty() {
  if [[ -n "$(git status --porcelain --ignore-submodules=untracked)" ]]; then
    echo "note: this checkout has uncommitted changes; they aren't in this dry run, and a deploy refuses them."
  fi
}

BUILD_FILE=data/build.toml

# Full deploys only, after require_clean. Undone by cleanup if the deploy
# stops before shipping; committed by commit_build once it has shipped.
bump_build() {
  local n
  n=$(sed -nE 's/^number = ([0-9]+)$/\1/p' "$BUILD_FILE")
  if [[ ! "$n" =~ ^[0-9]+$ ]]; then
    echo "error: can't read 'number = N' from $BUILD_FILE." >&2
    exit 1
  fi
  BUILD_NUMBER=$((n + 1))
  sed -E "s/^number = [0-9]+$/number = $BUILD_NUMBER/" "$BUILD_FILE" > "$BUILD_FILE.tmp"
  mv "$BUILD_FILE.tmp" "$BUILD_FILE"
  BUILD_BUMPED=1
  echo "Build $BUILD_NUMBER."
}

restore_build() {
  BUILD_BUMPED=""
  git checkout -- "$BUILD_FILE"
  echo "Deploy didn't ship; the build number stays at its last value." >&2
}

# tools/deploy.sh tags HEAD only after rsync succeeds, and can still fail
# afterwards (the live check). A new deploy-* tag on HEAD means the site
# shipped, so the build counts even then.
deploy_and_count() {
  local before status=0
  before=$(git tag -l 'deploy-*' --points-at HEAD)
  tools/deploy.sh || status=$?
  cd "$ROOT"
  if [[ "$(git tag -l 'deploy-*' --points-at HEAD)" != "$before" ]]; then
    BUILD_BUMPED=""
    git commit -q -m "Publishes build $BUILD_NUMBER." -- "$BUILD_FILE"
    if ! git push -q; then
      echo "warning: committed build $BUILD_NUMBER, but the push failed; run 'git push'." >&2
    fi
    echo "Published build $BUILD_NUMBER."
  fi
  return "$status"
}

cmd="${1:-all}"

case "$cmd" in
  all)
    lock
    require_clean
    push
    bump_build
    make_worktree
    build_in_worktree
    deploy_and_count
    ;;
  build)
    hugo_build
    ;;
  check)
    check
    ;;
  dry-run)
    lock
    warn_dirty
    make_worktree
    build_in_worktree
    tools/deploy.sh --dry-run
    ;;
  -h|--help|help)
    usage
    ;;
  *)
    echo "error: unknown command '$cmd'" >&2
    usage >&2
    exit 1
    ;;
esac

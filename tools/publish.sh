#!/usr/bin/env bash
# Build and publish the site. One entry point for the steps that otherwise
# live in the Makefile and tools/deploy.sh.
#
#   tools/publish.sh            build, check, deploy (the usual path)
#   tools/publish.sh build      build public/ only
#   tools/publish.sh check      sanity-check the current public/
#   tools/publish.sh dry-run    build, check, show what rsync would change
#   tools/publish.sh deploy     check and deploy the current public/ (no rebuild)
#
# Builds pull the reading list from Goodreads at most daily; READING=fresh
# pulls it now, READING=cached skips it (make build READING=fresh).
#
# A deploy ships only committed, pushed work: it refuses uncommitted changes
# (the reading cache aside, which it commits), pushes, and holds a lock so two
# sessions can't deploy at once. tools/deploy.sh then tags it and checks the
# live site.
set -euo pipefail

cd "$(dirname "$0")/.."

usage() {
  sed -n '5,17p' "$0" | sed 's/^# \{0,1\}//'
}

# --cleanDestinationDir: drop anything in public/ this build didn't write
# (old drafts, deleted pages) so rsync --delete can't ship it.
build() {
  tools/goodreads.sh "${READING:-daily}"
  echo "Building site..."
  hugo --minify --cleanDestinationDir
}

# Refuse to ship a public/ that came from a dev server or a draft build.
check() {
  if [[ ! -d public ]]; then
    echo "error: public/ not found; run 'tools/publish.sh build' first." >&2
    exit 1
  fi

  local hits
  hits=$(grep -rlE 'localhost:1313|livereload\.js' public 2>/dev/null | head -5 || true)
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

# A deploy commits the reading cache the build just refreshed, so what goes
# live is in git.
commit_reading() {
  if [[ -n "$(git status --porcelain -- data/reading.json assets/reading)" ]]; then
    git add -- data/reading.json assets/reading
    git commit -q -m "Updates the reading list." -- data/reading.json assets/reading
    echo "Committed the updated reading list."
  fi
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
  trap 'rm -rf "$LOCK"' EXIT
}

# Uncommitted work doesn't ship. The reading cache is the exception: the
# build refreshes it and commit_reading commits it. Untracked files inside
# the theme submodule don't count.
require_clean() {
  local dirty
  dirty=$(git status --porcelain --ignore-submodules=untracked -- . \
    ':!data/reading.json' ':!assets/reading')
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

# Content that isn't committed still shows in a dry run; say so.
warn_dirty() {
  if [[ -n "$(git status --porcelain -- content 2>/dev/null)" ]]; then
    echo "note: content/ has uncommitted changes; a deploy refuses them until they're committed."
  fi
}

cmd="${1:-all}"

case "$cmd" in
  all)
    lock
    require_clean
    build
    check
    commit_reading
    push
    tools/deploy.sh
    ;;
  build)
    build
    ;;
  check)
    check
    ;;
  dry-run)
    warn_dirty
    build
    check
    tools/deploy.sh --dry-run
    ;;
  deploy)
    lock
    require_clean
    check
    push
    tools/deploy.sh
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

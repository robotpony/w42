#!/usr/bin/env bash
# Start the Hugo dev server (including drafts) and open a post in the browser.
#
#   tools/preview.sh              drafts; opens the most recently created post
#   tools/preview.sh all          drafts and future-dated posts
#   tools/preview.sh [all] POST   open POST: a file, a bundle folder, or part
#                                 of a content path (e.g. a slug)
#
# A future-dated target post turns on `all` by itself, since Hugo won't
# serve it otherwise.
set -euo pipefail

FUTURE=()
POST=""
for arg in "$@"; do
  case "$arg" in
    all) FUTURE=(-F) ;;
    -*) echo "usage: tools/preview.sh [all] [post]" >&2; exit 1 ;;
    *)
      [ -z "$POST" ] || { echo "usage: tools/preview.sh [all] [post]" >&2; exit 1; }
      POST="$arg"
      ;;
  esac
done

cd "$(dirname "$0")/.."

themes/hugo-warped/tools/check-hugo.sh

# This site's port in the shared list (~/.claude/rules/site-ports.md).
PORT=1314
BASE="http://localhost:$PORT"
URL="$BASE/"

# Resolve the post to a content file. No argument means the most recently
# created page (birth time, so editing an old post doesn't steal the spot).
newest_post() {
  find content -name '*.md' ! -name '_index.md' -exec stat -f '%B %N' {} + |
    sort -rn | head -1 | cut -d' ' -f2-
}

if [ -z "$POST" ]; then
  FILE="$(newest_post)"
elif [ -f "$POST" ]; then
  FILE="$POST"
elif [ -f "$POST/index.md" ]; then
  FILE="$POST/index.md"
else
  FILE="$(find content -name '*.md' ! -name '_index.md' -path "*$POST*" -exec stat -f '%B %N' {} + |
    sort -rn | head -1 | cut -d' ' -f2-)"
  [ -n "$FILE" ] || { echo "No post matches '$POST'." >&2; exit 1; }
fi
FILE="${FILE#./}"

# `hugo list all` covers drafts and future posts. Read fields from the end of
# each CSV row: titles can contain commas, but permalink/kind/section can't.
ROW="$(hugo list all 2>/dev/null | awk -F, -v f="$FILE" '$1 == f { print; exit }')"
if [ -n "$ROW" ]; then
  PERMALINK="$(awk -F, '{ print $(NF-2) }' <<<"$ROW")"
  PUBLISH="$(awk -F, '{ print $(NF-4) }' <<<"$ROW")"
  URL="$BASE/$(sed -E 's#^https?://[^/]+/##' <<<"$PERMALINK")"
  if [[ "$PUBLISH" > "$(date -u +%Y-%m-%dT%H:%M:%SZ)" ]] && [ ${#FUTURE[@]} -eq 0 ]; then
    echo "$FILE is dated $PUBLISH; including future-dated posts."
    FUTURE=(-F)
  fi
  echo "Previewing $FILE at $URL"
else
  echo "Couldn't find $FILE in hugo's page list; opening the home page." >&2
fi

# Restart, don't reuse: a hugo server left running from an earlier session
# keeps serving stale templates and config. Stop only this site's own server
# (a hugo running from this folder); anything else on the port belongs to
# someone else, so refuse rather than kill it.
ROOT="$(pwd -P)"
for pid in $(lsof -ti tcp:$PORT -sTCP:LISTEN 2>/dev/null || true); do
  CWD="$(lsof -a -p "$pid" -d cwd -Fn 2>/dev/null | sed -n 's/^n//p' || true)"
  if [ "$(ps -o comm= -p "$pid" 2>/dev/null)" = "hugo" ] && [ "$CWD" = "$ROOT" ]; then
    echo "Stopping this site's hugo server on :$PORT (pid $pid)."
    kill "$pid"
  else
    echo "error: port $PORT is held by another process, which this script won't stop:" >&2
    echo "  pid $pid, running from ${CWD:-an unknown folder}: $(ps -o command= -p "$pid" 2>/dev/null || true)" >&2
    exit 1
  fi
done
for _ in $(seq 1 20); do
  lsof -ti tcp:$PORT -sTCP:LISTEN >/dev/null 2>&1 || break
  sleep 0.25
done
if lsof -ti tcp:$PORT -sTCP:LISTEN >/dev/null 2>&1; then
  echo "error: this site's hugo server is still on port $PORT after 5 seconds." >&2
  exit 1
fi

open_browser() {
  # Wait for the server to actually answer before opening a tab on it.
  # Opens in Chrome specifically (not the system default browser): the
  # Claude-in-Chrome extension used to check previews only sees Chrome tabs.
  for _ in $(seq 1 30); do
    if curl -sf -o /dev/null "$BASE/"; then
      open -a "Google Chrome" "$URL" 2>/dev/null || open "$URL" 2>/dev/null || xdg-open "$URL" 2>/dev/null || true
      return
    fi
    sleep 0.5
  done
}

# warped.js, warped.css, and the fonts come from the cdn/ submodule, so the
# preview works offline (tools/hugo.preview.toml). Without the submodule it
# falls back to the CDN, as a build does.
CONFIG=(--config hugo.toml)
if [ -f cdn/warped.js ]; then
  CONFIG=(--config hugo.toml,tools/hugo.preview.toml)
else
  echo "note: cdn/ isn't checked out (git submodule update --init cdn); branding loads from the CDN." >&2
fi

open_browser &

# -D: drafts. hugo.toml has buildDrafts = false, so only the preview shows them.
#
# -F (with `all`, or a future-dated target post): scheduled posts are dated
# ahead (a series goes out weekly), and Hugo skips future-dated content
# without it. Otherwise off, so the preview matches what a build would
# publish today.
#
# --disableFastRender: Fast Render Mode can go stale mid-session during heavy
# template/config editing; full rebuilds cost a little speed but never serve
# wrong content.
#
# --renderToMemory: a plain `hugo server` writes drafts straight into
# public/. `make deploy` rsyncs public/, so a running preview could ship
# drafts that were only ever meant to be served locally. Keep the server in
# memory so public/ only ever holds real builds.
exec hugo server "${CONFIG[@]}" -D ${FUTURE[@]+"${FUTURE[@]}"} --disableFastRender --renderToMemory --bind 127.0.0.1 --port "$PORT" --baseURL "$BASE/"

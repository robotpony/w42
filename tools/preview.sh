#!/usr/bin/env bash
# Start the Hugo dev server (including drafts) and open a post in the browser.
#
#   tools/preview.sh              drafts; opens the most recently created post
#   tools/preview.sh all          drafts and future-dated posts
#   tools/preview.sh [all] POST   open POST: a file, a bundle folder, or part
#                                 of a content path (e.g. a slug)
#   tools/preview.sh fresh ...    pull the reading list from Goodreads first
#
# The reading list comes from its committed cache unless asked: `fresh`, or
# READING=fresh (or daily) in the environment (make preview READING=fresh).
#
# A future-dated target post turns on `all` by itself, since Hugo won't
# serve it otherwise.
set -euo pipefail

FUTURE=()
POST=""
READING="${READING:-cached}"
for arg in "$@"; do
  case "$arg" in
    all) FUTURE=(-F) ;;
    fresh) READING=fresh ;;
    -*) echo "usage: tools/preview.sh [all] [fresh] [post]" >&2; exit 1 ;;
    *)
      [ -z "$POST" ] || { echo "usage: tools/preview.sh [all] [fresh] [post]" >&2; exit 1; }
      POST="$arg"
      ;;
  esac
done

cd "$(dirname "$0")/.."

BASE="http://localhost:1313"
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
# keeps serving stale templates and config. Stop any hugo already listening
# on the port, then start fresh.
for pid in $(lsof -ti tcp:1313 -sTCP:LISTEN 2>/dev/null || true); do
  if [ "$(ps -o comm= -p "$pid" 2>/dev/null)" = "hugo" ]; then
    echo "Stopping the hugo server already on :1313 (pid $pid)."
    kill "$pid"
  fi
done
for _ in $(seq 1 20); do
  lsof -ti tcp:1313 -sTCP:LISTEN >/dev/null 2>&1 || break
  sleep 0.25
done

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

# The reading list: cached unless asked (fresh or daily)
tools/goodreads.sh "$READING"

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
exec hugo server -D ${FUTURE[@]+"${FUTURE[@]}"} --disableFastRender --renderToMemory --bind 0.0.0.0

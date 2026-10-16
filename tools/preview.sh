#!/usr/bin/env bash
# Start the Hugo dev server (including drafts) and open it in the browser.
#
#   tools/preview.sh        drafts, but not future-dated (scheduled) posts
#   tools/preview.sh all    drafts and future-dated posts
set -euo pipefail

FUTURE=()
case "${1:-}" in
  "") ;;
  all) FUTURE=(-F) ;;
  *) echo "usage: tools/preview.sh [all]" >&2; exit 1 ;;
esac

cd "$(dirname "$0")/.."

URL="http://localhost:1313/"

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
    if curl -sf -o /dev/null "$URL"; then
      open -a "Google Chrome" "$URL" 2>/dev/null || open "$URL" 2>/dev/null || xdg-open "$URL" 2>/dev/null || true
      return
    fi
    sleep 0.5
  done
}

open_browser &

# -D: drafts. hugo.toml has buildDrafts = false, so only the preview shows them.
#
# -F (with `all`): scheduled posts are dated ahead (a series goes out
# weekly), and Hugo skips future-dated content without it. Off by default so
# the plain preview matches what a build would publish today.
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

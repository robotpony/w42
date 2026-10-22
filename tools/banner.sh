#!/usr/bin/env bash
# Generate a post banner with OpenAI's image API, crop it to the site's wide
# banner shape (1536x559, like the 2025 watercolour banners), and save it as a
# JPEG in the images repo under YYYY/MM/.
#
# Usage: tools/banner.sh [--crop top|center|bottom] <name> <prompt>
#        tools/banner.sh [--crop top|center|bottom] --from <png> <name>
#   name:   file name without extension (harvest-banner)
#   prompt: the image prompt, or - to read it from stdin (warped:banner-image
#           writes these)
#   --crop: which band of the 1536x1024 image to keep (default center)
#   --from: recrop an image this script already generated, without paying
#           for a new one; each run prints where it kept the full image
#
# The API key comes from OPENAI_API_KEY, or else from the login keychain:
#   security add-generic-password -a "$USER" -s openai-api-key -w
# BANNER_MODEL overrides the model (default gpt-image-1). IMAGES_REPO overrides
# where banners go (default ~/projects/sites/images.warpedvisions.org).
# Refuses to overwrite an existing banner.

set -euo pipefail

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  # The header comment above is the help text.
  sed -n '2,/^$/{/^$/q;s/^# \{0,1\}//;p;}' "$0"
  exit 0
fi

MODEL="${BANNER_MODEL:-gpt-image-1}"
REPO="${IMAGES_REPO:-$HOME/projects/sites/images.warpedvisions.org}"
WIDTH=1536
HEIGHT=1024
BANNER_HEIGHT=559
QUALITY=85

crop=center
from=""
while [[ "${1:-}" == --* ]]; do
  case "$1" in
    --crop) crop="${2:?--crop needs top, center, or bottom}"; shift 2 ;;
    --from) from="${2:?--from needs a png}"; shift 2 ;;
    *) echo "error: unknown option: $1" >&2; exit 1 ;;
  esac
done

name="${1:?usage: banner.sh [--crop top|center|bottom] <name> <prompt>}"
dest="$REPO/$(date +%Y/%m)/$name.jpg"
[[ -e "$dest" ]] && { echo "error: banner exists: $dest" >&2; exit 1; }

case "$crop" in
  top) offset=0 ;;
  center) offset=$(( (HEIGHT - BANNER_HEIGHT) / 2 )) ;;
  # sips silently skips a crop that reaches the last row, so stop one short.
  bottom) offset=$(( HEIGHT - BANNER_HEIGHT - 1 )) ;;
  *) echo "error: --crop must be top, center, or bottom" >&2; exit 1 ;;
esac

if [[ -n "$from" ]]; then
  [[ -f "$from" ]] || { echo "error: not found: $from" >&2; exit 1; }
  full="$from"
else
  prompt="${2:?usage: banner.sh [--crop top|center|bottom] <name> <prompt>}"
  [[ "$prompt" == "-" ]] && prompt=$(cat)

  key="${OPENAI_API_KEY:-}"
  if [[ -z "$key" ]]; then
    key=$(security find-generic-password -s openai-api-key -w 2>/dev/null || true)
  fi
  [[ -n "$key" ]] || {
    echo "error: no API key; set OPENAI_API_KEY or add openai-api-key to the keychain (see --help)" >&2
    exit 1
  }

  full="${TMPDIR:-/tmp}/banner-$name.png"
  echo "Generating $name with $MODEL (this takes a minute)..." >&2
  response=$(jq -n --arg model "$MODEL" --arg prompt "$prompt" --arg size "${WIDTH}x${HEIGHT}" \
      '{model: $model, prompt: $prompt, size: $size, quality: "high", n: 1}' |
    curl -sS https://api.openai.com/v1/images/generations \
      -H "Authorization: Bearer $key" \
      -H "Content-Type: application/json" \
      --data @-)

  if ! jq -e '.data[0].b64_json' >/dev/null <<<"$response"; then
    echo "error: $(jq -r '.error.message // "unexpected response"' <<<"$response")" >&2
    exit 1
  fi
  jq -r '.data[0].b64_json' <<<"$response" | base64 --decode >"$full"
fi

size=$(sips -g pixelWidth -g pixelHeight "$full" | awk '/pixel/ {print $2}' | paste -sd x -)
[[ "$size" == "${WIDTH}x${HEIGHT}" ]] || {
  echo "error: expected ${WIDTH}x${HEIGHT}, got $size: $full" >&2
  exit 1
}

mkdir -p "$(dirname "$dest")"
sips -s format jpeg -s formatOptions "$QUALITY" \
  --cropOffset "$offset" 0 -c "$BANNER_HEIGHT" "$WIDTH" \
  "$full" --out "$dest" >/dev/null
got=$(sips -g pixelHeight "$dest" | awk '/pixel/ {print $2}')
[[ "$got" == "$BANNER_HEIGHT" ]] || {
  rm -f "$dest"
  echo "error: crop failed (got height $got)" >&2
  exit 1
}

echo "Full image: $full (recrop with --from)" >&2
echo "Banner: $dest"
echo "URL: https://images.warpedvisions.org/${dest#"$REPO"/}"

#!/usr/bin/env bash
# Generate a post banner with OpenAI's image API, crop it to the site's wide
# banner shape (1536x559, like the 2025 watercolour banners), and save it as a
# JPEG in the images repo under YYYY/MM/.
#
# Usage: tools/banner.sh [--crop top|center|bottom] <name> <prompt>
#        tools/banner.sh [--crop top|center|bottom] --from <png> <name>
#        tools/banner.sh --check
#   name:   file name without extension (harvest-banner)
#   prompt: the image prompt, or - to read it from stdin (warped:banner-image
#           writes these)
#   --crop: which band to keep when the image is taller than the banner
#           (default center); a fresh 1536x560 image loses one row either way
#   --from: recrop an image this script already generated, without paying
#           for a new one; each run prints where it kept the full image
#   --check: test the key setup for free (finds the key, checks its length,
#           and asks OpenAI which image models it can use); never prints it
#
# The API key comes from OPENAI_API_KEY, or else from the login keychain. Copy
# the key, save it from the clipboard (a bare -w prompt cuts it at 128
# characters), then run --check. Full setup: tools/IMAGES.md.
#   security add-generic-password -U -a "$USER" -s openai-api-key -w "$(pbpaste)"
# BANNER_MODEL overrides the model (default gpt-image-2.6-sunburst).
# IMAGES_REPO overrides where banners go (default
# ~/projects/sites/images.warpedvisions.org).
# Refuses to overwrite an existing banner.

set -euo pipefail

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  # The header comment above is the help text.
  sed -n '2,/^$/{/^$/q;s/^# \{0,1\}//;p;}' "$0"
  exit 0
fi

# Sets $key and $key_source, or exits with setup help.
find_key() {
  key="${OPENAI_API_KEY:-}" key_source="OPENAI_API_KEY"
  if [[ -z "$key" ]]; then
    key=$(security find-generic-password -s openai-api-key -w 2>/dev/null || true)
    key_source="keychain item openai-api-key"
  fi
  [[ -n "$key" ]] || {
    echo "error: no API key; set OPENAI_API_KEY or add openai-api-key to the keychain (see tools/IMAGES.md)" >&2
    exit 1
  }
}

MODEL="${BANNER_MODEL:-gpt-image-2.6-sunburst}"

if [[ "${1:-}" == "--check" ]]; then
  find_key
  echo "Key: from $key_source, ${#key} characters, ends ${key: -4}"
  # The keychain's -w prompt keeps 128 characters; sk-proj- keys run about 164.
  if [[ ${#key} -eq 128 || "$key" =~ [[:space:]] ]]; then
    echo "error: the key looks cut short or has stray spaces; save it again from the clipboard (tools/IMAGES.md)" >&2
    exit 1
  fi
  models=$(curl -sS https://api.openai.com/v1/models -H "Authorization: Bearer $key")
  if jq -e '.error' >/dev/null <<<"$models"; then
    echo "error: OpenAI refused the key: $(jq -r '.error.message' <<<"$models" | sed -E 's/sk-[A-Za-z0-9_*-]+/sk-…/')" >&2
    exit 1
  fi
  echo "Image models: $(jq -r '[.data[].id | select(startswith("gpt-image"))] | sort | join(", ")' <<<"$models")"
  if jq -e --arg m "$MODEL" 'any(.data[]; .id == $m)' >/dev/null <<<"$models"; then
    echo "OK: $MODEL is available. (Organization verification, if needed, only shows on a real call.)"
  else
    echo "error: $MODEL isn't in the key's model list; set BANNER_MODEL to one above, or check the project's Limits" >&2
    exit 1
  fi
  exit 0
fi
REPO="${IMAGES_REPO:-$HOME/projects/sites/images.warpedvisions.org}"
WIDTH=1536
# Ask for the banner shape itself (sizes must be multiples of 16), then trim a row.
HEIGHT=560
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
[[ "$crop" =~ ^(top|center|bottom)$ ]] || { echo "error: --crop must be top, center, or bottom" >&2; exit 1; }

if [[ -n "$from" ]]; then
  [[ -f "$from" ]] || { echo "error: not found: $from" >&2; exit 1; }
  full="$from"
else
  prompt="${2:?usage: banner.sh [--crop top|center|bottom] <name> <prompt>}"
  [[ "$prompt" == "-" ]] && prompt=$(cat)

  find_key

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

width=$(sips -g pixelWidth "$full" | awk '/pixel/ {print $2}')
height=$(sips -g pixelHeight "$full" | awk '/pixel/ {print $2}')
[[ "$width" == "$WIDTH" ]] && (( height > BANNER_HEIGHT )) || {
  echo "error: expected ${WIDTH} wide and over ${BANNER_HEIGHT} tall, got ${width}x${height}: $full" >&2
  exit 1
}

case "$crop" in
  top) offset=0 ;;
  center) offset=$(( (height - BANNER_HEIGHT) / 2 )) ;;
  # sips silently skips a crop that reaches the last row, so stop one short.
  bottom) offset=$(( height - BANNER_HEIGHT - 1 )) ;;
esac

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

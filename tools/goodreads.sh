#!/usr/bin/env bash
# Refresh the reading cache from Goodreads: data/reading.json (every book on
# the read and currently-reading shelves) and its covers in assets/reading/.
# Both are committed, so the site builds from the cache and never from
# Goodreads. The theme's reading partial shows the newest few.
#
#   tools/goodreads.sh            fetch now
#   tools/goodreads.sh --daily    fetch only if the last fetch was a day ago
#
# The cache only grows: a book that leaves the feeds keeps its entry (a book
# no longer on currently-reading loses that shelf, so it stops showing as
# "reading now"). A failed fetch warns and leaves the cache alone; it never
# fails a build.
set -euo pipefail

cd "$(dirname "$0")/.."

USER_ID=111965143
STAMP=resources/.goodreads-fetched

if [ "${1:-}" = "--daily" ] && [ -n "$(find "$STAMP" -mtime -1 2>/dev/null)" ]; then
  exit 0
fi

mkdir -p assets/reading resources
if python3 -I - "$USER_ID" <<'EOF'
import json, os, re, sys, urllib.request
import xml.etree.ElementTree as ET
from concurrent.futures import ThreadPoolExecutor
from email.utils import parsedate_to_datetime

user = sys.argv[1]
DATA = "data/reading.json"
COVERS = "assets/reading"
UA = {"User-Agent": "warpedvisions.org reading cache"}


def get(url):
    req = urllib.request.Request(url, headers=UA)
    with urllib.request.urlopen(req, timeout=30) as r:
        return r.read()


def shelf(name):
    """Every item on a shelf; the feed pages 100 at a time."""
    items, page = [], 1
    while True:
        url = f"https://www.goodreads.com/review/list_rss/{user}?shelf={name}&page={page}"
        batch = list(ET.fromstring(get(url)).iter("item"))
        items += batch
        if len(batch) < 100:
            return items
        page += 1


def date(s):
    return parsedate_to_datetime(s).date().isoformat() if s.strip() else ""


def short_title(t):
    # "Neuromancer (Sprawl #1)" -> "Neuromancer"; "Ask Iwata: Words of..." -> "Ask Iwata"
    t = re.sub(r"\s*\([^)]*\)\s*$", "", t)
    return t.split(": ")[0].strip()


def book(item, shelf_name):
    f = lambda tag: (item.findtext(tag) or "").strip()
    read, added = date(f("user_read_at")), date(f("user_date_added"))
    cover = f("book_large_image_url") or f("book_medium_image_url")
    return {
        "id": f("book_id"),
        "title": short_title(f("title")),
        "full_title": f("title"),
        "author": " ".join(f("author_name").split()),
        "rating": int(f("user_rating") or 0),
        "read": read,
        "added": added,
        # finished date for sorting; many older books have no read date
        "date": read or added,
        "shelf": shelf_name,
        "url": f"https://www.goodreads.com/book/show/{f('book_id')}",
        "_cover_url": "" if "nophoto" in cover else cover,
    }


try:
    fresh = [book(i, "currently-reading") for i in shelf("currently-reading")]
    fresh += [book(i, "read") for i in shelf("read")]
except Exception as e:
    print(f"warning: Goodreads fetch failed ({e}); keeping the cached reading list.", file=sys.stderr)
    sys.exit(1)

try:
    with open(DATA) as fh:
        cache = {b["id"]: b for b in json.load(fh)["books"]}
except FileNotFoundError:
    cache = {}

# Shelves come from this fetch; anything not on a shelf now keeps its entry
for b in cache.values():
    b["shelf"] = ""


def fetch_cover(b):
    path = f"{COVERS}/{b['id']}.jpg"
    if not os.path.exists(path) and b["_cover_url"]:
        try:
            data = get(b["_cover_url"])
            with open(path, "wb") as fh:
                fh.write(data)
        except Exception as e:
            print(f"warning: no cover for {b['title']} ({e})", file=sys.stderr)
    return path if os.path.exists(path) else ""


with ThreadPoolExecutor(8) as pool:
    paths = list(pool.map(fetch_cover, fresh))

for b, path in zip(fresh, paths):
    del b["_cover_url"]
    b["cover"] = os.path.relpath(path, "assets") if path else ""
    # a book shelved twice (re-read) keeps the currently-reading entry
    if cache.get(b["id"], {}).get("shelf") != "currently-reading":
        cache[b["id"]] = b

books = sorted(cache.values(), key=lambda b: (b["date"], b["id"]), reverse=True)
out = {"profile": f"https://www.goodreads.com/user/show/{user}", "books": books}
with open(DATA, "w") as fh:
    json.dump(out, fh, indent=1, ensure_ascii=False)
    fh.write("\n")

counts = {s: sum(b["shelf"] == s for b in books) for s in ("currently-reading", "read")}
print(f"Reading list: {counts['currently-reading']} reading, {counts['read']} read, {len(books)} cached.")
EOF
then
  touch "$STAMP"
fi

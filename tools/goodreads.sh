#!/usr/bin/env bash
# Import the reading list from a Goodreads library export into data/reading.json
# (every book on the read and currently-reading shelves), with covers in
# assets/reading/. Both are committed, so the site always builds from them.
# Goodreads' RSS feeds went away around November 2026, and the export is a
# manual download: https://www.goodreads.com/review/import (Export Library).
#
#   tools/goodreads.sh import [file]   default: goodreads_library_export.csv
#
# The export holds reviews and the to-read shelf, so it's gitignored and only
# the fields below reach the site.
#
# The cache only grows: a book that leaves the shelves keeps its entry, without
# a shelf. Cached dates mostly win, because the export's Date Added can be the
# day a book first went on any shelf, years before it was read:
#   - a date read in the export wins; a blank one keeps the cached date
#   - a book that newly reaches read or currently-reading without a date read
#     sorts by today, so it shows as recent
#   - another edition of a book already cached on the same shelf is skipped
# Covers come from Open Library by ISBN and often miss. A book without one gets
# a blank tile; add assets/reading/<id>.jpg by hand, and the next import uses it.
set -euo pipefail

cd "$(dirname "$0")/.."

if [[ "${1:-}" != "import" || $# -gt 2 ]]; then
  echo "usage: tools/goodreads.sh import [file]" >&2
  exit 1
fi
FILE="${2:-goodreads_library_export.csv}"
if [[ ! -f "$FILE" ]]; then
  echo "error: $FILE not found. Download it from https://www.goodreads.com/review/import (Export Library)." >&2
  exit 1
fi

mkdir -p assets/reading
python3 -I - "$FILE" <<'EOF'
import csv, datetime, json, os, re, sys, urllib.error, urllib.request

DATA = "data/reading.json"
COVERS = "assets/reading"
SHELVES = ("currently-reading", "read")
COLUMNS = {"Book Id", "Title", "Author", "ISBN", "ISBN13", "My Rating", "Date Read", "Date Added", "Exclusive Shelf"}
TODAY = datetime.date.today().isoformat()


def short_title(t):
    # "Neuromancer (Sprawl #1)" -> "Neuromancer"; "Ask Iwata: Words of..." -> "Ask Iwata"
    t = re.sub(r"\s*\([^)]*\)\s*$", "", t)
    return t.split(": ")[0].strip()


def fields(row):
    title = row["Title"].strip()
    return {
        "title": short_title(title),
        "full_title": title,
        "author": " ".join(row["Author"].split()),
        # ratings come as 5.0; half stars round down, as the feed's did
        "rating": int(float(row["My Rating"] or 0)),
        "shelf": row["Exclusive Shelf"],
    }


def iso(s):
    return s.strip().replace("/", "-")


# ISBNs come as ="9781555581237", to keep spreadsheets from mangling them
def isbn(row):
    return (row["ISBN13"] or row["ISBN"]).strip('="')


def fetch_cover(book, row):
    path = f"{COVERS}/{book['id']}.jpg"
    if not os.path.exists(path) and isbn(row):
        url = f"https://covers.openlibrary.org/b/isbn/{isbn(row)}-L.jpg?default=false"
        req = urllib.request.Request(url, headers={"User-Agent": "warpedvisions.org reading cache"})
        try:
            with urllib.request.urlopen(req, timeout=30) as r:
                data = r.read()
            with open(path, "wb") as fh:
                fh.write(data)
        except (urllib.error.URLError, OSError) as e:
            if getattr(e, "code", None) != 404:
                print(f"warning: cover lookup failed for {book['title']} ({e})", file=sys.stderr)
    return os.path.relpath(path, "assets") if os.path.exists(path) else ""


with open(sys.argv[1], encoding="utf-8-sig", newline="") as fh:
    reader = csv.DictReader(fh)
    missing = COLUMNS - set(reader.fieldnames or [])
    if missing:
        sys.exit(f"error: {sys.argv[1]} isn't a Goodreads export; it lacks {', '.join(sorted(missing))}.")
    rows = [r for r in reader if r["Exclusive Shelf"] in SHELVES]
if not rows:
    sys.exit(f"error: {sys.argv[1]} has no books on the read or currently-reading shelves.")

try:
    with open(DATA) as fh:
        saved = json.load(fh)
except FileNotFoundError:
    saved = {"profile": "https://www.goodreads.com/user/show/111965143", "books": []}
cache = {b["id"]: b for b in saved["books"]}
before = {i: b["shelf"] for i, b in cache.items()}

# Shelves come from this export; anything not on a shelf now keeps its entry
for b in cache.values():
    b["shelf"] = ""

moved = []
new_rows = []
for row in rows:
    b = cache.get(row["Book Id"])
    if b is None:
        new_rows.append(row)
        continue
    b.update(fields(row))
    if iso(row["Date Read"]):
        b["read"] = b["date"] = iso(row["Date Read"])
    elif b["shelf"] != before[b["id"]] and not b["read"]:
        b["date"] = TODAY
    if b["shelf"] != before[b["id"]]:
        moved.append(b)
    b["cover"] = fetch_cover(b, row)

# Newest first, so the newest of two new editions is the one kept
new_rows.sort(key=lambda r: iso(r["Date Read"]) or iso(r["Date Added"]), reverse=True)
on_shelf = {(b["title"].lower(), b["author"], b["shelf"]) for b in cache.values() if b["shelf"]}
added = []
for row in new_rows:
    f = fields(row)
    key = (f["title"].lower(), f["author"], f["shelf"])
    if key in on_shelf:
        continue
    on_shelf.add(key)
    read = iso(row["Date Read"])
    b = {
        "id": row["Book Id"],
        "title": f["title"],
        "full_title": f["full_title"],
        "author": f["author"],
        "rating": f["rating"],
        "read": read,
        "added": iso(row["Date Added"]),
        "date": read or TODAY,
        "shelf": f["shelf"],
        "url": f"https://www.goodreads.com/book/show/{row['Book Id']}",
    }
    b["cover"] = fetch_cover(b, row)
    cache[b["id"]] = b
    added.append(b)

books = sorted(cache.values(), key=lambda b: (b["date"], b["id"]), reverse=True)

# Two editions cached on one shelf (a finished book joining an older read
# edition) keep only the newest entry, and the older edition's cover goes
seen, merged = set(), []
for b in books:
    key = (b["title"].lower(), b["author"], b["shelf"])
    if b["shelf"] and key in seen:
        if b["cover"] and os.path.exists(f"assets/{b['cover']}"):
            os.remove(f"assets/{b['cover']}")
        continue
    seen.add(key)
    merged.append(b)
books = merged

with open(DATA, "w") as fh:
    json.dump({"profile": saved["profile"], "books": books}, fh, indent=1, ensure_ascii=False)
    fh.write("\n")

counts = {s: sum(b["shelf"] == s for b in books) for s in SHELVES}
print(f"Reading list: {counts['currently-reading']} reading, {counts['read']} read, {len(books)} cached.")
for b in added:
    print(f"New: {b['title']} ({b['shelf']})")
for b in moved:
    print(f"Moved: {b['title']} ({before[b['id']] or 'no shelf'} to {b['shelf'] or 'no shelf'})")
for b in books:
    if b["shelf"] and not b["cover"]:
        print(f"No cover: {b['title']}; add {COVERS}/{b['id']}.jpg by hand.")
EOF

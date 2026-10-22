# /reading

Pull the reading list from Goodreads now, and commit what changed.

Usage: /reading

1. Run: `tools/goodreads.sh` (`make reading`). It fetches the read and currently-reading shelves into `data/reading.json`, with new covers in `assets/reading/`. A failed fetch warns and leaves the cache alone.
2. Report its summary line, and name the books that are new or changed shelf (`git diff data/reading.json`). Say so if nothing changed.
3. If `data/reading.json` or `assets/reading/` changed, commit just those paths as "Updates the reading list." and push.

A running preview picks up the new data without a restart. To pull as part of another run instead, use `READING=fresh` (`make preview READING=fresh`, `/preview fresh`, `make build READING=fresh`).

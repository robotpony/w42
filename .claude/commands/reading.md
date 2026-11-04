# /reading

Import the reading list from a Goodreads library export, and commit what changed.

Usage: /reading [file]

Bruce downloads the export by hand, about monthly: https://www.goodreads.com/review/import, Export Library, then the download link once it's ready. If the file isn't there, ask for it. Never commit the export: it holds reviews and the to-read shelf, and it's gitignored.

1. Run: `tools/goodreads.sh import $ARGUMENTS` (`make reading`). The default file is `goodreads_library_export.csv` in the repo root. It updates `data/reading.json` from the read and currently-reading shelves and looks up covers for new books on Open Library.
2. Report its summary, including the New, Moved and No cover lines, or say that nothing changed. A No cover line means a blank tile until Bruce adds `assets/reading/<id>.jpg` and imports again.
3. If `data/reading.json` or `assets/reading/` changed, commit just those paths as "Updates the reading list." and push. The change goes live with the next `/deploy`.

Previews and deploys print a note when the last import is over 35 days old. Each import records its date in `data/reading.json`, so it always leaves a change to commit.

A running preview picks up the new data without a restart.

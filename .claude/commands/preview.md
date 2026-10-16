# /preview

Start the Hugo development server and open it in the browser.

Usage: /preview [all]

Run: `tools/preview.sh $ARGUMENTS` (`make preview`, or `make preview-all` for `all`)

- No argument: drafts (-D), but not future-dated posts, so the preview matches what a build would publish today.
- `all`: drafts and future-dated (scheduled) posts (-F). Use it when working on a post dated ahead, such as the next post in a series.

The script stops any hugo server already on port 1313 and starts a fresh one, so the preview always reflects the current theme and config. Run it in the background; don't skip it because a server is already up.

It opens http://localhost:1313/ in Chrome once the server responds. Report the local URL when the server starts, plus the URL of any post being worked on (posts live at /blog/<year>/<path>/<slug>/). If that post is future-dated and `all` wasn't given, say it won't show and suggest `/preview all`.

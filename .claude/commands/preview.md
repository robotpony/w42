# /preview

Start the Hugo development server and open a post in the browser.

Usage: /preview [all] [post]

Run: `tools/preview.sh $ARGUMENTS` (`make preview`, or `make preview-all` for `all`)

- No post: opens the most recently created post (by file creation time, so editing an old post doesn't change the pick).
- `post`: a file, a bundle folder, or part of a content path such as a slug (`manifesto`, `not-a-chef/03`). The newest match wins.
- If the target post is future-dated, the script turns on `all` by itself.
- No `all` and no future-dated target: drafts (-D), but not future-dated posts, so the preview matches what a build would publish today.
- `all`: drafts and future-dated (scheduled) posts (-F).

The script stops any hugo server already on port 1313 and starts a fresh one, so the preview always reflects the current theme and config. Run it in the background; don't skip it because a server is already up.

It opens the post's local URL in Chrome once the server responds, and prints which file and URL it picked. Report that URL, and whether future-dated posts were included.

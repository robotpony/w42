# /deploy

Build the site and deploy it to warpedvisions.org. Running this is Bruce's go-ahead; the script's guards stand in for prompts. `/publish` is an alias.

Usage: /deploy [dry-run]

1. Run: `tools/publish.sh` (`make deploy`), or `tools/publish.sh dry-run` for `dry-run`. A deploy:
   - takes a lock, so a second session's deploy waits;
   - refuses uncommitted changes and pushes main;
   - builds HEAD in a clean worktree (`.build/deploy-worktree`) and checks it for dev-server output and drafts;
   - rsyncs by checksum with `--delete` and `--itemize-changes`, listing only real changes (keeping the host's `.dh-diag` and `favicon.gif`), writes `version.txt`, tags `deploy-YYYY-MM-DD` and pushes that tag;
   - fetches the live `version.txt` to confirm the tag.
2. If it refuses uncommitted changes, show the list and ask Bruce what to do. Don't commit his edits for him, and never flip a draft to published without his OK.
3. Before deploying a big change (many pages or a deletion in the dry run, or a new section), run the dry run first and summarise it in a line or two.
4. Report the build summary, what rsync changed (new, changed, deleted; name the pages, not every file), the tag, and the live check. If the tag push failed, retry `git push origin <tag>`.

If `tools/config.toml` is missing or lacks `[deploy]`, relay the error and point to `tools/config.toml.example`.

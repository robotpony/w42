# /lint

Validate blog posts' front matter and links.

Check all `.md` files under `content/blog/` (or only the path given). For each file, verify:

1. Required front matter fields are present: `title`, `date`, `slug`, `draft`
2. `date` parses: ISO 8601 (`2026-10-20` or `2026-10-20T09:00:00`). `TBD` or other text breaks the Hugo build; flag it as an error.
3. `slug` is kebab-case and unique within its year folder
4. `tags` is a list of plain lowercase strings (no `#` prefix)
5. `title` is sentence case (first word and proper nouns only), per the blog-writing skill
6. In a page bundle (`<folder>/index.md`), every image the post links (`![...](name.png)`) exists in the bundle, and every image in the bundle is linked from the post
7. Links to other posts (`/blog/...`) point at a post that exists under `content/`; note any target that's still a draft or future-dated, since it will 404 once this post is live
8. Leftover drafting markers in a post that isn't a draft (`draft: false` or no `draft`): `[PERSONAL ANECDOTE`, `[AUTHOR CHECK`, `[AUTHOR DECISION`, `[DETAIL PENDING`, `[IMAGE:`, `TODO`

Report files with issues, grouped by severity (build-breaking first). Files that pass cleanly should be summarized as a count, not listed individually.

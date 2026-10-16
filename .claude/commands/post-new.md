# /post-new

Create a new blog post stub in `content/blog/<year>/`.

Usage: /post-new "Post title" [series folder]

1. Ask for the date if one wasn't given; don't assume the current year (blog-writing skill rule). A date in the future schedules the post: `/preview all` shows it; `/preview` and a normal build skip it until then.
2. Derive the slug from the title (kebab-case).
3. Create a page bundle so images can sit beside the post: `content/blog/<year>/<slug>/index.md`, or `content/blog/<year>/<series>/<NN-short-name>/index.md` for a post in a series (see `content/blog/2026/not-a-chef/`).
4. Start from `archetypes/default.md`. Set `title` in sentence case (fix headline case if the user typed it), `date`, `slug`, `draft: true`, and any `tags` the user gave.
5. Report the file path and its preview URL (`http://localhost:1313/blog/<year>/[<series>/]<slug>/`). Don't commit.

For an outline or draft, follow up with `/warped:new-outline` or `/warped:draft`.

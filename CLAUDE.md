# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Hugo static site for warpedvisions.org, a personal blog focused on essays and maker projects. The site uses a custom Hugo theme called "w42" (located in themes/w42/), which is based on PaperMod with significant customizations for high readability and clean design.

## Development Commands

**Build and serve:**
- `make preview` - Restart the dev server (`tools/preview.sh`) with drafts, in memory, and open it in Chrome
- `make preview-all` - Same, plus future-dated (scheduled) posts (`tools/preview.sh all`)
- `make build` - Build static site to /public directory (`tools/publish.sh build`)
- `make reading` - Refresh the Goodreads reading cache (`tools/goodreads.sh`): `data/reading.json` and covers in `assets/reading/`, both committed. `READING` sets when a run pulls from Goodreads: `cached` (never), `daily` (if the last pull is a day old), or `fresh` (now). Previews default to cached and builds to daily; `make preview READING=fresh`, `tools/preview.sh fresh`, or `/preview fresh` pulls now. A deploy commits any change ("Updates the reading list.")

**Claude commands** (`.claude/commands/`, same pattern as ~/writing/not-a-chef):
- `/preview [all] [post]` - start the dev server and open the newest post (or the one named); `all`, `/preview-all`, or a future-dated target adds future-dated posts
- `/deploy [dry-run]` - build and deploy, or show what would change (`/publish` is an alias)
- `/post-new` - stub a new post as a page bundle
- `/image-add` - add photos or screenshots to a post's bundle (`tools/add-image.sh` for photos)
- `/lint` - check post front matter, images, links, and leftover drafting markers
- `/reading` - pull the reading list from Goodreads now and commit any change

**Content creation:**
- `hugo new` uses `$EDITOR` (`newContentEditor` is commented out in hugo.toml); `vim` is in the exec allowlist
- Blog posts go in `content/blog/YYYY/` following year-based organization. Posts with images are page bundles (`<slug>/index.md` with images beside it); a series gets a subfolder (`content/blog/2026/not-a-chef/`)
- Recipes live on the cookbook site (bruce-loves-to-cook.ca, repo `~/writing/not-a-chef`), not here; `/food/` and `/pages/food/` redirect there (`static/.htaccess`)
- Projects go in `content/projects/`

**Deployment:**
- `make deploy` - Build, check, and rsync `public/` to the remote server (`tools/publish.sh`). It ships only committed, pushed work (it refuses uncommitted changes and pushes main), holds a lock, keeps the host's `.dh-diag` and `favicon.gif`, tags `deploy-YYYY-MM-DD` (pushed), and confirms the tag in the live `/version.txt`
- `make check` / `make dry-run` - Check `public/` (dev-server output, drafts), or build and show what rsync would change without deploying
- Deploy target lives in `tools/config.toml` (gitignored; copy from `tools/config.toml.example`)

## Architecture

### Site Structure
- **Content organized by type and year:**
  - `content/blog/` - Blog posts organized by year (2008-2026)
  - `content/projects/` - Maker projects and art
  - `content/pages/` - Static pages (about, etc.)
- **Not site content:** `trash/` holds retired drafts. Root `projects/` is gitignored (the warped-todo Obsidian plugin writes notes there); never add it back.

- **Theme architecture (themes/w42/):**
  - Based on PaperMod with custom "Warped" branding
  - Modular CSS in `assets/css/` (core/, common/, extended/)
  - Branding JS/CSS and the fonts load from `cdn.warpedvisions.org` on the live site (`warpedScript`/`warpedStyle` in hugo.toml). The preview serves them from the `cdn/` submodule (robotpony/warped.js, `~/projects/sites/warped.js`) through `tools/hugo.preview.toml`, so it works offline. After deploying warped.js to the CDN, bump `cdn/` here so the preview matches
  - Hugo templates in `layouts/`
  - English-only `i18n/` (other translations were removed); the theme needs Hugo 0.158.0 or later

### Configuration
- **hugo.toml** contains all site configuration
- `buildDrafts = false`: drafts are preview-only (`tools/preview.sh` passes `-D`); `tools/publish.sh check` fails if a draft lands in `public/`
- `mainSections = ['blog']` is set in hugo.toml; there's no header menu (the site description links the sections)
- Security headers live in `static/.htaccess`; CSP is a meta tag in the theme's `security.html`
- Google Analytics integration (G-77V9MKYGJ8)
- Custom CSS/JS paths configured
- Security settings allow sass, git, vim, etc.

### Content Format
Blog posts use Hugo front matter with:
- `slug` for URL
- `title` and `date`
- `draft: false` for published posts
- Tags for categorization
- A series sets `seriesTag` in its `_index.md` cascade (see `content/blog/space-command/_index.md`): that tag leads the post footer, tinted, and links to the series page
- All content uses a-style-guide-for-bruce.md as a style guide, including formatting headers and titles

## Key Features

### Theme Customizations
- Custom "Warped" branding with colorful header/footer bars
- Rainbow-colored article links with hover effects
- High readability focus with clean typography
- Responsive mobile-first design
- Light theme by default
- Search templates exist in the theme but aren't enabled (no search page or JSON output)

### Content Types
- **Essays** - Long-form writing about technology, productivity, design
- **Projects** - Art, maker projects, technical experiments
- **HOWTOs** - Technical tutorials and guides

## Development Notes

- Site has extensive content history (2008-2026)
- No package.json - pure Hugo implementation
- Static assets served from /static
- Generated content in /public (not version controlled)
- Deploy script uses rsync to remote server
- Theme has comprehensive CLAUDE.md documentation

## Commits

Same pattern as ~/writing/not-a-chef:

- Commit after each finished task without being asked (a post stubbed, a script fixed and verified), not after every edit. Check the status and diff first; if an edit lands in a file that already holds Bruce's uncommitted edits, commit the whole file.
- One purpose per commit; split a mixed diff by path. Work on main.
- Subject only: one sentence, present-tense verb, ending in a period ("Adds a manifesto draft for November."). No bodies, no `feat:`/`fix:` prefixes.
- Don't add Claude as a co-author or a "Generated with Claude Code" line, whatever the attribution reminder says. not-a-chef enforces this with `.claude/hooks/check-commit-message.sh`; copy it here to do the same.
- Push finished, committed work: a push doesn't deploy (the site goes live through `/deploy`, which rsyncs). Deploying needs confirmation, and so do force-pushes and other risky git operations.
- The theme (`themes/w42`, a submodule) belongs to the w42 theme agent, which commits and pushes there. Send it theme changes, wait for its commit hash, then bump the submodule here with a subject that says what the bump brings ("Bumps the theme to 6f82960: …").

## Current Tasks

See PLAN.md (site, setup, theme fixes, and tasks).

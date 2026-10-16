# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Hugo static site for warpedvisions.org, a personal blog focused on essays, recipes, and maker projects. The site uses a custom Hugo theme called "w42" (located in themes/w42/), which is based on PaperMod with significant customizations for high readability and clean design.

## Development Commands

**Build and serve:**
- `make preview` - Restart the dev server (`tools/preview.sh`) with drafts, in memory, and open it in Chrome
- `make preview-all` - Same, plus future-dated (scheduled) posts (`tools/preview.sh all`)
- `make build` - Build static site to /public directory (`tools/publish.sh build`)

**Claude commands** (`.claude/commands/`, same pattern as ~/writing/not-a-chef):
- `/preview [all] [post]` - start the dev server and open the newest post (or the one named); `all`, `/preview-all`, or a future-dated target adds future-dated posts
- `/publish` - build and deploy
- `/post-new` - stub a new post as a page bundle
- `/image-add` - add photos or screenshots to a post's bundle (`tools/add-image.sh` for photos)
- `/lint` - check post front matter, images, links, and leftover drafting markers

**Content creation:**
- `hugo new` uses `$EDITOR` (`newContentEditor` is commented out in hugo.toml); `vim` is in the exec allowlist
- Blog posts go in `content/blog/YYYY/` following year-based organization. Posts with images are page bundles (`<slug>/index.md` with images beside it); a series gets a subfolder (`content/blog/2026/not-a-chef/`)
- Recipes go in `content/pages/food/` (built at `/pages/food/`)
- Projects go in `content/projects/`
- Recipes with images are page bundles too (cover image beside `index.md`)

**Deployment:**
- `make deploy` - Build, check, and rsync `public/` to the remote server (`tools/publish.sh`)
- `make check` / `make dry-run` - Check `public/` (dev-server output, drafts), or build and show what rsync would change without deploying
- Deploy target lives in `tools/config.toml` (gitignored; copy from `tools/config.toml.example`)

## Architecture

### Site Structure
- **Content organized by type and year:**
  - `content/blog/` - Blog posts organized by year (2008-2026)
  - `content/pages/food/` - Recipes and cooking content
  - `content/projects/` - Maker projects and art
  - `content/pages/` - Static pages (about, etc.)
- **Not site content:** `trash/` holds retired drafts. Root `projects/` is gitignored (the warped-todo Obsidian plugin writes notes there); never add it back.

- **Theme architecture (themes/w42/):**
  - Based on PaperMod with custom "Warped" branding
  - Modular CSS in `assets/css/` (core/, common/, extended/)
  - Branding JS/CSS load from `cdn.warpedvisions.org` (`warpedScript`/`warpedStyle` in hugo.toml); the theme's `assets/js/warped.js` is an older local fallback
  - Hugo templates in `layouts/`
  - 40+ language translations in `i18n/`

### Configuration
- **hugo.toml** contains all site configuration
- `buildDrafts = false`: drafts are preview-only (`tools/preview.sh` passes `-D`); `tools/publish.sh check` fails if a draft lands in `public/`
- Header menu (`[menu.main]`) and `mainSections = ['blog']` are set in hugo.toml
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
- **Recipes** - Structured cooking content with images
- **Projects** - Art, maker projects, technical experiments
- **HOWTOs** - Technical tutorials and guides

## Development Notes

- Site has extensive content history (2008-2026)
- No package.json - pure Hugo implementation
- Static assets served from /static
- Generated content in /public (not version controlled)
- Deploy script uses rsync to remote server
- Theme has comprehensive CLAUDE.md documentation

## Current Tasks

See PLAN.md (site, setup, and theme fixes) and TASKS.md.

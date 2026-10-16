# warpedvisions.org

A personal site by Bruce Alderson featuring essays on craft, makery, and software, along with recipes and creative projects. The site has been continuously evolving since before "weblogs" existed, serving as both a creative outlet and testing ground for new tools and techniques.

## Quick Start

```bash
# Start the development server (drafts, in memory)
make preview

# Build static site to /public directory
make build

# Build, check, and deploy to production
make deploy
```

## Content Structure

- `/content/blog/YYYY/` - Blog posts organized by year (2008-2026)
- `/content/pages/food/` - Recipes and cooking content
- `/content/projects/` - Maker projects and art
- `/content/pages/` - Static pages (about, style guide)

Not site content: `trash/` (retired drafts). Hugo doesn't build it. `projects/` is gitignored: the warped-todo Obsidian plugin writes project notes there when this folder is opened as a vault.

## Theme

The site uses a custom Hugo theme called "w42" (located in `themes/w42/`):
- Based on PaperMod with extensive customizations
- Optimized for readability and clean design
- "Warped" branding with colorful header/footer accents
- Rainbow-colored article links with hover effects
- Responsive mobile-first design

## Key Files

- `hugo.toml` - Site configuration
- `CLAUDE.md` - AI assistant guidance for code editing
- `PLAN.md` - Site, setup, and theme fixes
- `TASKS.md` - Development todo list
- `Makefile` / `tools/` - Build, preview, and deploy scripts

## Features

- Google Analytics integration
- Light theme by default
- Year-based content organization
- Drafts are preview-only: `make preview` shows them, production builds skip them
- Security headers in `static/.htaccess` (HSTS, nosniff, frame and permissions policy); CSP is a meta tag from the theme

## Building and deploying

- `make preview` — run the Hugo dev server locally (`tools/preview.sh`)
- `make build` — build the static site to `public/`
- `make deploy` — build, check, then rsync `public/` to the server (`tools/publish.sh`)

`tools/publish.sh` is the single entry point behind `make build`/`make deploy`; it also has subcommands:

- `tools/publish.sh check` (`make check`) — sanity-check the current `public/`: fails on dev-server output (`localhost:1313`, `livereload.js`) or any draft post
- `tools/publish.sh dry-run` (`make dry-run`) — build, check, and show what rsync would change without touching the server
- `tools/publish.sh deploy` — check and deploy the current `public/` without rebuilding

### Setup (per machine)

Copy `tools/config.toml.example` to `tools/config.toml` (gitignored — holds the deploy target) and fill in `[deploy] host` / `remote_path`.

For `host`, a plain `user@hostname` works, but a `~/.ssh/config` alias (with its own `IdentityFile`) is preferred over putting a username or key path in `config.toml`:

```
# ~/.ssh/config
Host warpedvisions
    HostName w42.warpedvisions.org
    User w28
    IdentityFile ~/.ssh/id_ed25519_warpedvisions
```

### Why `--renderToMemory` in preview

`hugo.toml` sets `buildDrafts = false`, and preview passes `-D`. A plain `hugo server -D` writes those drafts straight into `public/`, and `make deploy` rsyncs `public/`, so a running preview could ship drafts that were only ever meant to be served locally. `tools/preview.sh` passes `--renderToMemory` so the dev server never touches `public/`, and `tools/publish.sh check` refuses to deploy a `public/` that contains drafts.

## Development Notes

- Pure Hugo implementation (no package.json/npm)
- Static assets served from `/static`
- Generated content in `/public` (not version controlled)
- Extensive content history dating back to 2008

## Site Details

- **URL**: https://warpedvisions.org/
- **Author**: Bruce Alderson
- **Social**: [@robotpony@mas.to](https://mas.to/@robotpony)
- **Hosting**: Dreamhost (20+ years and counting)
- **Generator**: Hugo (previously Wordpress, Jekyll, Movable Type, Blosxom, and many others)

Site, setup, and theme plan (started 2026-10-15; last reviewed 2026-11-08 on Hugo 0.169.0). Open items first, then decisions, then a short record of what's done.

## Open

- [ ] **Bring back "carved" on the About page**: it linked the retired warpedvisionsdotorg Instagram, so it's out of the "things I've" list for now. Return it when the carvings have a home (a projects page, a gallery, or posts), between "worked on" and "drawn". Later: Bruce needs to pull the carving photos first (2026-11-09). #todo

## Routine

- Import the Goodreads export about monthly (`/reading`); previews and deploys note when it's over 35 days old.
- After a warped.js CDN deploy, bump `cdn/` and the `?v=` on `warpedScript`/`warpedStyle`. A CDN change the live CSP must allow ships with or after w42, never before.
- After building on a newer Hugo, raise `tested` in `.hugo-version`.

## Decided

- Search stays off. The theme keeps the templates; enabling it later needs `[outputs] home = ['HTML','RSS','JSON']` and a `layout: search` page.
- The LLM-filter essay idea ("if it isn't good practice without an LLM, it isn't good practice with one" cuts both ways) folds into the verification debt post as its too-little-thought side (2026-11-09).
- Retired drafts are deleted with `git rm`, not archived in the repo; git history keeps them (2026-11-09).
- Food lives on the cookbook site (bruce-loves-to-cook.ca, the not-a-chef repo); `/pages/food/` and `/food/` redirect there.
- Essay pages carry no sidebars or promos, out of respect for readers. Index pages and About can (2026-10-18).
- `warped.js`/`warped.css` and the fonts come from `cdn.warpedvisions.org`; the theme carries no copy, and the preview serves them from `cdn/`.
- Eng logs aren't published here (2026-10-29).
- Reading list link wording ("Everything I've read →", "More on Goodreads →") stays for now.

## Done

- **2026-11-10**: banners from OpenAI's image API: `tools/banner.sh` on gpt-image-2.6-sunburst at 1536x560, a free `--check`, key setup in `tools/IMAGES.md` (the keychain's `-w` prompt cuts keys at 128 characters), a default no-text-or-logos guard (`--allow-marks` skips it), and banners treated as mocks for review; local options dropped.
- **2026-11-08**: plan review; phone-width test passed; `archetypes/log-format.md` (an Obsidian template) deleted; merged `hugo-warped-module` branches deleted here (the theme repo's origin copy is left to Bruce); "Built in Canada 🇨🇦" in the footer (theme f829c1a), live by deploy-2026-11-08, the first real deploy from a clean worktree. Then: the footer's "Build 42.N · hash" (theme 218522e, f348d1e; `data/build.toml` holds `series = 42` and a count seeded at 9, one per earlier deploy tag, and each deploy commits "Publishes build 42.N." once it ships), live by build 42.13; the projects sidebar renamed the projects block (theme e297503); `/lint` lets drafts leave the date empty; the images-and-visuals phase closed.
- **2026-11-04**: reading list from a Goodreads export (the RSS feeds are gone; builds never contact Goodreads); deploys build from a clean worktree of HEAD; deploy host out of committed files; commit message hook from not-a-chef.
- **2026-10-29**: `timeline`, `flow` and `tabs` fences through hugo-warped's module, theme 0.8.0, live by deploy-2026-10-29-3; banners as `banner:` front matter loaded through the theme's `imagesURL`, which the preview points at the local images repo (theme 3365b3e); preview bound to 127.0.0.1; Hugo version check before previews and builds.
- **2026-10-22**: "Recently read" shelf and `/reading/` (theme c72d0bd..021fc57); warped.js `debug` off and fonts self-hosted (warped.js ad1ba82; theme eccbda1 dropped Google Fonts).
- **2026-10-18**: "Things I've made" block (`data/projects.yaml`, `showProjects: true`); cookbook move to bruce-loves-to-cook.ca; Space Command alpha mocks; Hugo 0.168; `categories` taxonomy off; Boost post footnotes.
- **2026-10-17**: `/pages/food` retired to not-a-chef with redirects; 404 text adventure (theme 8a11b6b); 19 untagged posts tagged; TASKS.md folded in here.
- **2026-10-15**: drafts preview-only (`buildDrafts = false`, `publish.sh check` fails on drafts); config cleanup (`locale`, `mainSections`, `[cover]` under `[params]`, exec allowlist); security headers in `.htaccess`; `make check`/`dry-run`; theme cleanup for Hugo 0.158+ (no deprecation warnings), i18n trimmed to English, stale assets removed.

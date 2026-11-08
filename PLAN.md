Site, setup, and theme plan (started 2026-10-15; last reviewed 2026-11-08 on Hugo 0.169.0). Open items first, then decisions, then a short record of what's done.

## Next

- [ ] **Deploy the Goodreads import** (undeployed since deploy-2026-11-04): the export-based reading list, the 35-day import note, the commit message hook, and the first real worktree deploy (the dry run matched the live site). After `/deploy`, check `/reading/` and the home page shelf. #todo
- [ ] **Delete the merged `hugo-warped-module` branches**: local and `origin` here, and `origin` in the theme repo (theme agent). Both are merged into main/master; hugo-warped's plan tracks this across sites. Needs Bruce's OK, since it deletes remote branches. #todo
- [ ] **Test at phone width**: the section RSS link against long centred titles, inline title icons (post h1s, cards, mid-title placement), the description, and body-text icons. Bruce checks widths in dev tools. #todo

## Open

- [ ] **"Built in Canada 🇨🇦" in the footer**: the theme's footer lacks it (global rule, as on space-command.ca: `<span>Built in Canada 🇨🇦</span>` after the copyright). Theme partial, so it goes to the theme agent; it can go now rather than wait for the build number.
- [ ] **Build number in the footer** (future), as in not-a-chef: `data/build.toml` holds a publish count. `tools/publish.sh` bumps it on a full deploy, passes the commit hash as `HUGO_PARAMS_BUILDHASH`, puts the count back if the deploy fails, and commits "Publishes build N." once it succeeds. The footer shows "Build N · hash", or "Build dev" on the dev server. The worktree build means the tree is always clean, so the `+` dirty marker and the dirty-tree exception from not-a-chef aren't needed. Footer part goes to the theme agent. See `~/writing/not-a-chef/tools/publish.sh` and `layouts/partials/footer.html`.
- [ ] **Banner image options** (`tools/IMAGES.md`, three open decisions): `tools/banner.sh` (OpenAI) is untested end to end without an API key; a local option (ComfyUI with SDXL, or Draw Things) is written up but not set up. #todo
- [ ] **Future phase: images and richer visuals** (tracked 2026-10-28; ideate before any mocks). A band of small images along the top of the site, plus more visual detail elsewhere. Open: which pages get the band (essays carry no promos, so likely the home page, indexes and About), where the images come from (post banners, bundle photos, the cookbook), and what the "additional details" are. Theme work once decided. #idea
- [ ] **`archetypes/log-format.md`** is an Obsidian template (`{{title}}`, `{{date}}`), not a Hugo archetype, so `hugo new --kind log-format` fails. The eng logs it served are no longer published here (dc1985f), so delete it, or move it to the vault's templates folder.
- [ ] **Date the undated draft**: `content/blog/2026/boring-is-where-ai-earns-its-keep.md` has `date: ""`, so it sorts oddly in preview and fails `/lint`. The date goes on at publish.
- [ ] **Bring back "carved" on the About page**: it linked the retired warpedvisionsdotorg Instagram, so it's out of the "things I've" list for now. Return it when the carvings have a home (a projects page, a gallery, or posts), between "worked on" and "drawn".
- [ ] **Rename projects-sidebar in the theme**: the "Things I've made" block no longer sits in a sidebar (it's below the content at every width). Theme agent.
- [ ] **Essay idea: the LLM filter cuts both ways** (from the manifesto draft, 2026-10-25). "If it isn't good practice without an LLM, it isn't good practice with one" also cuts the other way: a lot of the ways people use LLMs don't hold up. Vibe coding a whole app from a single prompt is the silliest of them: no design written down, nothing to check the result against, and nothing to rebuild from. #idea

## Routine

- Import the Goodreads export about monthly (`/reading`); previews and deploys note when it's over 35 days old.
- After a warped.js CDN deploy, bump `cdn/` and the `?v=` on `warpedScript`/`warpedStyle`. A CDN change the live CSP must allow ships with or after w42, never before.
- After building on a newer Hugo, raise `tested` in `.hugo-version`.

## Decided

- Search stays off. The theme keeps the templates; enabling it later needs `[outputs] home = ['HTML','RSS','JSON']` and a `layout: search` page.
- `trash/` stays in the repo as an archive of retired drafts.
- Food lives on the cookbook site (bruce-loves-to-cook.ca, the not-a-chef repo); `/pages/food/` and `/food/` redirect there.
- Essay pages carry no sidebars or promos, out of respect for readers. Index pages and About can (2026-10-18).
- `warped.js`/`warped.css` and the fonts come from `cdn.warpedvisions.org`; the theme carries no copy, and the preview serves them from `cdn/`.
- Eng logs aren't published here (2026-10-29).
- Reading list link wording ("Everything I've read →", "More on Goodreads →") stays for now.

## Done

- **2026-11-04**: reading list from a Goodreads export (the RSS feeds are gone; builds never contact Goodreads); deploys build from a clean worktree of HEAD; deploy host out of committed files; commit message hook from not-a-chef.
- **2026-10-29**: `timeline`, `flow` and `tabs` fences through hugo-warped's module, theme 0.8.0, live by deploy-2026-10-29-3; banners as `banner:` front matter loaded through the theme's `imagesURL`, which the preview points at the local images repo (theme 3365b3e); preview bound to 127.0.0.1; Hugo version check before previews and builds.
- **2026-10-22**: "Recently read" shelf and `/reading/` (theme c72d0bd..021fc57); warped.js `debug` off and fonts self-hosted (warped.js ad1ba82; theme eccbda1 dropped Google Fonts).
- **2026-10-18**: "Things I've made" block (`data/projects.yaml`, `showProjects: true`); cookbook move to bruce-loves-to-cook.ca; Space Command alpha mocks; Hugo 0.168; `categories` taxonomy off; Boost post footnotes.
- **2026-10-17**: `/pages/food` retired to not-a-chef with redirects; 404 text adventure (theme 8a11b6b); 19 untagged posts tagged; TASKS.md folded in here.
- **2026-10-15**: drafts preview-only (`buildDrafts = false`, `publish.sh check` fails on drafts); config cleanup (`locale`, `mainSections`, `[cover]` under `[params]`, exec allowlist); security headers in `.htaccess`; `make check`/`dry-run`; theme cleanup for Hugo 0.158+ (no deprecation warnings), i18n trimmed to English, stale assets removed.

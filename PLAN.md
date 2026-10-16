# Plan

Site, setup, and theme review (started 2026-10-15, Hugo v0.166.0). Open items first; done items stay as a record until the next cleanup.

## Open

- [ ] **Commit the theme.** Theme changes are in the `themes/w42` working tree (submodule `robotpony/hugo-WarpedPaperMod`). Commit and push there, then commit the new submodule pointer here.
- [ ] **Verify after the next deploy:** `curl -sI https://warpedvisions.org/` shows `strict-transport-security` and `x-content-type-options` (from `static/.htaccess`); `/food/` still lands on the food page; recipe covers render.
- [ ] **Turn off `debug: true` in the CDN `warped.js`** (warped.js repo). It logs to every visitor's console.
- [ ] **Drafts with `date: ""`**: `content/blog/2026/boring-is-where-ai-earns-its-keep.md` and others. They no longer reach production, but they sort oddly in preview and fail `/lint`. Give them dates when they're scheduled.
- [ ] **`archetypes/log-format.md`** is an Obsidian template (`{{title}}`, `{{date}}`), not a Hugo archetype; `hugo new --kind log-format` would fail. Move it to the vault's templates folder, or rewrite it with Hugo syntax.
- [ ] **Deploy host in committed files**: `tools/config.toml.example` and the README name the real deploy user and host. Swap in placeholders if the repo is public.
- [ ] **TASKS.md**: fold the rest into this file, or keep it for writing tasks only.

## Decided

- Search stays off. The theme keeps the templates; enabling it later needs `[outputs] home = ['HTML','RSS','JSON']` and a `layout: search` page.
- `trash/` stays in the repo as an archive of retired drafts.
- Food stays at `content/pages/food/`; `/food/` is an alias.
- `warped.js`/`warped.css` come from `cdn.warpedvisions.org`; the theme no longer carries a copy.

## Done (2026-10-15)

Drafts:

- [x] `buildDrafts = false`. Preview still shows drafts (`-D`). Before, every draft was built and deployed, and showed on `/blog/`, tag pages, and `sitemap.xml`.
- [x] `tools/publish.sh check` fails if any draft's page exists in `public/` (uses `hugo list drafts`).

Site:

- [x] `languageCode` → `locale`; `mainSections = ['blog']`; header menu (Essays, Food, Projects, About).
- [x] `[cover]` moved under `[params]`, where the theme reads it.
- [x] Removed `disableLiveReload` (`--renderToMemory` covers the reason it existed); pruned the exec allowlist to sass, git, vim.
- [x] Tagline links `/pages/food/`; `/food/` alias added.
- [x] Recipe images moved from `static/` into their page bundles, so Hugo processes them (responsive srcset).
- [x] Removed `content/pages/_index 1.md` (Finder duplicate), `static/code.txt`, committed `resources/_gen/`, and `projects/` (warped-todo plugin output). `resources/` and `projects/` are gitignored.
- [x] `static/.htaccess` sends HSTS (no `includeSubDomains`/`preload`), nosniff, `X-Frame-Options`, and `Permissions-Policy`, wrapped in `<IfModule mod_headers.c>`.
- [x] `make check` and `make dry-run` targets.
- [x] README, CLAUDE.md, `/publish` command doc updated to match.

Theme:

- [x] `.Language.LanguageDirection` → `.Direction`, `.Language.LanguageCode` → `.Locale`; min Hugo 0.158.0. The build has no deprecation warnings.
- [x] Removed the `site.Author` fallbacks from `rss.xml`.
- [x] Removed the stale `assets/js/warped.js` and the dead `css/warped.css` fallback.
- [x] `security.html`: dropped meta tags browsers ignore (HSTS, nosniff, XSS, Permissions-Policy) and the duplicate `'unsafe-inline'`.
- [x] `go.mod` module name, `theme.toml` homepage and lineage, README lineage, CLAUDE.md.
- [x] i18n trimmed to `en.yaml`.

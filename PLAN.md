# Plan

Review of the site, setup, and theme (2026-10-15, Hugo v0.166.0). Ordered by risk. Check items off as they land; move decisions into the item once made.

## 1. Drafts ship to production (decide first)

`hugo.toml` sets `buildDrafts = true`, and `tools/publish.sh build` runs plain `hugo --minify`, so every draft is rendered and rsynced. The theme only hides drafts from the home list and RSS (`themes/w42/layouts/_default/list.html`, `rss.xml`). They still appear in:

- `/blog/` and its pagination (e.g. `product-managers-are-just-storytellers` on `/blog/`)
- every tag page they're tagged with
- `sitemap.xml`
- direct URLs, with `robots: index, follow`

The `--renderToMemory` guard in `tools/preview.sh` only protects against the dev server; the production build itself includes drafts.

Pick one:

- [ ] **A. Drafts stay local (recommended).** Set `buildDrafts = false` in `hugo.toml`. Preview already passes `-D`. Add a `check` in `tools/publish.sh` that fails if any built page came from a `draft: true` file.
- [ ] **B. Unlisted posts.** Keep drafts out of builds (as A), and for posts you want live-but-hidden use Hugo's `build: { list: never }` front matter. It removes the page from every list, tag page, RSS, and sitemap at once, without theme template filters. Then remove the ad hoc `Draft` filters from `list.html` and `rss.xml`.

Related:

- [ ] Several drafts have `date: ""`. Give them real or placeholder dates so ordering and `/lint` work.
- [ ] Close the TASKS.md item "Add proper draft mode" once this lands.

## 2. Content and repo hygiene

- [ ] Delete `content/pages/_index 1.md`, a Finder copy of the home page intro. It builds a stray `/pages/_index-1/`.
- [ ] `resources/_gen/` is committed (image cache). Add `resources/` to `.gitignore` and `git rm -r --cached resources`.
- [ ] `trash/` is committed (8 old drafts). Keep it (and say so in the README) or move it out of the repo.
- [ ] Root `projects/` holds Obsidian project notes, not site content (site projects live in `content/projects/`). Name them in the README so they aren't mistaken for content, or move them to the vault.
- [ ] `static/` has stray recipe images (`mac-cheese-beaners-1980s.png`, `spaghetti-1980s.png`) and `code.txt`. Move the images into their recipe bundles; check whether `code.txt` is still needed.
- [ ] `archetypes/log-format.md` uses Obsidian/Templater syntax (`{{title}}`, `{{date}}`). Hugo treats files in `archetypes/` as Go templates, so `hugo new --kind log-format` fails. Move it to the vault's templates folder.
- [ ] Food lives at `content/pages/food/` (built at `/pages/food/`), but the tagline links `/food`. It works live today only because the server answers `/food/` by some means outside this repo. Either move the section to `content/food/` or add `aliases: [/food/]`, so the link doesn't depend on server state.
- [ ] Decide the social link: README says Bluesky (`@robotpony.bsky.social`), the footer in `hugo.toml` says Mastodon (`mas.to/@robotpony`).

## 3. Config (`hugo.toml`)

- [ ] `languageCode` is deprecated (v0.158). Rename it to `locale = 'en-ca'` (or `en-us`).
- [ ] Set `mainSections = ['blog']` explicitly in `[params]`. Today Hugo infers it from the biggest section.
- [ ] No `[menu]` is defined, so the header renders an empty `<ul id="menu">`. Add a menu (Essays / Food / Projects / About) or drop the element from the theme.
- [ ] Search is advertised but off: there's no search page and no JSON home output. Either enable it (`[outputs] home = ['HTML','RSS','JSON']` plus a `content/search.md` with `layout: search`) or stop claiming it.
- [ ] `disableLiveReload = true` was a guard against livereload ending up in `public/`. `--renderToMemory` covers that now, so live reload can come back for preview.
- [ ] Prune `security.exec.allow`: `npx`, `postcss`, `tailwindcss`, and `go` aren't used.

## 4. Theme (`themes/w42`, submodule `robotpony/hugo-WarpedPaperMod`)

Build blockers, coming soon:

- [ ] `.Language.LanguageDirection` (baseof.html) and `.Language.LanguageCode` (rss.xml) are deprecated in v0.158. Switch to `.Language.Direction` and `.Language.Locale`.
- [ ] `rss.xml` still falls back to `site.Author`, which Hugo removed. It only works because `hugo.toml` sets `params.author`. Remove the fallback branches from the theme.

Correctness:

- [ ] `warped.js` has two diverging copies: the theme's `assets/js/warped.js` (76 lines) and the CDN copy at `cdn.warpedvisions.org` (a different, larger version with `debug: true`). The site loads the CDN copy. Pick one source of truth, and turn `debug` off in production.
- [ ] `head.html` falls back to `css/warped.css`, which doesn't exist in the theme. The CSS lives only on the CDN.
- [ ] `security.html` sends HSTS, `X-Content-Type-Options`, `X-XSS-Protection`, and `Permissions-Policy` as `<meta http-equiv>`. Browsers ignore all of these as meta tags, and the live site sends none of them as headers. Move them to a `static/.htaccess` (Dreamhost is Apache) and keep only CSP and referrer in meta. Drop `X-XSS-Protection` (obsolete). The CSP also lists `'unsafe-inline'` twice.

Cleanup:

- [ ] `go.mod` declares `module github.com/adityatelange/hugo-PaperMod`. Rename it to the fork.
- [ ] Lineage is told three ways: theme README says "based on hugo-paper", `theme.toml` says ported from Paper, docs say PaperMod. It's a PaperMod fork (which forked Paper); say that once.
- [ ] `theme.toml` `homepage` points at a GitHub Pages site that doesn't exist; `min_version` and the error in `baseof.html` still say "hugo-PaperMod".
- [ ] 45 i18n files for an English-only site. Optional: keep `en.yaml` only.
- [ ] Theme `CLAUDE.md` describes `assets/css/warped.css` and the dark-mode toggle as core. Update it after the warped.js/css decision.

## 5. Tooling

- [ ] Add `make check`, `make dry-run`, and `make lint` targets so the documented `tools/publish.sh` subcommands are reachable from make.
- [ ] `tools/publish.sh check` should also fail on draft output (after section 1).
- [ ] `tools/config.toml.example` and the README include the real deploy user and host. Fine for a private repo; swap in placeholders if the repo is public.
- [ ] Staged deletion of root `deploy.sh` plus untracked `tools/` and `Makefile`: commit them together so history shows the move.

## 6. Docs

Done in this pass: README and CLAUDE.md now match the repo (food path, year range, search, vim claim, `projects/` and `trash/`). Still to do:

- [ ] Fold TASKS.md into this file and delete it, or keep TASKS.md for writing tasks only.
- [ ] Update the theme README and CLAUDE.md after section 4.

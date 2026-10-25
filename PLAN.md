
Site, setup, and theme review (started 2026-10-15, Hugo v0.166.0). Open items first; done items stay as a record until the next cleanup.

## Open

- [ ] **Review banner image options** (`tools/IMAGES.md`): `tools/banner.sh` generates banners with OpenAI but needs an API key. A local option (ComfyUI with SDXL, or Draw Things) is written up with three open decisions. #todo
- [ ] **Essay idea: the LLM filter cuts both ways** (from the manifesto draft, 2026-10-25). "If it isn't good practice without an LLM, it isn't good practice with one" also cuts the other way: a lot of the ways people use LLMs don't hold up. Vibe coding a whole app from a single prompt is the silliest of them: no design written down, nothing to check the result against, and nothing to rebuild from. #idea
- [ ] **Bring back "carved" on the About page**: it linked the retired warpedvisionsdotorg Instagram, so it's out of the "things I've" list for now. Return it when the carvings have a home (a projects page, a gallery, or posts), linked between "worked on" and "drawn".
- [x] **Turn off `debug: true` in the CDN `warped.js`** (warped.js ad1ba82, deployed 2026-10-22 by the warped.js agent, which now owns that repo). The same deploy self-hosted the fonts; w42 serves them from the `cdn/` submodule in preview, and the theme (eccbda1) dropped Google Fonts.
- [ ] **Drafts with `date: ""`**: `content/blog/2026/boring-is-where-ai-earns-its-keep.md` and others. They no longer reach production, but they sort oddly in preview and fail `/lint`. Give them dates when they're scheduled.
- [ ] **`archetypes/log-format.md`** is an Obsidian template (`{{title}}`, `{{date}}`), not a Hugo archetype; `hugo new --kind log-format` would fail. Move it to the vault's templates folder, or rewrite it with Hugo syntax.
- [ ] **Deploy host in committed files**: `tools/config.toml.example` and the README name the real deploy user and host. Swap in placeholders if the repo is public.
- [ ] **Test at phone width**: the section RSS link against long centred titles, inline title icons (post h1s, cards, mid-title placement), the description, and body-text icons.
- [ ] **A microformat for text-and-app views** (future): the manifesto's `{{< tabs >}}` shortcode (plain text beside an app screenshot) is a stopgap. Replace it with a fenced code block and render hook in the style of ```` ```timeline ````, so the source stays plain text. That's the standard for rich blocks here. The render hook goes to the theme agent. The cookbook is waiting for this rather than adopting the shortcode (shortcodes show up as noise in Obsidian), and its Fugu theme will port whatever w42 defines.
- [ ] **Build number in the footer** (future), as in not-a-chef: `data/build.toml` holds a publish count. `tools/publish.sh` bumps it on a full deploy, passes the commit hash as `HUGO_PARAMS_BUILDHASH` (with `+` for a dirty tree), puts the count back if the deploy fails, and commits "Publishes build N." once it succeeds. The dirty-tree check skips `data/build.toml`. The footer shows "Build N · hash", or "Build dev" on the dev server. The footer is a theme partial, so that part goes to the theme agent; it lacks "Built in Canada 🇨🇦", so add it in the same change. See `~/writing/not-a-chef/tools/publish.sh` and `layouts/partials/footer.html`.
- [x] **Commit the theme.** Theme changes are in the `themes/w42` working tree (submodule `robotpony/hugo-WarpedPaperMod`). Commit and push there, then commit the new submodule pointer here. #focus
- [x] **Verify after the next deploy:** `curl -sI https://warpedvisions.org/` shows `strict-transport-security` and `x-content-type-options` (from `static/.htaccess`); `/food/` still lands on the food page; recipe covers render.
- [x] **TASKS.md** folded in here (2026-10-17); the Claude test and `hugo new` items were done (`/post-new` and friends).
- [x] **Retire `/pages/food`** (2026-10-17). 8 of the 13 went to not-a-chef as Test-kitchen drafts (uncommitted there for Bruce); 5 already existed there and were skipped. Was: Export its 13 recipes (`content/pages/food`, incl. `2024/` and `older/`) to `~/writing/not-a-chef` as drafts, remove the section, and redirect `/pages/food/` and `/food/` to bruce-loves-to-cook.warpedvisions.org in `static/.htaccess`.
- [x] **404 page** (theme 8a11b6b, `ErrorDocument` in `.htaccess`): a text adventure like not-a-chef's (`~/writing/not-a-chef/layouts/404.html`), set in a cluttered maker's shop. Theme change (the theme's `404.html` is stock), so it goes to the theme agent.
- [x] **Tag the 19 untagged posts** (approved and done) from the existing tag set. Propose a table first; Bruce approves before any edits.
- [x] **Update the Space Command alpha mocks** (done 2026-10-18, from the 0.63 build; goes live with the next deploy): the five screenshots in `content/blog/space-command/03-first-alpha/` (Today, All projects, One project, Posts, Clipboard), live at `/blog/space-command/space-command-first-alpha-in-playtest/`. Keep the filenames, or update the image lines and captions to match.

- [x] **"Things I've made" sidebar** (planned 2026-10-18). `data/projects.yaml` lists Space Command, Scorekeep, and the cookbook. It shows on index pages and About (`showProjects: true`), never on essays. It sits below the content at every width (above the pager on index pages); icons and names only on phones. The right-margin placement and the minimize bar were dropped. Theme a57de4b, cc14b4b, 64e0b72, c8f69de, bc4c40d. Bruce approved it as is (2026-10-18); renaming projects-sidebar in the theme is still open.

- [x] **Cookbook domain move** (2026-10-18): links now point to https://bruce-loves-to-cook.ca, in `hugo.toml`, `data/projects.yaml`, `static/.htaccess` (`/food/` redirects straight there), README, CLAUDE.md, the two 2026 posts, and the `/food` links in About and the 2024 back-to-basics post. Goes live with the next deploy.

- [x] **After the next deploy** (2026-10-18 review, branch `site-review-cleanup`): Hugo 0.166 → 0.168 (output identical apart from the generator tag, no warnings); `categories` taxonomy off and the 9 empty `categories: []` fields dropped (`/categories/` leaves the sitemap); the 2008 Boost post's `((footnote))` markup is now Markdown footnotes.

- [x] **"Recently read" block** (planned and deployed 2026-10-22; theme c72d0bd..021fc57). `/reading/` ("Books I’ve read") lists every finished book, 24 a page; the shelf links to it, and About's "read" does too. `/reading` and `READING=cached|daily|fresh` control Goodreads pulls. Two Goodreads editions of one book merge into the newest (four did). Link wording "Everything I've read →" and "More on Goodreads →" stays for now. On the home page and About only, never on essays, below "Things I've made". Covers as a shelf: books being read now (larger covers), then the six newest finished, with star ratings, and "More on Goodreads →". No visible heading (the aside keeps aria-label "Recently read"); it shows on every home page, /page/2 on, like the projects block. Reading now goes one per line when its columns would be under ~280px. Whitespace instead of rules: no rule after the heading or below the block, and the heading sits 24px under the projects block's line, as far as the projects sit above it. Data: `tools/goodreads.sh` caches every book on the read and currently-reading shelves (RSS, `user 111965143`) in `data/reading.json`, with covers in `assets/reading/` (~10MB), all committed; builds refresh it first and fall back to the cache if Goodreads fails. The partial and CSS are theme work.

## Decided

- Search stays off. The theme keeps the templates; enabling it later needs `[outputs] home = ['HTML','RSS','JSON']` and a `layout: search` page.
- `trash/` stays in the repo as an archive of retired drafts.
- Food moves to the cookbook site (bruce-loves-to-cook.ca, the not-a-chef repo); `/pages/food/` and `/food/` will redirect there (2026-10-17).
- Essay pages carry no sidebars or promos, out of respect for readers. Index pages and About can (2026-10-18).
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

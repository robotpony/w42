---
title: Building a cookbook with Hugo
date: 2026-10-28
draft: true
slug: building-a-cookbook-with-hugo
tags:
  - cooking
  - hugo
  - markdown
  - not-a-chef
description: ""
---

## cookbook story Tasks #todo 

- [x] needs front-mater #focus


## Outline

- I built a cookbook in hugo
- The principle was that it had to look great in plain text
- I was tired of propietary formats and hosting
- I wanted it to have rich layouts and diagrams

How it's built:

- hugo theme (main theme, then subtheme that is custom)
- hugo-warped (helpers for rendering custom formats from markdown, diagrams)

## Plan

<!--
Decided 2026-10-28. Type: Technical Reflection for Hugo builders, ~2000 words. Snippets 15 lines or less.
Thesis: the cookbook is the manifesto's rule taken seriously (/blog/2026/what-im-about-in-plain-text/): every layer exists to keep the source plain.
Replaces the six not-a-chef series drafts (commit aec6e38 has them). Facts from the not-a-chef agent, checked 2026-10-28.
Spin-offs for later: "Ten things I learned building a cookbook with agents", pictures cost 1-2 orders of magnitude more than text (the lettuce rounds), folder vs tag as an ontology rule.
-->

1. **Announce, then the rule.** Two sentences: [Bruce loves to cook](https://bruce-loves-to-cook.ca/) is live, 229 recipes. Then the history: flour-dusted binders for decades, Google Docs in lockdown, and several apps tested along the way (Paprika and other iOS/Mac apps) that kept the recipes in their own formats and hosting. Land on the manifesto's rule, *a recipe should look natural in any text editor*, and link back.
   <!-- #todo what put you off Paprika and the others: export, sync, lock-in, or layout? -->
2. **The recipe is the contract.** The Asian slaw dressing as source and as the site shows it, in a `tabs` block (not the gravy; the manifesto used it). The Mechanic moves into the sidebar; the ingredients get check-off, scaling and metric/imperial. The repo is the Obsidian vault: no CMS, no copy step.
   <!-- #todo screenshot of the slaw dressing page, light and dark, from the not-a-chef agent -->
3. **Three themes and a dialect.** `theme = ["fugu", "blowfish"]`: Hugo looks in the site, then Fugu, then Blowfish. Blowfish is scaffolding you rent (search, dark mode, RSS on day one; then a day fighting it, and 17 of 141 templates overridden). Fugu is the reusable cookbook theme, split out once its boundary was obvious. The site keeps only branding. hugo-warped is the shared fence dialect, imported by Fugu as a Hugo module. Draw it as a `flow` block (w42 draws those).
4. **Fences that don't lie.** The spec's line: a diagram must not add anything the text doesn't say. Show the Whopper `stack` raw (w42 doesn't draw stacks, so it proves the point) beside a screenshot in `tabs`. Note the Hugo gotcha: bare words after the fence type are dropped, so arguments go in `{attr="…"}`.
5. **Structure without a database.** Three layers of features "and no fourth": source, build time, client time. The backend for saved recipes was considered and deferred. Folders for what a page can only be one of, tags for what it can be several of; wiki links resolve by title. `index.json` lets agents answer questions about the collection. Full build: 1.2 s for 654 pages.
6. **Test kitchen.** `draft: true` publishes as *Test kitchen*, on purpose. A recipe is closer to source code than scripture.
7. **Three things the agents taught me.** Cherry-picked from the old lessons post:
   - Mocks as the decision log: 31 mocks, each with a dated *Decided* line, so later sessions pick decisions up cold.
   - Hooks enforce, memory guides: the co-author trailer that slipped through three commits, and the hook that ended it.
   - Verify by looking: the "maybe 50% there" pass, and the Safari window nobody was watching.
8. **You can build your own cookbook.** Hints, not a tutorial: the theme line and module import from the config, the stdlib Python tools (`frontmatter.py`, `check-fences.py`), the slash commands (`/recipe-new`, `/lint`, `/preview`, `/publish`), and rsync to a plain host. Cost: two to three weeks full time, under $25. Worth it only if you want today's printed cookbook.
9. **Close.** The trade-off first: my wife still finds the Google Drive cookbook easier to edit, and I move her recipes over by hand. Then the spread: the fence format now feeds w42 and Scorekeep, so this post's own diagrams come from the cookbook's work.

Banner: the exploded Whopper twice, as handwritten monospace lines on lined paper and as a watercolour exploded stack, with dotted leaders matching each line to its layer. In the post: the theme stack as a three-tier layer cake (Blowfish base, Fugu middle, branding icing, hugo-warped drizzled through, a recipe card on top).

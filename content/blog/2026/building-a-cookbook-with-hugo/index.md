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

## B♥2C warped post #todo 

- [ ] Find the inspiration, find the interesting (it feels very flat now)

## Outline

- I published my cookbook using Markdown and Hugo
- Why? Recipes in Markdown is simpler for nerd-me to work in, and has a durability that paper, Word, GOOGLE docs, and custom apps like Paprika had.
- The principle was that it had to look great in plain text, and edit easily
- And, it had to look great published, not just an unstructured mess
- I was tired of proprietary formats and hosting
- I wanted it to have rich layouts and diagrams, and be easy to extend
- Hugo was a big win for extensibility, as hooking into the way the text is processed was simple
- Markdown was cool, as it's text with a bit of lipstick
- It also plays well with agents, which can assess, review, and transform things quickly. Yes, I'm lazy.
- Agents were also helpful for defining how text-y diagrams can be made, and even helped me come up with ideas for icons and glyphs for things
- I've made the tools and recipe theme (as a base) free/Free for anyone to use or abuse
- The recipes are free, too, as they're nothing special (and recipes should be free anyways)

How it's built:

- A hugo child/secondary theme sits on top of Blowfish (a decent base theme with some nice features)
- A set of tools `hugo-warped` (for rendering custom formats from markdown, diagrams, etc)

History:

- I started the project of pulling recipes from paper and word docs a decade ago
- It lived in Google docs, which were pretty good, but very manual
- Oddly, sharing recipes from these docs caused friction
- It never felt like a thing, either, despite being a whole cookbook 
- It also was a pain to edit without good network access
- I started moving things from those Google docs to markdown earlier this summer
- Then I decided to test using Hugo for it
- I had used Hugo for a blog and it was pretty good, but I hadn't yet automated some of the tooling around it
- The site went together quickly, and scope exploded as I realized what was possible
- I added methods, blueprints, builds, all things entirely unnecessary to a simple cookbook
- But the goal of these features was to show off a few of the simpler families of techniques that really drive my cooking
- And to show of my favourite burger, 20+ years in exploration. And chicken burgers. And stocks. And pan sauces. Wait a minute, I fucking love cooking. And win the fridge!
- Somehow the project rekindled my love of cooking, writing about it, and even building blog-shaped things.
- As I was winding down the cookbook work, the text-y thinking exploded into YET ANOTHER project. More on this later, but it's here: https://space-command.ca (text for TODOs, not a new concept, but my take on an exoskeletal version of it)

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
   Figure: *Slaw dressing* below.
3. **Three themes and a dialect.** `theme = ["fugu", "blowfish"]`: Hugo looks in the site, then Fugu, then Blowfish. Blowfish is scaffolding you rent (search, dark mode, RSS on day one; then a day fighting it, and 17 of 141 templates overridden). Fugu is the reusable cookbook theme, split out once its boundary was obvious. The site keeps only branding. hugo-warped is the shared fence dialect, imported by Fugu as a Hugo module. Draw it as a `flow` block (w42 draws those). Figure: *Recipes list* below.
4. **Fences that don't lie.** The spec's line: a diagram must not add anything the text doesn't say. Show the Whopper `stack` raw (w42 doesn't draw stacks, so it proves the point) beside a screenshot in `tabs` (figure: *Whopper stack* below). Note the Hugo gotcha: bare words after the fence type are dropped, so arguments go in `{attr="…"}`.
5. **Structure without a database.** Three layers of features "and no fourth": source, build time, client time. The backend for saved recipes was considered and deferred. Folders for what a page can only be one of, tags for what it can be several of; wiki links resolve by title. `index.json` lets agents answer questions about the collection. Full build: 1.2 s for 654 pages.
6. **Test kitchen.** `draft: true` publishes as *Test kitchen*, on purpose. A recipe is closer to source code than scripture.
7. **Three things the agents taught me.** Cherry-picked from the old lessons post:
   - Mocks as the decision log: 31 mocks, each with a dated *Decided* line, so later sessions pick decisions up cold.
   - Hooks enforce, memory guides: the co-author trailer that slipped through three commits, and the hook that ended it.
   - Verify by looking: the "maybe 50% there" pass, and the Safari window nobody was watching.
8. **You can build your own cookbook.** Hints, not a tutorial: the theme line and module import from the config, the stdlib Python tools (`frontmatter.py`, `check-fences.py`), the slash commands (`/recipe-new`, `/lint`, `/preview`, `/publish`), and rsync to a plain host. Cost: two to three weeks full time, under $25. Worth it only if you want today's printed cookbook.
9. **Close.** The trade-off first: my wife still finds the Google Drive cookbook easier to edit, and I move her recipes over by hand. Then the spread: the fence format now feeds w42 and Scorekeep, so this post's own diagrams come from the cookbook's work.

Banner: the exploded Whopper twice, as handwritten monospace lines on lined paper and as a watercolour exploded stack, with dotted leaders matching each line to its layer. In the post: the theme stack as a three-tier layer cake (Blowfish base, Fugu middle, branding icing, hugo-warped drizzled through, a recipe card on top).

## Figures

Screenshots from the not-a-chef dev server (build 21), 2026-10-28; each has a `-dark` twin with the same crop. Excerpts are the repo's current source.

### Slaw dressing

`````tabs {layout="stack"}
tab: Text
````markdown
---
title: Asian slaw dressing
tags: [salads, quick, vegan, dairy-free, dressings]
servings: 6–8 (makes ~200 ml)
prep_time: 5 min
cuisine: Asian
---

## Mechanic

A **weight-based emulsified dressing** at 2:1 oil to acid.

```formula
oil       | Oil  | 2
: vinegar | Acid | 1
caption: By weight
bar: yes
```

## Ingredients

- 90 g extra-virgin olive oil, or a lighter neutral oil
- 45–50 g rice vinegar
- 30 g Dijon mustard
````

tab: On the site
![The Asian slaw dressing recipe on bruce-loves-to-cook.ca: ingredients as a checklist with highlighted gram amounts and a settings button for scaling and units on the left, and in the sidebar the source and times, To serve, and the Mechanic with the 2:1 oil-to-acid formula drawn as a bottle and a flask, numbers, and a bar labelled By weight](slaw-dressing.png)
`````

<!-- #todo the excerpt is trimmed (front matter, Mechanic and ingredients shortened); say so in the lead-in -->

### Whopper stack

````tabs {layout="side"}
tab: Text
```stack
bun-top + mayo     | Sesame bun, mayo           | soft, rich
lettuce-chunks     | Iceberg, torn              | cool crunch
tomato             | Vine-ripe tomato           | juicy, acid
ketchup            | Ketchup                    | sweet
onion-raw          | White onion rings          | sharp
pickle             | Dill pickle chips          | sour
patty-thin-grilled | Flame-grilled patty, 115 g | smoke, salt
bun-base + mayo    | Sesame bun, mayo           | rich, barrier
```

tab: On the site
![The Whopper build's stack drawing: the burger exploded into layers from top to bottom (sesame bun with mayo, torn iceberg, tomato, ketchup, white onion rings, dill pickle chips, a flame-grilled patty, and the bottom bun with mayo), each labelled with its role and taste](whopper-build.png)
````

### Recipes list

![The Recipes list on bruce-loves-to-cook.ca: the site's own header and logo above Fugu's card grid, where each recipe card shows cuisine and tag chips, a short description, a small ratio formula where the recipe has one, and prep and cook times](themes-layers.png)

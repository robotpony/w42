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
Revised 2026-10-29 from Bruce's new outline and history notes. Type: Technical Reflection, long (~3000 words), snippets 15 lines or less. Audience: people who cook and tinker, Hugo builders second.
Thesis (proposed): I moved my recipes into plain text so they'd last, and the text made the cookbook feel like a thing at last. Then the scope blew up, and somewhere in the methods and burger builds I reminded myself that I fucking love cooking. A reminder, not a discovery: I always loved it. The tech sections show why text made that cheap.
This replaces the 2026-10-28 plan (a2008af has it): the old thesis, "every layer exists to keep the source plain", is the manifesto's point again, which is why it read flat.
Agent lessons stay in (Bruce, 2026-10-29: keep this one long). Test kitchen (old section 6) is one line, since the manifesto already says "closer to source code than scripture".
Spin-offs for later: "Ten things I learned building a cookbook with agents", pictures cost 1-2 orders of magnitude more than text (the lettuce rounds), folder vs tag as an ontology rule.
-->

1. **Open: it's live, and it got away from me.** [Bruce loves to cook](https://bruce-loves-to-cook.ca/) is live, 229 recipes in Markdown, built with Hugo. One sentence of the turn to come: I meant to convert some files, and I built methods, blueprints, and burger builds no simple cookbook needs. No profanity yet; save it for section 4.
2. **Decades of paper, then Google Docs.** The history bullets, compressed: pulling recipes from paper and Word docs started long ago and went slowly; lockdown gave it time, in Google Docs, which were good but manual. The pains are concrete and worth keeping: sharing a recipe caused friction, editing offline was painful, and it never felt like a cookbook despite being one. Apps like Paprika kept the recipes in their own formats and hosting. This summer the move to Markdown, then a Hugo test, because the blog already ran on it (but without the tooling). Land on the manifesto's rule, *a recipe should look natural in any text editor*, plus your second half: *and it should look great published, not an unstructured mess.* Link back.
   <!-- #todo what put you off Paprika and the others: export, sync, lock-in, or layout? -->
3. **Text with a bit of lipstick.** The slaw dressing in `tabs`: the source, then the site. Markdown is the text; Hugo is the lipstick. The Mechanic moves to the sidebar, ingredients get check-off, scaling, and metric/imperial. The repo is the Obsidian vault: no CMS, no copy step. Figure: *Slaw dressing* below.
4. **Scope creep, on purpose.** The heart of the post. Methods, blueprints, and builds exist to show the families of technique that drive your cooking: pan sauces, stocks, ratios, the burger you've chased for 20+ years, chicken burgers. The Whopper `stack` raw beside the drawing in `tabs`, with the fence spec's line: a diagram must not add anything the text doesn't say. Then the reminder, in your words ("Wait a minute, I fucking love cooking"): not news, but something the project brought back. Figure: *Whopper stack* below.
   <!-- #todo "And win the fridge!": what is it, and does it get a sentence or a link? -->
5. **How it's built.** Three themes and a dialect: `theme = ["fugu", "blowfish"]`, Hugo looks in the site, then Fugu, then Blowfish. Blowfish is scaffolding you rent (search, dark mode, RSS on day one; then a day fighting it, and 17 of 141 templates overridden). Fugu is the cookbook theme, split out once its boundary was obvious; the site keeps only branding. hugo-warped is the fence dialect, a Hugo module. Your extensibility point lives here: Hugo's render hooks let a code fence become a drawing with one template, which is why the scope could blow up cheaply. One gotcha: bare words after the fence type are dropped, so arguments go in `{attr="…"}`. Draw the stack as a `flow` block. Figure: *Recipes list* below.
6. **No database.** Short: source, build time, and client time, "and no fourth" (saved recipes deferred). Folders for what a page can only be one of, tags for what it can be several of. `index.json` and the agents: they can read, review, and reshape plain text quickly ("Yes, I'm lazy"), and they helped design the text diagram formats and the icons and glyphs. Full build: 1.2 s for 654 pages. Test kitchen in one line, linking the manifesto.
7. **Three things the agents taught me.**
   - Mocks as the decision log: 31 mocks, each with a dated *Decided* line, so later sessions pick decisions up cold.
   - Hooks enforce, memory guides: the co-author trailer that slipped through three commits, and the hook that ended it.
   - Verify by looking: the "maybe 50% there" pass, and the Safari window nobody was watching.
8. **Take it.** Fugu and hugo-warped (both MIT) are free to use or abuse; the recipes are CC BY-SA, because recipes should be free and these are nothing special. Hints, not a tutorial: the theme line and module import, the stdlib Python tools (`frontmatter.py`, `check-fences.py`), the slash commands, and rsync to a plain host. Cost: two to three weeks full time, under $25.
9. **Close: the text kept spreading.** The trade-off first: my wife still finds the Google Drive cookbook easier to edit, and I move her recipes over by hand. Then the spread: the fence format now feeds w42 and Scorekeep (this post's diagrams come from the cookbook's work), and the text-first thinking became [Space Command](https://space-command.ca/), more on that later. End on what the project gave back: cooking, writing about it, and building blog-shaped things.

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

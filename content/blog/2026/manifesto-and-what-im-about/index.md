---
slug: manifesto-and-what-im-about
title: "Manifesto and what I'm about"
date: 2026-11-24
draft: true
tags:
  - writing
  - markdown
  - teaching
  - making
  - publishing
description: "" # #todo one line, e.g. "Plain text, showing the work, and making things fun: what I believe, and what I built this year to prove it."
---

#focus

<!--
DRAFT NOTES (delete before publishing)
- Type: philosophical essay, 2000-3000 words. Each section is a belief, backed by things built this year.
- Scheduled the Tuesday after the bruce-loves-to-cook series ends (Nov 17). Move it if needed.
- Title options: "What I'm about" / "A manifesto for plain text and play" / "Things I believe, and the stuff I built to prove it"
- Lines in quotes come from your notes (~/writing/me, ~/writing/not-a-chef). Keep them, rework them, or cut them.
- Source goal: ~/writing/me/log/2026-October.md
-->

I have, yet again, revived WarpedVisions. It's been my blog since the 90s, when it was more of a Kottke-style link log. It still lives on Dreamhost, less a few stints on hosted blog tools. But this post isn't about that, it's about me rediscovering who I am. I am a writer. I make software. And I fucking love text, words, and transforming them into magical things.

[#todo OPENING: the style guide keeps profanity out of opening paragraphs; save "fucking" for one later beat (the close?). "This post isn't about that, it's about..." is a not-X-but-Y setup; just say what it's about. Consider stating the beliefs as a numbered list up top (or at the close) so the manifesto reads as one, then let each section argue its line.]

I looked back at what I've built and written since spring: a cookbook, a scorekeeping app, a pile of Obsidian plugins, a summer game jam, a weather tool, a text adventure engine. Different shapes, same handful of beliefs underneath. This is my attempt to write those beliefs down, mostly so I can check my next project against them.

## Plain text is the foundation

Almost everything I make starts, and ends up, as Markdown. Designs, specifications, recipes, tasks, blog posts, game briefs, comics, and even interactive fiction. Markdown is plain text: no API, no auth, no special SDK. It opens in any editor, it diffs in git, and it'll still be readable long after today's tools are gone.

- The not-a-chef (now bruce-loves-to-cook) rule transformed my cookbook and recipe development: *"A recipe should look natural in any text editor."* Pages have to read as plain text, render in Obsidian and Hugo, and still be parseable by tools. It's fast, easy, and it gets out of my way.
- Space Command is a macOS app that finds and manages `PLAN.md` files, via `#todo`, `#idea`, and `#focus` tags straight out of my notes. The source of truth is my source and my text files, and not something else.
- Thwarter, my interactive fiction engine, builds stories from Markdown and front matter, the same way Hugo builds a site.
- And all of my blogs, comics, and repos live in text. It is the only truly durable format.

[#todo EXAMPLE: show, don't tell. A 6-10 line recipe or PLAN.md snippet with `#todo` tags in a code block proves "looks natural in any text editor" faster than the bullets do.]

My love of text started a long time ago, but the real inspiration was [John Carmack's `.plan` files](https://github.com/oliverbenns/john-carmack-plan). Around that time I read Mike Gancarz's [*The UNIX Philosophy*](https://www.goodreads.com/en/book/show/633070.The_UNIX_Philosophy), which cemented the principles. I was already working in text, but these set the foundation in my mind. Text is raw power.

I even learned `vim` at the time, something I've never regretted. It's as outdated now as it was then, but it really leans on what text does well. I learned to stack piped commands, write scripts in *Perl*, *Python*, and *Ruby*. Ruby at the time was a toy, well before it powered Web 2.0, but it felt text-y to me.

I also encountered a number of text-y tools at the time, including Blosxom, the first truely great blogging tool. I built a few versions of it, once it was no longer cool. My versions were pale comparisons of it, but then I found *Hugo*. Hugo is fast. It lives on Markdown. It extends and themes easily, and it was so much better than *WordPress*.

[#todo CARMACK: "we read these like they were important" is the line; use it. A sentence on what that felt like (a working game developer thinking out loud in a text file, and a crowd of us checking it like a newspaper) shows why text felt like power, instead of asserting it.]

[#todo FACT: "the first truly great blogging tool" invites pushback (Blogger 1999 and Movable Type 2001 predate Blosxom's 2002); "the first blogging tool I truly loved" is true and safer.]

[#todo DIAGRAM: a timeline of the text lineage: Atari BASIC → Carmack's .plan → Unix pipes/vim → Blosxom → WordPress detour → Hugo. It'd also give this long section a spine; right now it drifts from belief into reminiscence.]

## Writing is how I think

My first real computer was an Atari 600XL. I usually tell people it was a 800XL, which I got a few years later, so I don't have to explain what the difference is.

With that 600XL, not only did I get a whopping 16kb, I got a previous-generation tape drive. That tape drive was the bane of my childhood. It was also a blessing in disguise. The drive at tapes, often the sort of low quality tapes I could afford to buy at 10 years old from Radio Shack. I developed a habit of saving the games I wrote several times, and writing down the design, and to sketch out the interfaces. In the 8-bit era, sketcking interfaces was often down to the bit, for custom fonts and sprites.

Writing down design and requirements was the first real lesson I learned. That tape drive ate every copy of everything I wrote, so I re-implemented most games several times. I had all the time in the world and my brain worked best when my fingers were attached to the keyboard. I learned to type, and I learned the ins and outs of BASIC, then ASM for those machines.  I wrote dozens of games, all of which are lost to time.

I use this same pattern now, except that I use source control, and I rarely reimplement except to experiment. But I always write down design. I always mock up user and programatic interfaces.

[#todo NARRATIVE: the tape drive story is the best thing in the post, and it's about losing work, not thinking. Land the turn: writing it down started as insurance against the tape, and became the way you figure out what to build. One sentence connecting "the notebook survived when the tape didn't" to "writing is how I think" makes the header earn itself.]

[#todo OVERLAP: /pages/working-with-me-bruce-alderson/ already tells this story ("When I was 8, a flakey tape drive ate three weeks of BASIC code", the haunted mansion text adventure). Here you're 10. Pick one age. Then either keep this telling short and link that page, or borrow its sharper details (three weeks of code, magnetic spaghetti) so the two don't read as rival drafts.]

[#todo MISSING: AI as writing partner. You link the robot editor post, but say nothing here about how writing to Claude (CLAUDE.md, specs, prompts) is the same habit as the 600XL notebook: write the design down first. It's a strong bridge from 1984 to now.]

- Link: [the fight for clarity and beauty in writing](/blog/2015/the-fight-for-clarity-and-beauty-in-writing/)
- Link: [how I rekindled my love of writing](/blog/2025/how-i-rekindled-my-love-of-writing-with-a-tireless-robot-editor/)

## Show the work

The usual way to write a cookbook is to hide the work. Being me, I'd rather not hide the design and development of recipes. The bruce-loves-to-cook recipes that aren't finished are marked **Test kitchen**, and they're published on purpose. A recipe is closer to source code than scripture: it has versions, bugs, and fixes.

I also explain methods. I didn't start to grok cooking until I realized the methods were key. The French figured this out forever ago, and of course I had to rediscover it through chefs like Kenji and Chef John. Showing methods teaches people how to adapt, as recipes can rarely be truly exact. Ingredients differ, conditions like humidity differ, as does equipment, dietary needs, and so on.

- Game jam rule 4: post your updates online weekly, including specs, and prompts if used.
- Repos carry their plans, bug lists, and decision logs in the open.
- Working with AI is part of the work, so the prompts and CLAUDE.md files get shown too.

[#todo STRUCTURE: the recipe material (Test kitchen, methods over recipes) is strong, but this section slides into "teach methods", which belongs in the next section. Keep "show the work" about publishing the unfinished; move the Kenji/Chef John paragraph to "Teach by making it easier".]

[#todo PERSONAL: what showing the work has gotten you. Feedback, accountability, people learning from the messy middle?]

## Teach by making it easier

I like to say that *"I love to teach, I think."* Sometimes I'm uncertain as I'm also impatient, and it's easy to forget how I got to understanding something. You need to remember your path to describe a path to people learning, and those darned paths change with each generation of tools and humans. But I do like to teach, I think.

I remember helping a number of people learn SQL. SQL is an powerfully dense and obtuse language for asking questions about structured data. It's incredibly efficient when used properly, which requires some math-y thinking, some background, and a bunch of experience. I've always struggled to teach this to beginners. I expect that I've never thought deeply about or developed a clear plan for beginners.

My way of teaching is to write. I can write and be frustrated, and not influence anyone negatively. I just put that frustration into my writing and redraft. Once written, I can teach effectively, but those lesson plans are where the real effort is. Well, that, and in keeping those lesson plans up to date where they fall short.

- From the recipe-maker notes: teaching people to cook, and making it easier to do it well, "is a way to make a difference for many people."

[#todo MISMATCH: the header says "making it easier", but the body says you teach by writing, and the SQL story ends on a failure with no turn. SUGGESTION: rename the section "Teach by writing it down" and give it this arc: (1) SQL is the failure: you taught it live, impatient, having forgotten your own path. (2) The fix is writing: drafting absorbs the frustration, and the written lesson remembers the path you've forgotten. (3) The success is the recipes: moving "methods over recipes" (Kenji, Chef John, humidity) here shows writing that makes cooking easier for people you'll never meet. Close on the recipe-maker quote. That keeps "I love to teach, I think," turns the SQL admission into the reason for the belief, and gives "making it easier" a concrete payoff.]

## Own the press

This site has been running for close to 30 years, on more engines than I can list (see [about the site](/pages/about-warpedvisions-dot-org/)). It's always been my testing ground. Today it's Hugo, my own theme, a few scripts, and rsync to the same host I've used for decades.

- The site has no comments, on purpose: if you want to respond, write something of your own. It gets *you* writing. It also produced less noise for me.

The pipeline really matters to me. I was very proficient with WordPress from my agency days, but I never found a productive writing flow for it. I was always fighting the web UI. I couldn't `grep` it, I couldn't see it locally without a lot of setup. That opaqueness runs against the grain of how I think.

[#todo OVERLAP: /pages/about-warpedvisions-dot-org/ already makes the no-comments case ("you taking the time to write a response somewhere, linking back to me"). Link it from the comments bullet rather than restating it.]

[#todo MISSING: why owning it matters beyond workflow. Platforms that folded or changed under you (Tumblr? Write.as? Twitter?), and the IndieWeb idea of publishing on your own site first (POSSE). One concrete loss story would carry this section.]

[#todo DIAGRAM: the pipeline in one line or a small graph: Markdown in a git repo → Hugo → public/ → rsync → Dreamhost. It makes "no magic, all text" visible.]

## Research in the open

[#todo GAP: no direct statement in your notes yet. Material to draw on: comparing batches of recipes side by side to find the best one (how-to-find-great-recipes); dailyweather's notes on Environment Canada feeds; prototyping four looks for Scorekeep before choosing one. What's the belief? Maybe "try several, compare honestly, write down why".]

[#todo OPTION: if this one won't come, fold it into "Show the work" (research is showing the work before it's finished) rather than forcing a thin section. Seven beliefs is plenty.]

## Make it fun

From my game-making principles: be emotive, be funny, be fun. Lean into constraints, limits, and plot holes.

- The summer game jam: four weeks rebuilding games I played and wrote between 1980 and 1985, on PICO-8, Picotron, TIC-80, and pygame.
- Retro desktop demos, LED displays, a CD player nobody needs.
- Scorekeep's goal: "it should feel like what it is: paper." Buttery smooth over feature-complete.
- "Things that teach. Things that make you smile."

[#todo PERSONAL: "feed the muse", and why scrolling usually doesn't.]

## Craft, inch by inch

[#todo Expand: simplicity as things fitting _just so_ (from the about page). Who we are is had inch by inch, failure by failure. Tie the sections together without summarizing them.]

Finally, text is truly incremental, especially when paired with source control. Other systems can do this, but the modes are separated by human time to find them rather than the immediacy of the terminal. Yes, I realize the terminal is not great for all users, but for me it's home.

[#todo CLARITY: "the modes are separated by human time to find them" doesn't parse. Do you mean other tools have undo and history, but they're buried in menus, while `git log` and `diff` are one command away? Say that. This paragraph also belongs in "Plain text is the foundation"; this section should be about craft (fit, finish, small steps), with text as one example.]

## What this means for what's next

[#todo CLOSE: you want essay form, so skip the checklist. End on reflection: the 8-year-old with the notebook and the person writing CLAUDE.md files are doing the same thing. Then point forward with one concrete next thing (Space Command, warped-next, more writing). The about page already covers who you are, so this close can be about the habits. If the profanity moves out of the opening, this is a good place for it.]

<!--
More links to consider:
- /blog/2025/the-comfort-of-home-bases-for-creative-work/
- /blog/2026/not-a-chef/smart-content-on-plain-markdown/
- /pages/about-bruce-alderson/
- /pages/working-with-me-bruce-alderson/
-->

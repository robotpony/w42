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

I have, yet again, revived WarpedVisions. It's been my blog since the 90s, when it was more of a Kottke-style link log. It still lives on Dreamhost, less a few stints on hosted blog tools. But this post isn't about that, it's about me rediscovering who I am. I am a writer. I make software. And I love text, playing with words, and transforming them both into magical things.

I looked back at what I've built and written since spring: a cookbook, a scorekeeping app, a pile of Obsidian plugins, a summer game jam, a weather tool, a text adventure engine. Different shapes, same handful of beliefs underneath. This is my attempt to write those beliefs down, mostly so I can check my next project against them.

## Plain text is the foundation

Almost everything I make starts, and ends up, as Markdown. Designs, specifications, recipes, tasks, blog posts, game briefs, comics, and even interactive fiction. Markdown is plain text: no API, no auth, no special SDK. It opens in any editor, it diffs in git, and it'll still be readable long after today's tools are gone.

- The not-a-chef (now [bruce-loves-to-cook](https://bruce-loves-to-cook.ca/)) rule transformed my cookbook and recipe development: *"A recipe should look natural in any text editor."* Pages have to read as plain text, render in Obsidian and Hugo, and still be parseable by tools. It's fast, easy, and it gets out of my way.
- [Space Command](https://space-command.ca/) is a macOS app that finds and manages `PLAN.md` files, via `#todo`, `#idea`, and `#focus` tags straight out of my notes. The source of truth is my source and my text files, and not something else.
- [Thwarter](https://github.com/robotpony/thwarter), my interactive fiction engine, builds stories from Markdown and front matter, the same way Hugo builds a site.
- And all of my blogs, comics, and repos live in text. It is the only truly durable format.

Here's part of a plan from Space Command's demo world, a sourdough book in progress, as text and as the app shows it:

{{< tabs layout="side" >}}
{{< tab "Text" >}}
```markdown
## Drafting

- [x] Chapter 1 · Flour
- [x] Chapter 2 · Water and salt
- [ ] Chapter 3 · Starters
- [x] Chapter 4 · Mixing and folding
- [x] Chapter 5 · The first rise
- [x] Chapter 6 · Shaping
- [x] Chapter 7 · Proofing in the fridge
- [ ] Chapter 8 · Baking in a Dutch oven #focus
- [ ] Chapter 9 · When it goes wrong
```
{{< /tab >}}
{{< tab "In Space Command" >}}
![Space Command's plan view for the sourdough book: one finished phase folded into a single line, then Drafting at 6 of 9 with chapters 3, 8, and 9 left, and a #focus chip on chapter 8](space-command-plan.png)
{{< /tab >}}
{{< /tabs >}}

That's the whole format. Every checkbox in a `PLAN.md` is already a task, so it needs no tag, and `#focus` marks the chapter I'm on now. In any other note, a `#todo` at the end of a line does the same job. It reads fine in `vim`, renders in Obsidian and on GitHub, and Space Command folds the finished work away so only what's left shows, `#focus` tag and all.

```timeline
1983 Atari BASIC
1994 *The UNIX Philosophy*
1996 Carmack's `.plan` files
2002 Blosxom
~2008 WordPress, a detour
~2015 Hugo, first look
2022 Hugo
```

My love of text started a long time ago, but the real inspiration was [John Carmack's `.plan` files](https://github.com/oliverbenns/john-carmack-plan). Around that time I read Mike Gancarz's [*The UNIX Philosophy*](https://www.goodreads.com/en/book/show/633070.The_UNIX_Philosophy), which cemented the principles. I was already working in text, but these set the foundation in my mind. The idea that text could define everything, including raw design thinking was revolutionary to me. I learned that text is raw power.

I even learned `vim` at the time, something I've never regretted. It's as outdated now as it was then, but it really leans on what text does well. I learned to stack piped commands, write scripts in *Perl*, *Python*, and *Ruby*. Ruby at the time was a toy, well before it powered Web 2.0, but it felt text-y to me.

I also encountered a number of text-y tools at the time, including [Blosxom](http://www.blosxom.com/), the first truely great blogging tool. Sure, there was Blogger and Movable Type, but owning your content in a format you can search and script was something I new was special.

I built a few versions of Blosxom myself, too, once it was no longer maintained. My versions were pale comparisons of it, but then I found [*Hugo*](https://gohugo.io/). Hugo is fast. It lives on Markdown. It extends and themes easily, and it was so much better than *WordPress*.

Finally, text is truly incremental, especially when paired with source control. Other systems can do this, but the modes are separated by human time to find them rather than the immediacy of the terminal. Yes, I realize the terminal is not great for all users, but for me it's home.

[#todo CLARITY: "the modes are separated by human time to find them" doesn't parse. Do you mean other tools have undo and history, but they're buried in menus, while `git log` and `diff` are one command away? Say that. ]

## Writing is how I think

My first real computer was an Atari 600XL. I usually tell people it was a 800XL, which I got a few years later, so I don't have to explain what the difference is.

With that 600XL, not only did I get a whopping 16kb, I got a previous-generation tape drive. That tape drive was the bane of my childhood. It was also a blessing in disguise. The drive at tapes, often the sort of low quality tapes I could afford to buy at 10 years old from Radio Shack. I developed a habit of saving the games I wrote several times, and writing down the design, and to sketch out the interfaces. In the 8-bit era, sketcking interfaces was often down to the bit, for custom fonts and sprites.

Writing down design and requirements was the first real lesson I learned. That tape drive ate every copy of everything I wrote, so I re-implemented most games several times. I had all the time in the world and my brain worked best when my fingers were attached to the keyboard. I learned to type, and I learned the ins and outs of BASIC, then ASM for those machines.  I wrote dozens of games, all of which are lost to time.

I use this same pattern now, except that I use source control, and I rarely reimplement except to experiment. But I always write down design. I always mock up user and programatic interfaces.

[#todo NARRATIVE: the tape drive story is the best thing in the post, and it's about losing work, not thinking. Land the turn: writing it down started as insurance against the tape, and became the way you figure out what to build. One sentence connecting "the notebook survived when the tape didn't" to "writing is how I think" makes the header earn itself.]

[#todo TRIM: keep this telling short and let the link below carry the full story (three weeks of code, the haunted mansion, magnetic spaghetti).]

[#todo MISSING: AI as writing partner. You link the robot editor post, but say nothing here about how writing to Claude (CLAUDE.md, specs, prompts) is the same habit as the 600XL notebook: write the design down first. It's a strong bridge from 1984 to now.]

- Link: [the fight for clarity and beauty in writing](/blog/2015/the-fight-for-clarity-and-beauty-in-writing/)
- Link: [working with me](/pages/working-with-me-bruce-alderson/), for the whole tape drive story
- Link: [how I rekindled my love of writing](/blog/2025/how-i-rekindled-my-love-of-writing-with-a-tireless-robot-editor/)

## Show the work

The usual way to write a cookbook is to hide the work. Being me, I'd rather not hide the design and development of recipes. The bruce-loves-to-cook recipes that aren't finished are marked [**Test kitchen**](https://bruce-loves-to-cook.ca/reference/essays/test-kitchen/), and they're published on purpose. A recipe is closer to source code than scripture: it has versions, bugs, and fixes.

- Game jam rule 4: post your updates online weekly, including specs, and prompts if used.
- Repos carry their plans, bug lists, and decision logs in the open.
- Working with AI is part of the work, so the prompts and CLAUDE.md files get shown too.

[#todo RESEARCH: research is showing the work before it's finished. One paragraph, maybe "try several, compare honestly, write down why". Material: comparing batches of recipes side by side to find the best one (how-to-find-great-recipes); dailyweather's notes on Environment Canada feeds; prototyping four looks for Scorekeep before choosing one.]

[#todo PERSONAL: what showing the work has gotten you. Feedback, accountability, people learning from the messy middle?]

## Teach by writing it down

I like to say that *"I love to teach, I think."* Sometimes I'm uncertain as I'm also impatient, and it's easy to forget how I got to understanding something. You need to remember your path to describe a path to people learning, and those darned paths change with each generation of tools and humans. But I do like to teach, I think.

I remember helping a number of people learn SQL. SQL is an powerfully dense and obtuse language for asking questions about structured data. It's incredibly efficient when used properly, which requires some math-y thinking, some background, and a bunch of experience. I've always struggled to teach this to beginners. I expect that I've never thought deeply about or developed a clear plan for beginners.

My way of teaching is to write. I can write and be frustrated, and not influence anyone negatively. I just put that frustration into my writing and redraft. Once written, I can teach effectively, but those lesson plans are where the real effort is. Well, that, and in keeping those lesson plans up to date where they fall short.

I also explain methods. I didn't start to grok cooking until I realized the methods were key. The French figured this out forever ago, and of course I had to rediscover it through chefs like [Kenji](https://kenjilopezalt.com/) and [Chef John](https://www.foodwishes.com/). Showing methods teaches people how to adapt, as recipes can rarely be truly exact. Ingredients differ, conditions like humidity differ, as does equipment, dietary needs, and so on.

- From the recipe-maker notes: teaching people to cook, and making it easier to do it well, "is a way to make a difference for many people."

[#todo ARC: SQL is the failure (taught live, impatient, having forgotten your own path), writing is the fix (drafting absorbs the frustration, and the written lesson remembers the path), and the recipes are the payoff (methods that make cooking easier for people you'll never meet). The pieces are in order now: give the SQL paragraph its turn into the writing one, and reword "I also explain methods" to land as the payoff. Close on the recipe-maker quote.]

## Own the press

This site has been running for close to 30 years, on more engines than I can list (see [about the site](/pages/about-warpedvisions-dot-org/)). It's always been my testing ground. Today it's Hugo, my own theme, a few scripts, and rsync to the same host I've used for decades.

- The site [has no comments](/pages/about-warpedvisions-dot-org/), on purpose: if you want to respond, write something of your own. It gets *you* writing. It also produced less noise for me.

The pipeline really matters to me. I was very proficient with WordPress from my agency days, but I never found a productive writing flow for it. I was always fighting the web UI. I couldn't `grep` it, I couldn't see it locally without a lot of setup. That opaqueness runs against the grain of how I think.

[#todo TRIM: the comments bullet now links the about page, which makes the full case ("you taking the time to write a response somewhere, linking back to me"), so this bullet can stay to one line.]

[#todo MISSING: why owning it matters beyond workflow. Platforms that folded or changed under you (Tumblr? Write.as? Twitter?), and the IndieWeb idea of publishing on your own site first (POSSE). One concrete loss story would carry this section.]

[#todo DIAGRAM: the pipeline in one line or a small graph: Markdown in a git repo → Hugo → public/ → rsync → Dreamhost. It makes "no magic, all text" visible.]

## Make it fun

From my game-making principles: be emotive, be funny, be fun. Lean into constraints, limits, and plot holes.

- [The summer game jam](https://github.com/robotpony/game-jams): four weeks rebuilding games I played and wrote between 1980 and 1985, on PICO-8, Picotron, TIC-80, and pygame.
- [Retro desktop demos](https://github.com/robotpony/retro-demos), LED displays, a CD player nobody needs.
- Scorekeep's goal: "it should feel like what it is: paper." Buttery smooth over feature-complete.
- "Things that teach. Things that make you smile."

[#todo PERSONAL: "feed the muse", and why scrolling usually doesn't.]

## Craft, inch by inch

[#todo Expand: simplicity as things fitting _just so_ (from the about page). Who we are is had inch by inch, failure by failure. Craft is fit, finish, and small steps, with text as one example. Tie the sections together without summarizing them.]

## What this means for what's next

[#todo CLOSE: you want essay form, so skip the checklist. End on reflection: the 10-year-old with the notebook and the person writing CLAUDE.md files are doing the same thing. Then point forward with one concrete next thing (Space Command, warped-next, more writing). The about page already covers who you are, so this close can be about the habits. If the profanity moves out of the opening, this is a good place for it.]

<!--
More links to consider:
- /blog/2025/the-comfort-of-home-bases-for-creative-work/
- /blog/2026/not-a-chef/smart-content-on-plain-markdown/
- /pages/about-bruce-alderson/
-->

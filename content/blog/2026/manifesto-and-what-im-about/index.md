---
slug: manifesto-and-what-im-about
title: "Manifesto and what I'm about #focus"
date: 2026-10-24
draft: true
tags:
  - writing
  - markdown
  - teaching
  - making
  - publishing
description: What I believe about text, teaching, and making things, and what this year's projects taught me.
---
My first real computer was an Atari 600XL. I usually tell people it was an 800XL, which I got a few years later, so I don't have to explain the difference. With the 600XL I got a whopping 16 KB and a previous-generation Atari 410 tape drive, the older and clunkier one. 

That tape drive was the bane of my childhood. It ate tapes, the sort of low-quality ones I could afford at 10 years old, bought in bulk from Radio Shack. I learned to save each program I wrote several times, write down its design in a notebook, and sketch out its interfaces. I even sketched fonts and sprites down to the bit level, so I could encode them in the bytes the machine expected.

The notebook survived when the tape didn't, and I'm still writing things down.

## Rediscovering who I am

I've revived WarpedVisions, again. It's been my weblog since the mid-90s, when it was more of a Kottke-style link log. It still lives on Dreamhost, except for a few stints on hosted blog tools. But this post isn't about that; it's about rediscovering who I am:

1. I am a writer. 
2. I make software. 
3. I love to tinker. I make art, I cook, and I make music.
4. And I love words and text.

I looked back at what I've built this year: [a cookbook](https://bruce-loves-to-cook.ca/), a [`#todo` tool](https://space-command.ca), a [scorekeeping app](https://scorekeep.warpedvisions.org), a pile of Obsidian plugins, a summer game jam, a weather tool, a text adventure engine, and a bunch of small tools and curios. Different shapes, all with the same handful of beliefs underlying them. This is my attempt to write the principles down, mostly so I can check myself and my next projects against them. 

## Plain text is the foundation

Almost everything I make starts, and ends up, as Markdown. Designs, specifications, recipes, tasks, blog posts, game briefs, comics, and even interactive fiction. Markdown is a form of structured plain text: it has no API, no auth, no special SDK. It opens in any editor, it diffs in git, and it will be readable long after today's tools are gone.

**Text reads naturally**. My not-a-chef project (now [bruce-loves-to-cook](https://bruce-loves-to-cook.ca/)) transformed my cookbook and recipe development. It builds a nicely shaped recipe book, including diagrams drawn from very simple ASCII text. The rule that drove the work:

> *"A recipe should look natural in any text editor."*

Pages must read well as plain text. They also must render in Obsidian and Hugo, and still be [parseable by tools](/blog/2026/not-a-chef/smart-content-on-plain-markdown/). Text is fast, easy, and it gets out of my way.

**Text, specifically my text, is sacred**. [Space Command](https://space-command.ca/) is a macOS app that finds and manages `PLAN.md` files via `#todo`, `#idea`, and `#focus` tags straight out of my notes. The source of truth is my source and my text files, and not something else. It's a nerd's tool, but it fits my neurospicy brain nicely.

**Text defines the world**. [Thwarter](https://github.com/robotpony/thwarter), my interactive fiction engine, builds stories from Markdown and front matter, the same way Hugo builds a site.

**Long live text**. All of my blogs, comics, and repos live in text. It is the only truly durable format.

**Want an example?** Here's part of a plan from Space Command's demo world, a sourdough book in progress, as text and as the app shows it:

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

That's the whole format. Every checkbox in a `PLAN.md` is already a task, so it needs no tag, and `#focus` marks the chapter I'm on now. In any other note, a `#todo` at the end of a line does the same job. It reads fine in `vim`, VS Code, Obsidian, and even renders nicely on GitHub. Space Command slurps up all of those tasks and folds your finished work away so only what's left shows, `#focus` tag and all.

## Text is part of my history

```timeline
1980 The school's one computer
1983 Atari BASIC
1995 *The UNIX Philosophy*
1996 Carmack's `.plan` files
2002 Blosxom
~2008 WordPress, a detour
~2015 Hugo, first look
2022 Write.as
2024 Hugo, for good
2025 *Claude and LLMs, text reborn*
```

My love of text started a long time ago, but the real inspiration was [John Carmack's `.plan` files](https://github.com/oliverbenns/john-carmack-plan). Around that time I read Mike Gancarz's [*The UNIX Philosophy*](https://www.goodreads.com/en/book/show/633070.The_UNIX_Philosophy), which cemented the principles. I was already working in text, but these set the foundation in my mind. The idea that text could define everything, including raw design thinking, was revolutionary to me. So was the idea that text is universal, and can be *piped* from tool to tool. I learned that text is raw power.

I even took the time to get comfortable in `vim`, something I've never regretted. It's as outdated now as it was then, but it really leans on what text does well. I learned to stack piped commands and to write scripts in *Perl*, *Python*, `sed`, and *Ruby*. 

I also encountered a number of text-y publishing tools at the time, including [Blosxom](http://www.blosxom.com/), the first truly great blogging tool. Sure, there were Blogger and Movable Type, but owning your content in a format you can search and script was something I knew was special. Even Movable Type ran on text filters like *Textile*, and Gruber first released *Markdown* in 2004 as a plugin for Movable Type and Blosxom.

I built a few versions of Blosxom myself, after it was uncool and no longer maintained, all pale imitations of it. I used WordPress for a few years, after several projects for my non-profit clients. I was always fighting the web UI. I couldn't `grep` it, and I couldn't see it locally without a lot of setup. It sufficed, until I remembered [*Hugo*](https://gohugo.io/). Hugo is fast, it lives on Markdown, and it extends and themes easily. I prototyped a version of my blog in it, and apart from one detour, it's been home since.

Enter the new world of LLMs. Text is king again. LLMs read and write plain text natively, so my notes, plans, and specs double as their working context, with no export or API in between. I've moved all of my notes and thinking back into text. My cookbook evolved from paper, to Google Docs, to Hugo and Markdown. I use Obsidian or VS Code to edit, Hugo to publish, and Claude to review; now Space Command ties it all together.

**My take**: Text is incremental, especially when paired with source control. Other tools have undo and history, but they're buried in menus, while `git log` and `diff` are one command away. And the commands are richer: you can see the reasons for changes, tag and branch to show progression, and remix easily. You never really lose changes. Yes, I realize the terminal is not great for all users, but for me it's home.

## Writing is how I think

That tape drive ate every copy of everything I wrote, so I reimplemented most games several times. I wrote dozens of games, tools, and curios, all of them lost to time. Somewhere along the way the notes stopped being a backup and became how I figure out what to build. I use the same pattern now, except that source control has replaced the extra copies. I always write down the design, and I always mock up user and programmatic interfaces.

`CLAUDE.md` files are that notebook again. An AI tool forgets everything between sessions, the way the tape forgot my games, so I write the design down first and it rebuilds from there. It's the same lesson, about 40 years later.

*I've written more about [the fight for clarity and beauty in writing](/blog/2015/the-fight-for-clarity-and-beauty-in-writing/) and about [how a tireless robot editor rekindled my love of writing](/blog/2025/how-i-rekindled-my-love-of-writing-with-a-tireless-robot-editor/). The whole tape drive story is on my [working with me](/pages/working-with-me-bruce-alderson/) page.*

## Showing the work

The usual way to write a cookbook is to hide the work. Being me, I'd rather not hide the design and development of recipes. The bruce-loves-to-cook recipes that aren't finished are marked [**Test kitchen**](https://bruce-loves-to-cook.ca/reference/essays/test-kitchen/), and they're published on purpose. A recipe is closer to source code than scripture: it has versions, bugs, and fixes.

This idea falls out of how we build software:

**Game jam rule 4**: post your updates online weekly, including specs, and prompts if used.

**Repos carry their plans**, bug lists, and decision logs in the open.

**Don't hide your tooling**. Working with AI is part of the work, so the prompts and `CLAUDE.md` files get shown too.

Research is showing the work before it's finished. I try several versions, compare them honestly, and write down why: [batches of recipes side by side](https://bruce-loves-to-cook.ca/essays/technique-essays/how-to-find-great-recipes/) to find the best one. I take careful notes on Environment Canada's feeds for [dailyweather](https://github.com/robotpony/dailyweather), and I developed four visual treatments for Scorekeep before choosing one. And the [50+ mocks](https://space-command.ca/mocks/) in Space Command led to something I really like. 

Showing the work keeps me accountable. The game jam's weekly posts meant there was always something to show, so I kept shipping. It also makes the work transparent to agents, which can reference a source of truth that I've developed, tested, and approved.

I have a theory that good practices are always good practices, so writing things down, being transparent, and publishing regularly fit nicely. The corollary is true, too, and there are a lot of anti-practices around using LLMs that are clearly not good practices. It's a great filter, for what it's worth.

## Teaching via writing

Text is fundamental to teaching. It's core to learning, too. 

I like to say that *"I love to teach, I think,"* because I'm not always certain of that fact. I'm occasionally impatient, and it's easy to forget how I got to understanding something. You need to remember your path to teach, and those darned paths change with each generation of tools and humans. But I do like to teach, I think.

I remember helping a number of people learn SQL. SQL is a powerfully dense and obscure language for asking questions about structured data. It's efficient when used properly, which requires some math-y thinking, some history, and a bunch of experience. I've always struggled to teach this to beginners. I suspect I've never thought deeply enough about it, or developed a clear plan for teaching it. Teaching it live, I'd forgotten my own path; writing it down is how I find it again.

My way of teaching is to write first. I can write and be frustrated, and not influence anyone negatively. I just put that frustration back into my writing and redraft. Once I've written it, I can iterate and teach more effectively, but those lesson plans are where the real effort is. Well, that and keeping those lesson plans up to date where they fall short. And they will.

The recipes are where this works best for me. I didn't start to grok cooking until I understood that methods were key. The French figured this out forever ago, and of course I had to rediscover it through chefs like [Kenji](https://kenjilopezalt.com/) and [Chef John](https://www.foodwishes.com/). Showing methods teaches people how to adapt, as recipes can rarely be exact. Ingredients differ, conditions like humidity differ, as do equipment, dietary needs, and so on.

As my recipe-maker notes put it, teaching people to cook, and making it easier to do it well, *"is a way to make a real difference for many people."*

## Own the press

This site has been running for close to 30 years, on more engines than I can list (see [about the site](/pages/about-warpedvisions-dot-org/)). It's always been my testing ground. Today it's Hugo, my own custom theme, a few scripts, and rsync to publish it to the same host I've used for decades.

```flow
Markdown | in git
Hugo
public/
rsync
Dreamhost
```

My blog [has no comments](/pages/about-warpedvisions-dot-org/), for good reason. I encourage people to respond by writing something of their own. This, of course, raises the bar and prevents a lot of silliness.

The pipeline really matters to me. A writing tool I can't `grep`, or see locally, runs against the grain of how I think. I learned this again on [Write.as](https://write.as), the second detour. In 2022 I [moved the site there](/blog/2022/warped-v40/), which meant hand-importing 60 posts over about 10 hours of evenings and cleaning up the Markdown that 17 generations of WordPress and Pandoc left behind. In 2024 I [ported it back to Hugo](/blog/2024/warped-42-back-to-basics/) in about a day, and since then it's lived as plain text in a repo I own. That's the IndieWeb idea of [POSSE](https://indieweb.org/POSSE): *publish on your own site first, and syndicate elsewhere.*

## Make it fun

From my game-making principles: *be emotive, be funny, be fun. Lean into constraints, limits, and plot holes.*

I learned a bit about fun this summer:

- [The summer game jam](https://github.com/robotpony/game-jams): four weeks [rebuilding games](/blog/2025/the-feels-of-nostalgia-can-drive-great-design/) I played and wrote between 1980 and 1985, on [PICO-8](/blog/2022/playing-with-the-pico-8-fantasy-console/), Picotron, TIC-80, and pygame.
- [Retro desktop demos](https://github.com/robotpony/retro-demos), LED displays, a CD player nobody needs.
- Scorekeep's goal: "it should feel like what it is: paper." Buttery smooth over feature-complete.
- *"Things that teach. Things that make you smile."*

The real lesson was playtesting. I wrote a space game and kept iterating on it until I found it fun. It's been a long time since I was able to do that.

## Craft, inch by inch

As I've always said, I believe simplicity is possible in anything, where simple means things fit _just so_. It's [a kitchen I know by heart](/blog/2025/the-comfort-of-home-bases-for-creative-work/), where I stop thinking about the tools and think about the food.

Who we are is had inch by inch, failure by failure, and craft works the same way. It's fit and finish, done in small steps: a recipe that stays in the test kitchen until it earns its way out, a heading nudged closer to the paragraph it belongs to, a commit that does one thing. Text makes those steps cheap, and git keeps every one of them, so I can afford to fail a lot on the way to _just so_.

## What this means for what's next

The 10-year-old with a notebook beside a tape drive and the person writing `CLAUDE.md` files are doing the same thing. Both write the design down first, because the machine will forget it. Both keep the notes somewhere they can be read and rebuilt from. I didn't set out to work this way; I only noticed it looking back over this year.

So what's next is more of the same, on purpose. [Space Command](/blog/space-command/) is in alpha playtest now, and it's the most direct version of all this: an app whose source of truth is plain text I've already written. I'll keep writing about it here first. If any of it sparks something for you, write about it on your own site and link back.

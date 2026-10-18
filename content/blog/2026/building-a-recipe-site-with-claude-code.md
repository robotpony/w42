---
title: Building a recipe site with Claude Code
date: 2026-09-29T22:29:58
draft: true
slug: building-a-recipe-site-with-claude-code
tags:
  - ai
  - claude-code
  - workflow
  - tools
categories: []
description: ""
---

I spent three weeks this summer building [Bruce Loves to Cook](https://bruce-loves-to-cook.ca/), a recipe site built on Hugo and Obsidian, using Claude Code. The final stats:

- 220 recipes,
- 6 essays, and
- ~16 reference pages

It's roughly 123,000 words of content with ~238 commits, each one a working chunk, not a checkpoint save.

The real work was more than three weeks: I've been developing the recipes and essays for several years now. Then it was a slow ramp from June through September: scaffolding, migrating old recipes over, figuring out the theme. Then, I was ready. I knew what I wanted, exactly. 

I ran a single, dense sprint, September 17th to the 29th, 13 days, 220-plus commits: 15 to 20 tested commits a day. The slow part taught me almost nothing. The sprint taught me most of what's below.

It didn't feel draining. I had a clear spec going in, and between my own habits improving and Claude Code improving under me, it went smoother than I expected. A few bugs, all caught by constant testing and fixed in minutes. This one was a good balance, not a grind.

The trigger was simple: I had the time, and finally knew exactly what I wanted. Google Docs had been good enough for years, but it was never going to be smart, and it was never going to read as a real website, especially not to my kids. They're millennials, and they don't take to paper or a shared doc the way my generation does; it repels younger users, however well it's formatted. I wanted the structure and the smarts a document can't give you, and something that actually belonged on the internet.

## The parts that actually worked

**Memory turned one-time corrections into permanent ones.** Every piece of feedback I gave Claude Code got saved once, and it held for the rest of the project: commit message style, test changes in Chrome instead of Safari, check the style guide before building mockups. When this failed, I coded the instructions into tools and hooks.

The Chrome/Safari case is the sharpest example. This Mac's default browser is Safari, and the browser automation tooling can't see into it. For a while, an entire "verified working" pass on a UI change was actually unverified: the agent was checking a window I wasn't looking at, calling it done, and moving on. Once I caught that and wrote it down, it never happened again. That's the difference between paying for a mistake once and paying for it on a loop.

**A big investigation, done once, kept paying off.** The Hugo theme I built on, Blowfish, has real non-obvious mechanics: Tailwind shade ramps that don't behave the way you'd guess, dark mode implemented through a `.dark` class rather than a media query, no render hook for list pages, and a body background hardcoded to a white token regardless of colour scheme.

Working all of that out took a genuine investigation. It only took it once. Once it was written up as project memory, every session after that used it instead of re-deriving it from scratch, across roughly seven sessions. It's the clearest example here of time saved by writing something down once, properly.

**Checklists as files instead of context.** A full content audit, 253 pages (before I later combined about a dozen overlapping recipes down to the 220 above), turned into a `REVIEW.md` file with checkboxes: resume at the first unchecked box. That let the audit happen across many separate sessions without reconstructing where things stood each time.

The same move worked for `PLAN.md`: once a phase shipped, it got squashed to a one-line summary instead of piling up. The file does the remembering, not the conversation.

**Skills and slash commands for the repeatable stuff.** Migrating a recipe, linting content, previewing a build, publishing it, scaffolding a new recipe file: those became load-on-demand commands instead of instructions I had to retype every time. Same for the writing rules for recipes: units, voice, formatting. Once those existed, I stopped explaining them.

## The parts that cost real time

**"Looks good," without anyone actually looking, cost the most time.** This happened repeatedly: a clean `hugo --quiet` build, or a grep match confirming a string existed, got reported back as visual parity. It wasn't.

The actual bugs were only visible by opening the page: a background that never picked up the real design token, a dead close button on the mobile nav drawer, a footer toggle stretched out of shape. None of them showed up in a build log.

The same failure mode showed up with tile styles: the design system had two versions, subtly different, and Claude kept grabbing whichever one it reached for first without checking the guide. Crisper naming on my end would have caught most of that before it started; the rest still needed someone to actually look before calling it done.

At one point I rejected a "looks good, about 50% there" verdict outright and asked for a real side-by-side comparison. It found the actual problem in a couple of minutes. The build succeeding and the thing working are two different facts, and it's easy for an agent, or a person moving fast, to treat the first as proof of the second.

**Silent failures are the worst failure mode for this kind of work.** None of these throw an error: a Tailwind class that compiles to nothing because the theme never used it, a Go template pipe that silently reorders its own arguments, a dev server serving stale draft counts and stale CSS after an edit. They just produce output that looks plausible and is wrong.

The clearest case: the footer's dark mode toggle swapped icons using `dark:hidden` on the sun and `dark:inline` on the moon. Hugo built clean, the HTML had both classes, and the console was silent. In dark mode, the button collapsed to an empty box.

Blowfish ships a precompiled Tailwind stylesheet, so a class only exists in it if the theme's own templates already use it somewhere. `dark:hidden` was in there. `dark:inline` wasn't. The CSS was compiled before I ever wrote the class calling for it.

That's a bad combination when the thing reviewing the output has no instinct for "that doesn't look right" unless it's told exactly what to check.

**Documentation drift that never fixed itself.** Partway through, I retired an old two-vault workflow, the staged path that had carried content from Google Docs, to a local notes vault, and finally into the Hugo site itself. I corrected `CLAUDE.md` to match. `ARCHITECTURE.md`, the old `PLAN.md`, and `README.md` kept describing the dead workflow anyway: nobody goes back and updates three other files just because you fixed the canonical one.

The correction had to live in memory instead, as a standing "ignore what the docs say here" note. It's still not fully fixed: the README still tells a reader that new recipes come from a folder that doesn't exist anymore.

The agent caught it, not me, and not by accident: it turned up during one of the periodic review passes I run between major versions, the same kind of audit that produced `REVIEW.md`.

**An overridden instruction got obeyed exactly once, and it cost a rebase.** A system-level instruction I hadn't authorized added an AI co-author trailer to three commits before I caught it. Fixing it meant a rebase and a force-push to strip it back out. When an agent has more than one source of instructions and they disagree, you may not find out until after it's already acted on the wrong one. It's also why that rule lives in a repo hook now instead of a memory note. Discipline loses to enforcement eventually, and that's just as true for humans: CI beats discipline every time.

## What I'd take from this

None of these failures were the agent being unable to code. They were failures of verification: trusting a signal (a build, a grep, a config file) that looked like proof of correctness but wasn't.

The fixes that worked turned one-time judgment into something durable: a memory note, a resumable checklist. The fixes that didn't work stayed as unwritten context, waiting to be rediscovered the hard way.

If you're doing anything like this (a real content project, not a toy), the payoff for writing something down once shows up in every session after. The payoff for trusting "looks good" unverified is negative, and you usually don't find out how negative until someone actually opens the page.


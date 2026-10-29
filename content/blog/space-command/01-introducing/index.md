---
title: "Space Command: a Mac sidebar for plain-text projects"
date: 2026-10-17
draft: false
slug: space-command-a-mac-sidebar-for-plain-text-projects
tags:
  - space-command
  - mac
  - tools
  - workflow
description: "Space Command is a native Mac sidebar that reads the plain-text projects you already keep and shows you the one thing to do next. It's pre-alpha, and I use it every day."
---
## Post tasks #todo 

- [ ] move this whole post to projects, where both this and scorekeep will get a section for changelogs/posts/etc.

## Outline

Your projects already live in plain text. {{< space-command >}} reads them and shows you the one thing to do next.

**{{< space-command >}}** is a native macOS sidebar app. It sits at the edge of your screen, a click from the menu bar, and works on your files where they are: Git repos, notes vaults, and Hugo blogs. Nothing to import, no second copy to keep in sync, and nothing leaves your Mac.

## Where it came from

The tool started as an Obsidian plugin, warped-command, both as a way to cut my teeth on scratching an itch with Claude and as something I've wanted to build for a very long time. Obsidian is great, but I started wanting the features closer to the rest of my tools, so I re-imagined it as a macOS app.

That meant moving up a level. The plugin knew one vault. {{< space-command >}} scans the folders you point it at, finds the repos, vaults, and blogs inside them, and watches them for changes.


## What it reads

The tags live in your own files: `#todo`, `#idea`, `#focus`, `#p0` to `#p4`, and `#snooze`. Files like `PLAN.md`, `TODO.md`, and `BUGS.md` are read as they are, with no special format to adopt.

From those, it builds a few views:

- **Today**, with anything marked `#focus` at the top. Focus leads every view.
- **Tasks and ideas** gathered from across your projects, each a click from the line it came from, opened in the right editor (Obsidian, Xcode, or VS Code).
- **Projects**, as a board. Each one shows its plan progress and its health, which mostly means docs drifting behind the code, plus what changed since you last looked.
- **Posts** from your Hugo blogs.
- **Clipboard fixes** for the small, annoying stuff: unwrapping terminal text, cleaning up Markdown, and fixing quotes and dashes.

## Smart, but never presumptuous

That's the rule the whole app follows. It notices and suggests, but nothing in your files is written, linked, or changed without your say.

When you do say, the file changes too. Tick a task off in the sidebar and the checkbox flips in the Markdown. Each write is checked first, touches a single line, and can be undone. Your files stay the source of truth; the app's index is just a cache of them.

There's no account, no cloud, and no tracking.

## Colour as meaning

The palette is warm and earthy, and every colour has a job. Terracotta is urgent. Amber can wait (and marks the clipboard). Sage, a deep teal, is ideas and connections. Moss is plans, Oak is posts, and Clay is an accent.

Leaf green is reserved for `#focus`, and it shows up once per screen. If you see it, that's the thing.


## Where it's at

{{< space-command >}} is pre-alpha. I started the app on October 15th, and I use it every day on my own folders.

What works: the parsing core, the index and file watcher, the checked writer with undo, Ideas, the projects board, Today, and opening any item at its line in the right editor.

What doesn't exist yet: the rest of the Tasks tab, the Posts and Clipboard tabs, onboarding, a proper testing pass, licensing, and a signed download. There's no release date.


## Following along

Launch news and dev notes will land here, in this series. If you only want the {{< space-command >}} posts, there's a [feed for just this series](/blog/space-command/index.xml). The [teaser site](https://space-command.ca/) has the short version.

Built in Canada 🇨🇦.

---
title: "Boring is where AI earns its keep"
date: ""
draft: true
slug: boring-is-where-ai-earns-its-keep
tags:
  - ai
  - obsidian
  - tools
  - workflow
categories: []
description: ""
---

Six months ago I started paying attention to which tasks Claude Code actually improved and which ones it just felt like it should. The results were not what I expected.

Most of the noise around AI productivity focuses on the impressive parts: generating code from a description, unblocking on a hard problem, synthesizing a pile of research into something coherent. Those are real wins. They're also not where I've seen the most consistent improvement in my own work.

The biggest gains have been in the boring stuff. Filing a log entry. Running a pre-publish checklist. The weekly review that kept slipping.

## The test that kept failing

[PERSONAL ANECDOTE: What the weekly review looked like before scripting it — how often it actually happened, what you'd skip, what the drift looked like when you missed a few weeks]

The weekly review is the best example because inconsistency there compounds. Miss it once and your notes drift a little. Miss it three times and the drift is hard to untangle. It's the kind of task where the value is entirely in the regularity, which makes it exactly the kind of task humans are bad at.

[PERSONAL ANECDOTE: What changed when you scripted it — what the command actually does, how often you run it now compared to before]

The change wasn't dramatic. It was just... consistent. Which, for that kind of task, is the whole point.

## Why Obsidian and Claude Code fit well together

The reason this pairing works is mostly structural. The vault is already organized: folders follow rules, filenames follow conventions, frontmatter schemas are defined. Those constraints live in a CLAUDE.md file that Claude Code reads before doing anything.

That means the automation doesn't require ongoing prompting or hand-holding. The rules are already there, in plain text, in a place the tool can find them. Markdown is simple: no API, no SDK, no authentication layer. Claude Code can just read and write files.

The feedback loop is short. You feel the friction daily, so you notice it quickly. When something is consistently annoying, the fix is a small project rather than a big one. Over six months that adds up to a system that actually fits how you work, not how you worked when you first set it up.

## When Claude Code alone isn't enough

Some tasks don't fit neatly into what Claude Code can do on its own. They need native Obsidian integration: a sidebar panel, a hotkey, a command palette entry. That's where building a plugin made sense.

Space Command started as an answer to one specific problem. [PERSONAL ANECDOTE: The specific pain point — TODO/IDEAS capture, the focus problem, what was going wrong before you had the plugin]

Building it was faster than I expected because Claude Code handled most of the Obsidian API work. I described what I wanted; it found the right hooks; I reviewed and adjusted. The ratio of thinking time to execution time shifted noticeably.

The meta-skill is knowing when to build a plugin versus just using Claude Code directly. A plugin has a maintenance cost. It's worth that cost when the task is daily and native integration matters. For occasional friction, a Claude Code command is usually enough. The wrong call there wastes time in both directions: over-engineering a one-off, or under-engineering something you'll need to run a hundred times.

## Where it doesn't work

Not every automation attempt worked out. The pattern that fails, reliably, involves large context assembled from multiple sources.

Bug triage is the clearest example. The idea was reasonable: gather the error, the relevant logs, the suspicious code, hand it to Claude Code. In practice, assembling that context was most of the actual work. By the time I'd seeded the agent with enough facts to be useful, I'd already done the hard part myself.

There's a useful rule hiding in that failure. Claude Code works well when the context is already in the file system: structured, accessible, complete. It struggles when the context lives partly in your head and has to be assembled before the task can even begin.

This clarifies what's worth automating. Structured, file-resident tasks with clear rules: yes. Tasks that require judgment about what's even relevant to include: not yet, and maybe not ever. The assembly work is often the actual thinking, dressed up as prep.

## The weekly tuning loop

The discipline that makes all of this compound is a short weekly pass at "what's still annoying?" It's a simple question, but it surfaces friction that's been quietly accumulating.

Six months of small adjustments adds up to something qualitatively different from a workflow you set up once. Each individual improvement is minor. Together they produce a system that fits how you actually work, including habits and quirks that you wouldn't have thought to specify in advance.

The review also catches mistakes. Some things I automated made the workflow worse, usually by adding steps that felt helpful but interrupted the actual work. Catching those early, while the pattern is fresh, is easier than untangling them after they've settled in.

## What this isn't

None of this is AI replacing thinking. Filing a log entry is not thinking. Running a checklist is not thinking. Reformatting a draft is not thinking.

What it is, is mise en place: clearing the prep work so the actual cooking can happen without stopping. The writing, the decisions, the hard problems — those are unchanged. What's different is that the friction around them is lower, and it's lower consistently, not just on days when I feel like doing the boring parts.

That's not the AI story most people are telling right now. But it's the one that's actually saved me time.

---

*[AUTHOR NOTES: Still need — the specific weekly review story (before/after), the Space Command origin story. Timeframe: ~6 months. Post date: TBD.]*

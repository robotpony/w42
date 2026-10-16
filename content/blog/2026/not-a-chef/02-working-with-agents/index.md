---
title: Working with agents on a real content project
date: 2026-10-27
draft: true
slug: working-with-agents-on-a-cookbook
tags:
  - ai
  - claude-code
  - workflow
  - not-a-chef
categories: []
description: ""
---

<!--
OUTLINE: Post 2 of 5. Type: Technical Reflection, 1500-2000 words.
Core argument: what made agents reliable was moving judgement out of the conversation and into files (mocks, checklists, memory) and enforcement (hooks).
Source: most of the old draft (building-a-recipe-site-with-claude-code.md) lands here; update its numbers.
-->

## Headline options

1. Working with agents on a real content project
2. The file does the remembering
3. Mocks, memory and hooks: how the agents stayed on track

## Opening hook

The "50% there" moment: rejecting the verdict and asking for a real side-by-side. Or the Safari window nobody was looking at. Pick one; the other went in post 1.

## Sections

1. **Design-first mocks as the decision log.** How a mock is built (options, light and dark, real data), how a decision gets written back with a date, and how a later agent picks it up cold. Show one README entry. Visual: mockups/README.md excerpt.
2. **Checklists and plans as files.** REVIEW.md with checkboxes, resumable across sessions. PLAN.md squashed to one line per shipped phase. Skills and slash commands for repeatable chores.
3. **Memory: what it's good for.** The Blowfish investigation done once and reused across sessions. Habits like opening mocks in Chrome. Where it failed: doc drift, and the "ignore what the docs say" note.
4. **Hooks: what memory can't do.** The co-author trailer, the rebase, the move to a repo hook. "CI beats discipline every time."
5. **Multi-agent: site, Fugu and content agents.** Ownership boundaries, how handoffs worked, likely token savings, what was untidy, what reconfiguring should look like. [PERSONAL ANECDOTE: a handoff that went well and one that didn't]
6. **Verification is the job.** Silent failures (precompiled Tailwind, stale dev server). Builds and greps aren't proof; looking is.

## Closing move

The pattern under all of it: one-time judgement becomes durable when it's written to a file or enforced by a hook. Practical close: a short list of what to set up on day one of the next project.

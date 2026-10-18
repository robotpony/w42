---
title: Smart content on plain markdown
date: 2026-11-03
draft: true
slug: smart-content-on-plain-markdown
tags:
  - hugo
  - obsidian
  - markdown
  - not-a-chef
description: ""
---

<!--
OUTLINE: Post 3 of 5. Type: Technical Reflection, 1200-1800 words.
Core argument: plain markdown files in an Obsidian vault can carry enough structure to drive a smart site, if the format is settled early and fixed at the source.
Sources: docs/FORMAT.md, docs/ARCHITECTURE.md, docs/METHODS.md in the not-a-chef repo. Ask the not-a-chef agent for a short recipe example and a before/after of a migrated recipe.
-->

## Headline options

1. Smart content on plain markdown
2. The repo is the vault
3. Making a cookbook smart without a database

## Opening hook

The Google Docs cookbook: good for years, never going to know that a recipe uses another recipe. [PERSONAL ANECDOTE: the moment the doc's limits became obvious]

## Sections

1. **The repo is the vault.** Edit in Obsidian, build with Hugo, deploy with rsync. Why one folder for both matters.
2. **The recipe format.** Front matter plus a few conventions that power checkboxes, scaling and metric/imperial. Code block: a trimmed recipe (under 15 lines).
3. **Wiki links resolved by title.** Obsidian-style links that Hugo resolves through a render hook. The client-side script that became obsolete.
4. **Methods, references and blueprints.** The ontology in METHODS.md, briefly: what a method page is and how recipes point at it.
5. **The generated index and search.** Stdlib Python tools and Fuse.js; no database.
6. **Test kitchen drafts.** How unfinished recipes live in the site without pretending to be done.
7. **Fix it at the source.** Garbled migrated recipes rebuilt, old link formats converted, food-safety review passes. Templates shouldn't paper over bad content.

## Closing move

The trade-off from post 1 returns: this format is lovely to build on and awkward for anyone who doesn't live in a text editor. Name it, don't solve it.

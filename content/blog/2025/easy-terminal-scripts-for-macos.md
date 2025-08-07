---
slug: 'easy-terminal-scripts-for-macos'
title: 'Lazy terminal scripts for macOS'
date: '2025-08-04T12:38:58-07:00'
draft: false
---

After thirty-something years of working in terminals, I've developed a pretty strong bias toward doing things from the command line. It can be faster for me to navigate around using scripts and shortcuts than clicking through GUI hierarchies. The muscle memory is there, the automation possibilities are endless, and frankly, it just feels more direct.

The problem is that GUI applications don't always want to cooperate with this workflow. You end up breaking your flow to hunt through Spotlight, dig around in Finder, or, worst of all, try to remember the actual executable path buried somewhere deep in an `.app` bundle. It's jarring when you're in the zone.

## A simple hack 

macOS ships with a command that bridges this gap perfectly: `open`. Most people use it for opening files (`open myfile.txt`) or Finder, but it has this killer feature where you can launch applications by their display name instead of hunting down executable paths.

Here's the script I've been using daily for years:

```
#!/bin/sh

open -a "iA Writer" $*
```

Save this as `ai` somewhere on your `$PATH`, make it executable with `chmod +x ai`, and restart your terminal. Now you can type `ai` from anywhere and launch iA Writer, optionally passing files as arguments.

This works for any named application on macOS. Want Photoshop? Make a script called `ps` that calls `open -a "Adobe Photoshop 2024"`. You're using the same display names you see in Applications—no bundle archaeology required.

## Tiny things matter

It's such a small hack, but it removes friction from the daily workflow. When you're deep in a coding session and need to quickly edit a document, preview an image, or tweak a design file, you don't want to context-switch to the mouse and hunt through GUI elements. You want to stay in flow and get the tool you need with zero cognitive overhead.

The `$*` passes through any arguments, so `ai notes.md` opens specific files, while just `ai` launches the app. It's simple automation that compounds—saving seconds dozens of times a day adds up to real productivity gains.



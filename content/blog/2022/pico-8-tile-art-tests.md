---
slug: pico-8-tile-art-tests
title: PICO-8 tile art tests
date: 2022-02-19T00:04:16Z
draft: false
tags:
- pico8
- programming
---

I've been playing around in [PICO-8](https://www.lexaloffle.com/pico-8.php), working on some generative art ideas. Lua is a fun little language that feels a lot like something between BASIC and JavaScript. Lua isn't my favourite language, but it's fun at the small scale. PICO-8, however, is a fantastic little game engine (or "Fantasy Console") that has all of the feels of the 80s.

## First tests

I started with a Minecraft style terrain generator, but as 2D tyles:

<video controls width="640">
    <source src="https://images.warpedvisions.org/2022/02/terrain-gen-test-14.mp4">
    Sorry, your browser doesn't support embedded videos.
</video>

It was a fun attempt and performed reasonably well that I filed away under _maybe later_.

My second attempt was a stamp generation tool, that defines some simple verbs and nouns for generating art, and applies it to coloured tiles:

<video controls width="640">
    <source src="https://images.warpedvisions.org/2022/02/tile-gen-test-1.mp4">
    Sorry, your browser doesn't support embedded videos.
</video>

The third test evolves on the previous and improves the performance significantly:

<video controls width="640">
    <source src="https://images.warpedvisions.org/2022/02/tile-stamper-test-2.mp4">
    Sorry, your browser doesn't support embedded videos.
</video>

I'm working on taking the basic concepts from these tests and building a Swift/iOS version that adds some interactivity. We'll see how that goes!

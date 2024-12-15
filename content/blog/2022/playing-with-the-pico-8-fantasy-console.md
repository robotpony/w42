---
slug: playing-with-the-pico-8-fantasy-console
title: Playing with the Pico-8 fantasy console
date: 2022-02-19T02:46:51Z
draft: false
---

#

I've been using [Pico-8](https://www.lexaloffle.com/pico-8.php) as a virtual playground for playing with generative art ideas. Pico-8 is a highly constrained virtual machine that behaves a lot like a personal computer from the 1980s. It has a fixed colour palette, limited memory, limited screen size, and a simplified programming model using Lua. The constraints make it a great place to scale down ideas and quickly finish demos and prototypes.

This week I'm toying with generative art ideas, starting with a tool that stamps the screen in various patterns. I'm hoping to evolve [these prototypes](https://github.com/robotpony/pico8-playground/tree/main/tileart) into a general plotter library, but for now I'm focused on making things that look cool, as a way to play in generative code again.

One of my demos this week is a GTIA style plotter that simulates a weird 80s graphic chip that drew wide pixels, but coloured in a way that produces some fun random patterns:

![Drawing test" width="100%](https://images.warpedvisions.org/2021/03/gtia-tiles.png)

#pico8

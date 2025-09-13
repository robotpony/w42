---
slug: when-technology-gets-boring-innovation-begins
title: When technology gets boring, innovation begins
date: 2024-12-27T12:00:00Z
draft: true
tags:
- computing
- software-design
- ai
---

I was debugging a power issue with my thermostat last week when it hit me: I had no idea how many batteries were in my house. Not approximately. Not even close.

Twenty years ago, I knew exactly where every battery lived; the TV remote, the kitchen clock, maybe a flashlight. Today? They're everywhere and nowhere. In sensors, in remotes, in devices I've forgotten I own. They've crossed the threshold from technology to invisible infrastructure.

Someone once told me that ubiquity in technology is the point at which you stop noticing a thing. They used electric motors as an example: once upon a time, a town might have had a single motor, probably at the mill. Now there are dozens in your kitchen alone, in your refrigerator, dishwasher, garbage disposal, microwave turntable, range hood. You don't think about them. They just are.

## The pattern is always the same

Every transformative technology follows this arc: 

`Novel → Expensive → Common → Invisible`

**CPUs** went from the machine that filled a room to computational dust sprinkled through every device. When I started programming, we carefully counted clock cycles. Now there's more processing power in my MacBook's power supply than in my first workstation. Think about that: the thing that just converts AC to DC has a microcontroller more powerful than the computer I learned to code on.

**LCD screens** traveled a similar path. Remember when a flat-screen monitor cost $3,000? Now they're so cheap we stick them on refrigerators to show the weather. My house has screens I've never turned on.

**Batteries** might be the perfect example. From expensive curiosities to utterly forgotten infrastructure. Quick: how many devices in your house have batteries? Start counting. Include the obvious ones—remotes, clocks, smoke detectors. Now add the hidden ones—motherboard CMOS batteries, backup batteries in your router, the battery in that kitchen scale you forgot you owned. I'll wait.

## The cost curve never lies

The economic pattern is predictable, almost boring in its reliability. The cost decrease follows something between a logarithmic and quadratic function, racing toward zero. Not literally zero, but effectively zero for decision-making purposes.

When something costs $10,000, you plan around it. When it costs $10, you might think about it. When it costs $0.10, you stop thinking entirely. That's the vanishing point.

This is where things get interesting for builders and designers. When a technology becomes effectively free, the constraints that shaped entire industries evaporate. The game changes completely.

## What's vanishing right now?

ML has been quietly driving weather prediction for years. We knew the current generation of AI would happen; the writing was on the wall for anyone paying attention to the research. I predicted advanced code generation years ago, based on the simple principle that if you iterate over code enough times with enough randomness, you'll eventually get something that works. 

Turns out we short-cut the process with LLMs' ability to classify prompts and essentially *paint* code. Same destination, different path.

Right now, AI feels expensive. Every API call costs something. We carefully manage context windows and token limits. But the pattern is clear: this will become cheap, then cheaper, then effectively free. The question isn't if, but when.

## Building for the invisible future

When we see something becoming inevitable, it means we can use a lot of it for cheap. Not today, but soon. This changes how we should build.

Instead of optimizing for scarcity, we should be thinking about abundance. How do you design systems when AI inference costs nothing? When you can layer it, use it to check its own work, throw multiple models at the same problem just because you can?

The best software, like the best technology, disappears into utility. Nobody thinks about TCP/IP anymore. Nobody marvels at Unicode. They just work, invisibly enabling everything else.

## The paradox of progress

There's something beautiful and sad about this vanishing. The technologies that transform society most profoundly are the ones we eventually forget exist. The highest achievement for any technology is to become boring.

I'm writing this on a device with billions of transistors, connected to a global network, powered by electricity I never think about, displaying on a screen I take for granted. Every one of these was once miraculous. Now they're just part of the furniture, sometimes literally.

The next time you're evaluating a new technology, ask yourself: can I imagine a world where this is too cheap to meter? Where it's so common we forget it exists? If the answer is yes, start building for that world now.

Because by the time everyone else notices it's inevitable, you'll already be building what comes next.

Just get out there and build something interesting, while everyone's debating the implications. The real opportunity is in imagining what happens when nobody notices anymore.
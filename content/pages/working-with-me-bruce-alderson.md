---
slug: "working-with-me-bruce-alderson"
title: "HOWTO: Work with Bruce Alderson (that's me)"
date: "2025-07-23T15:30:01-07:00"
draft: false
---

When I was 8, my flakey tape drive ate three weeks of BASIC code. One minute I had a working text adventure game where you could explore a haunted mansion. The next minute I had magnetic spaghetti and a valuable lesson about the nature of software.

That Chelco 410 drive[^1] taught me something fundamental: the thinking that goes into your software *is* the software. The code is just one representation of that thinking. After losing my third program to that temperamental piece of hardware, I started writing everything down first. Design notes, flow charts drawn on graph paper, detailed maps of game worlds. When the tape drive inevitably failed again, I could rebuild from my notes in a fraction of the time.

Thirty years later, I still sketch before I code. Turns out that 8-year-old me stumbled onto something important.

[^1]: That Chelco 410 had a 550 bits per second data rate. That's *bits*, not kilobits. I'm pretty sure mine was a return, too, which might explain the reliability issues.

## The millworker's guide to meaningful code

Fast forward to 1994. I'm standing at a lumber mill, watching the clock tick toward break time, counting down seconds like they're prison days. Eight hours a day of mind-numbing repetition. The kind of work that makes you understand, viscerally, what meaningless labour feels like.

Six months of that was enough. I quit and took a job managing a 7-11, which somehow managed to be worse. At least the mill had honest work; the convenience store had me selling lottery tickets to people who couldn't afford them and dealing with 3am drunks who wanted to fight about cigarette and gasoline prices.

But here's the thing: those jobs taught me what I *didn't* want from my career. Every line of code I write now, I ask myself: "Is this meaningful?" Am I just moving lumber from pile A to pile B, or am I building something that matters?

The restaurant work was different. I started delivering papers at 8, worked kitchens from 15 through college. That taught me about flow, timing, and what happens when systems break under pressure. You learn that mise en place isn't just about cooking; it's about having your tools ready before you need them. You learn that the difference between a good night and a disaster is usually preparation.

Those lessons translate directly to software. A well-architected system handles the dinner rush. A poorly planned one crashes when the orders pile up.

## From device drivers to human drivers

My technical path looks scattered if you just list the technologies: `real-time systems → device drivers → protocol stacks → cloud platforms → SaaS → front-end → AI/ML`. But there's a thread running through it all: I follow the complexity until I find the humans.

Early on, I was obsessed with making machines talk to each other. Writing drivers for obscure hardware, implementing protocol stacks from scratch, porting code across CPUs nobody remembers anymore. The constraints were brutal: kilobytes of memory, processors slower than your current smart watch, no Stack Overflow to save you.

But those constraints taught discipline. When you have 64KB of RAM, every byte matters. When your debugger is printf statements over a serial port, you learn to think before you type. You develop an intuition for what will work and what won't.

Then cloud happened, and suddenly the constraints flipped. Infinite storage! Unlimited compute! Just spin up more servers! Except now the complexity moved to coordination, consistency, and cost. The problems got softer but not easier.

The real shift came when I moved to SaaS and front-end work. Suddenly, I wasn't optimizing for machines anymore; I was optimizing for humans. All that backend complexity, all those carefully crafted systems, they only mattered if someone could actually use them.

That's when I discovered the truth: the interesting problems aren't in the technology. They're in the gap between what computers can do and what humans need them to do.

## The three rules I actually follow

After 30 years of this, I've distilled my approach to three principles that actually matter:

**Document first, but not because of that tape drive.** Documentation isn't about disaster recovery anymore; it's about thinking clearly. When I sketch a system before building it, I'm not creating backup plans. I'm finding the flaws before they become code. The best bugs are the ones that die on the whiteboard.

**Ship broken rather than perfect.** Perfect code that never ships is just millwork with better pay. I learned this managing teams: the teams that ship learn faster than the teams that polish. You want to know if your idea works? Put it in front of some of your users and watch it break. The breakage teaches you more than any design review.

**Method matters, process doesn't.** I've seen too many teams suffocate under Agile ceremonies while shipping nothing. Process is what managers do when they don't trust their teams. Method is what craftspeople develop through practice. Give me a team with good methods and no process over the opposite any day[^2].

Here's what this looks like in practice: Last month, I was building a data visualization component. Classic over-engineering trap: trying to make it handle every possible case before shipping v1. Instead, I sketched the simplest thing that could work, shipped it broken, and fixed it based on actual usage. Took three days instead of three weeks, and the final version was nothing like my original design because users needed something completely different than I'd imagined.

[^2]: Of course some process is helpful, but I side on method and understanding and not rules and rote.

## What I'm actually good at (and what I'm not)

Let's be honest about strengths and weaknesses:

I'm exceptional at seeing systems, understanding how pieces fit together, and finding the human story in technical problems. I can translate between business and engineering because I've been both. I can mentor junior developers because I remember what it felt like to stare at that C textbook at age 12, completely lost[^3].

I'm terrible at politics, "managing up," and pretending bad ideas are good. I have zero patience for process theatre. I'll challenge ideas that don't make sense, even when silence would be politically smarter.

I code every day, not because I have to, but because I need to. It's how I think. Even in leadership roles, I'm writing code, reviewing PRs, testing, and debugging production issues[^4]. The day I stop coding is the day I stop understanding the actual problems.

[^3]: That advanced systems programming book was way over my head. Had better luck with assembly language, oddly enough, because memory management was explicit and visible.
[^4]: I don't always write production code these days, but I do love pulling prototype data for proving ideas, understanding cohorts, and such. And yes, I still like reviewing PRs. It keeps my grounded.

## The AI thing isn't really about AI

Everyone asks about AI now. "How do we integrate LLMs?" "What's our AI strategy?" They're asking the wrong questions.

The interesting thing about AI isn't the technology; it's that we're finally building systems that speak human. After decades of forcing humans to think like computers, we're teaching computers to think like humans. Or at least fake it convincingly enough.

I predicted years ago that computers would write code by iterating through possibilities. What I didn't predict was that they'd do it by learning from every Stack Overflow post ever written. The implementation surprised me, but the principle didn't: sufficiently advanced pattern matching is indistinguishable from understanding.

My current obsession is using natural language to define system behaviour. Not because it's easier (it's not), but because it forces us to be clear about what we actually want. When you have to explain your requirements to an AI, you discover how muddy your thinking really was.

## Working with me: the practical bits

If we end up working together, here's what you can expect:

1. I'll ask you to draw things. Diagrams, flowcharts, sketches, whatever helps you think visually. The quality doesn't matter; the thinking does.
2. I'll push for shipping early and often. Not because I like broken software, but because I like software that evolves based on reality rather than speculation.
3. I'll write a lot of documentation, and I'll expect you to read it. But I'll also make it worth reading, with diagrams, examples, and the occasional joke.
4. I'll challenge ideas, including my own. Especially my own. Strong opinions, loosely held isn't just a phrase; it's how you avoid being that person still advocating for CORBA in 2025.
5. I'll be direct. Life's too short for corporate euphemisms. If something's broken, I'll say it's broken. If something's brilliant, I'll say that too.

## The work that matters

Here's what I've learned from three decades of making things with computers: the technology doesn't matter nearly as much as we pretend it does. Languages, frameworks, platforms, they're all just tools. The hard part isn't learning the tools; it's knowing what to build with them.

The best code I've ever written wasn't clever. It was clear. It solved real problems for real people. It was maintained by teams who understood it. It evolved as needs changed.

That tape drive that ate my BASIC games? It taught me that software is thinking made tangible. The millwork? It taught me that meaningful work matters more than perfect code. The restaurants? They taught me that systems under pressure reveal their true nature. It also taught me that anyone can do a thing, if you find the right ways of doing it.

Every line of code is a decision. Every architecture is a bet on the future. Every team is a collection of humans trying to build something together.

The tools keep changing. The languages evolve. The platforms come and go. But the fundamental challenge remains the same: using logic and electricity to solve human problems.

Thirty years in, and I still get excited about that challenge!

---

*Want to argue about whether process is actually bullshit, or just chat about making things? [Find me on Mastodon](https://mas.to/@robotpony). I promise I've gotten better at handling disagreement since my 7-11 days.*
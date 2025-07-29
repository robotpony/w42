---
slug: why-ai-coding-tools-make-us-better-programmers
title: "Why AI Coding tools make us better programmers (assuming we don't skip the hard parts)"
date: 2025-07-28T17:27:07Z
draft: true
---

There's a familiar anxiety in the air among software architects and engineering leaders. AI coding tools are going to make us lazy programmers. They'll erode our fundamental skills. We'll lose the ability to think through problems. Sound familiar?

It should. I've heard this exact song before, just with different verses. In the '90s, visual development environments were going to create a generation of developers who couldn't "really" code. Before that, higher-level languages were supposedly making us soft. Hell, I remember when debuggers were contentious—Linus famously ranted that real kernel developers should be able to think through their code without stepping through it line by line.

Here's the thing: every generation of tools that abstracts away grunt work gets the same reception from "real programmers." And every time, the fear misses the point entirely. The question isn't whether AI will change how we program, it already has. The question is whether we'll be smart enough to use it right.

## The pattern that keeps on giving

Looking back at thirty years of tool evolution, there's a clear pattern. Each wave of abstraction generates panic about dumbing down the craft, followed by a period where the tools actually raise the bar for what constitutes good work.

Visual Basic caught hell from C++ developers in the '90s. "Real programmers write real code," they said. But VB didn't create worse programmers, it just shifted the bottleneck. Suddenly, cranking out a functional Windows app in a weekend wasn't impressive anymore. The bar moved to system architecture, user experience, and business logic. The developers who adapted thrived. The ones who clung to manually managing window handles for credibility got left behind.

The same thing happened with IDEs, frameworks, and even lint tools. Remember when static analysis was controversial? "Good programmers don't need tools to catch their mistakes." Except that wasn't the point. Lint tools didn't make us lazy, they made sloppy code unacceptable. They raised our standards by automating the tedious parts of quality control.

AI coding tools are following the exact same trajectory, just faster and more dramatically.

## AI tools are an amplifier

Here's what's really happening when you use AI to write code: the grunt work disappears, and everything else gets intensified.

No more wrestling with syntax for the fifteenth time this week. No more hunting through documentation to remember whether it's `parseInt` or `parseInteger`. No more writing yet another REST endpoint that follows the same pattern as the twelve you wrote last month. The AI handles that mechanical stuff, the programming equivalent of doing laundry.

What's left? The hard parts. The parts that actually matter.

Requirements analysis becomes critical because feeding fuzzy requirements into an AI coding assistant gets you precisely-implemented garbage. System architecture decisions multiply in importance because AI can generate a lot of code very quickly in the wrong direction. Understanding tradeoffs becomes essential because you need to guide the tool toward solutions that actually solve the right problems.

This is where productive laziness becomes a superpower. I've always believed that the best programmers are appropriately lazy—they think in terms of leverage, they avoid unnecessary work, and they're constantly asking "what's the simplest thing that could possibly work?" AI coding amplifies this mindset beautifully.

A lazy programmer using AI will spend more time thinking about whether a feature should exist at all before implementing it. They'll rubber duck with the AI to explore different approaches and their implications. They'll plan in smaller, testable increments because they know AI can implement quickly but debugging AI-generated code that went off the rails is a nightmare.

Meanwhile, the heroic programmers, the ones who love complexity and want to hand-craft everything—are going to struggle. They'll either reject the tools entirely and become increasingly irrelevant, or they'll use AI to generate even more elaborate solutions to problems that didn't need to be complex in the first place.

## When AI falls over itself (and why that's good)

AI coding tools have some wonderfully clarifying failure modes. They break in ways that force you back to programming fundamentals.

The context window fills up and the AI starts hallucinating. The service goes down mid-session. The model gets confused and starts suggesting solutions from the wrong language or framework. You get a beautifully implemented feature that doesn't actually solve the problem you described.

All of these failures have something in common: they punish sloppy process and reward careful, deliberate development practices.

The YOLO approach to AI coding hits these weaknesses hard. You end up with a pile of code that works until it doesn't, with no clear path to debugging or extending it. Technical debt accumulates faster than you can track it. Context gets polluted and you lose the thread of what you were trying to accomplish.

But if you approach AI coding with discipline, these same limitations become guardrails that keep you honest.

## A discipline re-emerges

The developers who are having success with AI tools aren't the ones trying to replace their entire development process. They're the ones who've figured out how to augment their existing good practices.

They're using plan-review-implement-test-tweak cycles, with human oversight between each phase. They're treating AI output like code from any other contributor; useful, but requiring review and integration. They're maintaining clean commit histories and using pull requests because they know that AI-generated code still needs to pass the same quality gates as human written code.

Most importantly, they're using AI as a thinking partner, not just a code generator. They're rubber ducking design decisions with the AI, exploring tradeoffs, discussing patterns, and working through the implications of different architectural choices. The AI becomes a way to think out loud about complex problems, not a way to avoid thinking about them.

This requires a different kind of skill development. You need to get better at articulating requirements clearly. You need to develop stronger mental models of system architecture. You need to be more explicit about your design decisions and their rationales.

In other words, AI coding tools are pushing us toward practices that we should have been following all along.

## The craft ~revolution~ evolution

What we're really optimizing for has shifted. Speed of implementation isn't the constraint anymore, clarity of thought is. The bottleneck isn't typing speed or syntax knowledge; it's understanding what you're trying to build and why.

This is actually a return to fundamentals, not a departure from them. The best programmers have always been the ones who think clearly about problems, communicate effectively with their teams, and make thoughtful architectural decisions. AI just makes these skills more obviously essential by removing the distractions.

I'm reminded of when I moved from assembly language to higher-level languages in the early '90s. Some of the old-timers complained that we were losing touch with the hardware, that we wouldn't understand what our code was actually doing. They weren't entirely wrong, most developers today couldn't optimize a tight loop in assembly if their lives depended on it.

But we gained something more valuable: the ability to think at higher levels of abstraction. Instead of optimizing individual instructions, we started optimizing algorithms and data structures. Instead of managing memory manually, we started thinking about system architecture and scalability patterns.

AI coding tools are driving the same kind of abstraction shift, just one level higher. Instead of optimizing individual functions, we're optimizing entire system designs. Instead of debugging syntax errors, we're debugging conceptual misalignments between requirements and implementation.

## Meta-commentary: on writing this essay

I'll admit something: I used AI tools to help think through parts of this argument. Not to write it—I'm still too attached to my own voice for that—but to explore counterarguments and test my reasoning.

The process was revealing. The AI was excellent at suggesting historical parallels I hadn't considered and pushing back on weak points in my logic. It helped me structure the argument more clearly and identify gaps in my thinking. But it couldn't generate the insights or synthesize the patterns that still required human experience and judgment.

This is exactly the kind of symbiotic relationship I'm arguing for. The AI handled the mechanical parts of argument development (finding examples, checking logical consistency, suggesting structure) while I focused on the creative and synthetic work (identifying patterns, drawing from experience, developing the central thesis).

The result is better than what I would have produced entirely on my own, but it's still fundamentally my thinking, just augmented and refined through collaboration with a very sophisticated tool.

## Making better programmers, not replaceing them

Here's what I think is really happening: AI coding tools are going to create a bifurcation in the development community. On one side, you'll have developers who treat AI as a shortcut to avoid thinking, who use it to generate code they don't understand for problems they haven't clearly defined. These developers will produce a lot of code very quickly, most of it fragile and unmaintainable.

On the other side, you'll have developers who use AI to amplify their thinking, who use it to explore solution spaces more thoroughly, prototype ideas more quickly, and implement solutions more efficiently. These developers will produce better software faster, with cleaner architectures and clearer rationales for their design decisions.

The difference isn't in the tools they use; it's in how they approach the craft of programming itself.

The developers in the second group understand something fundamental: programming was never really about typing code. It was always about thinking through complex problems, breaking them down into manageable pieces, and assembling those pieces into systems that solve real problems for real people.

AI tools don't change that essential work—they just remove more of the mechanical friction that gets in the way of doing it well. They're the latest in a long line of abstractions that let us think at higher levels and focus on what actually matters.

The question isn't whether AI will make us better or worse programmers. The question is whether we'll rise to meet the elevated expectations, or get comfortable in the comfortable mediocrity of generating code without understanding it.

I know which side I'm betting on. The same forces that drove us from assembly to high-level languages, from manual memory management to garbage collection, from writing our own web servers to using frameworks, are still in play. The developers who embrace the new abstractions while maintaining their fundamental understanding of the underlying principles will thrive.

The ones who mistake the abstraction for the reality—who think that generating code is the same as solving problems—will find themselves increasingly irrelevant in a world where anyone can make a computer write code, but only thoughtful developers can make it write the right code.

And honestly? That's exactly how it should be.

---
slug: the-signal-to-noise-problem-llm-work-breakdown
title: 'The signal-to-noise problem: why breaking work down for LLMs is harder than it looks'
date: 2025-09-06T10:00:00Z
draft: true
tags:
- ai
- software-development
- llms
- productivity
---

Last week, I was reviewing an outline I worked on with an LLM agent for a technical article. It looked solid: comprehensive sections, logical flow, all the boxes checked. But something was off. On a hunch, I removed a section that was good (but didn’t quite fit) entirely. 

The result? Not only did the article flow better, but when I ran it through quality scoring, they all rated the shortened version higher. The very tools that helped created the meandering narrative recognized the improved signal when it was removed.

This moment crystallized something I'd been noticing across months of working with LLMs: they excel at producing plausible content, but that plausibility masks a surprising amount of noise. And we're remarkably bad at spotting it in real-time.

## The Nature of LLM Noise

Noise in LLM output isn't like static on a radio, it's more insidious. In prose, it manifests as sections that seem reasonable but don't quite belong. They use the right terminology, follow logical structures, but somehow dilute the core message. Remove them, and your argument sharpens.

In code, the noise takes different forms. LLMs love to over-engineer solutions, adding abstraction layers that feel professional but serve no real purpose. They'll implement a factory pattern for a simple function call, or create elaborate error handling for scenarios that can't occur given the constraints of the problem.

The hallucination gradient runs from subtle to obvious. At one end, you have slightly misaligned assumptions; a function that handles edge cases that don't exist in your domain. At the other end, complete fabrications, importing libraries that sound plausible but were never written. Most noise lives in the murky middle, where experience and careful review might catch it, but often doesn't.

This accumulation happens because LLMs optimize for completeness, not conciseness. They're trained on vast corpora where comprehensive answers often score higher than precise ones. When you ask for a design document, they give you everything that could possibly be relevant, plus some things that merely sound relevant.

The ambiguity problem compounds over distance. Think about descending a mountain: a 1% deviation in your angle of descent might only put you a few feet off course after 100 metres. But maintain that angle for kilometres, and you'll miss base camp entirely. Each ambiguous decision in an LLM's output creates a branching point where noise can accumulate.

## The Scale Problem

Here's why I catch noise more easily in essays than in code: narrative has a single thread. When a paragraph doesn't fit, it's like a wrong note in a melody—jarring and obvious. An essay of 1,000 words forms a coherent whole that your mind can hold at once.

Code operates differently. A typical project spans 10,000 to 100,000 lines, distributed across dozens or hundreds of files. The logic isn't linear—it's a web of interactions, dependencies, and state changes. A suspicious abstraction in one module might only reveal its uselessness when you're debugging an unrelated feature three modules away.

The cognitive load of context switching makes this worse. Reading an essay, you maintain a single mental model. Reviewing code, you're constantly loading and unloading context: What does this class do? What are its dependencies? How does it interact with the system? By the time you've built enough context to spot subtle noise, you've already moved on to the next component.

But the real killer is velocity. LLMs produce content faster than any human can properly review. We're evolved for conversations at speaking pace, maybe 150 words per minute. An LLM can generate thousands of words in seconds. Even experienced developers, who've spent decades reviewing code, struggle with this firehose of output.

The exhaustion is real. After reviewing the third thousand-line module of the day, your pattern recognition starts to fail. You begin accepting plausible-looking code because fighting through the verification would take longer than just accepting it and fixing issues later. This is how noise becomes technical debt.

## Personal War Stories

Let me share the YOLO spectrum—You Only Launch Once, except with LLMs, you're constantly launching half-baked experiments into your codebase.

Small utilities work pretty well out of the box. Ask an LLM to write a script that renames files based on EXIF data, and you'll get something functional. The noise might be an overly complex regex or unnecessary error handling, but it's manageable.

Scale up to a medium-sized project—say, a REST API with authentication, database integration, and business logic—and things get messier. The LLM will work, sort of. It'll generate endpoints that mostly do what you want. But dig deeper, and you find architectural decisions that make no sense. Why is user authentication handled in three different places? Why does every database query have its own connection pool? The code runs, but it's held together with digital duct tape.

The real pain comes weeks later when you need to add a feature. What should be a simple change requires refactoring half the codebase because the original design was noise masquerading as architecture. You face a choice: pile on more complexity to maintain backwards compatibility, or admit defeat and rebuild.

I've watched teams choose the first option too many times. They add adapter layers, compatibility shims, elaborate workarounds. Each addition makes sense in isolation—we can't break existing functionality—but collectively they transform technical debt into technical regret. The debug/fix cycles get longer. Simple changes require archaeological expeditions through layers of assumptions.

## The Bisection Solution

The solution runs counter to how LLMs want to work. These models perform best with large context windows—feed them your entire codebase, and they can make connections across modules. But human comprehension works oppositely. We need small, focused problems we can fully understand.

This is where bisection becomes critical. Instead of asking an LLM to design your entire system, break it down:

**First pass**: High-level architecture. What are the major components? How do they interact? Keep this under a page.

**Second pass**: Deep dive on one component. What are its responsibilities? What interfaces does it expose? Still keeping it focused.

**Third pass**: Implementation details for critical functions. Now we're getting specific, but only for small, well-defined pieces.

Each pass is an opportunity to remove noise. That authentication system spread across three places? Caught in the architecture review. The overly complex abstraction? Spotted when we focused on just that module.

The process feels backwards because it is. We're asking the LLM to do more work—multiple passes, multiple prompts—to get less output. But that's precisely the point. Each iteration removes a layer of noise, like repeatedly filtering coffee until you're left with something clear and strong.

I've found that asking the LLM to question its own assumptions helps. "What could go wrong with this design? What are we assuming that might not be true?" Often, the LLM will identify its own noise, though it rarely removes it unprompted.

Persisting these designs to documents that you then manually edit is crucial. The act of editing—removing sections, simplifying explanations, questioning assumptions—is where human judgment shines. We're good at recognizing when something feels over-engineered, even if we can't immediately articulate why.

## Looking Forward

The tools are evolving, but slowly. What we really need are LLMs that understand their own limitations—models that could suggest when bisection is needed, or flag their own uncertainty. "This section is speculative," or "Consider simplifying this abstraction" would be invaluable markers.

Could LLMs learn to gauge complexity and suggest different approaches based on project scale? A small utility gets a straightforward implementation, while a large system triggers requests for more specific requirements and constraints.

The discipline of prompt engineering is evolving too. We're learning to write prompts that explicitly request conciseness, that ban certain patterns of over-engineering, that demand justification for every abstraction. But this remains fundamentally human work. We have to know what to ask for.

Curation is the skill of the future. Not just selecting good content, but recognizing and removing noise. It's subtractive creativity—seeing what shouldn't be there and having the confidence to remove it.

## Closing Reflection

We started with a simple observation: removing a section improved an article. But that small act of deletion reveals a larger truth about working with LLMs. These are powerful tools that paradoxically require more skill, not less, to use effectively.

The noise problem isn't going away. If anything, as LLMs become more sophisticated, their plausible-but-unnecessary output will become harder to spot. We'll need to develop new muscles for recognition and removal, new disciplines for breaking down work into reviewable chunks.

So slow down. Bisect your problems until they're small enough to hold in your head. Edit ruthlessly. Learn to see not just what the LLM produced, but what it should have left out.

The craft isn't in the prompting—it's in recognizing the signal hidden in the noise. And sometimes, the best code is the code you don't write, the section you delete, the abstraction you resist.

That's the paradox of working with infinitely productive tools: the most valuable skill becomes knowing what to throw away.
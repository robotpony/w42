---
slug: 'lab-notebook-a-summer-of-llm-assisted-everything'
title: "Lab notebook: a summer of LLM Assisted Everything"
date: '2025-09-07T12:25:20-07:00'
draft: true
---

I spent the summer of 2025 running an experiment on myself. The hypothesis was simple: use AI for everything possible and see what happens. The results? Well, let's just say my relationship with making things will never be the same.

This isn't another "AI will revolutionize everything" post. It's messier than that. Some things got insanely faster. Some got frustratingly slower. And a few things broke my brain in ways I'm still processing.

## Setting up the experiment

I threw every major LLM at every creative task I could find. Claude (both Opus and Sonnet), GPT-4 and the preview of 5, Gemini, and a parade of llama-compatible models. Even Stable Diffusion when I needed images. 

The domains ranged from my usual haunts (software development, technical writing, documentation) to less familiar territory like fiction and non-technical essays. I tracked everything: time to completion, revision cycles, bug rates for code, word counts for writing, and that nebulous quality metric of "am I happy with this?"

Here's what I learned.

## Observation 1: the speed gradient is real

Some tasks became laughably fast. Research that used to take hours collapsed to minutes. First drafts that consumed entire mornings appeared in half an hour. Boilerplate code that made me want to quit programming materialized instantly.

[EXAMPLE NEEDED: Show a before/after of a research task with time comparisons]

But then there's the other end. UI work in large codebases? Slower than doing it myself. Ambiguous requirements? Watch the LLM chase its tail for hours. Fiction with a specific voice? Prepare for frustration.

The pattern became clear: speed inversely correlates with ambiguity. Give an LLM a crystal-clear task with good examples, and it's like having superpowers. Hand it something vague, and time dilates toward infinity.

## Observation 2: everything is decomposition now

My brain had to rewire itself. I used to think in systems and architectures, big interconnected webs of functionality. That doesn't work with LLMs. They need atoms, not molecules.

The breakthrough came with writing. I was struggling to get consistent output until I created a detailed style guide. Suddenly, the writing sounded like me. Well, mostly like me. The formula emerged: style guide + clear specification + iterative clarification = actual quality.

[EXAMPLE NEEDED: Show style guide snippet and resulting output comparison]

This isn't just prompt engineering. It's a fundamental shift in how we need to think about creative work. Every task becomes an exercise in decomposition. What's the smallest, clearest unit I can specify?

## Observation 3: when progress stalls and loops emerge

You know that feeling when you're lost but keep driving, hoping the next turn will look familiar? That's what LLM collaboration feels like when it goes wrong. You make a small change request. The LLM misunderstands. You clarify. It breaks something else. You fix that. The original problem returns.

I started tracking these loops. The symptoms were consistent: commit velocity drops, bug counts rise, and you find yourself arguing with a machine about whether a button should be blue or green.

[EXAMPLE NEEDED: Show a conversation spiral from actual project]

The recovery protocol I developed is simple: Stop. Drop. Roll. Stop the current approach entirely. Drop back to the last working version. Roll forward with a completely different strategy. Fighting an LLM is like wrestling a cloud; you'll just tire yourself out.

## Case study: the family tree parser

Let me show you what this looks like in practice. I needed to parse an ancient genealogy file format and create a family tree viewer. One afternoon, 11,000 lines of code.

[EXAMPLE NEEDED: Show initial file format sample and parsing challenge]

Hour 1: Claude and I reverse-engineered the format. The documentation was sparse, and the format included several undocumented custom elements that the commercial genealogy program had added over the years. These proprietary extensions weren't mentioned anywhere, but LLMs excel at pattern recognition and inferring structure from examples. We had a working parser surprisingly fast.

Hours 2-3: Built the ASCII output. Multiple iterations, each improving the layout algorithm. This felt like pair programming with an eager junior who types at superhuman speed.

Hour 4: "Now make it HTML," I said, providing minimal guidance. Mistake. The result was functional but ugly, like a GeoCities page had a baby with a database dump.

[EXAMPLE NEEDED: Show HTML output screenshot and code snippet of the "ugly but functional" result]

The lesson? LLMs without guidance produce exactly what you'd expect from an unsupervised junior developer: code that technically works but makes you wince.

## The writing revolution

The biggest surprise was writing. My traditional process was glacial: 5-10 hours per 1000 polished words. Research, outline, draft, revise, revise, revise, hate everything, revise again, publish.

With AI assistance? One hour per 1000-2000 words. But it's not just faster, it's different.

[EXAMPLE NEEDED: Show the iterative Q&A process from an actual blog post]

The process becomes conversational. I start with a premise and some notes. The LLM asks clarifying questions. We build an outline together. I write sections while it suggests improvements. Then (and this is key) I run the near-final draft through multiple models for different perspectives.

The metrics tell the story:
- **Before**: 200-400 words/hour, 3-5 major structural revisions
- **After**: 1000-2000 words/hour, 1-2 major revisions
- **Trade-off**: Constant vigilance to maintain my voice

## Genre matters more than I expected

Technical writing saw the most improvement. Blog posts, documentation, specs, all dramatically faster and often clearer. The LLMs caught ambiguities I would have missed. It's like having an editor who can read at superhuman speed, processing entire documents in seconds and spotting inconsistencies that human eyes glaze over. They never get tired on the third readthrough, never miss that duplicated paragraph on page 47.

Non-technical non-fiction was trickier. The structure improved, but I had to fight to keep my voice. Every model wants to write like a helpful assistant, not a occasionally-profane developer with opinions.

Fiction? That's where things get weird. Plot structure, world-building, character backgrounds, all improved. But dialogue and voice? It's like every character graduated from the same "Helpful AI Assistant Academy."

[EXAMPLE NEEDED: Show fiction dialogue before/after AI assistance]

## The philosophy bit (you knew it was coming)

This changes what we are as makers. I'm not coding anymore; I'm conducting. I'm not writing; I'm directing. The skill shifts from doing to specifying and reviewing.

It feels like when I moved from developer to product manager, except the computer is my junior developer now. And like any junior, it needs clear requirements, patient guidance, and lots of review.

The interesting part? This might be good for actual junior developers. Entry-level work isn't disappearing; it's shifting to AI collaboration. The skills are different but the need for human judgment remains.

## What actually works

After hundreds of experiments, the patterns are clear:

**The Winners:**
- Anything with clear boundaries and good examples
- Research and exploration tasks  
- First drafts of everything
- Boilerplate code (thank fucking god)
- Structure for non-fiction
- Code refactoring with clear targets

**The Losers:**
- Aesthetic decisions ("make it pretty")
- Large-scale architecture choices
- UI/UX nuance (spacing, timing, feel)
- Integrating with complex existing systems
- Unique voice in creative writing
- Anything where "you'll know it when you see it"

## Writing this post with AI (so meta it hurts)

Let's get recursive. I used Claude to help write this post about using AI to write. The process:

1. Brain dump of notes and observations
2. Claude asks clarifying questions
3. We develop an outline together
4. I write sections, Claude suggests improvements
5. Run through multiple models for perspective
6. I do final voice pass to add back my personality

The whole thing took about 2 hours instead of my usual 8-10. But here's the kicker: I had to actively fight to keep it from sounding like every other AI-assisted post out there.

[EXAMPLE NEEDED: Show actual conversation snippets from creating this post]

## The path forward

This summer taught me that AI assistance isn't a toggle; it's a dial. And learning where to set that dial for each task is the skill we need to develop.

I'm still figuring out the implications. My coding is faster but requires more review. My writing is more productive but needs constant voice checks. Everything requires clearer thinking upfront.

The tools will keep improving. The key is improving how we think about using them. Decomposition. Specification. Direction. Review. These are the skills that matter now.

We're all directors now, whether we wanted the job or not. Might as well get good at it.

---

*P.S. If you're curious about specific workflows or want to see more examples, hit me up. I have notebooks full of experiments that didn't make it into this post.*
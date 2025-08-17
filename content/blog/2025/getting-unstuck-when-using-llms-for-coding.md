---
slug: 'getting-unstuck-when-using-llms-for-coding'
title: 'Getting unstuck when using LLMs for coding'
date: '2025-08-16T16:51:26-07:00'
draft: false
---

Your AI coding assistant hasn't gotten worse; you've just hit the ceiling of what your current approach can handle. "My LLM coding tools have been serving me hot garbage lately" is a complaint I see weekly on Reddit. Same tool, same developer, suddenly worse results.

These threads are full of developers convinced their AI assistant has degraded overnight. Same prompts that worked last month suddenly fall over. The tool must be broken, right?

Here's what's actually happening: the tool hasn't changed. Your problems have.

When your LLM starts failing consistently, it's not a quality issue. It's a signal that you've hit the limits of your current approach. The fascinating part is how predictable these patterns are, and how fixable they become once you recognize them.

## The obvious culprits we all know about

Let's get the well-documented issues out of the way first:

**Context pollution** happens when your conversation gets too long and the LLM starts mixing up earlier requirements with current ones. **Conflicting requirements** occur when you've asked for things that fundamentally oppose each other. **Hallucinations** pop up when the model confidently invents things that don't exist or don't work together.

And don't forget about **randomness drift**, which occurs when developers forget that LLMs use temperature settings and probabilistic sampling. That "perfect" solution you got yesterday? The model might generate something slightly different today, even with identical prompts. This isn't degradation; it's literally how the technology works.

And these aren't separate problems; they compound each other. When your context is polluted or your requirements conflict, hallucinations become more likely. The model, trying to satisfy impossible constraints, starts confidently producing code that does not work.

These are annoying, sure. But they're not the interesting problems. They're not why experienced developers end up in those Reddit threads, convinced their AI assistant has lost its edge.

## Down the rabbit hole we go

The real frustration comes from a less obvious pattern. Your LLM assistant keeps making the same *class* of mistakes, especially when you're working on:

- fiddly UI components that need precise positioning,
- graphics or visualization code with complex state,
- balanced algorithms that require careful coordination, and
- file format parsers with detailed specifications.

You tweak your prompt. You add more context. You try different phrasings. But the LLM keeps generating variations of the same flawed approach. It's like watching someone try to push a door marked "pull," over and over again. Except that it's less entertaining.

This isn't the tool being broken. This is the tool telling you that you're operating at the wrong altitude.

## Zooming in: enhance, enhance, ENHANCE!

When I'm coding with LLMs, I've learned to constantly adjust my altitude; that is, the level of abstraction I'm working at. Sometimes I need to be an architect, thinking about high-level system design. Other times I need to be a plumber, diving into log files and debugging line by line.

Last month, I was building a data visualization component. The LLM kept generating React code that *almost* worked but had subtle state management issues. Every fix created new edge cases. Classic LLM loop of doom.

So I changed altitude. Instead of asking for React component fixes,

1. **I dove in** and manually tested the rendering logic, inspected the actual DOM updates, and traced through the state changes.
2. **I identified the real problem** and found that the component was trying to do too much, mixing data transformation with visualization.
3. **I resurfaced** and redesigned it as two separate modules with clear interfaces.

The LLM hadn't been struggling with React. It had been struggling with my muddy architecture.

And yes, I missed the conflated concerns in my code reviews. The truth is that it's easy to lose focus with the volume of code an LLM can create, and it's a challenge to review each line with a sharp and clear mind.

## The library extraction pattern

When you hit that wall of repetitive failure, stop. Don't tweak the prompt again. Extract the problem into a library or module.

Here's a before and after from a recent project:

**Before** (a mess of intertwined concerns):
```javascript
function ProcessReport({ data, config, onUpdate }) {
  // 200 lines of mixed parsing, validation, transformation, and UI logic
  // LLM kept breaking it in subtle ways
  // Every fix created new issues
}
```

**After** (clear separation):
```javascript
// data-parser.js
export function parseReportData(raw) { /* ... */ }
export function validateReportStructure(parsed) { /* ... */ }

// data-transformer.js
export function transformForVisualization(validated) { /* ... */ }

// ProcessReport.jsx
function ProcessReport({ data, config, onUpdate }) {
  const parsed = parseReportData(data);
  const validated = validateReportStructure(parsed);
  const transformed = transformForVisualization(validated);
  // Clean UI logic here
}
```

Once I had clear modules with focused responsibilities, the LLM could help effectively. Each piece had testable inputs and outputs. The fog lifted.

## The multiplier reality check

Here's the truth about productivity with LLM coding assistants:

**50x multiplier**: Boilerplate code, CRUD operations, standard patterns. The LLM flies through these. You're basically dictating code.

**10x multiplier**: Business logic, API integrations, refactoring existing code. Still very fast, occasional corrections needed.

**2x multiplier**: Complex algorithms, performance optimization, novel architectures. You're doing more guiding than generating.

**1x or negative**: You're fighting the tool. Every suggestion needs major rework. You spend more time fixing than writing.

When you hit that 1x threshold, it's time to stop and think. The problem isn't the LLM; it's usually one of:

- unclear requirements,
- poor architectural choices,
- a codebase that is too messy to reason about, and/or
- a problem that needs additional decomposition.

## When to hit reset

Sometimes the best code is the code you delete.

If you've been stuck in the same loop for a few iterations, stop. Reset the branch. Walk away from the keyboard. When you come back, ask yourself:

- can I simplify this approach?
- am I solving the right problem?
- would a different architecture make this trivial?

The sunk cost fallacy hits hard when you've been iterating with an LLM. Those 47 prompts feel like progress, but they're often just 47 variations of the wrong approach.

## It's not that different from regular coding

Getting stuck with an LLM is remarkably similar to getting stuck without one. When we hit a wall in our own coding, we:

- take a break,
- rethink our approach,
- refactor for clarity,
- throw our pointing device against the wall, and
- sometimes start over

The key difference? When we're stuck ourselves, we don't usually argue with our brain about why it's not working. We just try something different.

Your LLM is doing exactly what you're asking it to do. If it's not working, it's time to ask for something different, or better yet, ask yourself if you're solving the right problem at the right level of abstraction.

The tool isn't broken. It's just holding up a mirror to your architecture.

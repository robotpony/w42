---
slug: after-the-prompt-how-ai-disappears-into-everything
title: 'After the prompt: how AI disappears into everything'
date: 2025-09-06T10:00:00Z
draft: false
tags:
- ai
- computing
- software-design
---

I've been thinking about the current AI moment, and I can't shake the feeling that we're about to hit a wall. Not a failure wall, more like the wall Web 1.0 hit right before everything changed. Remember when every startup was "webr.com" and the height of innovation was animated GIFs? We're in the AI equivalent of that era right now.

Just as Web 2.0 wasn't really about AJAX or rounded corners, AI 2.0 won't be about better chatbots. We're about to witness a fundamental shift in how AI gets built, deployed, and integrated into our daily tools. And honestly? It can't come soon enough.

## The Web 2.0 parallel

Let's be real about what Web 2.0 actually was. It wasn't the technology, it was the shift in thinking:

| What | How we got there | 
| :------- | :------ | 
| *Read → Write*             | We went from consuming static pages to everyone becoming a publisher  | 
| *Desktop → Mobile*         | New devices meant new interaction paradigms |
| *Directories → Algorithms* | Yahoo's human-curated web gave way to Google's PageRank |
| *Pages → Platforms*      | Individual websites became Facebook, Twitter, YouTube |

The real magic? The winners made the "web" part invisible. You don't think about HTTP when you post to Instagram.

I'm seeing the same patterns in AI:

| What  | How we’ll get there | 
| :------- | :------ | 
| *Prompt → Program* | We'll move from chat interfaces to embedded  intelligence |
| *Cloud → Edge* | API calls will give way to local models (Apple's already betting on this) |
| *General → Specific* | ChatGPT for everything becomes domain experts for specific things |
| *Assistant → Infrastructure* | The helpful bot becomes an invisible layer |

This pattern of initial complexity giving way to invisible infrastructure is already playing out with AI. The telltale signs are everywhere, from the shift in how we talk about these tools to what we're actually building with them. 

## Tokens are the new Binary

Here's where things get weird and interesting. I've been thinking about tokens a lot lately, and I've come to a fairly obvious realization: tokens are the new binary.

Consider this: the Chinese city '北京市' takes 3 tokens in GPT-4 but 7 in Claude. That's not just a quirk, it's a fundamental incompatibility at the lowest level of these systems. It's like trying to run x86 code on ARM.

This is interesting because:

- Token engineering is the new assembly optimization
- Different tokenizers are creating the new x86 vs ARM
- Token injection is the new buffer overflow
- Token caching is the new opcode caching 
- It’s a cost and performance differentiator that compounds and creates moats as sticky as iOS vs Android

If tokens really are the new binary, then whoever builds the "operating system" for tokens, the layer that manages token "memory," handles token "interrupts," and provides token "system calls”, builds the next $100B company.

While there are many technical hurdles between ubiquitous use of LLMs, the larger gap is in the architecture. How do we scale and optimize these tools for use everywhere? 

## The architecture of next

Right now, everyone's deploying static models. Even "ChatGPT" is just switching between frozen snapshots. But the architecture is evolving:

| Now → | Next → | Future → |
| :-----: | :-----: | :-----: |
| `Static Models` <br/> <br/> Frozen weights, no adaptation | `RAG + Scheduled Updates` <br/> <br/> External memory, periodic retraining | `Hybrid Systems`  <br/> <br/>  Deterministic code + probabilistic AI |

Here's the thing most people don't want to admit: most "learning" needs are just clever caching. You don't need a model that truly learns from every interaction. You need a good data pipeline and maybe some periodic fine-tuning. 

True online learning? That's only necessary for a tiny subset of applications. But the market doesn't know this yet, which creates opportunity. You could build a "learning system" that's actually just smart caching and still blow people's minds.

## The Real Revolution: Boring AI

The WordPress moment for AI is coming. Remember when setting up a blog went from "install Linux, Apache, MySQL, and PHP" to "click this button"? That's about to happen with AI.

When AI becomes truly boring:

- Deployment becomes trivial
- Integration is a library, not a project
- AI configuration is a YAML file, not a team of PhDs
- "AI-powered" marketing copy disappears because it's meaningless

The winners won't focus on having the best models. They'll focus on:

- Domain expertise over model quality *(think Bloomberg Terminal, not ChatGPT)*
- Reliability over impressiveness 
- Solving actual problems vs. building toys
- Making AI so seamless users don't even know it's there

## What This Means for Builders

If you're building in AI right now, here are the questions that matter:

**Is AI core to your value or just making your real product better?** If you're building "Uber, but with AI," you're probably fucked. If you're building something where AI is the invisible magic that makes everything work better, you might be onto something.

**Do you need true adaptability or just its appearance?** Most users can't tell the difference between a model that's learning and clever caching. Build the simpler thing that works.

**What happens when inference is essentially free?** Because it will be, probably within 2 years. If your whole business model is charging for API calls, start pivoting now.

**How do you handle the new security threats?** Prompt injection is the new buffer overflow. If you're not thinking about this, you're not ready for production.

## The Uncomfortable Questions

There are some things keeping me up at night about this shift:

**Token lock-in is real.** OpenAI's tokenizer isn't the same as Claude's. Are we creating new platform wars? The same Chinese city name takes 3 tokens in GPT and 7+ in Claude. That's a cost and performance difference that compounds.

**Where are the missing layers?** If tokens are binary, where's the operating system? Where's the LLVM of AI? Where's the middleware? Imagine a layer that automatically handles token optimization across models, like how LLVM handles CPU instruction optimization. These feel like billion-dollar questions that nobody's answering yet.

**Who owns the primitives?** We're shifting from boolean logic to vector operations, from exact matches to similarity search. Whoever controls these new primitives controls the future stack.

## The Next Phase

The AI 2.0 winners won't have the best models. They'll build the boring infrastructure that makes AI as reliable and invisible as databases. They'll solve the token compilation problem. They'll make specialized AI that actually works in production.

The revolution isn't coming through better chatbots. It's coming through making AI so mundane, so integrated, and so reliable that we forget it's even there. Just like the best Web 2.0 companies made us forget about the web.

I'm reminded of that William Gibson quote: "The future is already here, it's just not evenly distributed." The boring AI future is already visible if you know where to look. The teams building Postgres extensions for vectors (pgvector), the companies making model deployment trivial (Replicate, Modal), the startups focusing on specific vertical problems—they get it.

The rest? They're still building chatbots.

And that's fine. Someone needs to explore the current paradigm to its limits. But I'm more interested in what comes next. The shift from "look at this cool AI thing" to "of course it works that way, how else would it work?"

That's the future I'm building toward. Boring, invisible, utterly transformative AI that just works.
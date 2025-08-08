---
slug: 'how-i-use-ai-tools-and-how-they-are-changing-software-development'
title: 'How I Use AI Tools and How They Are Changing Software Development'
date: '2025-08-07T14:14:30-07:00'
draft: true
---

<img src="http://images.warpedvisions.org/2025/07/ai-dream-wide.jpg" alt="AI Image" />

Something weird happened the other day. I found myself sketching more than I had in years. The pages quickly fill with diagrams, wireframes, and half-formed ideas that used to live in my head until they died of neglect. The reason? I can finally get from sketch to fleshed-out concept fast enough that my ideas don't evaporate.

After a few months of serious AI-assisted development, I'm starting to understand what these tools actually do well, and more importantly, where they will cheerfully lead you off a cliff. They don't replace thinking, they amplify it. But only if you understand the difference between augmenting your expertise and outsourcing your judgment.

## Different tools for different jobs

I’ve found that the most useful way to think about AI is as a collection of specialized tools. Each tool behaves like a hand-crafted instrument with its own strengths and idiosyncrasies, and picking the right one for a given task can make the difference between success and frustration. Picture a workshop where every tool is built for a particular purpose, only that a some of those tools occasionally start hallucinating.

**Claude.ai** has become my design partner. I use it for ideation, design thinking, research, and writing. The conversational depth works perfectly for exploring complex problems and you can iterate on ideas in real-time without the cognitive overhead of context switching. 

I had a real breakthrough with Claude when I started using style guides as prompts, when I realized that it thrived on clear and narrow context. I had some stale product requirements that needed to communicate their core value more clearly. Instead of grinding through rewrites myself, I asked Claude to provide alternatives closer to my style and Paul Graham's voice. The transformation was remarkable—suddenly dry technical specs became compelling explanations of why someone should care about the feature.

**Claude Code** lives in my terminal and VSCode, handling coding tasks. It excels at working on small utilities, refactoring changes, extending existing code, and—surprisingly: teaching me new codebases. There's something magical about being able to ask, "What does this function actually do?" and getting a clear explanation instead of spelunking through documentation. It's useful on larger projects, too, but you do have to manage your scope carefully.

**Llama** runs locally for evaluation and prototyping. When I need to experiment without cloud dependencies, or when I'm working on something sensitive, having a capable local model changes the game. It's not as conversational as Claude (depending on the model and hardware), but for quick code analysis or brainstorming, it's invaluable.

**Gemini** handles my more random questions and learning. I often cross-check findings across multiple engines. If Claude and Gemini agree on something technical, I'm usually in good shape. If they disagree, I know I need to dig deeper.

## The method hasn't changed, and it's more important than ever

Here's the thing that surprised me most: these tools work dramatically better when you separate thinking from doing. This should be obvious, it's how good software development already works, but it's easy to skip the design phase when you're vibing. With AI, skipping design becomes actively dangerous.

The tools excel with small, clear, well-thought-out chunks of work. Give Claude a vague "build me a thing" request, and you'll get vague, thing-shaped code. Give it a specific, well-scoped task with clear requirements, and you'll get something genuinely useful.

This has led to a sketching renaissance in my workflow. I'm writing more requirements, more architecture documents, more detailed sketches of what I want to build. The payoff is enormous: the gap from idea to working prototype has collapsed from days to hours.

I've started using style guides for everything now—not just blog posts, but also for product requirements, READMEs, and architecture documents. Having a consistent voice across all your project documentation isn't just nice to have; it actually helps the AI understand the context and tone you're aiming for.

## These tools are magical

When these tools click, they feel like having a conversation with the most patient, knowledgeable colleague you've ever worked with. Here's where I've found the real productivity multipliers:

**Architecture and decision making** have become collaborative. I ask for lists of alternative approaches, justifications for each, and detailed tradeoffs. I repeat this process a few times to ensure I'm seeing the full possibility space. What used to require hours of research and discussion now happens in minutes, but with better coverage of edge cases and alternatives.

**Learning new technologies** is transformational. Instead of wading through documentation for simple questions, I can ask targeted questions and get immediate, contextual answers. "How does React's useEffect differ from componentDidMount?" gets me a precise answer instead of generic tutorials.

The real magic happens in **rapid prototyping**. I can go from rough sketch to working demo faster than ever before. Not because the AI writes better code than me, but because it handles the tedious parts while I focus on the interesting problems.

## Like boots or hearts: when it starts, it really falls apart

Of course, it's not all magic and productivity gains. These tools fail in predictable ways, and if you're not careful, they'll fail spectacularly.

**Context collapse** is the most common failure mode. The AI forgets key details, hallucinates features that don't exist, or loses the thread of what you're trying to accomplish. I've learned to structure my approach to minimize this: use smaller modules, focus on one priority at a time, and restart conversations between major tasks. When a conversation starts feeling confused, throw it out and start fresh.

But the more dangerous problem is that AI coding is like automating a **loaded gun**. Less experienced developers can build enormous, complex systems with AI assistance before realizing they've made fundamental design mistakes. It's like the old *ways to shoot yourself in the foot in various programming languages* joke, except now you can do it much more quickly and with larger guns.

The pattern I see is "vibe coding"—relying too heavily on the AI's intuition without architectural guidance. When you're building something large with minimal constraints, everything from abstraction names to component design becomes random chance. This has always been true, but with AI tools, you reach the point of no return much more quickly.

**Sunk cost spirals** are particularly insidious. Human plus AI can continue down obviously wrong paths for surprisingly long periods. The solution isn't better prompting, it's stepping back and questioning the entire approach. Sometimes you need to throw out the branch and start over.

## It changes you as a developer

The most interesting change isn't in what I build, but how I think about building. I'm spending less time on low-level implementation details and more time on tech leadership, architecture, and thinking about what features actually mean to people.

This altitude adjustment feels significant. I question my technical instincts less because I can validate them quickly. Instead, I focus on pattern recognition, system design, and the human elements that AI can't handle.

> The tools excel at amplifying expertise, but they can't substitute for understanding why you're building something in the first place.

The core insight that crystallized for me is that it was always about the idea-build-test cycle. None of us really know what will work until we try it. The faster you can iterate, the faster you can find what's valuable and interesting. AI tools compress the build phase dramatically, which means more time for the thinking phases that actually matter.

## Making it work for you

If you're thinking about integrating AI tools into your development workflow, here's what I've learned works:

**Match tools to specific use cases.** Don't try to use Claude for everything. Each tool has strengths and weaknesses—play to them.

**Structure your process around the tools' limitations.** Break work into small, well-defined chunks. Keep conversations focused. Restart context when things get muddy.

**Build judgment before relying on suggestions.** This is especially crucial for junior developers. The tools can accelerate learning, but they can't substitute for understanding fundamental principles.

**For experienced developers**: embrace the amplification, but don't lose the craft. These tools make you more productive, but they don't make architectural thinking obsolete.

The frustration that experienced programmers initially feel is real and understandable. These tools change your workflow in fundamental ways, and there's a learning curve to using them effectively. But once you calibrate your approach, the productivity gains are genuine.

## The future is still full of making interesting things

We're in the early days of understanding how AI changes software development. The tools will get better, the integration will get smoother, and the failure modes will evolve. But the fundamental insight remains: these are amplification tools, not replacement tools.

The craft of software development isn't disappearing—it's evolving. The developers who thrive will be those who understand how to combine human insight with AI capabilities. We're becoming augmented developers, and that's a more interesting future than I expected.

The best part? I'm sketching more, writing more, and building more interesting things. The tools have compressed the tedious parts of development, leaving more time for the creative work that drew us to programming in the first place. That feels like progress.

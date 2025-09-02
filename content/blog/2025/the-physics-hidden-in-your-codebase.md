---
slug: the-physics-hidden-in-your-codebase
title: The physics hidden in your codebase
date: 2025-09-02T11:02:00Z
draft: false
tags:
- software-design
- architecture
- ai
- programming
---

<img src="https://images.warpedvisions.org/2025/09/crab-evolution-hand-drawn.jpg" alt="AI Image of crabs" />

Evolution has a weird obsession with crabs. At least five times, nature has taken some random crustacean and said, "you know what would work better? A crab." But it's not just crabs, evolution continues to reinvent the wheel. Trees evolved independently more than 40 times. Many different types of eyes appeared in dozens of unrelated lineages. Flight emerged in insects, pterosaurs, birds, and bats, each independently.

These aren't coincidences. They're examples that good design is inevitable.

The same forces that push random arthropods toward crab-shape push our software systems toward certain architectures. Not because we're copying each other, but because we're all solving the same problems with the same fundamental constraints.

I've been thinking about this *inevitability* in system design, how the best solutions aren't invented, they're discovered. And how certain architectural patterns keep emerging like those damn crabs, those trees, and those eyes.

## Good design isn't created, it's uncovered

Michelangelo said that, "every block of stone has a statue inside it, and it is the task of the sculptor to discover it." He wasn't creating David, he was revealing the David that was always there, hidden in the marble.

Software architecture works the same way. The best designs already exist in the problem space, waiting to be discovered.

Back in the late 1990s, I watched data buses emerge across different companies and projects. Nobody was copying each other, we were all just chipping away at similar problems until the same shapes emerged. Network latency forces you to batch operations. CPU cache lines push you toward data-shaped design. Disk I/O makes you discover buffering and write-ahead logs.

These aren't design choices. They're the software equivalent of finding the figure in the stone.

Just as a sculptor must work with the texture and shape of the marble, we must work with the grain of our constraints. Just as wings must be shaped certain ways to generate lift, systems must be architected certain ways to handle load. The constraints define what's possible. Good design becomes as inevitable as water finding the lowest point.

Physical constraints create natural fissures in problem spaces; places where systems want to cleave. When you split along these lines, everything just *works*. You're not imposing an arbitrary structure; you're revealing a structure that was always there. Performance is predictable. Interfaces are simple. The good attributes are maximized almost automatically.

But fight against these fissures? Try to carve against the marble's grain? I've seen teams try to split systems across network boundaries in ways that violated the natural structure. The result is always the same: race conditions multiply like rabbits, performance becomes unpredictable, and complexity explodes. 

You can't fight the stone and win. You can only discover what it wants to become.

## The convergent evolution of software patterns

Look at any mature software ecosystem and you'll see the same shapes emerging, like ancient forms revealed by erosion:

**The tree pattern**: Hierarchical structures appear everywhere; file systems, DOM, org charts, dependency graphs. Just like biological trees, they solve the distribution problem efficiently. Nobody invented the tree structure; we just kept finding it.

**The eye pattern**: Monitoring and observability systems converge on similar designs; collectors, aggregators, visualizers. Every system eventually evolves the ability to see itself. The need to observe reveals the same solution.

**The crab pattern**: Sideways scalability through horizontal distribution. Whether it's microservices, map-reduce, or actor systems, we keep uncovering the same crab-walk approach to handling load.

**The 'nix pattern**: "Everything is a file," small composable tools, pipes for composition; these principles weren't arbitrary design choices. They emerged because they match how humans think about and manipulate data. When Plan 9, Linux, and dozens of Unix-likes independently evolved similar philosophies, they weren't just copying, they were all discovering the same fundamental truths about operating system design. Even Windows PowerShell eventually evolved objects-as-streams. The stone wanted to be carved this way.

Operating systems in the 1990s all converged on similar abstractions, not through collaboration, but through discovery. The POSIX standards didn't invent these patterns; they just documented what everyone was already finding. Networking stacks in the 1980s independently revealed layering patterns. Today's microservices are yesterday's SOA are last decade's distributed objects. The names change, but we're all finding the same shapes in the stone.

## Natural selection as a discovery mechanism

Here's where it gets interesting. LLMs and coding agents are accelerating this discovery process in a way that proves just how inevitable these patterns are.

When you iterate with an AI coding assistant, you're not really creating. You're running a hyper-speed discovery process. Each iteration chips away more stone, revealing more of the shape that was always there. The selection pressures, like tests that must pass, performance requirements that must be met, human reviewers that must be satisfied; these aren't shaping the solution. They're helping us find it faster.

What fascinates me is watching AI rediscover the same patterns we've been finding for decades. Give an LLM a distributed systems problem, and it will eventually reveal something that looks like a message queue. Not *just* because it's learning from existing solutions, but also because that's the shape hidden in that particular problem domain. 

AI brings examples to the table, yes, it's seen message queues before. But watch what happens when you add your specific constraints: it pieces those examples together in new ways, adapting and evolving them to fit your particular stone. The resulting shape is both familiar and unique, a message queue, but one carved to match your exact grain.

It's proof that these patterns aren't arbitrary human convention; they're as inevitable as the David in Michelangelo's stone. The AI accelerates our discovery by bringing thousands of chisels to try, but the shape that emerges is still determined by the marble itself.

## Reading the grain of inevitability

So how do you know when you're revealing the natural design versus trying to impose your own? After banging on enough problems over the years, you develop a feel for the marble:

- **Clean breaks**: When a system cleaves naturally along a boundary, you've found a real fissure in the stone
- **Simple interfaces**: Natural structures create minimal surface areas between components
- **Predictable performance**: Working with the grain rather than against it
- **Universal emergence**: If everyone keeps "inventing" the same solution, they're not inventing, they're discovering
- **That feeling of recognition**: When the solution feels found rather than built

Good design has a quality of obviousness in retrospect. Of course databases use B-trees. Of course web apps separate presentation from logic. Of course distributed systems need consensus protocols. We didn't invent these patterns, we revealed them by chipping away everything that didn't work.

## When to fight the stone

Sometimes you don't want the shape that's emerging. Sometimes the marble seems to contain a crab, but you need a bunny.

But be honest with yourself about what you're doing. Are you revealing a different shape that's also in the stone? Or are you trying to force the marble into something it doesn't want to be?

I've seen too many projects fail because someone decided they were Michelangelo working with clay instead of marble. They built custom frameworks instead of discovering the natural ones. They invented new patterns instead of recognizing the emerging ones. They fought the stone and lost.

The trick is recognizing which parts of your problem space are still unexplored marble and which parts have well-established forms waiting to be revealed. Focus your exploration on the former, embrace the discovered patterns in the latter.

## Embracing evolutionary design as discovery

The most productive developers I know have made peace with being discoverers rather than creators. They approach each new system like archaeologists approaching a dig site; careful, methodical, watching for the shapes that want to emerge.

This isn't giving up on innovation, it's recognizing that true innovation is finding shapes that nobody has revealed before. Use evolutionary thinking to accelerate your discovery process. Let the constraints guide your chisel. Save your energy for the truly unexplored marble.

Because here's the thing: even when you know there's a crab in the stone, you still have to do the work of revealing it. The journey teaches you *why* it's crab-shaped, why that form was inevitable given the constraints. That understanding is often more valuable than the shape itself.

Just ask any team that tried to adopt microservices without doing the work of discovery. They copied the revealed form without understanding why it emerged. They got a crab statue without understanding the marble it came from.

## The future is full of undiscovered forms

As AI coding assistants become more sophisticated, I expect we'll see this principle become even more obvious. These tools are essentially running millions of discovery processes in parallel, each one revealing the same optimal patterns hidden in the problem space.

The interesting question isn't whether AI will create new architectures, it's how many forms are still hidden in the marble, waiting to be discovered. And whether AI will help us recognize the grain faster, before we waste time trying to carve against it.

When I'm deep in a system design now, I've learned to approach it differently. I don't ask "what should I build?" but "what's already here?" I don't try to be clever; I try to be observant. I look for the natural fissures, feel for the grain, watch for the shapes that want to emerge.

I bang on the problem like a sculptor testing the stone. I chip away the parts that don't belong. I watch for the patterns that feel discovered rather than invented, the shapes that keep appearing across different systems, different teams, different decades.

Because good design isn't something you impose on a system. It's something already there, waiting to be uncovered. As inevitable as crabs. As natural as trees. As universal as eyes. As present as the David in the marble.

The best architects aren't the ones who invent new patterns, they're the ones who can see what's already in the stone. Who recognize the emerging crab and plan for claws. Who feel the grain and work
---
slug: 'turkey-dinner-as-a-metaphor-for-scaling-software'
title: "Turkey dinner as a metaphor for scaling software"
date: '2025-10-26T10:30:03-07:00'
draft: false
tags:
- ai
- software-development
- llms
- programming
---

<img src="https://images.warpedvisions.org/2025/10/harvest-banner.jpg" alt="AI image showing harvest colours in watercolours" />

Years ago, something clicked when I read about Anthony Bourdain's approach to feeding crowds. It was his [stunt turkey](https://www.amazon.ca/Appetites-Cookbook-Anthony-Bourdain/dp/0062409956) technique, where he cooks an extra turkey the week before the actual event. It made me think about how we release software. It seemed absurd at first: why would you cook two turkeys for one dinner?

Then I realized what he was really doing: load balancing across time.

That extra turkey unlocks a cascade of optimizations that aren't obvious until you think through the dependencies. Turkey stock made a week ahead means better gravy and more flavourful stuffing. It also means practice runs; most people only roast a turkey once or twice a year, so that stunt turkey is essentially a fire drill. Having stock and rendered fat ready lets you prep other components days in advance. Suddenly your Thanksgiving-day workflow changes from frantic juggling to orchestrated execution.

Bisecting complexity, and focusing on a small set of key quality factors before hitting production reduces risks and makes it easier to build delicious systems with less chaos.

## The critical path through Thanksgiving

When you map out Thanksgiving dinner as a dependency graph, something interesting emerges. The turkey stock sits at the root of everything: you can't make gravy until you have stock, you can't make stuffing the way you want it, you can't prep the vegetables in rendered turkey fat. That stock is your critical path, which is the longest sequence of dependent tasks that determines your minimum timeline.

Software architects call this a DAG (a [directed acyclic graph](https://en.wikipedia.org/wiki/Directed_acyclic_graph)). Understanding your critical path is essential for scaling. I've watched teams try to parallelize everything. They'd add more servers and more developers, yet ignore a fundamental problem: their database migration had to run serially and took hours. Here's the thing: no amount of horizontal scaling fixes a critical path bottleneck.

The stunt turkey technique works because it moves the critical path work off the critical day. You're essentially refactoring your dependency graph to reduce the longest path through the system. In distributed systems terms, you're reducing your latency by doing advance preparation, not by making individual operations faster.

## The big and little rocks of scaling

Bourdain's stunt turkey is an example of what Stephen Covey called "big rocks"; the high-impact preparation that enables everything else. In software terms, these are your foundational architecture decisions that create multiplicative effects downstream.

Just like that early turkey enables stock, gravy, stuffing prep, and risk mitigation, the right infrastructure investments unlock capabilities you didn't even know you needed. I've seen teams struggle with scaling because they tried to optimize the wrong layer. They'd tune database queries while their fundamental data model fought against their access patterns. They'd add more servers while their monolithic architecture created coordination bottlenecks.

The stunt turkey approach forces you to think about dependencies and bottlenecks before you're under pressure. In my experience with real-time systems, this kind of advance preparation is the difference between graceful scaling and catastrophic failure.

## Scaling cached configurations: when the fundamentals change

One scaling challenge I've encountered repeatedly involves cached configurations. Early in a system's life, configuration is simple; a few environment variables, maybe a config file. As you scale, configuration becomes distributed state that needs to be synchronized across dozens or hundreds of services.

What starts as a simple key-value lookup transforms into a distributed consensus problem. Suddenly you're thinking about cache invalidation strategies, eventual consistency, and circuit breakers. The turkey stock equivalent here is building configuration as a first-class service early, with proper versioning and rollback capabilities.

AI tooling is discovering similar patterns, with token caching and document retrieval. What looks like a simple optimization at small scale becomes a fundamental architectural constraint as you grow. The teams that prepare for this transition; their "stunt turkey"; will scale smoothly. The ones that don't will hit a wall where their configuration system becomes the bottleneck.

## Performance art vs. production systems

Not everything scales the same way, and that's where the metaphor gets interesting. Bourdain also talked about dishes that are essentially performance art; table-side preparations, flambéed desserts, anything that requires timing and showmanship. These don't scale by adding more cooks; they scale by understanding what can be prepped and what must happen live.

In software terms, this is customer service, installation support, or live deployments. You can't just throw more people at a critical deployment any more than you can throw more chefs at a soufflé. But you can prepare everything that can be prepared, automate what can be automated, and ensure your experts aren't wasting time on work that could have been done earlier.

I've seen organizations try to scale their deployment process by adding more people to the war room. What they really needed was better preparation; comprehensive testing environments, automated rollback procedures, and clear runbooks. The performance art still requires skilled practitioners, but everything around it can be optimized.

## Conway's Law and kitchen organization

The most interesting parallel between scaling dinners and scaling software is organizational. [Conway's Law](https://en.wikipedia.org/wiki/Conway%27s_law) states that organizations design systems that mirror their communication structure. Kitchens prove this every day.

A home kitchen designed for one cook can't efficiently handle four people, no matter how skilled they are. You need stations, clear responsibilities, and communication protocols. Commercial kitchens aren't just bigger; they're organized differently. The garde manger doesn't coordinate with the saucier the same way you coordinate with yourself when cooking alone.

I've watched teams try to scale by adding developers to a codebase designed for a small team. The result is always the same: coordination overhead grows faster than productivity. Like trying to cook Thanksgiving dinner for 40 people in a kitchen designed for 4, you spend more time negotiating for counter space than actually cooking.

The solution isn't a bigger kitchen; it's a different kitchen. Microservices, team topologies, and deployment boundaries aren't just technical decisions; they're organizational architecture that enables teams to work in parallel rather than in conflict.

## Approaching the limits: when scaling becomes dangerous

One of the most instructive aspects of scaling food service is understanding capacity limits. Every kitchen has a theoretical maximum; the point where adding one more order breaks the entire system. Professional kitchens know these limits intimately and design their service around staying comfortably within them.

Software systems have the same constraints, but we're often less honest about them. I've worked on real-time systems where approaching theoretical limits didn't just slow things down; it created cascading failures that took the entire system offline. Like a kitchen in the weeds, once you cross that threshold, recovery becomes exponentially more difficult than prevention.

The stunt turkey approach applies here too: load testing, chaos engineering, and capacity planning are your advance preparation. You want to discover your limits in controlled conditions, not during Black Friday traffic.

It's more than just prep, too. Bourdain was obsessive about tasting throughout the cooking process. Not just at the end when it's too late to fix anything, but constantly. A pinch of salt here, a taste there, adjusting as you go. That's testing and observability. 

In software, observability means instrumenting your systems so you can learn what's happening in real-time. Metrics, logs, and traces are your constant tasting spoons. I've seen teams build elaborate systems without proper monitoring, then wonder why they can't diagnose problems under load. They're serving dinner without ever tasting the sauce.

That stunt turkey lets you practice, and helps to remind you what "good" tastes like under controlled conditions. When you're monitoring your production system on Thanksgiving Day (or Black Friday), you need that baseline. You need to know what normal looks like so you can detect when something's off before your users complain. Just like a chef can tell by taste when the stock needs another hour of reduction, good observability lets you detect problems before they cascade into failures.


## Cron jobs as mise en place

The final parallel that strikes me is how cron-style batch processing mirrors kitchen prep work. Bourdain's advance stock preparation is essentially a cron job; work done during off-peak hours to enable peak performance.

I've seen systems transform their scaling characteristics by moving computation from request-time to background processing. Pre-computed aggregations, materialized views, and cache warming jobs are all versions of making stock ahead of time. They let you load balance across time rather than just across servers.

The key insight is recognizing which work can be done asynchronously and which must happen in real-time. Just like recognizing which components of your dinner can be prepped and which must be cooked fresh, this distinction often determines whether your system gracefully scales or falls over under load.

## Well-known recipes for well-known problems

Here's the thing about scaling: most of the problems you'll encounter have been solved before. Just like cooking Thanksgiving dinner for 40 people isn't a novel challenge; restaurants do it every day; scaling software systems follows predictable patterns.

The issue isn't lack of solutions; it's choosing the right recipe for your context. Home kitchen scaling looks different from restaurant scaling, which looks different from catering scaling. Similarly, scaling a CRUD application looks different from scaling a real-time system, which looks different from scaling an analytics platform.

Bourdain's stunt turkey works because it forces you to understand your specific constraints and dependencies before you're under pressure. In software terms, this means understanding your traffic patterns, data access patterns, team structure, and operational capabilities before you need to scale.

Most scaling failures I've witnessed came from teams applying the wrong pattern to their specific context. They'd read about Netflix's microservices architecture and try to apply it to a team of three developers. Or they'd implement Google's approach to data processing without Google's operational sophistication.

The solution isn't more innovative architecture; it's better pattern matching. Understanding which scaling approach fits your constraints, your team, and your timeline. Sometimes the right answer is a bigger server. Sometimes it's a complete re-architecture. Usually, it's something in between.

## The real lesson

The stunt turkey isn't really about turkey. It's about understanding dependencies, preparing for constraints, and enabling peak performance through advance work. In software, as in cooking, scaling isn't just about handling more volume; it's about maintaining quality and coordination as complexity grows.

The teams that scale successfully are the ones that invest in their preparation; the foundational work that seems excessive until you need it. They build configuration systems before they become bottlenecks, implement monitoring before they're flying blind, and design team boundaries before coordination becomes chaos.

Because here's the thing: when you're serving dinner to 40 people, or handling Black Friday traffic, or deploying during a critical deadline, you don't want to be learning how to scale. You want to be executing a plan you've already tested.

That's what the stunt turkey really teaches us. Sometimes the best optimization is just doing it twice.
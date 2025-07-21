---
slug: the-art-of-context-what-i-have-elarned-about-working-with-ai
title: "The Art of context: what I’ve learned about working with AI"
date: 2025-07-21T21:27:07Z
draft: false
---

I sat down last week to ask Claude to help me analyze some user feedback data. I spent fifteen minutes crafting what I thought was the perfect prompt:

```
> Please analyze this data, but don't make assumptions about causation,
  don't over-interpret small sample sizes, don't use corporate jargon,
  don't suggest solutions we can't implement, and definitely don't...
```

The response was generic and cautious. Frustrated, I tried again with a simple request:

```
> Here's some user feedback. What patterns do you see that might help us
  improve the product?
```

The result was exactly what I needed. There were clear insights, practical observations, and actionable suggestions.

That moment crystallized something I'd been learning over months of working with AI tools: success isn't about prompt engineering tricks or elaborate constraints. It's about managing context effectively.

## Context is everything (and we're thinking about it wrong)

Working with AI for research or creation tasks has taught me that the real skill isn't in crafting clever prompts, it's in information architecture for conversation. We're not programming a system; we're building a shared understanding with a collaborator who happens to be imaginary artificial.

The newness of these tools has people thinking about context in strange ways. I see developers approaching AI like they're writing defensive code, trying to anticipate every possible failure mode. I see writers crafting prompts like legal documents, hedging against misinterpretation. We're bringing old mental models
to a fundamentally different kind of interaction.

This reminds me of the early web development days when we'd write elaborate CSS hacks to force layouts that would have been simple with proper HTML structure. We were solving the wrong problem at the wrong level.

## Don't think about purple elephants

To understand why negative context often backfires, think of it this way: what happens when I tell you, "Don't think about purple elephants?"

*You thought about purple elephants, didn't you?*

The same cognitive load applies when we frontload AI conversations with extensive don'ts and warnings. Every restriction requires mental processing power, both for the AI and for us as we craft increasingly complex constraints. A prompt that starts with "Don't assume, don't generalize, don't oversimplify, don't..." forces the system to hold all those negatives in working memory while trying to figure out what you do want.

I see this constantly in code reviews too. When I tell a developer "don't use global variables here," it's less effective than showing them the specific pattern that would work better. The human brain—artificial or otherwise—works better with positive examples than negative constraints.

## Show me what good looks like

The breakthrough for me came when I shifted from using restrictions with prompting to using examples for context. Instead of telling the AI what not to do, I started showing it what good looked like.

Rather than: "Analyze this code but don't make assumptions about performance, don't suggest premature optimizations, and don't ignore readability concerns..."
I learned to say: "Here's some code I'm reviewing. I'm looking for feedback similar to what you might see in a thoughtful code review, focusing on maintainability, potential bugs, and any architectural concerns that stand out."

The difference is profound. The first approach creates a minefield of constraints. The second establishes a shared mental model and lets the AI work within that framework.

This mirrors good technical documentation practices. The best API docs don't list everything you shouldn't do. Instead, they show you clear examples of the intended usage patterns. They build understanding rather than enforcement.

## Clear language beats prompt hacking

One of the most persistent myths I see is that AI responds better to weighted language, by adding "very important" or multiple exclamation points or elaborate emphasis markers. This is cargo cult thinking, the equivalent of believing that shouting at your compiler will make it work better.
Professional communication works with AI the same way it works with humans: be direct, be specific, and respect the intelligence of who you're talking to. I've consistently found that clear, conversational language outperforms elaborate prompt engineering every time.

When I treat the AI like a skilled colleague rather than a temperamental system to trick, the interactions become more productive. I explain context the same way I would to a new team member: "Here's what we're trying to accomplish, here's the relevant background, and here's how I'm thinking about the problem."

## What actually works in practice

Through trial and error, I've developed some simple principles for managing context effectively:

* **Start with intent, not constraints.** Lead with what you're trying to accomplish before diving into specifics. This gives the AI a framework for interpreting everything that follows.
* **Build context iteratively.** You don't need to frontload everything. Start with the core problem and add detail as the conversation develops. This feels more natural and allows for course correction.
* **Use examples generously.** Show the AI what good output looks like, even if it's just a rough sketch. Examples are worth a thousand constraints.
* **Reset when context gets muddled.** If a conversation goes off track, it's often better to start fresh than to try steering with increasingly complex corrections.
* **Be explicit about your role and expertise.** The AI can tailor its responses better when it understands your background and what level of detail you need.

These aren't revolutionary insights—they're basic principles of clear communication. The surprising thing is how much we forget them when the other party happens to be a machine.

## Learning to communicate better, period

What's struck me most about learning to work with AI is how it's made me more conscious of how I communicate with humans. The same clarity and context management that works with Claude makes me a better collaborator with my colleagues.

When I explain a technical problem to a junior developer, do I lead with constraints or with clear intent? When I'm asking for feedback on a design, am I showing what good looks like or just listing what I'm worried about?

The skills are transferable because the underlying challenge is the same: building shared understanding with another intelligence, whether artificial or human.

## Just talk to it like a person

Here's the advice I give people starting to work with AI tools: stop overthinking it. Treat it like a smart colleague who's new to your project. Be clear about what you want and why. Provide relevant context without drowning the conversation in disclaimers. Show examples when possible.

The tools will keep evolving, but these communication principles will remain constant. We're not learning to program machines, we're learning to collaborate with a new kind of intelligence. The sooner we approach it as a conversation rather than a coding problem, the better our results will be.

And if you catch yourself writing a prompt that starts with a dozen don'ts, stop. Take a step back. Think about what you're actually trying to accomplish. Then just ask for it directly.

*The purple elephants can wait.*

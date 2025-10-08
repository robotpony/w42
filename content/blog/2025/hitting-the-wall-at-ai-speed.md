---
slug: 'hitting-the-wall-at-ai-speed'
title: "The hidden cost of AI-assisted development: cognitive fatigue"
date: '2025-08-10T15:27:03-07:00'
draft: false
---

<img src="https://images.warpedvisions.org/2025/10/watercolour-clouds-dripping.jpg" alt="AI showing complexity and fatique" />


After three months of AI-assisted development, I'm more productive than ever. I'm also mentally exhausted in ways I didn't expect.

The productivity gains are real—I can go from sketch to working prototype in hours instead of days. But there's a hidden cost that we're not talking  about: the tools fundamentally change the cognitive load of programming. Instead of being tired from wrestling with implementation details, I'm exhausted from operating constantly at the architecture and design level.

It turns out that having a tireless coding partner creates its own kind of burnout.

## The new fatigue

Traditional programming fatigue comes from the relentless focus on details; fighting with syntax, debugging obscure errors, or grinding through repetitive implementation work. AI tools eliminate much of this friction. But they replace it with something subtler and more draining: **decision fatigue at the design level**.

When you can prototype three different approaches in the time it used to take to implement one, you're suddenly making architectural decisions constantly. Should this be a service? A library? A simple script? What about error handling? Data persistence? Each decision branches into more decisions, and the AI is ready to implement whatever you choose, immediately.

The bottleneck shifts from "can I build this?" to "should I build this, and how?" That's a much higher cognitive load, and it accumulates faster than you'd expect.

I find myself needing breaks not because I'm stuck on a problem, but because my brain is tired from thinking at that level of abstraction for extended periods. It's like doing interval training for your mind's highest-order functions.

## Hitting the wall at light speed

The most jarring change is how quickly you slam into fundamental design decisions. In traditional development, you discover more architectural problems as you implement, test, and scale. You have time to think through the implications because writing the code takes time.

With AI assistance, you hit these walls immediately. The implementation happens fast enough that you're suddenly facing questions about data models, API design, and system boundaries before you've had time to think them through properly.

But there's something else happening here. When humans write code, we think about architecture as we work. We make small adjustments, refactor as we go, and encode architectural decisions in the act of implementation. AI doesn't do this—or at least, it doesn't communicate that kind of thinking in its output.

The result is code that works but feels architecturally flat. It implements what you asked for without the subtle design improvements that happen naturally during human implementation. You end up doing more explicit architectural thinking to compensate for what's missing.

## The review problem

The volume of code to review has exploded, but that's not the hardest part. The real challenge is that you can't interrogate AI's reasoning after the fact. When a human programmer makes an odd choice, you can ask them why. When AI does it, that reasoning is buried somewhere in a larger set of changes.

Try to ask the AI about a specific decision after it's made, and you'll get sycophantic apologizing instead of explanation. "I'm sorry, that was a poor choice, let me fix that." But I don't want an apology—I want to understand the tradeoff that led to that implementation.

This creates blind spots in code review that didn't exist before. You're reviewing the what without access to the why, which makes it harder to evaluate whether the approach is sound or just happens to work.

The testing discipline becomes critical here. If AI can't or won't test its own code—and it usually won't unless you explicitly ask—then you're flying blind on correctness. The speed advantage disappears quickly if you're debugging subtle issues that proper tests would have caught.

## Learning to work at AI pace

The adaptation isn't just about using the tools better—it's about developing new mental muscles for sustained high-level thinking. Your brain needs time to get stronger in these areas.

I've started taking more deliberate breaks, especially between major design shifts. I literally walk away from my computer to `/clear` my own mental context. The parallel to clearing AI conversation context isn't accidental—both human and AI thinking can get muddy when you're carrying too much forward.

The other adaptation is using AI as a thinking partner for design exploration, not just implementation. Instead of jumping straight to "build this," I spend more time asking: What's missing? What's been done before? What are the tradeoffs? The AI is actually quite good at this kind of analysis, and it helps front-load the architectural thinking that you'll need anyway.

## The practice makes you stronger

This feels similar to other major shifts in how we work. When version control systems became common, we had to learn new habits around committing and branching. When testing frameworks matured, we had to internalize different patterns for writing testable code.

AI-assisted development is another fundamental shift that requires building new habits and mental models. The fatigue is real, but it's also temporary. Like any new way of working, it requires practice before it becomes natural.

The strange thing is that this exhaustion coexists with genuine excitement about what's possible. I'm building more interesting things, exploring more approaches, and shipping more polished prototypes. But I'm also learning to pace myself in ways that weren't necessary before.

## The new normal

We're still in the early days of understanding how AI changes the actual experience of programming. The productivity gains get all the attention, but the cognitive shifts are equally important to navigate successfully.

The developers who thrive will be those who recognize that these tools don't just change what you can build—they change how you think about building. They amplify your highest-level thinking, which is incredibly powerful but also mentally demanding in ways we're still learning to manage.

The adaptation period is worth it. But don't underestimate the learning curve, especially the parts that happen inside your head. Give your brain time to develop these new muscles. The tools will wait.

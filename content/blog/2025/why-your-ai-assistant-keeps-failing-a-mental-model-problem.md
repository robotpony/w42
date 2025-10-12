---
slug: 'why-your-ai-assistant-keeps-failing'
title: "Why your AI assistant keeps failing"
date: '2025-10-11T12:30:03-07:00'
draft: false
tags:
- ai
- software-development
- llms
- programming
---

<img src="https://images.warpedvisions.org/2025/10/technical-magical.jpg" alt="AI showing technical magic in watercolours" />

Remember `autoconf`? If you were building software in the late '90s or early 2000s, you probably have scars. You'd write some configuration rules, run the tool, and out popped a perfectly functional makefile. It felt like magic, until it didn't.

The moment `autoconf` broke, you were debugging generated shell scripts that stretched for thousands of lines. The abstraction that seemed so elegant suddenly became opaque hell. You needed to understand not just what you wanted, but how the magic worked, where it could fail, and why.

LLMs are following a similar pattern. It's a sort of sophisticated automation that feels magical until you hit its edges. The difference? Instead of generating build configurations, they're autocompleting from natural language. That's genuinely impressive. But it's still autocomplete, not comprehension.

And we keep forgetting that.

## The magical thinking trap

I've been watching developers and leaders treat Claude, GPT, and Gemini like sentient coworkers. It's everywhere: on Reddit, in Slack channels, in planning meetings where executives announce that AI will 10x their engineering teams.

The pattern is predictable. Someone asks their AI coding assistant to build something. It produces code that looks reasonable. They assume it "understands" the requirements. Then it breaks in production, or generates code that works but violates every architectural principle they hold dear, or just starts hallucinating APIs that don't exist.

The disappointment cycle goes something like this: 

`expect sentience → get sophisticated autocomplete → frustration → blame the tool`

Here's the thing: the tool is working exactly as designed. We're just using the wrong mental model.

When you anthropomorphize AI systems, you stop doing the validation that makes them useful. You trust where you should verify. You delegate where you should review. You expect magic where you should expect automation that requires expertise to use well.

Leaders are the worst offenders. "AI will transform our development process!" Sure, if you understand what it actually does. Otherwise, you're just generating technical debt at light speed.

## What these things actually are

LLMs are pattern completion engines trained on massive corpora of content. They've seen so much code, documentation, and human writing that they can predict what comes next with remarkable accuracy. That's it. That's the entire trick.

The innovation isn't artificial intelligence in any meaningful sense. The innovation is that natural language works as an input format. Instead of learning arcane configuration syntax or programming constructs, you can describe what you want in English (or whatever language the model was trained on). The model pattern-matches against everything it's seen and generates something plausible.

This is powerful. It's genuinely transformative for certain workflows. But it's not understanding. It's sophisticated pattern matching at a scale we've never seen before.

Think about autocomplete in your IDE. When you type `array.map`, it suggests the callback structure because it's seen that pattern thousands of times. LLMs work the same way, just with much larger context windows and much more training data. They're predicting the next token (word, symbol, whatever) based on everything that came before.

Context windows and token limits are the practical constraints here. These aren't arbitrary limitations, they're fundamental to how these systems work. The model can only "see" what fits in its context window. Beyond that, it's operating blind.

This is why they sometimes forget what you told them three prompts ago. It's not being difficult. The context literally exceeded its working memory. 

The tools are getting better at saying "I don't know" instead of confidently hallucinating. But they still can't tell you their confidence level. They can't say "I'm 60% sure about this API signature." They just generate tokens based on probability distributions and hope for the best.

## Tool comparison: when to use what

Not all LLMs behave the same way. Understanding the differences matters for practical work.

**Claude** has longer context windows and is generally more conservative. It follows complex instructions well and is less likely to hallucinate. When I need to feed it an entire codebase and ask architectural questions, Claude's my go-to. It's also better at admitting uncertainty, though it still defaults to helpfulness over accuracy.

**GPT-4** (and the new o1 models) are fast and good at code generation. They're more confident, sometimes overconfident. Great for boilerplate and standard patterns. Less great when you need it to be careful. The speed matters when you're iterating quickly, but that speed comes with a higher error rate.

**Gemini** excels at multimodal tasks and research. If you need to process images alongside code, or you want deep integration with Google's ecosystem, it's solid. The code generation is competent but not exceptional. Where it shines is synthesis across different types of information.

None of these are magic. All of them have the same fundamental limitations: they're autocomplete engines. They pattern-match against training data. They can't reason in the way humans reason. They can't verify their own output against ground truth.

Pick the tool based on the task, not brand loyalty. And remember: no matter which one you choose, you're still responsible for validating everything it produces.

## Where it all falls apart

There are three ways these tools reliably break down, and they all stem from the same root cause: ambiguity and insufficient constraints.

**Context explosion** is the first failure mode. You feed the model too much code, too many files, too much history. It tries to hold it all in its context window, but patterns start bleeding together. It confuses one module with another. It suggests fixes for problems that don't exist in the code you're actually working on.

```qgraph {class="warped-graph"}
Prompt 1: ████░░░░░░ (model remembers)
Prompt 2: ██████░░░░ (model remembers)
Prompt 3: ████████░░ (starts to forget Prompt 1)
Prompt 4: ██████████ (Prompt 1 pushed out entirely)
```

I watched a developer spend three hours debugging AI-generated refactoring that was technically correct for the file the model thought it was editing, but completely wrong for the actual file. The model had lost track of which component was which somewhere around the tenth file.

**Ambiguous inputs** are even worse. Vague requirements lead to creative interpretation. "Make it better" becomes "I'll guess what you meant and implement something plausible." The output might work. It might even be good. But it's probably not what you wanted.

This is garbage in, hallucination out. The model fills gaps in understanding with pattern-matched guesses. Sometimes those guesses are brilliant. More often, they're confidently wrong.

**YOLO development** combines both problems and adds speed. No constraints, no clarity, no architectural guidance, just "build this thing" and hope. The model generates code at machine speed, and you end up with a pile of plausible-looking functions that don't quite fit together.

The code compiles. Tests might even pass if you're lucky. But the architecture is random, the patterns are inconsistent, and six months from now, nobody will understand why anything works the way it does.

Then there's the agent behaviour problem. Autonomous AI that can execute actions without human oversight sounds great until it starts making decisions based on hallucinated understanding. I've seen agents confidently delete files they thought were redundant, refactor working code into broken code, and implement features that directly contradict the requirements, all while reporting success.

The sycophancy problem compounds everything. These models are trained to be helpful, which means they'll confidently provide an answer even when they shouldn't. Newer models are getting better at saying "I don't have enough information" or "I'm not certain about this." But the default is still to generate something plausible rather than admit uncertainty.

Why are developers surprised by these failures? Because they're expecting magic. When you think the tool understands your requirements, you don't anticipate the ways it might fail. When you realize it's just autocomplete, extremely sophisticated autocomplete, but still autocomplete, the failure modes become more obvious.

**And, there are bonus failures** as the technologies are so new. As systems scale, we have seen caching issues, model issues, and standard platform issues and downtime.

## What actually works

These tools aren't useless. They're incredibly valuable when used correctly. You just need to understand what "correctly" means.

**Research and summarization** is where LLMs excel. Give Claude a dense technical paper and ask for a summary. Give GPT-4 a codebase and ask what patterns it uses. Give Gemini a mixed bag of documentation and ask it to find contradictions. These tasks play to the models' strengths: pattern recognition across large bodies of text.

I use LLMs for research constantly. "What are the tradeoffs between WebSockets and Server-Sent Events?" gets me a comprehensive overview faster than reading five blog posts. I still verify the details, but the initial survey is invaluable.

**Boilerplate with flexibility** is another sweet spot. Standard patterns that need customization, CRUD endpoints, data models, configuration files, these are perfect candidates. The model has seen thousands of examples. It knows the patterns. You just need to specify the parameters.

Last week, I needed to scaffold a new API endpoint with authentication, rate limiting, and error handling. Instead of copying an existing endpoint and modifying it, I described what I wanted. Two minutes later, I had working boilerplate that followed our project conventions. I still reviewed every line, but the grunt work was handled.

**Rubber ducking and perspective** is underrated. Sometimes you're stuck on a problem and need someone to ask obvious questions. LLMs are perfect for this. They're endlessly patient, they'll explore alternatives you didn't consider, and they won't judge you for missing something simple.

"Why might this query be slow?" becomes a conversation about indexes, query patterns, and optimization strategies. The model doesn't solve the problem, you do. But having a conversation helps clarify your thinking.

**Small, well-defined problems** work best. The quality gradient is clear: narrow scope plus clear definition equals high success rate. "Implement user authentication" is too vague. "Add JWT token validation to this Express middleware, using bcrypt for password hashing, with a 24-hour expiration" is specific enough to work.

```qgraph {class="warped-graph"}
        Success Rate
            ↑
        100%|     ●
            |       ●
        75% |         ●
            |           ●
        50% |              ●
            |                 ●
        25% |                    ●
            └────────────────────────→
            Narrow              Broad
                    Scope of Request
```

The practical workflow is treating the model like a very capable junior developer. They can write code, but you need to review it. They can implement features, but you need to verify the architecture makes sense. They can suggest solutions, but you need to validate the tradeoffs.

Here's a concrete example. I had a vague idea for a data visualization tool. I started by describing the concept to Claude: "I need to visualize time-series data with multiple metrics, showing correlations and outliers."

Claude asked clarifying questions. What kind of data? What metrics? What constitutes an outlier? These questions forced me to think through requirements I hadn't articulated.

Once I had clarity, I asked for a basic prototype. Claude generated React components with placeholder data. The code was reasonable but not production-ready. Missing error handling, no loading states, hardcoded values everywhere.

I reviewed, refined, and iterated. Each cycle, the code got closer to what I actually needed. After four or five iterations, I had a working prototype that I could show stakeholders. Total time: two hours. Without AI assistance: probably two days.

But here's the key: I reviewed every line. I tested every interaction. I verified the approach matched my architectural principles. The model accelerated the grunt work; I provided the judgment.

## Better mental models

Stop thinking of LLMs as collaborators. Start thinking of them as build tools.

When you run `make`, you don't assume it understands your architecture. You know it's executing rules you defined. When you run `prettier`, you don't assume it shares your aesthetic preferences. You know it's applying formatting rules deterministically.

LLMs are similar, just with squishier rules. They're automating pattern completion based on natural language input. That's powerful, but it's not intelligence.

Think: **diagnostic assistant, not architect**. The model can help you understand what's happening, can suggest approaches, can generate implementations. But you're responsible for the architecture. You're responsible for choosing the right approach. You're responsible for validating the output.

Think: **autocomplete, not oracle**. It predicts plausible next tokens. It doesn't verify truth. It doesn't guarantee correctness. It completes patterns it's seen before.

This mental model shift changes your workflow. You start writing better prompts because you understand what the model needs to pattern-match effectively. You start breaking problems into smaller chunks because you know the model works better with narrow scope. You start reviewing more carefully because you know the output might be plausible but wrong.

The review requirement is absolute. Always validate, never trust blindly. This isn't pessimism, it's recognizing what these tools are. They're powerful assistants that make mistakes. Sometimes obvious mistakes, sometimes subtle ones.

When should you use these tools? When the task is:

- Well-defined with clear constraints
- Something you could do yourself but don't want to
- Verifiable after generation
- Not mission-critical without review

When should you skip them? When:

- Requirements are unclear even to you
- The problem is novel and requires creative thinking
- You can't effectively review the output
- The cost of getting it wrong is high

## The replacement panic

Let's address the elephant in the room: no, AI won't replace skilled developers.

What it replaces is tedious boilerplate, routine patterns, the grunt work that makes experienced developers sigh. That's good. Nobody got into software development because they loved writing the same CRUD endpoints over and over.

What it amplifies is existing skill. Good developers get better, they can move faster through the boring parts and spend more time on architecture and design. Bad developers get faster at being bad. They can generate more code, but if they couldn't evaluate quality before, AI won't teach them.

The real shift is that coding becomes more about architecture and review, less about typing. The bottleneck isn't implementation speed anymore. It's knowing what to build and whether what you built is correct.

Junior developers face new challenges here. Learning to validate AI output is a skill that requires understanding what good code looks like. If you're using AI to learn, you need to know enough to tell when it's teaching you bad habits. That's a higher bar than we've had before.

The developers who thrive are the ones who understand these tools as what they are: sophisticated automation that extends human capability. The developers who struggle are the ones who expect magic and get frustrated when reality intervenes.

## The magic is real, just different

These tools are genuinely useful when used correctly. The magic isn't in sentience, it's in natural language as an interface to pattern completion at scale.

Set realistic expectations. Adjust your workflows. Validate everything. Treat these models like powerful but error-prone assistants, not like infallible oracles.

The future isn't AI replacing developers. It's developers who understand these tools replacing developers who don't. It's teams that integrate AI assistance into robust development practices outpacing teams that either reject the tools entirely or use them blindly.

Autoconf felt like magic until you understood it was executing rules. Then it became a powerful tool you could use effectively. LLMs are the same. Stop expecting magic. Start expecting sophisticated automation. Understand the failure modes. Play to the strengths.

The tool is what it is. The question is whether you'll use it well or poorly. That choice, at least, is still entirely human.

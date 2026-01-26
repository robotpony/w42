---
slug: 'how-i-rekindled-my-love-of-writing-with-a-tireless-robot-editor'
title: 'How I rekindled my love of writing with a tireless robot'
date: 2025-09-15T12:00:00Z
draft: true
tags:
- writing
- ai
- productivity
---


A colleague sent me an architecture document last spring. Seventy pages of what should have been clear technical thinking. Instead, it read like a corporate-speak generator had vomited onto a page. Every paragraph danced around its point using elaborate metaphors that went nowhere. The tone shifted wildly between sections, as if multiple people with no shared understanding had written it.

"Did you use AI for this?" I asked.

"Yeah, mostly," they admitted. "Just gave it some notes and let it run."

The document was technically complete but utterly unreadable. It left a sour taste that stuck with me for weeks. AI writing was producing garbage, and smart people were accepting it because it was fast. I swore I'd never let my writing become that kind of babble.

Then, a few months later, I saw that Anthropic's Claude had added Projects: a feature that could link directly to my Google Drive and GitHub repos. I stared at the screen for a moment, brain catching up to the implications. It could see my actual writing. All of it. My essays from the last fifteen years, my style, my voice, my characteristic phrases and weird punctuation choices.

A realisation clicked into place: I didn't have to accept generic AI writing any more than I had to accept my colleague's mess. I could configure these machines to write well. Or more accurately, I could configure them to help me write well.

That distinction matters. A lot.

## The default settings will betray you

Here's what most people miss about AI writing tools: they write poorly because we let them. We accept the defaults. We type a prompt in plain English, get a response that sounds plausible, and move on. It's like buying a professional camera and only ever using the auto mode; technically it works, but you're missing the entire point.

The natural language interface is deceptive. It makes you think less structure is better, that these tools should just understand what you want through casual conversation. But these are machines. They operate on patterns and probabilities. The more consistent your inputs, the more you can tune and improve the outputs.

This goes against intuition. We're trained to think that talking to AI should be like talking to a person. But that's wrong. You shouldn't treat your LLM like a human colleague. You should treat it like what it is: a writing, research, and review automation system. And like any system, it needs configuration, calibration, and consistent methodology.

The breakthrough isn't in the technology. It's in understanding that working with these tools requires the same rigour you'd apply to any craft:

* Consistent method
* Measurable improvement
* Iterative refinement
* Quality gates

Get those right, and AI becomes a tireless collaborator. Get them wrong, and you get that seventy-page mess.

## Building a writing system that actually works

After that Google Drive integration epiphany, I started experimenting. First, I fed Claude about ten of my essays and asked it to identify patterns in my writing. Early on, it struggled with more than that; context windows were smaller then, and the analysis would drift after too much input.

Then I had it review established style guides and publications I admired: Wired Magazine's voice, Paul Graham's essays, the directness of John Carmack's technical writing. Not to copy them, but to give the AI a broader sense of what good technical writing looks like.

The real work came next: creating my own style guide with AI assistance. Not a list of grammar rules but a living document that captured how I actually write. The characteristic phrases I use ("Here's the thing:" and "This is good"), the temporal anchors that ground my stories ("When I was eight..." and "Last week I realised..."), the things I deliberately avoid (corporate jargon, excessive adjectives, starting with compliments).

That first version was rough. But when I used it to review a draft, something clicked. Claude told me: "This doesn't sound like your writing, because of X, Y, and Z." It was close enough to right that I saw possibilities. Close enough to know this could work.

For the next four to five months, I refined that guide weekly. I'd run drafts through different LLMs (Claude, GPT, Gemini) and look for where they disagreed. Disagreement meant ambiguity in my guide. I'd add examples, clarify rules, and test again. The guide evolved from a page of notes to a comprehensive document covering everything from post types to voice calibration.

You can see the current version [here](https://warpedvisions.org/pages/a-style-guide-for-bruce/). It's specific about things like:

* How different post types should open (quick observations vs philosophical essays)
* Characteristic phrases that signal "this is Bruce writing"
* Temporal anchors and how to use them
* What to absolutely avoid (starting with "Great question!" or using "leverage" as a verb)

The specificity is the point. General guidance like "write conversationally" is useless. Concrete patterns like "use 'Here's the thing:' to introduce key insights" gives the AI something to work with.

I also discovered something unexpected: having a style guide made me a better editor of my own work. Articulating why I write the way I do forced me to understand my own voice more clearly. The guide wasn't just training the AI; it was training me.

### The actual workflow

Here's what writing an essay looks like now:

**Step 1: Negotiate an outline.** I start with one to two pages of stream-of-consciousness notes. Not organised, just thoughts. Then I ask the LLM to question those notes considering my style guide. What's unclear? What's missing? What's the core insight?

This back-and-forth shapes the outline. The AI asks questions I haven't considered. I realise I'm making assumptions the reader won't share. We iterate until the structure feels solid.

**Step 2: First draft.** This can be human-written, AI-assisted, or a mix. It doesn't matter much because you're going to throw most of it away. The first draft is a thinking tool. It helps you find the story hiding in your notes.

I usually write the opening myself; that needs my voice from the start. Then I might ask the AI to expand certain sections while I work on others. The key is staying in conversation with the draft, not just generating text.

**Step 3: Review and rewrite cycles.** This is where the system proves itself. I run my draft through a custom review command (see [the full command here](https://github.com/robotpony/warped-claude/blob/main/review-draft.md)) that checks:

* Quality score compared to major publications
* Adherence to my style guide
* Spelling and grammar
* Factual correctness
* Missing concepts and narrative opportunities

The AI comes back with specific feedback. Not "this is good" but "this paragraph uses passive voice which doesn't match your style" and "this claim needs a source." I rewrite based on that feedback, then run it through again. 

**Step 4: The secret ingredient is time.** I let drafts sit. Come back the next day. Read them fresh. The best edits happen when you've forgotten what you were trying to say and can only see what you actually said.

A typical essay under 2,000 words takes anywhere from an afternoon to a few weeks, depending on complexity and how much thinking time it needs. Something longer (5,000 words or more) takes two to five times longer. The sweet spot is two to ten review iterations. If you're past ten and it still doesn't work, there probably isn't enough good writing to salvage.

**Step 5: Quality gates.** An essay is done when three things align:

* It feels done to me (the hardest gate to articulate but the most important)
* My review command gives it strong scores across the board
* Two independent LLM reviews (using different models) agree on quality

These gates aren't perfect. AI reviews vary, they miss things, they occasionally contradict each other. But they provide enough consistency that I can trust my own judgement more. The feedback helps me see what I'm too close to notice.

### Tools and costs

I start most pieces in Claude's web interface. It's fast for exploration and lets me reference Google Docs and GitHub repos without local setup. But as I iterate, I always move to Claude Code. Working in my actual text editor, with my files local, just feels better. The style guide lives in Markdown so it works seamlessly in both environments.

For review cycles, I use multiple tools: Claude as primary, with GPT and Gemini as secondary checks. I run the same review command across different models and look for disagreements. When they diverge, it usually means something in the writing is ambiguous or weak.

The cost? About $20 a month for essay writing. Compare that to a human editor at $50-100 per hour. That twenty dollars buys me roughly one hundred hours of machine thinking time; more review cycles than I could ever afford from a human, and available exactly when I need them at 2 AM.

For code writing the costs are different, but for essays? It's absurdly cheap for what you get.

## What actually changes

The most immediate change: my essays got longer and I write more of them. Not because the AI writes for me, but because editing became faster and less painful. I can spend more time thinking about the story and less time agonising over sentence structure.

But the real transformation was psychological. I had a tireless reviewer who would never get bored reading the same paragraph for the tenth time. No social cost to asking "does this work?" again and again. No worry about imposing on someone's time. Just immediate, detailed feedback whenever I needed it.

Wikipedia has [a guide for identifying AI-generated writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing). It lists patterns like hedging language, repetitive phrasing, and generic examples. These aren't signs of bad writing per se; they're signs of writing that doesn't match Wikipedia's style. The same patterns that flag AI writing on Wikipedia would be perfectly fine in other contexts.

That's the insight: generic AI voice is detectable because it's *generic*. It doesn't belong to anyone. But AI writing configured with a strong style guide? That's detectable too, as your writing, not as AI's.

Let me show you what I mean. Here's how Claude might respond to a prompt without style guidance:

> This is an interesting question that touches on several important aspects of software development. There are many factors to consider when approaching this problem, and it's worth exploring them in detail.

Technically correct. Completely bloodless. Now here's how it responds when working with my style guide:

> Here's the thing: most developers overthink this problem. We get tangled up in edge cases and perfect solutions when the real constraint is much simpler.

Same idea, different voice. The second one is mine because the style guide taught the AI what "mine" sounds like.

### The rekindling

I didn't realise I'd fallen out of love with writing until I fell back in. For years, writing felt like a chore I'd committed to. I'd force myself through drafts, hate every revision, and publish out of obligation more than excitement.

The change wasn't instant. But somewhere in those first few months of building my system, I started writing more. Not because I had to, but because I wanted to. The friction had dropped enough that ideas could flow from brain to screen without dying in the editorial torture chamber.

I wrote three to four essays a week during the summer. Not perfect essays; many were experiments, working through ideas, figuring out what I thought about AI and writing and creative process. But they were mine, in my voice, and they felt good to make.

The tireless editor didn't replace the joy of writing. It removed the barriers that were blocking it.

## Where the system breaks down

Of course, it's not magic. The system has clear failure modes you need to recognise and work around.

The most common: the AI just goes off track. You're thinking X, but the review keeps suggesting Y and Z. One suggestion might be reasonable, but the other starts wandering into territory that doesn't fit. This is usually caused by accumulated context getting muddy, or by ambiguity in your prompt, or just by the inherent randomness in how these models work.

Think about it like a water droplet on uneven terrain. Each generation finds a local maximum, a direction that seems optimal given the immediate context. But that local maximum might be on a peak that slopes away from your actual goal. Re-running the same prompt often fixes this, because the randomness might land the droplet in a better valley.

If re-running doesn't help, I try different models or have the AI comment on the prompt itself. Sometimes it will point out ambiguity I didn't notice: "This prompt could mean either A or B, and I assumed B." That kind of meta-feedback is surprisingly useful.

The system also struggles with fiction. I've tried applying the same approach to short stories and found it less effective. Fiction needs different constraints: guides about character voice, world rules, narrative tension. My essay-focused style guide doesn't transfer well. It's possible to build a fiction-writing system with similar rigour, but I haven't invested the time to do it right. We'll look more into this in the future.

And there's a fundamental limit: AI suggestions are only as good as the method feeding them. Garbage in, garbage out. The style guide doesn't make bad writing good. It makes your existing writing more consistent, more clear, more you. If you don't know what you're trying to say, no amount of AI assistance will save you.

## The human side of the equation

Let me be direct about something: you maintain 100% control. Always. The AI is making suggestions, not decisions. You're the author. You're responsible for every word that goes out under your name.

This sounds obvious, but it's easy to forget when a tool gives confident feedback. The AI will occasionally suggest changes that sound good but subtly shift your meaning. It will recommend cuts that remove important context. It will push towards clarity that loses necessary complexity.

Your job is to evaluate those suggestions with the same critical eye you'd apply to a human editor's feedback. Is this change making my writing better, or just different? Is this suggestion based on understanding, or pattern-matching to training data?

I follow the old phrase "strong convictions, loosely held." I trust facts and reason, but I doubt everything until I verify it. The AI gives me good ideas often enough that I listen. But I check those ideas against my intent, my knowledge, and my bullshit detector.

The comparison to human editors is instructive. Human editors have biases, blind spots, and different taste. They might miss things, over-correct, or push changes that don't fit your voice. The solution isn't to blindly accept their feedback. It's to consider their suggestions critically and decide what serves your work.

AI editors are the same, just faster and cheaper. The mechanics are different (neural networks instead of neurons) but the relationship is identical. Take feedback graciously, consider it carefully, but maintain authority over your words.

## The meta-layer worth acknowledging

I'm using AI to write this essay about AI-assisted writing. Claude helped me outline these ideas, draft sections, and review iterations. We're now on revision twelve or thirteen, and the essay exists because the method I'm describing actually works.

This isn't ironic or complicated. It's demonstrative. The system I built lets me articulate complex ideas more clearly than I could alone. The AI caught places where my argument wandered, pointed out claims that needed support, and suggested structure improvements that make the essay more readable.

But every word is still mine. The voice, the stories, the insights; those come from thirty years of making things and thinking about how to make them better. The AI helped me express those ideas. It didn't create them.

That's the distinction that matters. AI writing tools are amplifiers, not authors. They magnify your capabilities but don't replace your judgement. Used well, they let you write more, write better, write clearer. Used poorly, they generate that seventy-page mess of corporate babble.

The difference isn't the AI. It's the human process wrapped around it.

## If you're starting today

The path forward is simpler than you might think:

**Start with a style guide.** Even a rough one. Spend an afternoon looking at your best writing and noting patterns. What phrases do you use repeatedly? How do you structure openings? What do you avoid? Get an AI to help with this; feed it your writing and ask what patterns it sees. You'll probably disagree with some observations, and that disagreement helps clarify what matters to you.

**Use it to review your writing.** Before worrying about automation or complex workflows, just ask: Does this sound like me? Is this good? Is this correct? Let the AI catch spelling errors, point out unclear passages, and suggest improvements. See if the feedback helps.

**Iterate weekly for a few months.** Your first style guide will be wrong. That's fine. Update it as you discover what works. Add examples of good writing. Remove rules that don't help. Test changes by running old drafts through the new guide and seeing if the feedback improves.

**Build your workflow gradually.** Start with simple review. Add structure for different post types as you notice patterns. Create automated review commands once you understand what checks matter. The system should emerge from your actual writing practice, not from some ideal of what a system should be.

**Treat it as a system, not magic.** The improvement comes from method, measurement, and iteration. Consistency in your inputs enables tuning in your outputs. Document your process, track what works, and refine ruthlessly.

The payoff? Because you review your writing ten times more than you write it, the time savings from a good style guide are huge. The guide also scales to human editors and teams; it's a precise way to communicate how you want to sound.

Getting better at any craft requires consistent methodology, careful measurement, and iterative improvement. AI tools can help with those tasks, but only if you approach them with the same rigour you'd apply to any other tool in your workshop.

## The craft remains

I started this journey disgusted by generic AI writing. That seventy-page architecture document represented everything wrong with how people were using these tools; treating them as magic word generators instead of as systems requiring configuration and control.

What I found was a way to make AI amplify my voice instead of drowning it out. The tools didn't replace the craft of writing. They removed enough friction that I could practise the craft more often, with less resistance, and rediscover why I loved it in the first place.

The tireless robot editor doesn't write for me. It reviews for me, questions me, and helps me see my work more clearly. That relationship (human judgement guided by machine consistency) turns out to be more valuable than I expected.

Your writing voice matters. It's what makes your ideas yours, what lets readers recognise you in a paragraph, what gives your words weight beyond their dictionary definitions. AI writing without method produces generic babble because it has no voice to amplify. AI writing with method becomes a collaborator that helps you sound more like yourself, more clearly, more often.

The difference isn't the technology. It's the human process, the style guide, the quality gates, and the relentless iteration. It's treating the tool like a tool instead of like magic. It's maintaining control while accepting help.

---

*My style guide is [available here](https://warpedvisions.org/pages/a-style-guide-for-bruce/), and the review command I use is [documented here](https://github.com/robotpony/warped-claude/blob/main/review-draft.md). Feel free to use them as starting points for your own system. The best version won't be mine; it'll be yours, tuned to your voice and refined through your practice.*



 Missing Concepts

  1. Version control and writing history: You mention iterating on
  drafts but never discuss whether you keep revision history. Do
  you use git? Just save versions? This could tie into the "system"
   framing.
  2. Failure stories: You mention the system has "clear failure
  modes" but only describe vague drift problems. A specific story
  of a draft that went completely wrong would strengthen your
  credibility.
  3. Comparison to traditional editing processes: You touch on this
   with the human editor cost comparison, but never directly
  address: what did your writing process look like before? What
  changed specifically?
  4. The style guide evolution: You say you refined it weekly for
  4-5 months, but what were the major turning points? What
  discoveries changed how you thought about it?

  Narrative Improvements

  1. Structure the "breakthrough" more clearly: The realization
  moment (lines 21-25) is powerful but happens early. Consider
  foreshadowing it in the opening, then circling back: "I didn't
  know it then, but that terrible document would lead me back to
  writing..."
  2. Create more tension in the middle: Lines 44-110 are very
  process-heavy. The workflow is fascinating, but it's all "this is
   how it works" without much struggle. Where did you get stuck?
  What almost made you give up?
  3. Stronger callbacks: The opening story about the colleague's
  document never comes back. What would you say to them now? Could
  you rewrite a paragraph from that doc using your system as a
  demonstration?
  4. The "rekindling" arrives late: The section titled "The
  rekindling" doesn't appear until line 131, but it's in your
  title. The emotional journey of falling back in love with writing
   could thread through earlier sections.


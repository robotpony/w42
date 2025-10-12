---
slug: 'teaching-claude-to-write-like-me-a-two-month-journey'
title: 'Teaching Claude to Write Like Me a Two Month Journey'
date: '2025-09-07T17:06:33-07:00'
draft: true
---

Two months ago, I realized my Claude writing guide was lying to me. Not intentionally, of course - it just wasn't telling the whole truth about how I write.

I'd spent weeks extracting patterns from my posts, building what I thought was a comprehensive style guide. Voice characteristics, recurring themes, favourite phrases - the works. But when I started using it to help draft posts, something felt off. The words were there, but the voice wasn't. It was like hearing someone do an impression of you: technically accurate but somehow wrong.

## The Initial Problem

The first version of my style guide was simple enough. I fed Claude a bunch of my posts and asked it to extract patterns. It dutifully produced a list of observations: conversational tone, technical depth, occasional profanity, short paragraphs. All true, but apparently not sufficient.

When I'd ask Claude to review drafts against this guide, it would cherry-pick examples. Sometimes it would analyze three posts deeply, sometimes it would skim twenty posts superficially. The sampling was inconsistent, and so were the results.

The date problem was particularly maddening. I'd write "Last week I realized..." and Claude would helpfully correct it to something specific about 2024. Except I'm writing this in 2025. Or it would assume current events that were months old. My posts are full of temporal anchors - they're part of how I ground experiences - and Claude kept getting them wrong.

Some drafts came out reading like corporate blog posts. Others had the casual tone but lost all technical depth. It was clear that my initial guide was more of a rough sketch than a blueprint.

## Observing the Struggles

The real education came from watching Claude fail in specific ways. Each failure taught me something about what was missing from the guide.

Format changes broke everything. I have this occasional series of "tired/wired" posts - a format I lifted from 90s Wired Magazine. They're satirical, punchy, built on contrasts. When Claude tried to write one using my general style guide, it came out reading like a philosophical meditation on the nature of comparison. Technically in my "voice," but completely missing the point.

Different post types have different objectives. A technical how-to needs clarity and examples. A philosophical essay needs narrative arc and introspection. A media diet post needs conversational asides and colourful descriptions. My original guide treated all posts the same.

Here's an example of Claude missing the mark on a technical post:

**What Claude wrote:** "This fascinating journey into JavaScript closures reveals profound insights about the nature of programming itself..."

**What I would write:** "I hit a weird bug with JavaScript closures last week. Turns out I'd been thinking about them wrong for years."

See the difference? One sounds like it's trying to impress. The other sounds like someone actually working with code.

The pattern-matching was too shallow. Claude would pick up that I use metaphors, so it would insert random comparisons. It knew I referenced the 90s, so it would drop in "back in the 90s" without context. It was cargo-cult writing - reproducing the forms without understanding the function.

## The Breakthrough: Post Types

The game-changer was realizing that I don't have one writing style - I have several, and they map to different types of posts.

A quick observation post starts with immediate action: "I'm starting a small project for a client today." A philosophical essay starts with broader context: "I've been thinking about the evolution of software design." A tool review starts with a problem: "TODO apps drive me crazy, and I finally figured out why."

Once I bucketed my posts into types, patterns emerged:

- **Quick observations**: 500-800 words, single insight, punchy conclusion
- **Technical reflections**: 1200-2000 words, personal story leads to technical insight
- **Media diet posts**: List format with personality, conversational asides
- **Philosophical essays**: Longer narrative arc, more introspection

Each type has its own rhythm. Quick observations are jazz - improvisational, energetic, landing on a strong final note. Technical reflections are more like classical music - structured movements that build to a conclusion. 

When I updated the guide with these buckets, Claude's behaviour changed dramatically. Instead of generic "Bruce-flavoured" text, it would recognize what type of post we were writing and adjust accordingly. The modality was built in.

## What Actually Works

Voice consistency comes from specific patterns, not general descriptions. Saying "conversational tone" is useless. Saying "use 'Here's the thing:' to introduce key insights" is actionable.

My guide now includes characteristic phrases:
- "This is good"
- "And that's okay"  
- "Well, duh"
- "Enter [thing/person/tool]"

These aren't just quirks - they're part of how I think. "This is good" is how I acknowledge positive outcomes without gushing. "Enter [X]" is how I introduce new elements in a story. They're small, but they matter.

Temporal anchoring needs explicit rules. Now the guide says: "Ask about dates and don't assume the current year." Simple fix, huge improvement. My posts are full of "Two months ago..." and "Back when I was eight..." - these anchors ground the narrative in real experience.

The negative examples might be more important than the positive ones. Telling Claude to avoid corporate jargon ("leverage," "synergy"), excessive adjectives ("amazing," "revolutionary"), and opening with compliments ("Great question!") prevents a whole category of failures.

Building in self-awareness about AI limitations helped too. The guide now acknowledges that this is a collaboration, not a replacement. Claude helps me get ideas down faster, but I still need to review, edit, and ensure the voice is genuinely mine.

## The Numbers and The Future

The results speak for themselves. What used to take 10-20 hours now takes 1-2 hours for a 1000-2000 word post. That's not just about typing speed - it's about maintaining flow, exploring ideas, and not getting stuck in the "blank page" trap.

But speed isn't everything. The real metrics are:
- Voice consistency: Does it sound like me?
- Quality: Is it well-written and clear?
- Personal reaction: Do I feel good about publishing it?

All three have improved dramatically. Posts feel more "me" because Claude understands not just how I write, but why different posts need different approaches.

Open questions remain. Should each post type get its own detailed guide? There's a tradeoff between specificity (which improves output) and complexity (which makes the system harder to maintain).

How much context is too much? My current guide is substantial, but I could add more examples, more edge cases, more rules. At some point, though, you're just creating a brittle system that can't adapt.

What's the optimal balance? I don't know yet. This is only two months in, and I'm still learning.

## The Meta Layer

There's something deeply ironic about using an AI to help write a post about teaching an AI to write. It's turtles all the way down.

But that's missing the point. This isn't about replacing human creativity or outsourcing my voice. It's about having a better collaborator - one that understands not just what I want to say, but how I want to say it.

The evolution of my Claude writing guide mirrors my own evolution as a writer. Each iteration teaches me something about my own patterns, biases, and blind spots. In teaching Claude to write like me, I'm learning how I write.

And that's okay. Hell, that's good.

---

## Missing Elements Summary

**Technical Details Needed:**
- Specific code/prompts for the ingestion process
- Exact version control - how many iterations of the guide?
- Screenshots or examples of the Claude interface during reviews

**Examples to Include:**
- Before/after of a particularly bad early attempt
- Specific failed output from the date problem
- Side-by-side comparison of different post types
- Example of Claude successfully identifying post type

**Additional Research:**
- Comparison with other AI writing tools or approaches
- Specific prompts that worked vs. didn't work
- Metrics on edit time - how much editing is still required?
- Examples from other writers who've attempted similar guides

**Personal Details to Add:**
- Which specific post triggered the realization?
- First successful post written with the improved guide
- Most surprising discovery in the process
- Specific tired/wired post that failed
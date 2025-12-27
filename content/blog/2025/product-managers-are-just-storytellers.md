---
slug: 'product-managers-are-just-storytellers'
title: 'Product managers are just storytellers'
date: '2025-12-26T21:19:03-08:00'
draft: true
---

I was sitting in a roadmap review meeting a few years back when someone asked the question that cracked everything open: "Why are we even building this?"

It was a reasonable question. We had a requirements document. We had metrics showing demand. We had engineering estimates and a timeline. We had everything you're supposed to have. The question was about *meaning*. Why does this matter? What world are we building toward?

The answer wasn't in the document.

Here's the thing about product management: we're not actually managers. We're not really strategists, though people use that word. We're storytellers. Our job is to tell the story about *why* we're building something, and tell it in a way that everyone—engineers, designers, leadership, users—sees themselves in the narrative and understands what we're trying to accomplish.

The documents come after. Requirements, specifications, design artifacts, decision records. They're necessary. But they're not where the work actually happens. The work happens when a team understands not just *what* they're building, but *why* it matters.

Most PM writing gets this backwards.

## The Refunds Story

Let me show you what I mean.

I was working on a payment platform a few years ago. The core features were straightforward: take payments, settle funds, provide dashboards. But there was this constant tension around returns and refunds. It kept getting pushed down the roadmap. Not urgent, not in the critical path, let's circle back later.

Engineering was frustrated by the constant scope creep around edge cases. Product leadership saw it as a secondary feature. The prioritization logic made sense: if you're only shipping 20% of your roadmap, shouldn't returns be lower than, say, the core checkout flow?

Then we stopped debating *priority* and started telling the *story*.

We started asking: who actually uses this thing? We looked at our customer base and found that a significant chunk were retailers—boutique stores, small e-commerce shops, people running agency services where they take deposits and issue refunds. For these people, returns and refunds aren't edge cases. They're the core business.

Then we did something different. We stopped talking about "the returns feature" and started talking about Sue.

Sue runs a small clothing boutique with an online presence. She gets maybe five orders a day, and one of them is almost always a return. A customer gets the size wrong, changes their mind, or doesn't like the fit. Sue needs to issue a refund, adjust her accounting, and ideally understand why the return happened so she can improve her product or description.

When a payment platform doesn't handle refunds gracefully, Sue's workflow breaks. She has to manually track refunds in a spreadsheet, reconcile them with her accounting, and follow up with customers outside the system. It's tedious and error-prone. More importantly, it makes her question whether this payment platform is even worth using.

That's not a scope item. That's a person whose business is broken.

Once we told that story—as a concrete person with a specific workflow and specific frustrations—everything shifted. Engineers started asking different questions. What does Sue need to see when she issues a refund? How does she know the refund actually went through? What happens if a customer disputes it?

The scope cut didn't disappear. But it became a *choice* instead of a default. We chose to defer other features so we could build refunds properly, because we understood that deferring refunds meant deferring a whole class of customers.

That's what a story does.

## The Story vs. The Document

The requirements document said:

> **Refunds feature**
> - User can issue full or partial refund within 30/90 days
> - Refund appears in transaction history
> - Refund status: pending, processed, failed
> - API support for automated refunds

Technically accurate. Logically complete. Utterly uninspiring.

The story showed *why* those requirements existed. It revealed that we weren't optimizing for some abstract metric—we were serving people whose livelihoods depended on this feature working. It showed the team that this wasn't a feature to ship, it was a promise to keep.

Documents are solutions. Stories are problems. And you can't make good solutions if you don't deeply understand the problem.

The story doesn't replace the document. It comes *before* it. The story is the reasoning layer, the justification that makes every line of the spec feel coherent instead of arbitrary.

This is why great engineers don't just execute requirements—they interrogate them. And the way you give them permission to interrogate is by making the story clear enough that they can see when the solution doesn't match the problem.

## The Shapes Stories Take

Not all stories are the same shape. Different narrative structures work for different purposes.

**The Empathy Story** is what we just walked through. A person, their problem, why it matters. Sue and her boutique. A developer struggling with an API that's too complex. A content creator trying to understand why their videos aren't getting recommended. The empathy story grounds everything in human reality.

**The Learning Story** is different. It's for when you have to pivot, when you realize something you've been building is wrong. What we thought, what we learned, why we're changing direction. The learning story doesn't ask for forgiveness. It says: reality taught us something, and we're moving with it. Engineers respect that. They've felt the difference between "we were wrong" and "we discovered something." One feels like failure, the other feels like progress.

**The Tension Story** shows what happens when you have competing valid needs. Engineering wants architectural purity, product wants velocity, users want features. Instead of picking a winner, the tension story says: we're balancing these over time. Phase one optimizes for this, phase two addresses that, and this order makes sense because X. The tension story is where tradeoffs become visible instead of hidden in process.

**The Comparison Story** shows what happens if you choose A versus B. This is the "A Christmas Carol" move—show both futures. If we build refunds properly, Sue's boutique thrives and referral grows. If we defer it, we lose that customer cohort. The metrics might be directional—we don't know exact numbers—but the direction is clear. One choice pushes the needle up, the other down. Or one choice reaches the goal faster.

The story doesn't have to be perfect. You don't need exact numbers. You need *direction* and *grounding in reality*. That's enough to make a decision feel coherent instead of arbitrary.

## Where Stories Live (And Why That Matters)

Most teams fail because stories die.

Someone tells a great story in a meeting. Everyone nods. The moment passes. Months later, a new team member joins, and the story is gone. Six months later, someone re-litigates the exact same tension because they don't know it was already resolved, already thought through, already understood.

Stories need to be *archived and indexed*.

The refunds story doesn't live in a Slack thread that scrolls away. It doesn't live in someone's head. It lives in the product definition, linked to the requirements it justifies. It lives in design artifacts that reference the problem Sue is solving. It lives in engineering specs that quote the story to explain why certain edge cases matter.

Stories turn into requirements. Requirements turn into design outlines. Designs definitions turn into engineering specifications. And the story runs through all of it as the *why*.

When a new engineer picks up a task three months later, they see the spec. But they also see the story. They see Sue. They see that this isn't just plumbing—it's a commitment to a real person.

This is institutional memory. This is how you prevent smart teams from making the same decision twice, or worse, undoing good decisions because the reasoning got lost.

Archive the story. Index it. Link it to everything downstream. Make it part of the product definition the way you'd make requirements part of the spec.

## The Guardrail: How Stories Avoid Bullshit

The hardest question to answer: when is a story true, and when is it propaganda?

It's easy to tell a story that makes your preferred outcome sound inevitable. "This feature will transform the business, users desperately want it, the market is begging for it." Is that a story or a sales pitch?

The guardrail is unglamorous: **facts, motivations, metrics, and people who know the domain calling you out**.

Sue isn't an invented persona. She's a pattern we observed with 43% of our customer base. We have data showing that customers in that cohort have high churn or low feature adoption. We can see their actual behaviour in support tickets and analytics. The story emerges from that evidence, not the other way around.

Then you add motivations. Why do these people use our product? What are they trying to accomplish? What frustrates them? Not what you think they should want—what they *actually* care about, based on how they spend time and money.

Then you tie it to metrics. One choice pushes time-to-first-refund down, the other up. One choice improves retention for this cohort, the other doesn't. The metrics don't have to be precise—"directional understanding is enough"—but they have to be *real*.

And finally, you have mavens. These are people who know the domain deeply. They're inside your company—a customer success leader, an engineer who's spent months with the API, a designer who's done dozens of user interviews. And they're outside—actual customers, industry experts, people who've solved this problem elsewhere.

You tell them your story. You ask them: does this match what you see? Where am I wrong? What am I missing?

That's the check against propaganda. It's not foolproof—you can still fool yourself. But it's the difference between a story rooted in observation and a story rooted in wishful thinking.

The moment you realize you're tailoring the story to fit your preferences instead of following where the evidence points, that's when you know you've crossed the line. That's when you need to step back and let the evidence speak instead.

## Why This Changes Everything

When your team shares a story about *why* they're building something, the entire dynamic shifts.

Engineers stop seeing requirements as arbitrary constraints and start seeing them as commitments. Designers stop making decisions in isolation and start designing for the specific person in the story. Product leadership stops debating priorities in abstraction and starts asking: which story matters more?

Tradeoffs become visible. You're not choosing between A and B based on some invisible rubric. You're choosing between serving Sue's returns problem in phase one or building the API that fifteen engineers have been asking for. You can see both sides. You can articulate why you chose one first and when you'll come back to the other.

Mistakes become learning instead of failure. When something doesn't work the way you expected, the story gives you a framework to understand why. You can see where your assumption about the customer was wrong, where the world changed, where you missed something. That's not a failure of the story—it's the story doing its job, which is staying true to the reality.

And alignment becomes possible. Not the false alignment of everyone nodding in a meeting, but the real alignment where a team understands the problem so deeply that they make good decisions even when you're not in the room. They see a tradeoff and think: what would Sue need? They run into an edge case and think: is this the kind of thing that breaks the story?

That's when stories become the actual operating system of your team.

## The Practice

In practice, this means:

When you're building your roadmap, start with stories, not features. Who are the people you're serving? What are they trying to accomplish? Where do current solutions break? Archive those stories. Make them searchable.

When you're writing requirements, ground them in stories. What problem is this solving for whom? Why does this detail matter? Link the requirement back to the story it serves.

When you're making tradeoffs, tell the comparison story. Here's what happens if we do A. Here's what happens if we do B. Show the futures, not just the reasoning.

When you're onboarding someone new, tell them the stories first. Show them the people they're building for. Let them understand the narrative before they see the specs.

When reality surprises you, update the story. Don't pretend the old story was wrong. Update it with what you learned. Let it evolve as your understanding evolves.

## The Real Job

It took me years to understand this: the PM job isn't about making decisions. Managing features, timelines, stakeholders—those are all necessary, but they're downstream from the actual work.

The actual work is making sure your team understands why they're building something. It's telling the story in a way that makes the decision feel inevitable instead of arbitrary. It's creating shared understanding so that when tensions arise, everyone can see the tradeoff instead of just the conflict.

You're a storyteller. Your medium is products. Your audience is a team trying to build something meaningful.

The documents, the specs, the requirements—they're just the proof that you understood the story well enough to translate it into something buildable.

The story is where the real work happens.



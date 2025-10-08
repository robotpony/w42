---
slug: beware-of-turducken-projects
title: Beware of turducken projects
date: 2024-12-27T12:00:00Z
draft: true
tags:
- software-development
- software-design
- methodology
---

I've been thinking about a particular flavor of technical disaster that keeps cropping up in software companies. I call them "turducken projects" - those unfortunate mashups where you try to maintain two different solutions to the same problem, usually for political rather than technical reasons.

Like the absurd holiday dish they're named after, these projects seem impressive at first glance. "We'll support both approaches!" sounds inclusive and customer-friendly. In reality, you end up with something that makes everything involved worse.

## The anatomy of a turducken

You know you're building a turducken when you have two paths to solve the same problem, and instead of picking one, you decide to support both. Sometimes it's maintaining two systems in parallel. Sometimes it's building one, then the other, with years of expensive overlap. The effort expended always far outweighs any value - usually to the detriment of the actual product.

I watched one company maintain two versions of their template editor for over a decade. The "new" version was cleaner internally but missing features customers actually used. The "old" version worked well for the problem and had thousands of customer templates built on it. 

Here's the kicker: we spent years trying to convert customers from the old editor they loved to the new one they didn't want. Think about that - trying to sell your already-sold customers on your own product *again*. Nearly 10 years later, another push to force the switch failed spectacularly due to customer pushback. 

Listen to your customers. Radical idea, I know.

## Follow the money (in the wrong direction)

Another company I know selected a cloud provider based on kickbacks and rebates. The provider had limited services and was actually more expensive per unit, but those upfront incentives were too tempting to pass up. The competing providers offered richer environments and better value but no fat rebate checks.

Guess how that worked out? The "savings" evaporated immediately. The limited services meant constant workarounds. Performance suffered. Customers noticed. After burning tens of millions more than the alternative would have cost, they migrated anyway - eating the switching costs, downtime, and engineering effort all over again.

Saving pennies to lose dollars is still losing dollars.

## Why do smart people build turduckens?

The politics behind these disasters follow predictable patterns:

- **Blind faith in the new**: "Modern" must be better, even when customers disagree
- **Kickback economics**: Following the rebate instead of the value
- **Trend chasing**: Adopting popular approaches without considering fit
- **Compromise culture**: Nobody wants to be the bad guy who kills someone's pet project
- **Sunk cost paralysis**: We've already invested so much in both approaches...

The cost is always greater than 2x - often exponentially worse. But here's the real problem: a company that can't resolve a two-path problem is fundamentally paralyzed. It's not just about the wasted engineering effort. It's about what that indecision says about your ability to make hard choices.

## The turducken test

Here's the thing: you already know if you're building a turducken. It's when the technical debt makes you wince. When new hires ask "why do we have two of these?" and nobody has a good answer. When you're spending real money maintaining that thing everyone knows should be deprecated but somehow never is. When the word "migration" has been in your roadmap for multiple years.

## When two paths make sense (hint: rarely)

There are legitimate reasons to maintain multiple approaches:

- **True migration periods**: With hard deadlines and clear deprecation plans
- **Fundamentally different use cases**: When the problems are actually different
- **Platform requirements**: Native mobile vs web, for instance

But these are the exceptions. And even then, the overlap should be minimal and decreasing, not indefinite.

## Just make the damned choice

The prevention is simple but requires courage: make a decision, pick the good path, and root out the politics that created the mess. Yes, someone's feelings might get hurt. Yes, you might have to admit a previous decision was wrong. Yes, you might have to tell a customer no.

But the alternative is worse. Turduckens don't get better with age - they just get more expensive to maintain and harder to untangle. Every day you don't choose is another day of compounding technical debt and team frustration.

The next time someone suggests supporting both approaches "just to be safe," remember: that's not safety. That's the first step toward a very expensive disaster. Sometimes the bravest thing you can do is pick one path and stick with it.

Even if it means admitting the other path was a mistake.
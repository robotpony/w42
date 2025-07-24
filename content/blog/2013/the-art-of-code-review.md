---
slug: the-art-of-code-review
title: The art of code review
date: 2013-06-30T22:53:23Z
draft: false
tags:
- software-development
---

I review a lot of code these days. It's an incredible way to nudge a team of bright people toward greatness. It allows me to look at problems from the outside with a perspective of experience and distance from the low level design. The perspective is important too, and I see things that I often miss in my own code. You see, we're easily blinded when we're too close to the problems we're trying to solve.

> A change in perspective is worth 80 IQ points. [--- Alan Kay](http://en.wikiquote.org/wiki/Alan_Kay)

Think of it like this: walk up to the front of a large building. You won't be able to see around it anymore: the roads leading away from it are obscured, and the metropolis surrounding it is dwarfed by its stature. Your perspective limits you.

## Rule 0: no one has immunity

I require review for most code that comes from my teams, including my own. [Github](http://github.com) pull requests are a great tool for this, as you package up a change, relate it to a bunch of tracked issues, and open it up for peer review. It allows you and your team to comment, iterate, and accept *or deny* each patch. There are lots of other ways to do this, of course, but the mix of branching and discourse is brilliant.

## Rule 1: reviewed code is always better code

You don't have to review all of the code produced by your teams, but it is incredible value for the effort. It's far easier to bump design and learning along in small steps, and far cheaper too. There are fewer surprises, fewer rewrites, and a much easier learning curve for everyone.

I can review code for a few teams of developers, given a mix of skills, in a few hours a day. That includes time to talk over issues with individuals and group whiteboard sessions. The code review leads to design review, and a solid understanding of where your teams stands on a daily basis. Getting the team productive gets you to shipping.

## Rule 2: develop simple ways to sample code

Understanding every line of code is difficult, especially given the chaos that creeps into the daily life of a team lead. Even after taming the chaos you still need to find ways to focus on code in ways that finds the important holes. How do I do this? Simple heuristics, or in other words: rules for finding crap.

For example, when reviewing anything in Python, Ruby, Perl, or PHP, I look for programming conventions from other languages. Parsing strings using `strpos`? Is there a better way in the language? Is there a faster way? Is there a cleaner way? I call this: **alien syndrome**. It's easy to spot, and even though it's sometimes the best solution, it's more often a sign of a developer who has failed to really understand the language. A sign that they're limiting their thinking to what they know and not in the potential of the tool at hand.

## Rule 3: write down your rules and philosophies

Write your rules and style guidelines down and share them with the team. Make them into manifestos or a top-`$n` list. Have fun with it.

Here's my 8-bit list for reviewing code:

1. *Alien syndrome* - the code uses a convention or mechanism from a different style of language. C-isms in Python? That's weird!
2. *Exception litter* - a function spreads its error cases throughout larger algorithms. Is the data unreliable? Failing early seems more humane than dragging it out.
3. *In-and-out buggers* - the code mixes generation with logic. Can the logic be split into something more easily tested? Can the generation be split into some sort of adapter or template?
4. *Elbow-itis* - the design or code has several elbows. Does the complexity of the code or design fit the complexity of the feature? Not!
5. *Inconceivable* - language or library functions used in odd ways, or where much better mechanisms are available with a bit of searching. Do the functions do what the developer thinks they mean to do? Various uses of `regex` are especially subject, as they represent incredibly dense logic.
6. *Are we there yet?* - algorithms or classes that drone on well past their welcome. What makes the code so lengthy? The rhythm of the code is much like prose: it should feel good, not boring.
7. *How DRY I am* - repeated code is stupid. I may be lazy, but testing something more than once is crazy talk. It's also expensive and prone to errors on several levels. Bad mojo!
8. *Preflight sanity* - code fails the basic mustard: neat, tidy, edible, digestible, and food-safe. Loose lips sink ships. Sloppy code is crap. Or, if code can't meet basic minimum limits, then it's likely flawed in other ways.

I add heuristics regularly, based on simple misconceptions, new techniques, or especially creative developers (often including myself). I focus on different types of problems with different developers, and with different types of designs.

## Rule 4: review should use what people do best

Let the computers worry about syntax checking, enforcing persnickety grammar rules, and testing for large and complex things. Code review does not replace the compiler, the lint tools, the unit tests, the system tests, or the load tests. How could it?

I focus my time on things that I can use to teach better techniques, on patterns I can use to prevent entire classes of problems in the future. In the rare case where there are grievous basic issues, I call everyone to the bat cave.

## Rule 5: to the bat cave!

Some problems deserve more than one-on-one time or group training. You know the type of problem I'm talking about: that API that's warty and gross, or those SQL queries that are covered in slop. Picking these things apart piece by piece would be painful and cruel. Didn't someone tell you not to pick at the scabby things? No?!

These loathsome problems require a graft and not just a simple nudge. Solve the problem properly, cleanly, and with some tact. No sense in making it painful or tedious. Write a standard or a guideline, and plan some real time to scour the grit out of the gunk. Fix it up right, and take the fix out of band to the mess it solves. No sense in dragging developers through the mud. Pick them up, set them straight, and show them how to solve the problem properly.

## Rule 6: there is no rule 6

There are always problems that don't fit your experience. Roll with it and remember your team is awesome. Support them, look for the long game, and base your recommendations on solid first principles and fact. Keep it clean. Keep it fun. And remember: code review is a form of programming itself. You're encoding your team's success using a simple series of feedback loops.

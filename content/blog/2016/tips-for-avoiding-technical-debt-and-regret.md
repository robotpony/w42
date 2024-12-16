---
slug: tips-for-avoiding-technical-debt-and-regret
title: Tips for avoiding technical debt and regret
date: 2016-07-15T22:56:05Z
draft: false
tags:
- tips
- software-development
---

[Last week](being-honest-about-technical-debt) I was talking about how it’s easy to conflate debt and regret when it comes to technical decisions. Technical debt is the set of simple, shorter paths in software development that you follow intentionally. Regret is more about getting lost and following unsafe paths, often blissfully unaware that you're lost. Technical debt will feel good in the long run, as it helps you get somewhere faster at a reasonable cost. Regret, on the other hand, feels bad, as you can see the wasted time and effort spent on a path that was clearly followed by mistake. It's easy to feel unqualified to measure technical decisions, especially if you're not technical. You may be disconnected from the planning process or you may not understand the jargon and details of an approach. How can you ask intelligent questions about risk when you feel so separated from what's happening? How can you make clear decisions about risks with incomplete technical knowledge? Luckily, most regrettable technical decisions fail to satisfy even the most basic of principles, and risky debt is all about the poor ratios of cost versus gain.

## Know the scale of your product and features

In terms of debt and regret, you can measure the risks by understanding two things:

- the basic _scale_ of your product, and
- the basic _dependencies_ in the features your product offers.

Understanding these doesn't require much technical knowledge, and that understanding is anchored to what your product does. Thinking of risk starting with facts and how they relate to what your product provides you a rational base to start from. Scale includes things like the number of users, the size of the things they do, and how fast they need to do them. When you have a lot of something, you can ask questions around your features and those abundant things: how can we report on X with Y users? Can we also do Z? Dependencies are simply how the features and pieces of your product relate, as there will be certain features that are more important to your product than others. Those features are riskier, as your system wouldn't be viable without them, and other features may not be possible without them. Our product has to do X to do Y and Z; what if X is too slow? What if we can't do Y? Bigger, more fundamental things are obviously more important. Understanding the scale and dependent risks gives you a set of facts you can use to anchor your thinking. The truths don't change as you develop your software either, unless you change the focus of the product.

## Know which risks to focus on

To simplify thinking about risk, you can place it on a gradient of principles:

1. Decisions that are never questioned or justified represent the risk of _the unknown and unseen_.
2. Decisions that follow known bad paths represent the risk of _the known bad_.
3. Decisions that don't follow known good paths represent the risk of _the likely bad_.
4. Decisions that follow new paths represent risk, that of _the unknown_.
5. Decisions about the most fundamental parts of your system are risks _of increased or root dependency_.
6. Decisions about the biggest parts of your system are risks _of scale_.
7. Decisions that defer costs are a risk _of future expense_.
8. Decisions that prevent key opportunity are a risk _of reduced momentum_.

When you think about risks in terms of principles, you can separate some of the technical from the rationalization. When a team wants to build a custom framework (a classic example), it's easy for a non-technical manager to see that the approach isn't a known good, and that it's a new path. These principles don't prevent following that path, but they do make it clear that the risks and likely costs are not insignificant.

## Know when to consider risks

Considering risks is a crucial part of a healthy software development process. Knowing the size and dependencies of your product gives you a place to anchor your thinking. Identifying the bigger, more fundamental issues in your product using principles helps you identify the most basic major risks, as well as giving you a way to describe the risks themselves. But, do you consider every risk? Do you weigh every change? Most organizations can be improved by considering the risks of only a small portion of their technical decisions. Anything foundational or large should be considered carefully, and anything that violates one ore more of your team's core principles should be actively avoided.

## Know your history

Finally, another great way to identify risks is to learn more about the history of software failures. The principles that identify risk are clear throughout the history of failed projects, and the ways that the risks remained hidden help to identify future failures.

- [PSU's list of well known software failures](http://www.cse.psu.edu/~gxt29/bug/softwarebug.html),
- [Wikipedia's list of famous software bugs](https://en.wikipedia.org/wiki/List_of_software_bugs) (check out the long list of references),
- [Why software fails (IEEE)](http://spectrum.ieee.org/computing/software/why-software-fails),
- [TAU's software horror stories](https://www.cs.tau.ac.il/~nachumd/horror.html),
- [Jeff Attwood's history of software project failures](https://blog.codinghorror.com/the-long-dismal-history-of-software-project-failure/). Also see his mega list of [recommended reading for developers](https://blog.codinghorror.com/recommended-reading-for-developers/),
- [Steve McConnel's Classic Mistakes Enumerated](http://www.stevemcconnell.com/rdenum.htm) (based on his book _Rapid Development_),
- [Software Project Secrets: Why Software Projects Fail](https://www.amazon.com/Software-Project-Secrets-Projects-Experts/dp/1590595505) (book),
- [The Mythical Man-Month: Essays on Software Engineering, Anniversary Edition](https://www.amazon.com/dp/0201835959/) (book)

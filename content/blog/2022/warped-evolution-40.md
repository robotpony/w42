---
slug: warped-v40
title: Warped v40
date: 2022-02-19T03:54:06Z
draft: false
---

This is the 40th evolution of [warpedvisions.org](https://warpedvisions.org). It's now running on [WriteFreely](https://github.com/writefreely/writefreely),  hosted by [Write.as](https://write.as). WriteFreely is a minimalist writing platform built on Go, LESS, and plain old vanilla Javascript. It's a speedy platform that feels nice to write in.

This is also the 40th Warped theme. Not all 40 versions made the light of day, mind you, but I've hacked together all of these themes as a sort of playground of tech and design approaches. The process of building out a theme for a platform tells you a lot about the platform.

It turns out that the process of designing a theme for a site forces you to think about what you're trying to say and how you want to be seen. I decided that I needed a place to write that didn't get in my way, presented simply and clearly.

The theme is based it on my previous (and ageing) WP theme. I dialled back the colours and complexity a bit so that it fit better with the platform, and dropped the Google web fonts to promote better privacy (and because I was being lazy). The process forced me to relearn vanilla JS, and I ported a few simple helpers from my old sites as part of the process.

## About WriteFreely and Write.as

I immediately liked the writing interface. It's minimal and in Markdown (optionally at least). The app stays out of your way, while allowing some basic CSS and Javascript theming. Write.as allows you to host 3 sites at the Pro level, and offers domain name mapping, basic pages, tags, and some publishing mojo.

The entire import and build took me about a week of evenings, maybe 10 hours to import the top 60 or so posts from my old site and set up a new theme. The process was as simple as exporting WordPress posts as text, reformatting as proper Markdown, and pasting them in by hand. It is possible to script the upload using [their CLI tool](https://write.as/apps/cli), but I wanted to review each article I added so I could fix the formatting and adjust the site CSS.

I did end up having to script some Markdown cleanup as the combination of 17 generations of WordPress posts and [Pandoc](https://pandoc.org/) produced some funky Markdown. The biggest issues were around wrapped lines, extra image tag formatting, and indentation that didn't work well with Write.as. Most of these were repairable with simple regex substitutions, but a few had to be fixed by hand.

## What's next for Warped?

I haven't written much over the past few years. Most of this was the shift to working from home, and some of it was related to starting a new job and building out a new business unit.

I've been itching to write and find my voice again, but WordPress was getting in my way as I just want to write. The last straw was a botched WordPress upgrade that required fixing some old plugins, realizing my theme needed work to support current WordPress tooling, and the general annoyance of how unproductive writing in WordPress is for me.

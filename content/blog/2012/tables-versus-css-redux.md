---
slug: tables-versus-css-redux
title: Tables versus CSS, redux
date: 2012-01-09T23:51:27Z
draft: false
tags:
- html
- web-design
---

I'm a bit surprised that the [argument](http://www.reddit.com/r/programming/comments/7uecr/css_should_not_be_used_for_layout_good_rant/c07fqvk)
over [tables versus semantic layout](http://www.jwz.org/doc/markup.html) is still floating around. It ignores the obvious:

- Any set of nodes can be rendered like a table
- Any table node can be rendered like a non-table node

There is no difference between a `<div>` and a `<td>`, except for the default layout settings and nesting. The
[major browsers support](http://www.quirksmode.org/css/display.html) the distinction with the `display: table-cell;` and its important
variants, so it's a matter of how you want to organize your data.

The argument is really *semantics* versus easy *pixel perfection*. Sub arguments include, *"Do I really want my site to adapt to
various handheld sizes?*" and, *"Screw accessibility, I like my pixel perfect layouts, thank you very much."*

The whole discourse ignores where the W3C is aiming HTML5, which is to use things like `section`, `article`, `header`,
`footer`, and `nav`. These tags are much nicer than `<div>` or `<td>` soup, at least to me.

But screw semantics, you want your perfect little `px` layouts.

The complaint about pages that use positioned or floated blocks is the "difficulty" in rendering the classic column layouts.
You know, the column layouts that don't behave like newspapers (text doesn't flow between columns). And guess what? These
classic column layouts are based on---wait for it---the table layouts of the 1990s. HTML1, without any stinkin' CSS. We did
what we could then, with the tools we had.

Of course real column layouts are possible now with CSS3, where text and headlines can flow between proper columns, where you
can control flow (roughly at least), and where you can make the columns look like real print columns. And reasonable
faux-tabloid-sidebar-content-sidebar layouts are easy to build without table blocks, if you absolutely must have them, and you're
still free to use table block rendering if you're so inclined.

But people want their pixel perfect, hey-look-I-can-use-Photoshop layouts, without having to work for it. These people miss the
point of putting stuff in a browser, which is, *"Hey, look, people can view this stuff in browsers of all sorts on hundreds of different hardware and software platforms!"* You get a huge potential audience at the cost of easy pixel perfect layouts.

You can still churn out perfect layouts with all sorts of hacks and caveats, but the argument for putting things in tables is
mostly unrelated. There are other ways to get the same effect, while making your content make sense to your future self and
automated tools of all sorts. And there are better ways to get a good effect while supporting a wider range of browsers and tools.
[Fluid layouts](http://37signals.com/svn/posts/2661-experimenting-with-responsive-design-in-iterations) are way more interesting
anyway, as they work in more browsers, more usefully, and with less work.

Tables have their place, of course, for things that are actually [tables of data](http://www.ptable.com/). Even then, you could use
paragraphs and headings if it made more sense for the content.

So it's really pixel-perfect and familiar versus ubiquitous, useful, and semantically meaningful.

It ends up it's all about the data. Make the data obvious, and everything else falls into place. HTML5 has enough semantic and
layout expressiveness to wrap data in a way that is obvious and easy to make look good.

`</rant>`

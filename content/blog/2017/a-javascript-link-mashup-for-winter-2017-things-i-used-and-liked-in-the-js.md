
---
slug: a-javascript-link-mashup-for-winter-2017-things-i-used-and-liked-in-the-js
title: 'A JavaScript link mashup for Winter 2017: Things I used and liked in the JS universe this year'
date: 2017-12-11T22:55:07Z
draft: false
tags:
- js
- programming
---

2017 was a good year for JavaScript. The newer language features are now part of our daily routine. Tightly integrated CI and packaging scripts are the norm, and we have a huge sea of libraries and tools available to us. The core JavaScript frameworks have settled down and matured to the point that we can be confident in JS as the base for large-scale commercial projects.

Here are a few of the main JavaScript things that impressed me this year:

------------------------------------------------------------------------

[GraphQL for Node.js](https://dev-blog.apollodata.com/apollo-server-1-0-a-graphql-server-for-all-node-js-frameworks-2b37d3342f7c) is the most exciting library of 2017. [GraphQL](http://graphql.org/learn/) (the QL stands for *query language*) is a natural evolution of APIs: it makes it easier to ask a web service questions without having to work as hard for the answers. While RESTful APIs provided a clean way to publish and present data, building APIs based on static object definitions force a lot of work on the things that need the data, which is wasteful and complex (as you end up with much more data than you need). And while including the concept of server-side queries isn't new to APIs, GraphQL does it with a simple syntax that fits nicely into the JS world.

------------------------------------------------------------------------

React had a great year as well, with a [major feature release](https://reactjs.org/blog/2017/09/26/react-v16.0.html) and [some sweeping licensing changes](https://code.facebook.com/posts/112130496157735/explaining-react-s-license/). I think the combination of these changes and the vitality of the React ecosystem have pushed it well past AngularJS this year. [Redux](https://medium.com/@rintoj/its-2017-time-to-give-redux-another-thought-fa3bc4373df9) has gained a bunch of ground over [Flux](https://medium.com/@gyeon/redux-vs-flux-a31a02faccf3) this year too, though Facebook could undo that in 2018 with their partial-kinda-sort-of replacement QL/Flux hybrid [Relay](https://facebook.github.io/relay/docs/en/getting-started.html). The [next version of React *Fiber*](https://techcrunch.com/2017/04/18/facebook-announces-react-fiber-a-rewrite-of-its-react-framework/) has already [landed in v16](https://code.facebook.com/posts/1716776591680069/react-16-a-look-inside-an-api-compatible-rewrite-of-our-frontend-ui-library/) and will be core to significant improvements to React applications in 2018.

One of the ways to gauge the success of a UI framework is in what gets built with it. This Fall I found a solid [spreadsheet](https://github.com/denisraslov/react-spreadsheet-grid) component. I've also been using [SemanticUI](https://semantic-ui.com) and its [React bindings](https://react.semantic-ui.com/introduction), though I am a bit worried about their slow pace of updates. There are a few commercial UI kits, like [ExtReact](http://examples.sencha.com/ExtReact/6.5.1/kitchensink/#/) and [Webix](https://webix.com) that have some legs, though I'd love a richer open kit that we could all contribute to.

------------------------------------------------------------------------

I've worked to improve how [we develop software](https://codetree.com/how-we-ship/interviews/lemonstand) this year with things like deeper CI, better Lint and formatting tools, and better practices. In our quest for improvement, I found [Prettier](https://github.com/prettier/prettier), a JavaScript code formatter that is pretty smart about line lengths and readable code. You can use it in your build scripts, CI, or your favourite editor.

------------------------------------------------------------------------

Speaking of editors, I switched to [Visual Studio Code](https://code.visualstudio.com) this year, which is built on Electron (Node, Chromium, and V8). VSC replaces both Atom and Sublime, as well as my older favs [Coda](https://panic.com/coda/) and [Espresso](https://espressoapp.com). Visual Studio Code plays well with all of the recent linters, CI, build tools, and other gizmos. It performs well for coding tasks in JS and the various web formats I use regularly. When I work with larger text files, however, I'll still switch to the Vim of Mac (TextMate), or actual Vim (though I'm getting pretty rusty with that these days).

There was a time when I couldn't imagine Microsoft as a leader in OSS or web tech, but they've found their mojo with VSC and have a steady release cadence that's downright impressive.

------------------------------------------------------------------------

One of the best things about JavaScript in 2017 was the huge selection of mature and featureful libraries.

Formatting dates in JavaScript, for example, has always been a bit of a pain, but libraries like [date-fns](https://date-fns.org) make it a breeze. Similarly, CLI apps have always felt a bit clunky to build with NodeJS, but I found that by using [Ink](https://github.com/vadimdemedes/ink), a React-like library and components for CLI apps, I write a lot less fiddly `console.log()` code. Ink also makes it easy to write more complex CLI tools, which could be especially good for the ecosystem.

In terms of packaging tools, I haven't sided on a single bundler this year. That said, I do find [webpack](https://auth0.com/blog/webpack-a-gentle-introduction/) easy to set up and use. It's one of the current generation of build tools, and has simpler, clearer configuration than its predecessors. [ParcelJS](https://parceljs.org) is on my radar as a simpler way to bundle JS applications, but I haven't had a chance to use it on anything big yet.

And while there are too many JS libraries to mention, the exciting thing is that there are huge communities and tools for recommending great libraries, like [MicroJS](http://microjs.com/#) and [JavaScript weekly](http://javascriptweekly.com/).

------------------------------------------------------------------------

[Storybook](https://storybook.js.org) is one of those unexpected tools: it's a mature UI builder for ReactJS, that feels about the way a UI builder should feel these days. I didn't find myself getting lost in a tonne of automated code generation (i.e., it felt surprisingly lightweight). I haven't used it in production yet, but I'm looking for ways to make it part of my prototype toolchain for early 2018.

------------------------------------------------------------------------

And finally: as JS matures past ES6 and ES7, the language is getting easier to teach (and learn). Here are some resources to help you learn more about the evolution of JavaScript:

- [Another way to think about `this` in JavaScript](http://2ality.com/2017/12/alternate-this.html)
- [The state of The state of JavaScript modules](https://medium.com/webpack/the-state-of-javascript-modules-4636d1774358)
- A very [succinct ES6 cheet sheet](https://devhints.io/es6)
- [Some recommended NodeJS practices](https://github.com/i0natan/nodebestpractices)
- Some [async/await](http://nikgrozev.com/2017/10/01/async-await/)  learning (a pending feature in ES7)
- The [AirBnB JS style guidelines](https://github.com/airbnb/javascript) that pretty much everyone uses these days
- [A cartoon intro to Fiber](https://www.youtube.com/watch?v=ZCuYPiUIONs), a very detailed view at how rendering improves with fibers
- [The state of JS in 2017](http://stateofjs.com/2017/introduction/)

#JavaScript #Programming

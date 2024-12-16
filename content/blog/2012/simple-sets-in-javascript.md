---
slug: simple-sets-in-javascript
title: Simple sets in JavaScript
date: 2012-05-29T22:47:12
draft: false
tags:
- js
- programming
---

One of my favourite JavaScript features is its literal object notation.
It allows you to declare data structures in `JSON`, which is a very
succinct, C-like syntax. You can use this notation to declare SETs, and
the `a in b` syntax to verify a variable is in a set:

```
/* Declare your set as a JSON constant */
var valid_widgets = {
    'widget-viewer': 1,
    'special-viewer': 1,
    'widget-editor': 1
};

/* Fail if something isn't in the set */
if ( ! (options.widget in valid_widgets) )
    return false;

/* Profit! */
```

As the `in` keyword operates on the index of the referred object, we set
the value of the constants to `1` (true). A bit of a hack, but it
results in a very clean way of checking if something is part of a set of
valid values.

#Weblog

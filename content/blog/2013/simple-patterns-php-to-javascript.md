---
slug: simple-patterns-php-to-javascript
title: 'Simple patterns: PHP to JavaScript'
date: 2013-06-25T22:44:12Z
draft: false
tags:
- php
---

You can pass data between the client and server in a number of ways. I like to mirror data structures between my server and client, so that I have the same basic data model available in both realms. There are a few ways to do this, including:

- Calling an API that returns `JSON` (or `JSONP`)
- Calling an API that returns some UI, which can include some `JSON`
- Getting an entire page that includes your data model in `JSON`

Sending a client data is trivial in most dynamic languages, and PHP is no different. You return a response body with the result of a `json_encode` and your data model. The technique works just as well in APIs as it does in standard `HTML` templates:

```
<h1>Some HTML</h1>
<script>
    var my_object = <?= json_encode($my_object); ?>;
</script>
```

The result is a mirror of your server side structure on the client. You should encode your object somewhere else (like in your framework), as you should take care to ensure that the result is valid, but the simplified example shows the basic process.

You can replace these data objects from the server in subsequent requests too, ether in `JSON` calls or when requesting subsequent chunks of `HTML` (by including the same script tag). The technique lets you keep your client and server model in sync, to whatever degree your application requires. It also helps force your thinking to data structures, which gives you a chance to properly model what your application needs.

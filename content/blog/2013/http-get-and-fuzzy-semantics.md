---
slug: http-get-and-fuzzy-semantics
title: HTTP, GET, and fuzzy semantics
date: 2013-01-26T23:28:05Z
draft: false
tags:
- http
---

A developer asked me a seemingly obvious question today:

> I have an API `GET` request that requires a `JSON` body. Is that okay?

It's a good question too. It turns out the answer isn't as simple as it should be. On principle the answer is, "*No*, it's not cool". A `GET` is an idempotent request for a resource. You don't request a resource with a resource (what would that mean?), you request it with a *resource identifier*. The `HTTP` spec, however, is unclear on the subject and does not explicitly disallow it (it probably should).

This developer was using the request body as a convenient way to send a complex set of parameters, as `JSON` is much more useful to work with than `URI` encoded components. His approach was both sane and pragmatic. But, it was also incorrect.

A [few minutes of reading](http://tech.groups.yahoo.com/group/rest-discuss/message/9962) confirmed my take on it: [`GET` requests with payloads are bad mojo](http://stackoverflow.com/questions/978061/http-get-with-request-body). But why is that, though?

## Four reasons why you should avoid payloads GET requests

1. *It's unexpected.* You are not guaranteed that all `HTTP` implementations will treat it in the same way.
2. *The spec says so, sort of.* Servers could/should ignore request bodies, as they have no semantic meaning to the request.
3. *It doesn't play nicely with caching.* Many caching layers use the URI as the cache hash. Unless the URI is changing between requests, the payload will not change the result of the request.
4. *It's disingenuous.* A `GET` request uses a `URI` to name the resource. The request body is irrelevant to that request.

Sometimes the simplest questions are not answered by the spec.

## And how does the story end?

The developer recast the `GET` as a `POST`. The semantic of the request was to retrieve a customized resource based on specific parameters, essentially creating a new resource on the fly based on the given parameters. As the filters were non-trivial, they could not be cast as `HTTP` headers or components of the `URI`. This was a pragmatic fix too (one line in his tool chain).

#HTTP

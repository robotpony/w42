---
slug: five-things-to-love-about-php
title: Five things to love about PHP
date: 2013-06-17T22:20:54Z
draft: false
tags:
- programming
- php
---

PHP is a great language. It follows a long lineage of C-based syntaxes, mirroring much of the C standard library. It performs well, is trivial to deploy, and has been stable for many years. And, it's almost universally [hated](https://www.google.ca/search?client=safari&rls=en&q=why+php+sucks&ie=UTF-8&oe=UTF-8&redir_esc=&ei=OLrZUejjJ6KPiAK9-IH4Bg).

While many people look down on PHP, it's worth considering where it shines compared to other languages. I find that in many uses, PHP provides a great set of features and elegance. Not only is it competent, but there are places where it is truly a great little tool.

But first, what's up with the hate?

## PHP is old

PHP has changed over the years. The result is a language specification that has (at times) been incompatible with previous versions. It also has produced a warty standard library, with a large variety of naming and programming conventions. I agree that this should be improved.

On the other hand, the current language is expressive, and the runtime libraries are vast and rich. Any good code editor will provide auto-complete (and API references). I've found PHP no more difficult to navigate than C, C++, Java, or Ruby, though I'll agree that Ruby is a lot tidier.

## Too much dynamite

Another common complaint has to do with PHP's automatic dynamic type casting system and how it can be confusing. This stems from versions of PHP prior to 5, though there are still a few edges where the language can be used incorrectly to produce incorrect results. Namely, when comparing dynamic types, take care to read the documentation and use the appropriate casts and operators.

## Library quality, thread safety, and so on

Other complaints include varying library quality (this is a problem in most of the languages I've used), and thread safety (also a common problem). These problems have never blocked anything I've used PHP for over the years, as I use it for problems it fits well.

There are also other language quirks that frustrate people, things like ternary behaviour, historic security issues, error handling, and so on. My assertion is that, yes, PHP is quirky, but no more so than Javascript or Perl (or many other languages). I find that PHP produces very readable, predictable code for a few specific problems. This makes it a great tool for those problems, despite the hate.

## So what's to love?

If you can get over the warts, there are many features in PHP that come together to make a solid set of template and API building tools. PHP is designed as a thin veneer over HTTP requests, with enough finesse to build simple, clean interfaces.

My favourite PHP features:

1. **Dynamic class loading,** allowing you to register your own loader for classes that are requested by code and not found in the current namespace. It makes it possible to handle installation errors nicely, dynamically create modules at runtime, or provide custom loading of nearly any sort.
2. **Dynamic class accessors,** a feature that allows you to provide class accessors with a single function, making it trivial to provide clean and consistent error messages with a minimum amount of code.
3. **Dynamic call dispatching** allows you to route class member calls through a single function. This makes it simple to provide a learning interface, one that can probe a remote API and dispatch based on the results. The syntax to the caller is clean, and it implements with only a single function point.
4. **First order templates.** PHP is a template language at its base. It allows you to represent output in the output's format, hooking to the language with an obvious syntax. With its ability to set the variable namespace, it makes for a rich, performant template system.
5. **HTTP/CGI at its base.** PHP, when started by a web server, is primed and ready to go. No additional libraries are needed, and very little work is required to parse a request and produce a response. This makes it possible to service web service requests with minimal overhead (though oddly most PHP frameworks do not do so).

There is more to love too. PHP has a solid set of mechanisms for defining classes and namespaces. It provides interpolated strings and oldschool HEREDOCs. Many of its core features and libraries are implemented in C (and perform well). Given a reasonable amount of discipline it produces predictable, useful code ... about the same amount of discipline required to work effectively in Javascript or Perl.

PHP isn't for every problem. For example, I find that it's a poor fit for shell tools (Bash, Perl, Ruby and Python are much nicer here). It also doesn't scale to huge server side things on its own (Java? Ruby?). And it doesn't have the rich ecosystem of things like Ruby and Rails. But, PHP is a solid tool in my kit, especially suited for lean web things.

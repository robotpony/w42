---
slug: howto-directory-recursion-in-boost-and-other-tips
date: 2008-04-23T22:26:01Z
title: 'HOWTO: Directory recursion in Boost (and other tips)'
draft: false
tags:
- programming
- c++
---


Boost's [Filesystem](http://www.boost.org/doc/libs/1_35_0/libs/filesystem/doc/index.htm) library is an incredible resource: it abstracts paths, directories, and `stat` results.  It simplifies coding shell problems in C++, it's portable, and is maintained by a large community of contributors. The one downside of Boost is that some of its newer libraries are poorly documented. ((Something I want to contribute to.))  Until I have time to get involved in the Boost project, I'm going to post examples here.

*Traversing a directory tree*

This is the coolest feature I've found in `boost::filesystem` so far.  It treats directory elements like iterators, and has a convenience iterator that flattens the problem of iterating through a directory tree recursively.  The only examples I found for it were in their extensive test sources, (See [convenience tests](http://www.boost.org/doc/libs/1_35_0/libs/filesystem/test/convenience_test.cpp) and [operations tests](http://www.boost.org/doc/libs/1_35_0/libs/filesystem/test/operations_test.cpp) for more examples.) which are a bit light on comments.

```
#include "boost/filesystem.hpp"
#include &lt;iostream&gt;

for ( boost::filesystem::recursive_directory_iterator end, dir("./");
       dir != end; ++dir ) {
       cout &lt;&lt; *dir &lt;&lt; std::endl;
}
```

The example starts in the current working directory, and prints all of the file names (and directories) in `inode` order. ((Later I'll try to post an example that uses the `stat` features to dump extra information.))

_Notes:_

- I don't alias the namespace here (but I recommend doing so in production code, see below)
- Creating an instance of `recursive_directory_iterator` sets it to the `.end()` element by default.
- The `path` type supports all standard string paths, including relative paths.


*Aliasing Boost namespaces*

Here's how Boost's own source recommends aliasing their namespaces:

```
namespace fs = boost::filesystem;
namespace sys = boost::system;
```


*Other cool bits*

I'll write more about these later, but for now here are a few things you'll find in the library:


- `fs::exists( boost_root / "libs" )`, a static function to check if a file exists (`-e`)
- `fs::current_path()` that returns the application's `cwd`
- `fs::create_directories( "xx/yy/zz" )` is equivalent to `mkdir -p xx/yy/zz`
- `fs::is_directory( "xx" )` is the same as Perl/*sh's `-d`
- `fs::change_extension("a.txt", ".tex")` does the obvious
- `fs::extension("a/b.txt") == "txt"` is used to check file extensions
- `fs::remove_all( "x/" );` deletes everything in `"x/"`
- `ifstream file2( arg_path / "foo" / "bar" );` shows the overloaded `/` operator!


Things that are great about `boost::filesystem`'s approach:


- Static functions are used for 'helper' stuff.  Take note C++ devs: this is a great balance for types, it keeps the types noise-free while still providing a great deal of utility.
- It mirrors Perl/*sh functionality, something most developers should know well.
- It throws errors (`filesystem_error`), allowing for some really clean, transactional code.
- And, it abstracts paths that work on Win32, OSX, Unix, and Linux variants.


#boost #c++

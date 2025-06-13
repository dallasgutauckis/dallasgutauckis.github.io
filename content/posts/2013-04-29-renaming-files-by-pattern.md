---
title: "Renaming files by pattern"
date: 2013-04-29
draft: false
---

Occasionally (and especially when receiving assets) I have the need to rename multiple files at once -- often by some sort of pattern. For instance, I may need to rename all files with the string `"_msg"` in it where the file ends with `".png"`. Previously, I might have manually found and renamed all of them or written some hack of a bash "for loop" to iterate over a `find` result. Neither options are quick or easy.

Recently, I found a great and simple util called `rename` to quickly and easily rename files with simple search-and-replace functionality.

In this example, I'm renaming any _.png file under a drawable_ folder, replacing `_msg` with `_message`.

<pre>rename s/_msg/_message/ drawable*/*.png</pre>

The `rename` util (not the same as `mv`) comes standard with most linux installations, but I'm on Mac OS X and that means I have to get it separately. In order to easily get rename, I use [homebrew](http://brew.sh/ "homebrew").

0.  Install [homebrew](http://brew.sh/ "homebrew").
    `ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"`
0.  Install rename
    `brew install rename`
0.  Done.

---
layout: post
status: publish
published: true
title: 'Scala: Get character from character code'
date: '2010-11-15 20:09:10 -0500'
date_gmt: '2010-11-16 01:09:10 -0500'
categories:
- programming
- scala
tags: []
comments: []
---
Let's say that we are taking in a set of numeric ASCII codes from which we want to get the corresponding character.

```scala
val charCode = 45  

val character = charCode.toChar

// Additionally, because of the way scala works, we could just do this, if it's a pre-determined value  

val character = 45.toChar  
```

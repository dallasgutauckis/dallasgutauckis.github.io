---
title: "Scala: Get character from character code"
date: 2010-11-15
draft: false
---

Let's say that we are taking in a set of numeric ASCII codes from which we want to get the corresponding character.

```scala
val charCode = 45  

val character = charCode.toChar

// Additionally, because of the way scala works, we could just do this, if it's a pre-determined value  

val character = 45.toChar  
```

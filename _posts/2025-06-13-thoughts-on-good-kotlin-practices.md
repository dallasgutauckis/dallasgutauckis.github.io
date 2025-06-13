---
layout: post
status: publish
published: true
title: Thoughts on good Kotlin practices
date: '2025-06-13 14:00:00 -0400'
date_gmt: '2025-06-13 14:00:00 -0400'
categories:
- kotlin
- programming
tags: ['kotlin']
comments: []
---

I recently joined a new company to continue my career in Android development and leadership. Part of that is seeing how people code, what the team has found valuable 
in the past for best practices, and sprinkling some of my own ideas in as time goes on.

I thought I'd share some of my thoughts here so that others can see these and consider them as well.

## Kotlin Best Practices

### Only use destructuring on positional classes

Destructuring can be a really clean way to unpack data, but it should be reserved for data types where the order of fields makes intuitive sense—namely, positional classes 
like `Pair`, `Triple`, or when splitting a string, e.g.

```kotlin
val input = "userId=42"
val (key, value) = input.split("=")
```

When you destructure something like `val (a, b, c) = someData`, it’s no longer obvious what `a`, `b`, or `c` actually represent without jumping back to the class definition. 
This hurts readability and can lead to subtle bugs if fields are ever reordered or misunderstood.

Instead, prefer using named accessors (`someData.foo`) unless destructuring truly enhances clarity and is immediately obvious from context.

### Structure state in a way that models the data available

In modern Android architecture (especially with MVI), it's critical to design your UI state in a way that matches what the user can actually see or experience at a given moment. This usually means using a sealed class to represent the different "modes" of the screen:

```kotlin
sealed class UiState {
    object Loading : UiState()
    data class Error(val reason: String) : UiState()
    data class Success(val data: MyData) : UiState()
}
```

This approach helps prevent invalid combinations of state (like showing both a spinner and an error) and makes it clear in the UI layer how to render each state. Each subclass should fully represent a single, valid UI configuration.

### Use `object`/`data object`, not `class`…

You’ll often see people reach for `class` when they really mean `object`, especially for singleton values. There’s a [widely shared article](https://medium.com/android-news/memory-efficiency-with-sealed-object-d7941ce8a66c) that argues for using `object` on the basis of memory efficiency — but that’s largely a red herring.

In practice, the memory savings are negligible. The real value in using `object` or `data object` (as of Kotlin 1.9) is **clarity of intent**: if something doesn’t carry instance-specific data and doesn’t need to be instantiated multiple times, it *shouldn’t* be a class.

This makes your code easier to reason about. Using `object` reduces boilerplate and makes exhaustive `when` statements cleaner and more reliable, since there's no ambiguity around instantiation or equality.

It’s not about saving memory — it’s about making your code harder to misuse and easier to understand.

### Keep extension functions focused and contextual

Extension functions are great for adding functionality to existing types, but they can become a dumping ground if not scoped appropriately.
Prefer keeping them close to where they're used (e.g. in the same file or module) and naming them in a way that reflects their context.

Good:

```kotlin
fun List<Event>.upcomingOnly(): List<Event> = filter { it.date > now }
```

Bad:

```kotlin
fun List<Any>.filterValid(): List<Any> {
    // Who knows what "valid" means here?
    return filterNotNull()
}
```

In this bad example, the extension is:

 - Too generic (`List<Any>`)
 - Vaguely named (`filterValid()`)
 - Unclear in behavior — the reader has to inspect the implementation to understand what “valid” actually means.

Avoid vague, overly generic names like `filterValid()` or `toCleaned()`, especially if it’s not obvious what “valid” or “clean” means in that scope.

### Avoid nullable types unless truly necessary

Kotlin gives you powerful tools to model nullability explicitly — use them thoughtfully. If a value should always exist, don’t make it nullable "just in case."

Instead of this:

```kotlin
var name: String? = null
```
...consider this:

```kotlin
lateinit var name: String
```

Or better yet, design your class so that name can be injected or passed in directly and be non-null from the start.

Make nullability meaningful—not a default.

---
layout: post
status: publish
published: true
title: A Better Parcelabler...
date: '2014-02-10 18:19:33 -0500'
date_gmt: '2014-02-10 23:19:33 -0500'
categories:
- programming
- projects
- android
tags: []
comments:
- id: 394
  author: Antonio
  author_email: antonio_espin@ono.com
  author_url: ''
  date: '2014-04-06 15:13:49 -0400'
  date_gmt: '2014-04-06 20:13:49 -0400'
  content: "hello Dallas \r\nthanks for your Parcelable tool \r\n\r\nI have a doubt,
    when you have a class that inherits from another. Do they have to implement Parcelable
    the two? \r\nI actually have an object with attributes that are objects of other
    classes and collections, but I get errors ClassCastException. \r\nA part of the
    structure: \r\n\r\nclass Grado{\r\nprivate int g, m, s; \r\n... \r\n} \r\nCuerpoCeleste
    class {\r\nprotected String name; \r\nprotected Grado position; \r\nprotected
    String sign; \r\n...\r\n} \r\n\r\nclass Planeta extends CuerpoCeleste  {\r\nprivate
    boolean esRetrogrado; \r\nprivate boolean visible; \r\n...\r\n}\r\n\r\nI understand
    that you all have to implement Parcelable, correct?\r\nbest regards"
---
A little bit ago (okay, a long time ago) I wrote [a blog post about a tool I wrote for creating Parcelable implementations for Android](http://dallasgutauckis.com/2012/01/20/parcelabler-for-implementing-androids-parcelable-interface/ "parcelabler: for implementing Android’s Parcelable interface"). At time of writing, I knew it wasn't a great solution, but that at least it worked... Since then, I constantly put off writing what I thought would be a better solution: an IDE plugin.

So last week, I embarked upon the journey of making a plugin for Android Studio. I immediately saw that [something existed](https://github.com/mcharmas/android-parcelable-intellij-plugin), but it was a bit older, and not quite as feature-packed as I had hoped. So, I took it upon myself to [make some enhancements and submit a pull request](https://github.com/mcharmas/android-parcelable-intellij-plugin/pull/7).

I'll be continuing development under [my fork](https://github.com/dallasgutauckis/android-parcelable-intellij-plugin), where you'll always be able to grab the latest as I work on enhancements. Please feel free to fork and submit pull requests as well.

[Check out the plugin...](https://github.com/dallasgutauckis/android-parcelable-intellij-plugin)

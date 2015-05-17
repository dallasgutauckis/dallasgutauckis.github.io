---
layout: post
status: publish
published: true
title: Generate JUnit assertions from your JSON
date: '2015-02-27 01:35:51 -0500'
date_gmt: '2015-02-27 06:35:51 -0500'
categories:
- Uncategorized
tags: []
comments: []
---
Got some JSON you want to build into a model and test?

It can be pretty tedious writing all of that code. Instead, why not generate the assert* code automatically? I've been writing code manually for a while now and finally decided to build something to write that boilerplate code for me.

I've put up a [live version](http://java-json-test-writer.herokuapp.com) for anyone to use, as well as [open-sourced it on GitHub](http://github.com/dallasgutauckis/java-json-test-writer). Let me know what you think!

Here's some JSON to test with:

```json
{
     "id": 2,
     "name": "An ice sculpture",
     "price": 12.50,
     "tags": ["cold", "ice"],
     "dimensions": {
         "length": 7.0,
         "width": 12.0,
         "height": 9.5
     },
     "warehouse_location": {
         "latitude": -78.75,
         "longitude": 20.4
     }
 }
 ```

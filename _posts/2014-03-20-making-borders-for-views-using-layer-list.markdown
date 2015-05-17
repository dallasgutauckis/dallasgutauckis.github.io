---
layout: post
status: publish
published: true
title: Making Borders for Views Using layer-list
date: '2014-03-20 11:01:42 -0400'
date_gmt: '2014-03-20 16:01:42 -0400'
categories:
- Uncategorized
tags: []
comments: []
---
Android is full of many ways to do things differently. One of those things happens to be making a border for a View.

The common approach I've seen is for developers to have two Views. One View is the View with a background (be it solid, bitmap, or otherwise). The other View acts as a border, typically either 1px or 1dp in width or height, the other side matching the height or width of the other View. Although this is certainly an easy approach, at adds more to your layout than is likely necessary.

Example with Views:

```xml
<View
    android:layout_width="match_parent"
    android:layout_height="1px"
    android:background="#ccc" /></p>
<TextView
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:background="#eee"
    android:text="Hello, World" />
```


Assuming those Views are encapsulated in a LinearLayout with vertical orientation, you'll end up with a TextView with background of `#eee` and top border of `#ccc`.

Now, let me introduce you to [layer-list](http://developer.android.com/guide/topics/resources/drawable-resource.html#LayerList)…

layer-list allows you to do many things regarding multiple drawables. One of the more common implementations is adding a border to something.

I'll explain by example:

```xml
<?xml version="1.0" encoding="utf-8"?>
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <item>
        <shape>
            <solid android:color="#ccc" />
        </shape>
    </item>
    <item android:top="1px">
        <shape>
            <solid android:color="#eee" />
        </shape>
    </item>
</layer-list>
```

What this example shows is the layer-list way of going about the previous example. This will produce a drawable that has a 1px solid top border colored `#ccc` and a background of `#eee`. The confusing part to this for most people tends to be where the 1px is designated. layer-list draws top-down in the XML. This means that #ccc is drawn in the full background first, and then #eee is drawn over top of that, with a 1px top offset.

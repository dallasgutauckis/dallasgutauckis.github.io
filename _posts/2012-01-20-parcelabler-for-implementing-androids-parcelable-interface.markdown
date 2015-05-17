---
layout: post
status: publish
published: true
title: 'parcelabler: for implementing Android''s Parcelable interface'
date: '2012-01-20 00:18:35 -0500'
date_gmt: '2012-01-20 05:18:35 -0500'
categories:
- programming
- android
tags: []
comments:
- id: 80
  author: gulyasm
  author_email: mgulyas86@gmail.com
  author_url: http://twitter.com/gulyasm
  date: '2013-02-06 04:28:11 -0500'
  date_gmt: '2013-02-06 09:28:11 -0500'
  content: Great tool! One observation. You could generate the code for the unknown
    types too. You could assume they implement the Parcelable interface, and have
    the public static CREATOR member, and generete code for them as well. If there
    is any error, generating for those types too solves the problem. I did the above
    for my own parcelable tool. Though I don't have this cool interface like yours.
    :)
- id: 85
  author: ursimon
  author_email: michal.ursiny@gmail.com
  author_url: http://gravatar.com/ursimon
  date: '2013-03-11 04:55:45 -0400'
  date_gmt: '2013-03-11 09:55:45 -0400'
  content: thank you! useful tool!
- id: 126
  author: Ev
  author_email: gwnem@libero.it
  author_url: ''
  date: '2013-05-19 09:08:56 -0400'
  date_gmt: '2013-05-19 14:08:56 -0400'
  content: "u should fix the parcelabler so it could handle the 2 or more dimensional
    array.\r\nfor example:\r\nint [][]v;"
- id: 127
  author: Ev
  author_email: gwnem@libero.it
  author_url: ''
  date: '2013-05-19 09:09:20 -0400'
  date_gmt: '2013-05-19 14:09:20 -0400'
  content: however good job! ;)
- id: 128
  author: Dallas Gutauckis
  author_email: dallas@gutauckis.com
  author_url: ''
  date: '2013-05-19 13:54:41 -0400'
  date_gmt: '2013-05-19 18:54:41 -0400'
  content: "I've ticketed this on the open-source repo: https://github.com/dallasgutauckis/parcelabler/issues/4\r\n\r\nThanks
    for pointing it out."
- id: 176
  author: shanuka
  author_email: shanukagayashan@gmail.com
  author_url: http://www.wintafu.com
  date: '2013-07-20 00:14:41 -0400'
  date_gmt: '2013-07-20 05:14:41 -0400'
  content: "Really great job. if you can add Encapsulation method (for private feilds
    ) that will be great.\r\nthank you again."
- id: 187
  author: Wajeeh
  author_email: muhammad.wajeeh@arbisoft.com
  author_url: ''
  date: '2013-08-13 05:38:12 -0400'
  date_gmt: '2013-08-13 10:38:12 -0400'
  content: Wow, just add syntax highlighting in text box. I guess such boxes are available
    open source.
- id: 382
  author: A Better Parcelabler&#8230; | Dallas Gutauckis
  author_email: ''
  author_url: http://dallasgutauckis.com/2014/02/10/a-better-parcelabler/
  date: '2014-02-10 18:19:36 -0500'
  date_gmt: '2014-02-10 23:19:36 -0500'
  content: "[&#8230;] little bit ago (okay, a long time ago) I wrote a blog post about
    a tool I wrote for creating Parcelable implementations for Android. At time of
    writing, I knew it wasn&#8217;t a great solution, but that at least it worked&#8230;
    [&#8230;]"
---

**[Update 2014-09-02]**: Since this original post, a plugin has been made for Android Studio/IntelliJ by Michał Charmas with contributions from me as well. See [android-parcelable-intellij-plugin](https://github.com/mcharmas/android-parcelable-intellij-plugin) for installation instructions.

I have created a tool for making the methods needed for implementation of Android's [Parcelable](http://developer.android.com/reference/android/os/Parcelable.html) interface within a pre-existing class.

0.  Open the [parcelabler tool](http://parcelabler.com).
0.  Copy the full code of the class into the "Code" text field.  
     Example code:  

     ```java
     public class Photo {  

        /**  

         * Caption for the photo  

         */  

        public String caption;  

        public int commentCount;  

        public long photoId;  

        public boolean isDefault;  

        public Bundle metadata;  

        public CommentHandler commentHandler;  

    }
    ```
0.  Click "Build" to create the methods
0.  Copy the methods into your class
0.  Add `implements Parcelable` to your class definition

Now you should hopefully have a working implementation of `Parcelable` in your class.

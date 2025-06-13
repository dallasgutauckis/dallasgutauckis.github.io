---
title: "An adb (Android Debug Bridge) wrapper for installing from a URL, installing to all devices"
date: 2011-04-07
draft: false
---

At myYearbook, we produce our internal and release candidate builds for all of our [Android applications](https://market.android.com/developer?pub=myYearbook.com) using [Jenkins CI](http://jenkins-ci.org/). This allows us to automatically produce builds when changes are pushed to code review (through [gerrit](http://code.google.com/p/gerrit/)) as well as when they’re merged upstream. This process is great for keeping integration clean and organized, but it means that QA, product development, and sometimes developers have to download the produced APK from jenkins on to their computer, and then install from the location they downloaded to. In order to expedite this process, I wrote a wrapper script for adb to allow the installation of an APK from a URL.

To do this, simply change your usage from

<pre>adb install /path/to/app.apk</pre>

to use a URL
<pre>adb install http://my.server.com/app.apk</pre>

Additionally, use the -a flag to execute your commands on all devices.
<pre>adb -a install http://my.server.com/app.apk</pre>

Get the source: the [adt-plus](https://github.com/myYearbook/adt-plus) project on github!

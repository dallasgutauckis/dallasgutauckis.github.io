---
title: "Looking at Android Framework source quickly"
date: 2012-04-25
draft: false
---


Even though I have recent checkouts of the Android source on my local machine, I usually prefer a more convenient and quick way to look at the platform code. Looking through source files on my local machine can often be slow to find the appropriate files and unreasonable to keep open in an IDE all of the time. Instead, I've been using the copy of the [Android source that is hosted on github](https://github.com/android/platform_frameworks_base).

Generally, if I'm looking for something like 'How is ListView implemented in Froyo?', I'll open up the source in github at [https://github.com/android/platform_frameworks_base](https://github.com/android/platform_frameworks_base), hit 'w' as the shortcut for switching branches and tags, type in 'froyo' and choose the right branch, hit 't' as the shortcut for finding a file in the repository, type 'ListView' and hit enter to open the file. Now I have the ListView implementation open in Github and ready to peruse!

What's nice is that at myYearbook, we have a [github:enterprise](https://enterprise.github.com/) instance where we host our own internal code. So in the same way I can figure out how ListViews are implemented in Android, I can also figure out what our current Android versionCode is. Open the internal github to the myYearbook repository, hit 't', type in AndroidManifest.xml, and then use my browser's find functionality to look for 'versionCode'. Done.

Awesome!

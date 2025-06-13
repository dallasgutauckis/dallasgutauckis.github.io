---
title: "parcelabler: for implementing Android''s Parcelable interface"
date: 2012-01-20
draft: false
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

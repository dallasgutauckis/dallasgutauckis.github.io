---
layout: post
status: publish
published: true
title: Listing connected Android devices with OS version and model
date: '2014-04-09 14:46:36 -0400'
date_gmt: '2014-04-09 19:46:36 -0400'
categories:
- Uncategorized
tags: []
comments: []
---
I was wandering down the path of trying to associate the myriad of devices connected to my machine for debugging. I wanted to know very easily what the devices' model and OS version were without having to manual check by disconnecting and reconnecting devices and using the process of elimination.

One way to see this information is using a special flag with adb:

````
adb devices -l
````

This yields something like


    List of devices attached

    HT16JHX24920 device usb:14130000  

    015d2a506750081b device usb:14120000 product:nakasi model:Nexus_7 device:grouper  

    4d005e148cc950eb device usb:14112000 product:ja3gub model:GT_I9500 device:ja3g  

    0A3BC06A11010002 device usb:14140000  

    e08b84fd device usb:14113000  

    HT346W912280 device usb:14114000  


Which as you can probably tell doesn't give us all of the information we want, nor does it seem to work on every device.

So instead, I wrote a script for printing out what I needed. The bash script reads properties from the device via `adb shell`.

The output for that looks like:


        HT16JHX24920 [ 4.0.3]: PG86100  

    015d2a506750081b [ 4.4.2]: Nexus 7  

    4d005e148cc950eb [   4.3]: GT-I9500  

    0A3BC06A11010002 [ 4.1.2]: DROID RAZR  

            e08b84fd [ 4.1.1]: SAMSUNG-SGH-I747  

        HT346W912280 [ 4.1.2]: HTC One  


[View, download, or fork the script](https://gist.github.com/dallasgutauckis/10306968)

In case you were curious, the corresponding properties are:


    $ adb shell getprop ro.product.model  

    PG86100  


and


    $ adb -s HT16JHX24920 shell getprop ro.build.version.release

    4.0.3

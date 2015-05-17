---
layout: post
status: publish
published: true
title: Wi-Fi issues on Moto X 2nd Gen
date: '2014-09-26 13:38:17 -0400'
date_gmt: '2014-09-26 18:38:17 -0400'
categories:
- Uncategorized
tags: []
comments:
- id: 1031
  author: Matt
  author_email: motforum@motorola.com
  author_url: http://supportforums@motorola.com
  date: '2014-09-26 15:59:29 -0400'
  date_gmt: '2014-09-26 20:59:29 -0400'
  content: Dallas, our wifi team has seen this and is taking a look. If you want to
    contact me at supportforums@motorola.com, it may be easier to exchange information.
- id: 1063
  author: Dayv
  author_email: noghri@gmail.com
  author_url: ''
  date: '2014-10-06 09:10:19 -0400'
  date_gmt: '2014-10-06 14:10:19 -0400'
  content: Having the <em>same</em> issue.  Quite annoying.
- id: 1069
  author: Jae
  author_email: ellieappa@gmail.com
  author_url: ''
  date: '2014-10-08 13:26:55 -0400'
  date_gmt: '2014-10-08 18:26:55 -0400'
  content: I'm having the same issue on our corporate network.  Waiting to hear back
    from Motorola support.  I talked to someone in IT, We do have Cisco routers but
    he said he had no complaints from anyone else.  My Moto X is the first device
    specific issue about not being able to connect to Wi-fi in the office.
- id: 2065
  author: Paul Sanderson
  author_email: dallasgutauckis@ringinglow.co.uk
  author_url: ''
  date: '2014-12-20 10:31:32 -0500'
  date_gmt: '2014-12-20 15:31:32 -0500'
  content: "It seems Cisco Access points with older firmware versions have problem
    with PMF supported devices. Cisco has fixed this issue in the latest firmware
    versions. There is a thread on the forums: http://goo.gl/ZjbhX0\n\nHowever
    knowing that your phone is following the standard correctly and that the access
    point is wrong doesn't help at all if you have no way to influence the people
    who upgrade your corporate infrastructure.  I think the phone should gracefully
    fall back to incorrect working if it fails to connect - I am seriously thinking
    about returning my phone under the UK sale of goods act - every other device I
    know about connects just fine to my work WiFi.\n\nI received Lollipop last night
    after leaving work, so I don't know if it might fix the problem - I doubt it.
    \ If anyone knows, please post.\uFEFF"
- id: 2093
  author: Jae
  author_email: ellieappa@gmail.com
  author_url: ''
  date: '2014-12-22 00:04:55 -0500'
  date_gmt: '2014-12-22 05:04:55 -0500'
  content: Lollipop did not fix the problem.  Motorola will not update their firmware.  After
    many emails and phone calls with Motorola, I gave up.  I have to rely on my mobile
    connection at work which is spotty around the office.  I would have never bought
    the phone if I had known about this.  I should have bought the LG or Samsung or
    HTC.  Motorola is sticking to their guns.  I think Samsung/HTC/LG would
    have done something about the problem or corporate wifi support staff would have
    been forced to upgrade quickly with larger install base.
---
I received my 2nd Gen Moto X today. During setup, I attempted to connect to our company's Wi-Fi network to no avail. I was able to connect to another public Wi-Fi in the area but for some reason not to our typical Cisco WAP setup at work. All of the other devices we have at work are able to connect to the network, so I'm not sure what is going on.

I've contacted Motorola customer support, supplied a logcat output of the Wi-Fi-related messages during the connection attempt, but they were not immediately able to resolve the issue. Instead, they've gathered my information and will be reaching out to me after escalating the issue internally.

I'll follow up more here as this issue and hopefully resolution progresses.

**UPDATE 1 [2014-09-26T14:30:00EST]**: Motorola has called me back and are currently connecting me to their "level 2 support". I'm on hold now waiting for them to chime in. Will update more as this progresses.

**UPDATE 2 [2014-09-26T14:40:00EST]**: Motorola got back on the phone with me and explained that their level 2 support is currently swamped and that they have my information and will call me in the next 24 hours.

_In the meantime, I'll just blow through my carrier data allocation as I install all of my apps again (because I had to reset my phone to see if that'd solve the problem)._

**UPDATE 3 [2014-09-27T14:07:00EST]**: Someone by the name of 'Matt' followed up on this blog in the comments to ask me to bring the conversation to email. So, I did. The conversation so far is as follows:

**Me to them**

> From: Dallas Gutauckis <[redacted]>  
>  Date: Fri, Sep 26, 2014 at 11:37 PM  
>  Subject: Re: http://dallasgutauckis.com/2014/09/26/wi-fi-issues-on-moto-x-2nd-gen/#comments  
>  To: supportforums@motorola.com
>
> Hi,
>
> Someone naming himself Matt commented on my blog post about the Wi-Fi issue some users are having with their 2nd Gen Moto X asking me to reach out. I already have an ongoing support issue ([redacted]) where I also already shared logcat output — not much but all I could give.
>
> Let me know if there is something else I can provide to get this matter resolved expediently.
>
> Best,  
>  Dallas

**Them to me**

> From: Motorola Support Forums <[redacted]>  
>  Date: Sat, Sep 27, 2014 at 10:00 AM  
>  Subject: Re: http://dallasgutauckis.com/2014/09/26/wi-fi-issues-on-moto-x-2nd-gen/#comments  
>  To: Dallas Gutauckis <[redacted]>
>
> Hi Dallas.
>
> Have you updated your router software? The Wifi team says old software versions of Cisco APs have problem with PMF supported devices. Cisco fixed this issue in later software versions.
>
> Let me know if that helps. Thanks.
>
> - Matt
>
> Matt and Mark  
>  Social Media - Customer Care  
>  Motorola Mobility  
>  Visit us at https://forums.motorola.com

**Me to them**

> From: Dallas Gutauckis <[redacted]>  
>  Date: Sat, Sep 27, 2014 at 2:06 PM  
>  Subject: Re: http://dallasgutauckis.com/2014/09/26/wi-fi-issues-on-moto-x-2nd-gen/#comments  
>  To: Motorola Support Forums <[redacted]>
>
> Matt,
>
> I'm unaware of whether the AP is up to date, and unfortunately, I'm not going to be able to simply try to update the routers because we don't employ any full-time IT staff capable of managing the routers — this would instead require we pay a contractor to come in and ensure they're up-to-date, something I'm not willing to do if we can't be sure it's the problem.
>
> I know of other people having the issue — they might be able to check such a thing on their network. See https://twitter.com/cavega_/status/515566709927706624

What I still don't understand is why this is a 2nd-Gen-specific issue and not 1st-Gen. I realize they're different devices, and potentially different networking hardware, but I would assume if it can work on one, it can work on the other.

Not yet sure where this is going to get us…

**UPDATE 4 [~2014-09-27T9:00:00EST]**: Got a call that went to voicemail (because I was still asleep). The caller said they were just checking in on me to see if my issue was fixed or not. If it wasn't, they gave me the number to contact their level 1 support (seems I've been downgraded). Obviously, nothing has changed, so nothing is resolved. _Note that this call came in before the email response from Matt._

**UPDATE 5 [2014-10-07T19:30:00EST]**: Our IT contractor happened to need to come in to set up network redundancy for our internet connection, at which time we also asked him to update the Cisco controller. The update seems to have fixed the PMF as suggested by Motorola support. Quick! Call your IT gang out to update your controllers. Best of luck to all. Still a ridiculously shitty experience to have for a new device [where they know it's going to be broken for users].

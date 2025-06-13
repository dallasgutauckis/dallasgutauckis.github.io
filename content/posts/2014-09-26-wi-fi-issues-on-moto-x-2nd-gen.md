---
title: "Wi-Fi issues on Moto X 2nd Gen"
date: 2014-09-26
draft: false
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

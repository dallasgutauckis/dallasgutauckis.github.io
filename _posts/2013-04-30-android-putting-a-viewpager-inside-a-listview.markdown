---
layout: post
status: publish
published: true
title: 'Android: putting a ViewPager inside a ListView'
date: '2013-04-30 15:19:15 -0400'
date_gmt: '2013-04-30 20:19:15 -0400'
categories:
- programming
- android
tags: []
comments:
- id: 115
  author: grantland
  author_email: grantlandchew@gmail.com
  author_url: http://gravatar.com/grantlandchew
  date: '2013-05-06 14:00:05 -0400'
  date_gmt: '2013-05-06 19:00:05 -0400'
  content: What is mActionListener?
- id: 116
  author: Dallas Gutauckis
  author_email: dallas@gutauckis.com
  author_url: ''
  date: '2013-05-07 09:04:26 -0400'
  date_gmt: '2013-05-07 14:04:26 -0400'
  content: Remnants from the actual code; I updated the example. Thanks!
- id: 117
  author: torchdragon (@torchdragon)
  author_email: torchdragon@twitter.example.com
  author_url: http://twitter.com/torchdragon
  date: '2013-05-07 09:26:12 -0400'
  date_gmt: '2013-05-07 14:26:12 -0400'
  content: Would you recommend doing any kind of graphical representation of the state
    lock out during the scrolling? Not that I would expect users to (NOT) want to
    try to push a button while the content is scrolling past their fingers, but if
    there's any kind of event delay, I can see a possible inconsistency with the UI's
    ability to accept a touch call and its visual representation.
- id: 119
  author: Dallas Gutauckis
  author_email: dallas@gutauckis.com
  author_url: ''
  date: '2013-05-07 09:41:35 -0400'
  date_gmt: '2013-05-07 14:41:35 -0400'
  content: "The state lock (touch lock) is only enabled while the user is still touching/pointing
    the view. To press a button or other view means that the user would have to lift
    his finger and press again, at which point the touch delegating would no longer
    occur, thereby allowing the user to press the appropriate view. The reason for
    the touch lock is to prevent the ListView from consuming touch events when it
    starts to see vertical movement while touching the inner (ViewPager) view.\r\n\r\nSo,
    no, I don&rsquo;t think a visual indication is needed for this touch lock."
- id: 145
  author: sc
  author_email: soochengkoh@gmail.com
  author_url: ''
  date: '2013-06-08 15:17:33 -0400'
  date_gmt: '2013-06-08 20:17:33 -0400'
  content: "I try to put viewpager in listview, but only the first viewpager is shown.
    Other viewpagers are blank. \r\n\r\nwhen i scroll down and back to the top, the
    first viewpager disappear too. \r\n\r\nDo you have any idea how to put viewpager
    in every listview row?\r\n\r\nholder.pager = (ViewPager) convertView.findViewById(R.id.pager);\r\n\r\nCustomePagerAdapter
    customPagerAdapter = new CustomePagerAdapter(fragmentManager, data);\r\nholder.pager.setAdapter(foodPostPagerAdapter);"
- id: 213
  author: osssman
  author_email: asd@asd.com
  author_url: http://gravatar.com/osssman
  date: '2013-09-19 04:28:03 -0400'
  date_gmt: '2013-09-19 09:28:03 -0400'
  content: Bad example, where is the listView?? The Activity have a listView and the
    adapter, then the adapter is who controls the viewpagers inside the rows...
- id: 3475
  author: Matt Peterson
  author_email: mattjpeterson@gmail.com
  author_url: https://plus.google.com/+MattPeterson1
  date: '2015-04-15 01:26:10 -0400'
  date_gmt: '2015-04-15 06:26:10 -0400'
  content: |-
    I ran into a bug with this. It's possible to exit the scroll without setting mTouchTarget back to null causing all touches elsewhere on the Activity to be ignored even though you are no longer interacting with the ViewPager. The simplest way to reproduce this is to start dragging and then immediately remove your finger from the screen so the current page snaps back.

    My solution is to set mTouchTarget to null whenever an ACTION_DOWN event is detected as this would indicate the initiation of a new touch event which isn't possible while dragging the ViewPager. Therefor, somehow, we aren't dragging anymore and can safely release the touch interception.

    if (mTouchTarget != null &amp;&amp; ev.getAction() != MotionEvent.ACTION_DOWN) {
                boolean wasProcessed = mTouchTarget.onTouchEvent(ev);

    <code>        if (!wasProcessed) {
                mTouchTarget = null;
            }

            return wasProcessed;
        }

        mTouchTarget = null;
        return super.dispatchTouchEvent(ev);
    </code>

    }
---
So, I've been Googling for a while to find a clean, reasonable approach for putting a `ViewPager` inside of a `ListView` (or any vertically scrolling element). The problem with putting a `ViewPager` inside a `ListView` is that it takes only a small amount of vertical (Y) delta before the `ListView` begins to consume touch events instead of delegating to the child in order to enable the scrolling of the `ListView`. That's fine, but the problem often occurs after the `ViewPager` has already started processing a page change (when dragging horizontally), producing a poor user experience resulting in the improper pagination and scrolling of the two views.

There are a few ways to try to handle this.

1.  [You could not do it at all (thanks Dianne and Mark)](http://stackoverflow.com/questions/8674529/viewpager-inside-listview)
2.  You can set a touch listener on the `ListView` and try to delegate the touches based on which view you think needs to get the touches and what actions need to occur based on those touches.
3.  You can also combine a touch listener with GestureDetector to try to make the implementation a little less cumbersome. The problem is that in some ListViews, our layouts are a little more complex than single item rows of text. If the item layout has for instance a Button, we'd then need to properly delegate the touch event down to the Button. This obviously has huge ramifications for implementation and testing.

In order to avoid the aforementioned shenanigans, I added an `[OnPageChangeListener](http://developer.android.com/reference/android/support/v4/view/ViewPager.OnPageChangeListener.html)` to the `ViewPager` and based on the state of the pager, forced a touch delegate from the `Activity`.

Contrived example:

```java
class MyActivity extends Activity {  

    private ViewPager mViewPager;  

    private View mTouchTarget;

    @Override
    protected void onCreate(Bundle icicle) {  

        super.onCreate(icicle);  

        setContentView(R.layout.example);
        mViewPager = (ViewPager) findViewById(R.id.view_pager);
        mViewPager.setOnPageChangeListener(new OnPageChangeListener() {
            private int mPreviousState = ViewPager.SCROLL_STATE_IDLE;

            @Override
            public void onPageSelected(int position) {  
                // NO-OP
            }

            @Override  
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {  
                // NO-OP
            }

            @Override
            public void onPageScrollStateChanged(int state) {
                // All of this is to inhibit any scrollable container from consuming our touch events as the user is changing pages
                if (mPreviousState == ViewPager.SCROLL_STATE_IDLE) {
                    if (state == ViewPager.SCROLL_STATE_DRAGGING) {
                        mTouchTarget = mViewPager;
                    }
                } else {
                    if (state == ViewPager.SCROLL_STATE_IDLE || state == ViewPager.SCROLL_STATE_SETTLING) {
                        mTouchTarget = null;
                    }
                }

                mPreviousState = state;
            }
        });
    }

    @Override
    public boolean dispatchTouchEvent(MotionEvent ev) {  
        if (mTouchTarget != null) {  
            boolean wasProcessed = mTouchTarget.onTouchEvent(ev);

            if (!wasProcessed) {  
                mTouchTarget = null;  
            }

            return wasProcessed;  
        }

        return super.dispatchTouchEvent(ev);
    }

}
```

Now, we have a ViewPager that retains control of touch events once the page starts changing and releases it when paging is idle or settling.

---
title: "Android: putting a ViewPager inside a ListView"
date: 2013-04-30
draft: false
---

So, I've been Googling for a while to find a clean, reasonable approach for putting a `ViewPager` inside of a `ListView` (or any vertically scrolling element). The problem with putting a `ViewPager` inside a `ListView` is that it takes only a small amount of vertical (Y) delta before the `ListView` begins to consume touch events instead of delegating to the child in order to enable the scrolling of the `ListView`. That's fine, but the problem often occurs after the `ViewPager` has already started processing a page change (when dragging horizontally), producing a poor user experience resulting in the improper pagination and scrolling of the two views.

There are a few ways to try to handle this.

1.  [You could not do it at all (thanks Dianne and Mark)](http://stackoverflow.com/questions/8674529/viewpager-inside-listview)
2.  You can set a touch listener on the `ListView` and try to delegate the touches based on which view you think needs to get the touches and what actions need to occur based on those touches.
3.  You can also combine a touch listener with GestureDetector to try to make the implementation a little less cumbersome. The problem is that in some ListViews, our layouts are a little more complex than single item rows of text. If the item layout has for instance a Button, we'd then need to properly delegate the touch event down to the Button. This obviously has huge ramifications for implementation and testing.

In order to avoid the aforementioned shenanigans, I added an [`OnPageChangeListener`](http://developer.android.com/reference/android/support/v4/view/ViewPager.OnPageChangeListener.html) to the `ViewPager` and based on the state of the pager, forced a touch delegate from the `Activity`.

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

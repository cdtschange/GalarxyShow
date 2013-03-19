//
//  JDDroppableViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/10/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/JDDroppableView.h>
#import "ControlBaseViewController.h"

@interface JDDroppableViewController : ControlBaseViewController<JDDroppableViewDelegate>
{
    UIScrollView* mScrollView;
    UIView* mDropTarget;
    
    CGPoint mLastPosition;
}

- (void) relayout;
- (void) addView: (id) sender;
- (void) scrollToBottomAnimated: (BOOL) animated;

@end

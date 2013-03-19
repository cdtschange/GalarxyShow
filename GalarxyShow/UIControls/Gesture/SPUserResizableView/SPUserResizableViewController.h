//
//  SPUserResizableViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/9/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/SPUserResizableView.h>
#import "ControlBaseViewController.h"

@interface SPUserResizableViewController : ControlBaseViewController<UIGestureRecognizerDelegate, SPUserResizableViewDelegate> {
    SPUserResizableView *currentlyEditingView;
    SPUserResizableView *lastEditedView;
}

@end

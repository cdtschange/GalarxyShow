//
//  SVSegmentedViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/11/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class SVSegmentedControl;

@interface SVSegmentedViewController : ControlBaseViewController

- (void)segmentedControlChangedValue:(SVSegmentedControl*)segmentedControl;
@end

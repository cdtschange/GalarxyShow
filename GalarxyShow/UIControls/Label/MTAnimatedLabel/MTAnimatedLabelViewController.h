//
//  MTAnimatedLabelViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/21/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class MTAnimatedLabel;

@interface MTAnimatedLabelViewController : ControlBaseViewController
@property (strong, nonatomic) IBOutlet MTAnimatedLabel *animatedLabel;
@property (strong, nonatomic) IBOutlet UIImageView *slider;

@end

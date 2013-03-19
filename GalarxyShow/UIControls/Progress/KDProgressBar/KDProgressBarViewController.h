//
//  KDProgressBarViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class KDGoalBar;

@interface KDProgressBarViewController : ControlBaseViewController

@property (weak, nonatomic) IBOutlet KDGoalBar *firstGoalBar;
@property (weak, nonatomic) IBOutlet KDGoalBar *secondGoalBar;

@end

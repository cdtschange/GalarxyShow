//
//  GRAlertViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@interface GRAlertViewController : ControlBaseViewController <UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UISegmentedControl *animationSelector;

@end

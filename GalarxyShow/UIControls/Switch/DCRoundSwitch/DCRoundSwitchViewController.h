//
//  DCRoundSwitchViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/14/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class DCRoundSwitch;

@interface DCRoundSwitchViewController : ControlBaseViewController

@property (nonatomic, strong) IBOutlet DCRoundSwitch *switch1;
@property (nonatomic, strong) IBOutlet DCRoundSwitch *switch2;
@property (nonatomic, strong) IBOutlet DCRoundSwitch *switch3;

@property (nonatomic, strong) IBOutlet DCRoundSwitch *longSwitch;
@property (nonatomic, strong) IBOutlet DCRoundSwitch *fatSwitch;
@end

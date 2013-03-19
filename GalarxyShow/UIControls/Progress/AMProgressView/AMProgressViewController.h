//
//  AMProgressViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class AMProgressView;

@interface AMProgressViewController : ControlBaseViewController

@property (nonatomic, weak) AMProgressView *pv1;
@property (nonatomic, weak) AMProgressView *pv2;
@property (nonatomic, weak) AMProgressView *pv3;
@property (nonatomic, weak) AMProgressView *pv4;
@property (nonatomic, weak) AMProgressView *pv5;
@property (nonatomic, weak) AMProgressView *pv6;
@property (nonatomic, weak) AMProgressView *pv7;
@property (nonatomic, weak) AMProgressView *pv8;

- (void)changeValue:(id)sender;

@end

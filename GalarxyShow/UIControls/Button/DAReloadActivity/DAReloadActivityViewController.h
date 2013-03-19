//
//  DAReloadActivityViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/8/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class DAReloadActivityButton;

@interface DAReloadActivityViewController : ControlBaseViewController

@property (nonatomic, strong) DAReloadActivityButton *navigationBarItem;
@property (nonatomic, strong) DAReloadActivityButton *viewButton;

@end

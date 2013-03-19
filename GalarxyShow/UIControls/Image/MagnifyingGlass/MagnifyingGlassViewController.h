//
//  MagnifyingGlassViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/12/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class ACMagnifyingView;

@interface MagnifyingGlassViewController : ControlBaseViewController

@property (nonatomic, retain) IBOutlet ACMagnifyingView *magnifyingView;
@end

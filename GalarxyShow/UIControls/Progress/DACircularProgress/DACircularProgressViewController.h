//
//  DACircularProgressViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class DACircularProgressView;

@interface DACircularProgressViewController : ControlBaseViewController

@property (strong, nonatomic) DACircularProgressView *progressView;
@property (strong, nonatomic) DACircularProgressView *largeProgressView;
@property (strong, nonatomic) DACircularProgressView *largestProgressView;
@end

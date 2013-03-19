//
//  ZCScrollNumLabelViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/21/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class ZCWScrollNumView;
@interface ZCScrollNumLabelViewController : ControlBaseViewController

@property (retain, nonatomic) IBOutlet ZCWScrollNumView *scrollNumber;

- (IBAction)none:(id)sender;
- (IBAction)fromZero:(id)sender;
- (IBAction)fromLast:(id)sender;
- (IBAction)fast:(id)sender;
- (IBAction)random:(id)sender;
@end

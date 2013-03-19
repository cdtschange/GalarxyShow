//
//  BBCyclingLabelViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/20/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class BBCyclingLabel;

@interface BBCyclingLabelViewController : ControlBaseViewController<UITextFieldDelegate>

@property(weak, nonatomic) IBOutlet BBCyclingLabel* defaultLabel;
@property(weak, nonatomic) IBOutlet BBCyclingLabel* scaleOutLabel;
@property(weak, nonatomic) IBOutlet BBCyclingLabel* scrollUpLabel;
@property(weak, nonatomic) IBOutlet BBCyclingLabel* customLabel;
@property(weak, nonatomic) IBOutlet UITextField*    textField;

@end

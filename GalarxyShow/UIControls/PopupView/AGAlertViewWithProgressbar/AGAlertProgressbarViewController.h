//
//  AGViewController.h
//  AGAlertViewWithProgressbar Demo
//
//  Created by Artur Grigor on 23.04.2012.
//  Copyright (c) 2012 Artur Grigor. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ControlBaseViewController.h"
#import <GalarxyUIKitLib/AGAlertViewWithProgressbar.h>

@interface AGAlertProgressbarViewController : ControlBaseViewController<UIAlertViewDelegate>

- (IBAction)showAction:(id)sender;
- (IBAction)incrementProgress:(id)sender;

@end

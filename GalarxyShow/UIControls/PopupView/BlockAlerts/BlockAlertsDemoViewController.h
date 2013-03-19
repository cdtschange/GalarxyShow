//
//  BlockAlertsDemoViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/3/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@interface BlockAlertsDemoViewController : ControlBaseViewController<UITextFieldDelegate>

- (IBAction)showAlert:(id)sender;
- (IBAction)showActionSheet:(id)sender;
- (IBAction)showAlertPlusActionSheet:(id)sender;
- (IBAction)showActionSheetPlusAlert:(id)sender;
- (IBAction)goNuts:(id)sender;
- (IBAction)whatsArrived:(id)sender;
- (IBAction)arrivedBlog:(id)sender;
- (IBAction)showTextPrompt:(id)sender;


@end

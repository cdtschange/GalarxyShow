//
//  ZAActivityBarViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@interface ZAActivityBarViewController : ControlBaseViewController<UITextFieldDelegate> {
    __weak IBOutlet UITextField *_textbox;
    
    __weak IBOutlet UILabel *_actionLabel1;
    __weak IBOutlet UILabel *_actionLabel2;
    __weak IBOutlet UILabel *_actionLabel3;
}

// Action Methods
- (IBAction) show:(id)sender;
- (IBAction) showSuccess:(id)sender;
- (IBAction) showError:(id)sender;
- (IBAction) dismiss:(id)sender;
- (IBAction) dismissAll:(id)sender;


@end

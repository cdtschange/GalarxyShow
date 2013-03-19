//
//  YIPopupTextViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/4/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"
#import <GalarxyUIKitLib/YIPopupTextView.h>

@interface YIPopupTextViewController : ControlBaseViewController<YIPopupTextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIButton *editButton;

- (IBAction)handleEditButton:(id)sender;

@end

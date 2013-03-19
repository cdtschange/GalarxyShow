//
//  SQRiskCursorViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/11/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class SQRiskCursor;

@interface SQRiskCursorViewController : ControlBaseViewController{
	IBOutlet UILabel *label;
	IBOutlet SQRiskCursor *cursor1;
	IBOutlet SQRiskCursor *cursor2;
	IBOutlet SQRiskCursor *cursor3;
}

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) SQRiskCursor *cursor1;
@property (nonatomic, strong) SQRiskCursor *cursor2;
@property (nonatomic, strong) SQRiskCursor *cursor3;

- (IBAction)increment:(id)sender;
- (IBAction)decrement:(id)sender;

- (IBAction)valueChanged:(id)sender;

@end

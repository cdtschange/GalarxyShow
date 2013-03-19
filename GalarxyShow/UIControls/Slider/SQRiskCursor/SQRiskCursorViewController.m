//
//  SQRiskCursorViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/11/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "SQRiskCursorViewController.h"
#import <GalarxyUIKitLib/SQRiskCursor.h>

@interface SQRiskCursorViewController ()

@end

@implementation SQRiskCursorViewController
@synthesize cursor1;
@synthesize cursor2;
@synthesize cursor3;

@synthesize label;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
	cursor2.maxValue = 5;
	cursor3.maxValue = 30;
    
	cursor2.transform = CGAffineTransformMakeRotation(M_PI/3);
    
	cursor3.transform = CGAffineTransformMakeRotation(M_PI/2);
}

- (IBAction)increment:(id)sender {
	cursor1.value = cursor1.value + 1;
}

- (IBAction)decrement:(id)sender {
	cursor1.value = cursor1.value == 0 ? 0 : cursor1.value - 1;
}

- (IBAction)valueChanged:(id)sender {
	label.text = [NSString stringWithFormat:@"%d", cursor1.value];
}
- (void)dealloc {
	self.label =nil;
	self.cursor1 =nil;
	self.cursor2 =nil;
	self.cursor3 =nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

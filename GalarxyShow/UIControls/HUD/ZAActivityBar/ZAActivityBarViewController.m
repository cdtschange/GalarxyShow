//
//  ZAActivityBarViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "ZAActivityBarViewController.h"
#import <GalarxyUIKitLib/ZAActivityBar.h>

@interface ZAActivityBarViewController ()

@end

@implementation ZAActivityBarViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Action Methods

- (NSString *) actionForSender:(id)sender show:(BOOL)show {
    
    // Get the action
    UIButton *button = (UIButton *)sender;
    NSString *action = [NSString stringWithFormat:@"Action%i",button.tag];
    
    // Set the title
    UILabel *label = nil;
    if (button.tag == 1) label = _actionLabel1;
    if (button.tag == 2) label = _actionLabel2;
    if (button.tag == 3) label = _actionLabel3;
    
    NSString *buttonText = nil;
    if (show) {
        buttonText = [NSString stringWithFormat:@"%@: %@", action, _textbox.text];
    } else {
        buttonText = [NSString stringWithFormat:@"%@: -- dismissed --", action];
    }
    
    [label setText:buttonText];
    
    return action;
}

- (IBAction) show:(id)sender {
    [self dismissTextField];
    NSString *action = [self actionForSender:sender show:YES];
    [ZAActivityBar showWithStatus:_textbox.text forAction:action];
}

- (IBAction) showSuccess:(id)sender {
    [self dismissTextField];
    NSString *action = [self actionForSender:sender show:NO];
    [ZAActivityBar showSuccessWithStatus:_textbox.text forAction:action];
}

- (IBAction) showError:(id)sender {
    [self dismissTextField];
    NSString *action = [self actionForSender:sender show:NO];
    [ZAActivityBar showErrorWithStatus:_textbox.text forAction:action];
}

- (IBAction) dismiss:(id)sender {
    [self dismissTextField];
    NSString *action = [self actionForSender:sender show:NO];
    [ZAActivityBar dismissForAction:action];
}

- (IBAction) dismissAll:(id)sender {
    [self dismissTextField];
    
    [_actionLabel1 setText:@"Action1: -- dismissed --"];
    [_actionLabel2 setText:@"Action2: -- dismissed --"];
    [_actionLabel3 setText:@"Action3: -- dismissed --"];
    
    [ZAActivityBar dismiss];
}

///////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark TextField Methods

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self dismissTextField];
    return YES;
}

- (void) dismissTextField {
    if ([_textbox isFirstResponder]) {
        [_textbox resignFirstResponder];
    }
}
@end

//
//  DDLoginAlertPromptViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/3/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "DDLoginAlertPromptViewController.h"
#import <GalarxyUIKitLib/DDLoginAlertPrompt.h>

@interface DDLoginAlertPromptViewController ()

@end

@implementation DDLoginAlertPromptViewController

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

- (IBAction)alertAction {
	DDLoginAlertPrompt *loginPrompt = [[DDLoginAlertPrompt alloc] initWithTitle:@"Sign in to Service" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitle:@"Sign In"];
	[loginPrompt show];
}

- (void)didPresentAlertView:(UIAlertView *)alertView {
	if ([alertView isKindOfClass:[DDLoginAlertPrompt class]]) {
		DDLoginAlertPrompt *loginPrompt = (DDLoginAlertPrompt *)alertView;
		[loginPrompt.plainTextField becomeFirstResponder];
		[loginPrompt setNeedsLayout];
	}
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
	if (buttonIndex == [alertView cancelButtonIndex]) {
	} else {
		if ([alertView isKindOfClass:[DDLoginAlertPrompt class]]) {
			DDLoginAlertPrompt *loginPrompt = (DDLoginAlertPrompt *)alertView;
			NSLog(@"textField: %@", loginPrompt.plainTextField.text);
			NSLog(@"secretTextField: %@", loginPrompt.secretTextField.text);
		}
	}
}
@end

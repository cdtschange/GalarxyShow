//
//  AHAlertViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "AHAlertViewController.h"
#import <GalarxyUIKitLib/AHAlertView.h>

#define UIViewAutoresizingFlexibleMargins 45

@interface AHAlertViewController ()

@end

@implementation AHAlertViewController

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
    self.view.backgroundColor = [UIColor grayColor];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setBackgroundImage:[[UIImage imageNamed:@"ahalert_custom-cancel-normal"] stretchableImageWithLeftCapWidth:8 topCapHeight:0]
					  forState:UIControlStateNormal];
	button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
	button.frame = CGRectMake(85, 125, 143, 44);
	button.autoresizingMask = UIViewAutoresizingFlexibleMargins;
	[button setTitle:@"Show Alert View" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	
	UILabel *switchLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 225, 120, 16)];
	switchLabel.text = @"Custom Styles";
	switchLabel.font = [UIFont boldSystemFontOfSize:15];
	switchLabel.backgroundColor = [UIColor clearColor];
	[self.view addSubview:switchLabel];
	
	UISwitch *appearanceSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(175, 217, 0, 0)];
	[appearanceSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:appearanceSwitch];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonWasPressed:(id)sender {
	NSString *title = @"Alert View Title";
	NSString *message = @"Here is a message informing you of something that happened. Do you want to do something about it?";
    
	AHAlertView *alert = [[AHAlertView alloc] initWithTitle:title message:message];
	[alert setCancelButtonTitle:@"Cancel" block:^{
		alert.dismissalStyle = AHAlertViewDismissalStyleTumble;
	}];
	[alert addButtonWithTitle:@"OK" block:nil];
	[alert show];
}

- (void)switchValueChanged:(UISwitch *)sender
{
	if(sender.isOn)
		[self applyCustomAlertAppearance];
	else
		[AHAlertView applySystemAlertAppearance];
}

- (void)applyCustomAlertAppearance
{
	[[AHAlertView appearance] setContentInsets:UIEdgeInsetsMake(12, 18, 12, 18)];
	
	[[AHAlertView appearance] setBackgroundImage:[UIImage imageNamed:@"ahalert_custom-dialog-background"]];
	
	UIEdgeInsets buttonEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 8);
	[[AHAlertView appearance] setCancelButtonBackgroundImage:[[UIImage imageNamed:@"ahalert_custom-cancel-normal"] resizableImageWithCapInsets:buttonEdgeInsets]
													forState:UIControlStateNormal];
	[[AHAlertView appearance] setButtonBackgroundImage:[[UIImage imageNamed:@"ahalert_custom-button-normal"] resizableImageWithCapInsets:buttonEdgeInsets]
											  forState:UIControlStateNormal];
	
	[[AHAlertView appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
													  [UIFont boldSystemFontOfSize:18], UITextAttributeFont,
													  [UIColor whiteColor], UITextAttributeTextColor,
													  [UIColor blackColor], UITextAttributeTextShadowColor,
													  [NSValue valueWithCGSize:CGSizeMake(0, -1)], UITextAttributeTextShadowOffset,
													  nil]];
	
	[[AHAlertView appearance] setMessageTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
														[UIFont systemFontOfSize:14], UITextAttributeFont,
														[UIColor colorWithWhite:0.8 alpha:1.0], UITextAttributeTextColor,
														[UIColor blackColor], UITextAttributeTextShadowColor,
														[NSValue valueWithCGSize:CGSizeMake(0, -1)], UITextAttributeTextShadowOffset,
														nil]];
	
	[[AHAlertView appearance] setButtonTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
															[UIFont boldSystemFontOfSize:14], UITextAttributeFont,
															[UIColor whiteColor], UITextAttributeTextColor,
															[UIColor blackColor], UITextAttributeTextShadowColor,
															[NSValue valueWithCGSize:CGSizeMake(0, -1)], UITextAttributeTextShadowOffset,
															nil]];
}
@end

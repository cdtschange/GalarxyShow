//
//  CustomAlertViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "CustomAlertViewController.h"
#import <GalarxyUIKitLib/CustomAlertView.h>

@interface CustomAlertViewController ()

@end

@implementation CustomAlertViewController

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

- (IBAction)showInfo:(id)sender
{
    
    CustomAlertView *alert = [[CustomAlertView alloc] initWithTitle:@"hhhh" message:@"hhhhh" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewBackground = [UIImage imageNamed:@"customalert-window.png"];
    alert.alertViewButtonCancel = [UIImage imageNamed:[NSString stringWithFormat:@"customalert-%@-button.png", @"gray"]];
    alert.alertViewButtonOK = [UIImage imageNamed:[NSString stringWithFormat:@"customalert-%@-button.png", @"black"]];

    [alert show];
}
@end

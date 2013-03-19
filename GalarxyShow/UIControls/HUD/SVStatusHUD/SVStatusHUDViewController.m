//
//  SVStatusHUDViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/11/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "SVStatusHUDViewController.h"
#import <GalarxyUIKitLib/SVStatusHUD.h>

@interface SVStatusHUDViewController ()

@end

@implementation SVStatusHUDViewController

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
#pragma mark Show Methods Sample

- (void)showWithImage {
	[SVStatusHUD showWithImage:[UIImage imageNamed:@"svstatushud_sync"]];
}

- (void)showWithImageStatus {
	[SVStatusHUD showWithImage:[UIImage imageNamed:@"svstatushud_wifi"] status:@"Connected"];
}

@end

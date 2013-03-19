//
//  CQMFloatingViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/7/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "CQMFloatingViewController.h"
#import "CQMFloatingDemoTableViewController.h"
#import <GalarxyUIKitLib/CQMFloatingController.h>

@interface CQMFloatingViewController ()

@end

@implementation CQMFloatingViewController

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

- (IBAction)show:(id)sender {
    CQMFloatingDemoTableViewController *demoViewController = [[CQMFloatingDemoTableViewController alloc] init];
	
	// 2. Get shared floating controller
	CQMFloatingController *floatingController = [CQMFloatingController sharedFloatingController];
	
	// 3. Show floating controller with specified content
	[floatingController presentWithContentViewController:demoViewController animated:YES];
}
@end

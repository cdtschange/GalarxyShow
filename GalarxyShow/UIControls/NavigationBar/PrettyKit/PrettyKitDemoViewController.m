//
//  PrettyKitDemoViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/30/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "PrettyKitDemoViewController.h"
#import "PrettyKitExampleViewController.h"
#import "PrettyKitPlainExample.h"
#import "PrettyKitModalViewController.h"

@interface PrettyKitDemoViewController ()

@end

@implementation PrettyKitDemoViewController

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

- (IBAction)goToBtn1:(id)sender {
    PrettyKitExampleViewController *vc = [[PrettyKitExampleViewController alloc] initWithNibName:@"PrettyKitExampleViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)goToBtn2:(id)sender {
    PrettyKitPlainExample *vc = [[PrettyKitPlainExample alloc] initWithNibName:@"PrettyKitPlainExample" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)goToBtn3:(id)sender {
    PrettyKitModalViewController *vc = [[PrettyKitModalViewController alloc] initWithNibName:@"PrettyKitModalViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
@end

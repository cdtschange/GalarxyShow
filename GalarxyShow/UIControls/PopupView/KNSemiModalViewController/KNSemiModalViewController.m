//
//  KNSemiModalViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/4/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "KNSemiModalViewController.h"
#import "KNSemiDemoViewController.h"
#import <GalarxyUIKitLib/UIViewController+KNSemiModal.h>

@interface KNSemiModalViewController ()

@end

@implementation KNSemiModalViewController

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

- (IBAction)buttonDidTouch:(id)sender {
    
    // You can also present a UIViewController with complex views in it
    // and optionally containing an explicit dismiss button for semi modal
    KNSemiDemoViewController * vc = [[KNSemiDemoViewController alloc] initWithNibName:@"KNSemiDemoViewController" bundle:nil];
    [self presentSemiViewController:vc];
    
}
@end

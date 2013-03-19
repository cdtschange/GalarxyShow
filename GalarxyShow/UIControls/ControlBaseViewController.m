//
//  ControlBaseViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/13/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "ControlBaseViewController.h"

@interface ControlBaseViewController ()

@end

@implementation ControlBaseViewController

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
    self.navigationItem.leftBarButtonItem = [UIManager createCloseBarButtonItem:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (void)goBack:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end

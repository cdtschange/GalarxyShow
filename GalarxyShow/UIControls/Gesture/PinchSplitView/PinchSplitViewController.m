//
//  PinchSplitViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/10/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "PinchSplitViewController.h"
#import <GalarxyUIKitLib/PinchSplitView.h>

@interface PinchSplitViewController ()

@end

@implementation PinchSplitViewController

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
    
    PinchSplitView *view = [[PinchSplitView alloc] initWithFrame:CGRectMake(332, (768-44-20-480)/2, 360, 480) withImageView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pinchSplitView_demo.jpg"]]];
    [self.view addSubview:view];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

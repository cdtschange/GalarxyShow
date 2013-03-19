//
//  TouchCloudLabelViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/21/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "TouchCloudLabelViewController.h"

@interface TouchCloudLabelViewController ()

@end

@implementation TouchCloudLabelViewController

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
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"touchcloudbg.png"];
    [self.view addSubview:imageView];
    
    TouchCloudView *cloud = [[TouchCloudView alloc] initWithFrame:self.view.bounds
                                           andNodeCount:50];
    
    cloud.delegate = self;
    [self.view addSubview:cloud];
}

- (void)didSelectedNodeButton:(TouchCloudButton *)button
{
    NSLog(@"---%d",button.tag);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

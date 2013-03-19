//
//  DAReloadActivityViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/8/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "DAReloadActivityViewController.h"
#import <GalarxyUIKitLib/DAReloadActivityButton.h>

@interface DAReloadActivityViewController ()

@end

@implementation DAReloadActivityViewController
@synthesize navigationBarItem;
@synthesize viewButton;

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
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    navigationBarItem = [[DAReloadActivityButton alloc] init];
    navigationBarItem.showsTouchWhenHighlighted = NO;
    [navigationBarItem addTarget:self action:@selector(animate:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navigationBarItem];
    viewButton = [[DAReloadActivityButton alloc] init];
    [viewButton addTarget:self action:@selector(animate:) forControlEvents:UIControlEventTouchUpInside];
    viewButton.center = CGPointMake(160, 176);
    viewButton.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
                                   UIViewAutoresizingFlexibleBottomMargin |
                                   UIViewAutoresizingFlexibleLeftMargin |
                                   UIViewAutoresizingFlexibleRightMargin);
    [self.view addSubview:viewButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animate:(DAReloadActivityButton *)button
{
    if(button == navigationBarItem)
    {
        [button spin];
    }
    else
    {
        if ([button isAnimating])
        {
            [button stopAnimating];
        }
        else
        {
            [button startAnimating];
        }
    }
}


- (void)viewDidUnload {
    [super viewDidUnload];
}
@end

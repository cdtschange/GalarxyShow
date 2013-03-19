//
//  KDProgressBarViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "KDProgressBarViewController.h"
#import <GalarxyUIKitLib/KDGoalBar.h>

@interface KDProgressBarViewController ()

@end

@implementation KDProgressBarViewController
@synthesize firstGoalBar, secondGoalBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc{
    
    [self setSecondGoalBar:nil];
    [self setFirstGoalBar:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
	[firstGoalBar setAllowDragging:YES];
    [firstGoalBar setAllowSwitching:NO];
    [firstGoalBar setPercent:68 animated:NO];
    
    [secondGoalBar setThumbEnabled:YES];
    [secondGoalBar setAllowSwitching:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

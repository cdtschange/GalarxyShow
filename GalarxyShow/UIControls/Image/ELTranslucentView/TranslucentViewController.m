//
//  TranslucentViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/14/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "TranslucentViewController.h"
#import <GalarxyUIKitLib/ELTranslucentView.h>

@interface TranslucentViewController ()

@end

@implementation TranslucentViewController

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
    
    ELTranslucentView *translucentView = [[ELTranslucentView alloc] initWithFrame: CGRectMake(0, 50, 1024, 629)];
    translucentView.backgroundImage = [UIImage imageNamed: @"eltranslucent_car1"];
    translucentView.translucentImage = [UIImage imageNamed: @"eltranslucent_car2"];
    translucentView.boundsImage = [UIImage imageNamed: @"eltranslucent_bounds.png"];
    
	translucentView.moveMinY = 80;
    [self.view addSubview: translucentView];
	
    
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(60, 35, 800, 50)];
	//label = [[UILabel alloc] initWithFrame:CGRectMake(60, 640, 800, 50)];
	label.text = @"透  视  图  模  块";
	label.alpha = 0.6;
	label.font = [UIFont boldSystemFontOfSize: 46]; //[UIFont fontWithName:@"TrebuchetMS" size:30];
	label.backgroundColor = [UIColor clearColor];
	[self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ImageReflectionViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/11/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "ImageReflectionViewController.h"
#import <GalarxyUIKitLib/UIImage+Reflection.h>

@interface ImageReflectionViewController ()


@end

@implementation ImageReflectionViewController

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
    
	[refView setImage:[[monkeyView image] reflectionWithAlpha:0.5]];
	[topRef setImage:[[monkeyView image] reflectionRotatedWithAlpha:0.1]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

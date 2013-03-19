//
//  MagnifyingGlassViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/12/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "MagnifyingGlassViewController.h"
#import <GalarxyUIKitLib/ACMagnifyingGlass.h>
#import <GalarxyUIKitLib/ACLoupe.h>
#import <GalarxyUIKitLib/ACMagnifyingView.h>

@interface MagnifyingGlassViewController ()

@end

@implementation MagnifyingGlassViewController

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
    
	ACLoupe *loupe = [[ACLoupe alloc] init];
	self.magnifyingView.magnifyingGlass = loupe;
	loupe.scaleAtTouchPoint = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

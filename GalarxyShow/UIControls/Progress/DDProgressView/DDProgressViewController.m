//
//  DDProgressViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "DDProgressViewController.h"
#import <GalarxyUIKitLib/DDProgressView.h>

@interface DDProgressViewController ()

@end

@implementation DDProgressViewController

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
    testProgress = 0.0f ;
    progressDir = 1 ;
    
    [super viewDidLoad] ;
    
	[self.view setBackgroundColor: [UIColor blackColor]] ;
	
	progressView = [[DDProgressView alloc] initWithFrame: CGRectMake(20.0f, 140.0f, self.view.bounds.size.width-40.0f, 0.0f)] ;
	[progressView setOuterColor: [UIColor grayColor]] ;
	[progressView setInnerColor: [UIColor lightGrayColor]] ;
	[self.view addSubview: progressView] ;
    
    progressView2 = [[DDProgressView alloc] initWithFrame: CGRectMake(20.0f, 180.0f, self.view.bounds.size.width-40.0f, 0.0f)] ;
    [progressView2 setOuterColor: [UIColor clearColor]] ;
    [progressView2 setInnerColor: [UIColor lightGrayColor]] ;
    [progressView2 setEmptyColor: [UIColor darkGrayColor]] ;
    [self.view addSubview: progressView2] ;
	
	// set a timer that updates the progress
	NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval: 0.03f target: self selector: @selector(updateProgress) userInfo: nil repeats: YES] ;
	[timer fire] ;
}

- (void)updateProgress
{
	testProgress += (0.01f * progressDir) ;
	[progressView setProgress: testProgress] ;
    [progressView2 setProgress: testProgress] ;
    
    if (testProgress > 1 || testProgress < 0)
        progressDir *= -1 ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

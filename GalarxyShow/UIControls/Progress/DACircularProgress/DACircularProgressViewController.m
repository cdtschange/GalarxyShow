//
//  DACircularProgressViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "DACircularProgressViewController.h"
#import <GalarxyUIKitLib/DACircularProgressView.h>

@interface DACircularProgressViewController ()

@end

@implementation DACircularProgressViewController
@synthesize progressView;
@synthesize largeProgressView;
@synthesize largestProgressView;

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
    
    
    progressView = [[DACircularProgressView alloc] initWithFrame:CGRectMake(140.0f, 20.0f, 40.0f, 40.0f)];
    [self.view addSubview:progressView];
    
    largeProgressView = [[DACircularProgressView alloc] initWithFrame:CGRectMake(110.0f, 80.0f, 100.0f, 100.0f)];
    [self.view addSubview:largeProgressView];
    
    largestProgressView = [[DACircularProgressView alloc] initWithFrame:CGRectMake(60.0f, 200.0f, 200.0f, 200.0f)];
    [self.view addSubview:largestProgressView];
    
    [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(progressChange) userInfo:nil repeats:YES];
}

- (void)progressChange
{
    progressView.progress += 0.01;
    largeProgressView.progress += 0.01;
    largestProgressView.progress += 0.01;
    
    if (progressView.progress > 1.0f)
    {
        progressView.progress = 0.0f;
    }
    
    if (largeProgressView.progress > 1.0f)
    {
        largeProgressView.progress = 0.0f;
    }
    
    if (largestProgressView.progress > 1.0f)
    {
        largestProgressView.progress = 0.0f;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

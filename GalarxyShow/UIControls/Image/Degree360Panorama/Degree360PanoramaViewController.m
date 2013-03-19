//
//  Degree360PanoramaViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "Degree360PanoramaViewController.h"
#import <GalarxyUIKitLib/CDVViewController.h>

@interface Degree360PanoramaViewController ()

@end

@implementation Degree360PanoramaViewController

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
    [self showWebView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)showWebView
{
    CDVViewController *cdvViewController = [CDVViewController new];
    cdvViewController.wwwFolderName = @"www";
    cdvViewController.startPage = @"index.html";
    //cdvViewController.useSplashScreen = YES;
    cdvViewController.view.frame = self.view.frame;
    [self.view addSubview:cdvViewController.view];
}

@end

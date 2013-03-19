//
//  BWStatusBarOverlayViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/14/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "BWStatusBarOverlayViewController.h"
#import <GalarxyUIKitLib/BWStatusBarOverlay.h>
#include <stdlib.h>

@interface BWStatusBarOverlayViewController ()

@end

@implementation BWStatusBarOverlayViewController

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
    
    [BWStatusBarOverlay setActionBlock:^{
        NSLog(@"you pressed me");
    }];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return UIInterfaceOrientationIsPortrait(toInterfaceOrientation);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)goBack:(id)sender {
    [BWStatusBarOverlay dismissAnimated:YES];
    [self dismissModalViewControllerAnimated:YES];
}
////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)randomMessage {
    int r = rand() % 74;
    return @"Download files 1 of 2";
    return [NSString stringWithFormat:@"Random number %d", r];
}
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Actions


////////////////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)didPressChangeStatusBarStyle:(id)sender {
    UIStatusBarStyle statusBarStyle = [UIApplication sharedApplication].statusBarStyle;
    
    if (UIStatusBarStyleDefault == statusBarStyle) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
        [BWStatusBarOverlay setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        [BWStatusBarOverlay setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)didPressChangeProgression:(id)sender {
    [BWStatusBarOverlay setProgress:0.7 animated:YES];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)didPressShowSimple:(id)sender {
    [BWStatusBarOverlay showWithMessage:[self randomMessage] loading:YES animated:NO];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)didPressShowWithFade:(id)sender {
    [BWStatusBarOverlay setAnimation:BWStatusBarOverlayAnimationTypeFade];
    [BWStatusBarOverlay showWithMessage:[self randomMessage] loading:YES animated:YES];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)didPressShowWithFromTop:(id)sender {
    [BWStatusBarOverlay setAnimation:BWStatusBarOverlayAnimationTypeFromTop];
    [BWStatusBarOverlay showWithMessage:[self randomMessage] loading:YES animated:YES];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)didPressHideSimple:(id)sender {
    [BWStatusBarOverlay dismissAnimated:YES];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)didPressChangeAnimatedText:(id)sender {
    [BWStatusBarOverlay setMessage:[self randomMessage] animated:YES];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)didPressShowSuccess:(id)sender {
    [BWStatusBarOverlay showSuccessWithMessage:@"Success" duration:2 animated:YES];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)didPressShowError:(id)sender {
    [BWStatusBarOverlay showErrorWithMessage:@"Error" duration:2 animated:YES];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)didPressChangeText:(id)sender {
    [BWStatusBarOverlay setMessage:[self randomMessage] animated:NO];
}
@end

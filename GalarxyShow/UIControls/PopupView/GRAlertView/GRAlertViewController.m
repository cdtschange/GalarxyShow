//
//  GRAlertViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "GRAlertViewController.h"
#import <GalarxyUIKitLib/GRAlertView.h>

@interface GRAlertViewController ()

@end

@implementation GRAlertViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(UIButton *)button {
    GRAlertView *alert;
    
    if ([button.titleLabel.text isEqualToString: @"Alert"]) {
        
        ////// Alert
        alert = [[GRAlertView alloc] initWithTitle:@"Alert"
                                           message:@"Be careful!"
                                          delegate:self
                                 cancelButtonTitle:nil
                                 otherButtonTitles:@"OK", nil];
        alert.style = GRAlertStyleAlert;
        [alert setImage:@"gralert_alert.png"];
    }
    
    if ([button.titleLabel.text isEqualToString: @"Success"]) {
        
        ////// Success
        alert = [[GRAlertView alloc] initWithTitle:@"Success"
                                           message:@"Download completed!"
                                          delegate:self
                                 cancelButtonTitle:nil
                                 otherButtonTitles:@"OK", nil];
        alert.style = GRAlertStyleSuccess;
        [alert setImage:@"gralert_accept.png"];
    }
    
    if ([button.titleLabel.text isEqualToString: @"Info"]) {
        
        ////// Info
        alert = [[GRAlertView alloc] initWithTitle:@"Info"
                                           message:@"Info message without buttons\nAuto hide: 3sec"
                                          delegate:self
                                 cancelButtonTitle:nil
                                 otherButtonTitles:nil];
        alert.style = GRAlertStyleInfo;
        [alert setImage:@"gralert_info.png"];
        
        [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(closeAlert:) userInfo:alert repeats:NO];
    }
    
    if ([button.titleLabel.text isEqualToString: @"Question"]) {
        
        ////// Question
        alert = [[GRAlertView alloc] initWithTitle:@"Question"
                                           message:@"Question message\nAre you sure to delete this item?"
                                          delegate:self
                                 cancelButtonTitle:@"Cancel"
                                 otherButtonTitles:@"OK", nil];
        alert.style = GRAlertStyleInfo;
        //        [alert setImage:@"gralert_help.png"];
    }
    
    if ([button.titleLabel.text isEqualToString: @"Warning"]) {
        
        ////// Warning
        alert = [[GRAlertView alloc] initWithTitle:@"Warning"
                                           message:@"Warning message"
                                          delegate:self
                                 cancelButtonTitle:nil
                                 otherButtonTitles:@"OK", nil];
        alert.style = GRAlertStyleWarning;
        [alert setImage:@"gralert_alert.png"];
    }
    
    if ([button.titleLabel.text isEqualToString:@"Custom"]) {
        
        ////// Custom
        alert = [[GRAlertView alloc] initWithTitle:@"Custom Alert"
                                           message:@"Merry Christmas!"
                                          delegate:self
                                 cancelButtonTitle:nil
                                 otherButtonTitles:@"Close", nil];
        
        [alert setTopColor:[UIColor colorWithRed:0.7 green:0 blue:0 alpha:1]
               middleColor:[UIColor colorWithRed:0.5 green:0 blue:0 alpha:1]
               bottomColor:[UIColor colorWithRed:0.4 green:0 blue:0 alpha:1]
                 lineColor:[UIColor colorWithRed:0.7 green:0 blue:0 alpha:1]];
        
        [alert setFontName:@"Cochin-BoldItalic"
                 fontColor:[UIColor greenColor]
           fontShadowColor:[UIColor colorWithRed:0.8 green:0 blue:0 alpha:1]];
        
        [alert setImage:@"gralert_santa.png"];
    }
    
    alert.animation = [_animationSelector selectedSegmentIndex];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"Button pushed: %@, index %i", alertView.title, buttonIndex);
}

- (void)closeAlert:(NSTimer*)timer {
    [(UIAlertView*) timer.userInfo  dismissWithClickedButtonIndex:0 animated:YES];
}


@end

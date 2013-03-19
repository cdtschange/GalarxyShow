//
//  RRSGlowLabelViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/20/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "RRSGlowLabelViewController.h"
#import <GalarxyUIKitLib/RRSGlowLabel.h>
#import <QuartzCore/CALayer.h>
#import <QuartzCore/QuartzCore.h>

@interface RRSGlowLabelViewController ()

@end

@implementation RRSGlowLabelViewController

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
    
    //Create a couple of colours for the background gradient
    UIColor *colorOne = [UIColor colorWithRed:0.0 green:0.125 blue:0.18 alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:0.0 green:0.00 blue:0.05 alpha:1.0];
    
    //Create the gradient and add it to our view's root layer
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.frame = CGRectMake(0.0, 0.0, 1024.0, 768.0);
    [gradientLayer setColors:[NSArray arrayWithObjects:(id)colorOne.CGColor, (id)colorTwo.CGColor, nil]];
    [self.view.layer insertSublayer:gradientLayer atIndex:0];
    
    //Set the label properties and glow params
    self.label.textColor = [UIColor colorWithRed:0.20 green:0.70 blue:1.0 alpha:1.0];
    self.label.glowColor = self.label.textColor;
    self.label.glowOffset = CGSizeMake(0.0, 0.0);
    self.label.glowAmount = 30.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)adjustGlowAmount:(id)sender {
    self.label.glowAmount = self.glowSlider.value;
    [self.label setNeedsDisplay];
}

- (void)dealloc {
    self.glowSlider = nil;
    self.label = nil;
}
@end

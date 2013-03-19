//
//  F3BarGaugeViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/13/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "F3BarGaugeViewController.h"
#import <GalarxyUIKitLib/F3BarGauge.h>

@interface F3BarGaugeViewController ()

@end

@implementation F3BarGaugeViewController
@synthesize horizontalBar;
@synthesize reversedBar;
@synthesize verticalBar;
@synthesize lcdBar;
@synthesize peakHoldBar;
@synthesize customThresholdBar;
@synthesize customRangeBar;
@synthesize valueSlider;
@synthesize valueLabel;

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
    
    
    reversedBar.reverse = YES;
    
    customThresholdBar.numBars = 15;
    customThresholdBar.warnThreshold = 0.45;
    customThresholdBar.dangerThreshold = 0.90;
    customThresholdBar.normalBarColor = [UIColor blueColor];
    customThresholdBar.warningBarColor = [UIColor cyanColor];
    customThresholdBar.dangerBarColor = [UIColor magentaColor];
    customThresholdBar.outerBorderColor = [UIColor clearColor];
    customThresholdBar.innerBorderColor = [UIColor clearColor];
    
    customRangeBar.numBars = 20;
    customRangeBar.minLimit = 0.40;
    customRangeBar.maxLimit = 0.60;
    
    peakHoldBar.numBars = 10;
    peakHoldBar.holdPeak = YES;
    
    lcdBar.numBars = 20;
    lcdBar.litEffect = NO;
    UIColor *clrBar = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
    lcdBar.normalBarColor = clrBar;
    lcdBar.warningBarColor = clrBar;
    lcdBar.dangerBarColor = clrBar;
    lcdBar.backgroundColor = [UIColor clearColor];
    lcdBar.outerBorderColor = [UIColor clearColor];
    lcdBar.innerBorderColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
    
    [self setCustomThresholdBar:nil];
    [self setCustomRangeBar:nil];
    [self setValueLabel:nil];
    [self setReversedBar:nil];
    [self setHorizontalBar:nil];
    [self setVerticalBar:nil];
    [self setValueSlider:nil];
    [self setLcdBar:nil];
    [self setPeakHoldBar:nil];
}

- (IBAction)didChangeValue:(id)sender {
    // Update the text label
    valueLabel.text = [NSString stringWithFormat:@"%0.02f", valueSlider.value];
    
    // Update the bar gauges
    horizontalBar.value = valueSlider.value;
    reversedBar.value = valueSlider.value;
    lcdBar.value = valueSlider.value;
    verticalBar.value = valueSlider.value;
    peakHoldBar.value = valueSlider.value;
    customThresholdBar.value = valueSlider.value;
    customRangeBar.value = valueSlider.value;
    
}

- (IBAction)didReset:(id)sender {
    [peakHoldBar resetPeak];
}
@end

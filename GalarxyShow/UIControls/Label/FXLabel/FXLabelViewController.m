//
//  FXLabelViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/20/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "FXLabelViewController.h"
#import <GalarxyUIKitLib/FXLabel.h>

@interface FXLabelViewController ()

@end

@implementation FXLabelViewController

@synthesize label1;
@synthesize label2;
@synthesize label3;
@synthesize label4;
@synthesize label5;


@synthesize labelOversampling;
@synthesize oversamplingLabel;
@synthesize oversamplingSlider;
@synthesize fontSizeLabel;
@synthesize fontSizeSlider;


@synthesize labelShadow1;
@synthesize labelShadow2;

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
    label1.shadowColor = nil;
    label1.shadowOffset = CGSizeMake(0.0f, 2.0f);
    label1.shadowColor = [UIColor colorWithWhite:0.0f alpha:0.75f];
    label1.shadowBlur = 5.0f;
    
    //demonstrate inner shadow
    label2.shadowColor = [UIColor colorWithWhite:1.0f alpha:0.8f];
    label2.shadowOffset = CGSizeMake(1.0f, 2.0f);
    label2.shadowBlur = 1.0f;
    label2.innerShadowColor = [UIColor colorWithWhite:0.0f alpha:0.8f];
    label2.innerShadowOffset = CGSizeMake(1.0f, 2.0f);
    
    //demonstrate gradient fill
    label3.gradientStartColor = [UIColor redColor];
    label3.gradientEndColor = [UIColor blackColor];
    
    //demonstrate multi-part gradient
    label4.gradientStartPoint = CGPointMake(0.0f, 0.0f);
    label4.gradientEndPoint = CGPointMake(1.0f, 1.0f);
    label4.gradientColors = [NSArray arrayWithObjects:
                             [UIColor redColor],
                             [UIColor yellowColor],
                             [UIColor greenColor],
                             [UIColor cyanColor],
                             [UIColor blueColor],
                             [UIColor purpleColor],
                             [UIColor redColor],
                             nil];
    
    //everything
    label5.shadowColor = [UIColor blackColor];
    label5.shadowOffset = CGSizeZero;
    label5.shadowBlur = 20.0f;
    label5.innerShadowColor = [UIColor yellowColor];
    label5.innerShadowOffset = CGSizeMake(1.0f, 2.0f);
    label5.gradientStartColor = [UIColor redColor];
    label5.gradientEndColor = [UIColor yellowColor];
    label5.gradientStartPoint = CGPointMake(0.0f, 0.5f);
    label5.gradientEndPoint = CGPointMake(1.0f, 0.5f);
    label5.oversampling = 2;
    
    labelOversampling.shadowColor = [UIColor colorWithWhite:1.0f alpha:0.2f];
    labelOversampling.shadowOffset = CGSizeMake(0.5f, 1.0f);
    labelOversampling.innerShadowColor = [UIColor blackColor];
    labelOversampling.innerShadowOffset = CGSizeMake(0.5f, 1.0f);
    labelOversampling.oversampling = 1;
    
    //set minimum
    oversamplingSlider.minimumValue = labelOversampling.oversampling;
    
    //update labels
    [self setOversampling:oversamplingSlider];
    [self setFontSize:fontSizeSlider];
    
    labelShadow1.shadowColor = nil;
    labelShadow1.shadowColor = [UIColor blackColor];
    labelShadow1.shadowBlur = 10.0f;
    
    //demonstrate use of insets to prevent cropping
    labelShadow2.shadowColor = nil;
    labelShadow2.shadowColor = [UIColor blackColor];
    labelShadow2.shadowBlur = 10.0f;
    labelShadow2.textInsets = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
}

- (void)viewDidUnload
{
    self.label1 = nil;
    self.label2 = nil;
    self.label3 = nil;
    self.label4 = nil;
    self.label5 = nil;
    self.labelOversampling = nil;
    self.oversamplingLabel = nil;
    self.oversamplingSlider = nil;
    self.fontSizeLabel = nil;
    self.fontSizeSlider = nil;
    self.labelShadow1 = nil;
    self.labelShadow2 = nil;
    [super viewDidUnload];
}

- (void)dealloc
{
    self.label1 = nil;
    self.label2 = nil;
    self.label3 = nil;
    self.label4 = nil;
    self.label5 = nil;
    self.labelOversampling = nil;
    self.oversamplingLabel = nil;
    self.oversamplingSlider = nil;
    self.fontSizeLabel = nil;
    self.fontSizeSlider = nil;
    self.labelShadow1 = nil;
    self.labelShadow2 = nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setOversampling:(UISlider *)slider
{
    slider.value = roundf(slider.value);
    labelOversampling.oversampling = slider.value;
    
    NSString *sampling = [NSString stringWithFormat:@"%ix", (int)slider.value];
    oversamplingLabel.text = [NSString stringWithFormat:@"Oversampling (%@)", (slider.value > slider.minimumValue)? sampling: @"none"];
}

- (IBAction)setFontSize:(UISlider *)slider
{
    slider.value = roundf(slider.value);
    labelOversampling.font = [labelOversampling.font fontWithSize:slider.value];
    
    fontSizeLabel.text = [NSString stringWithFormat:@"Font size (%i)", (int)labelOversampling.font.pointSize];
}


@end

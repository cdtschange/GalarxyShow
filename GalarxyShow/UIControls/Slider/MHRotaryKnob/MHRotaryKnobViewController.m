//
//  MHRotaryKnobViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/11/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "MHRotaryKnobViewController.h"
#import <GalarxyUIKitLib/MHRotaryKnob.h>

@interface MHRotaryKnobViewController ()

@end

@implementation MHRotaryKnobViewController
@synthesize slider, label, rotaryKnob;

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
    
    
	rotaryKnob.interactionStyle = MHRotaryKnobInteractionStyleRotating;
	rotaryKnob.scalingFactor = 1.5f;
	rotaryKnob.maximumValue = slider.maximumValue;
	rotaryKnob.minimumValue = slider.minimumValue;
	rotaryKnob.value = slider.value;
	rotaryKnob.defaultValue = rotaryKnob.value;
	rotaryKnob.resetsToDefault = YES;
	rotaryKnob.backgroundColor = [UIColor clearColor];
	rotaryKnob.backgroundImage = [UIImage imageNamed:@"mhKnob_Background.png"];
	[rotaryKnob setKnobImage:[UIImage imageNamed:@"mhKnob"] forState:UIControlStateNormal];
	[rotaryKnob setKnobImage:[UIImage imageNamed:@"mhKnob_Highlighted.png"] forState:UIControlStateHighlighted];
	[rotaryKnob setKnobImage:[UIImage imageNamed:@"mhKnob_Disabled.png"] forState:UIControlStateDisabled];
	rotaryKnob.knobImageCenter = CGPointMake(80.0f, 76.0f);
	[rotaryKnob addTarget:self action:@selector(rotaryKnobDidChange) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)releaseObjects
{
	self.slider = nil;
	self.label = nil;
	self.rotaryKnob = nil;
}

- (void)dealloc
{
	[self releaseObjects];
}

- (IBAction)sliderDidChange
{
	label.text = [NSString stringWithFormat:@"%.3f", slider.value];
	rotaryKnob.value = slider.value;
}

- (IBAction)rotaryKnobDidChange
{
	label.text = [NSString stringWithFormat:@"%.3f", rotaryKnob.value];
	slider.value = rotaryKnob.value;
}

- (IBAction)toggleEnabled
{
	rotaryKnob.enabled = !rotaryKnob.enabled;
}

- (IBAction)toggleContinuous
{
	slider.continuous = !slider.continuous;
	rotaryKnob.continuous = !rotaryKnob.continuous;
}

- (IBAction)goToMinimum
{
	[slider setValue:slider.minimumValue animated:YES];
	[rotaryKnob setValue:rotaryKnob.minimumValue animated:YES];
}

- (IBAction)goToMaximum
{
	[slider setValue:slider.maximumValue animated:YES];
	[rotaryKnob setValue:rotaryKnob.maximumValue animated:YES];
}

- (IBAction)toggleInteractionStyle:(UIButton *)sender
{
	MHRotaryKnobInteractionStyle style = rotaryKnob.interactionStyle + 1;
    
	if (style > MHRotaryKnobInteractionStyleSliderVertical)
		style = MHRotaryKnobInteractionStyleRotating;
    
	rotaryKnob.interactionStyle = style;
    
	switch (style)
	{
		case MHRotaryKnobInteractionStyleRotating:
			[sender setTitle:@"Style: Rotating" forState:UIControlStateNormal];
			break;
            
		case MHRotaryKnobInteractionStyleSliderHorizontal:
			[sender setTitle:@"Style: Horizontal" forState:UIControlStateNormal];
			break;
            
		case MHRotaryKnobInteractionStyleSliderVertical:
			[sender setTitle:@"Style: Vertical" forState:UIControlStateNormal];
			break;
	}
}
@end

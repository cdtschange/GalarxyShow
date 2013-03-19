//
//  UISoundMixerViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/13/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "UISoundMixerViewController.h"

@interface UISoundMixerViewController ()
- (void)faderSliderInit;
- (void)glowLabelInit;

@end

@implementation UISoundMixerViewController
@synthesize  faderSlider = _faderSlider;
@synthesize glow = _glow;

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
    
    [self faderSliderInit];
    [self glowLabelInit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark FaderSlider init and action listner

- (void)faderSliderInit {
    
    //Init Fader slider UI, set listener method and Transform it to vertical
    [_faderSlider addTarget:self action:@selector(faderSliderAction:) forControlEvents:UIControlEventValueChanged];
    _faderSlider.backgroundColor = [UIColor clearColor];
    UIImage *stetchTrack = [[UIImage imageNamed:@"soundmixer_faderTrack.png"]
                            stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
    [_faderSlider setThumbImage: [UIImage imageNamed:@"soundmixer_faderKey.png"] forState:UIControlStateNormal];
    [_faderSlider setMinimumTrackImage:stetchTrack forState:UIControlStateNormal];
    [_faderSlider setMaximumTrackImage:stetchTrack forState:UIControlStateNormal];
    CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI * -0.5);
    _faderSlider.transform = trans;
    
}

- (void)faderSliderAction:(id)sender
{
    // UISlider *slider = (UISlider *)sender;
    [_glow setText:[NSString stringWithFormat:@"%i", (int)[_faderSlider value]]];
}

#pragma mark -
#pragma mark Glowing label initialize

- (void)glowLabelInit {
    [_glow setText:[NSString stringWithFormat:@"%i", 0]];
    _glow.glowColor = [UIColor colorWithRed:(62.0/255.0) green:(136.0/255.0) blue:(255.0/255.0) alpha:0.75f];
	_glow.glowOffset = CGSizeMake(0.0f, 5.0f);
	_glow.glowRadius = 30.0f;
}
@end

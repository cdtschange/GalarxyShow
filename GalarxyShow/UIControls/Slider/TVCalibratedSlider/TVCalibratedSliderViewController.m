//
//  TVCalibratedSliderViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/14/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "TVCalibratedSliderViewController.h"
#import <GalarxyUIKitLib/TVCalibratedSlider.h>

@interface TVCalibratedSliderViewController ()<TVCalibratedSliderDelegate> {
    TVCalibratedSlider *_programmaticallyCreatedSlider;
}

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet TVCalibratedSlider *scaledSlider;
- (IBAction)btnDecrementRange:(id)sender;
- (IBAction)btnIncrementRange:(id)sender;

@end

@implementation TVCalibratedSliderViewController
@synthesize containerView;
@synthesize scaledSlider;

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
    
    TVCalibratedSliderRange range;
    range.maximumValue = 5;
    range.minimumValue = 1;
    
    [scaledSlider setRange:range];
    [scaledSlider setValue:3];
    [scaledSlider setTextColorForHighlightedState:[UIColor blackColor]];
    [scaledSlider setStyle:TavicsaStyle];
    scaledSlider.tvSliderValueChangedBlock = ^(id sender){
        NSLog(@"The value is %d",[(TVCalibratedSlider *)sender value]);
    };
    
    //    Adding the slider programatically
    
    //    _programmaticallyCreatedSlider = [[TVCalibratedSlider alloc] init];
    //    _programmaticallyCreatedSlider.frame = containerView.frame;
    //    _programmaticallyCreatedSlider.style = TavicsaStyle;
    
    _programmaticallyCreatedSlider = [[TVCalibratedSlider alloc] initWithFrame:containerView.bounds withStyle:TavicsaStyle];
    
    [_programmaticallyCreatedSlider setThumbImage:nil forState:UIControlStateHighlighted];
    TVCalibratedSliderRange range2;
    range2.maximumValue = 8;
    range2.minimumValue = 2;
    [_programmaticallyCreatedSlider setRange:range2];
    [containerView addSubview:_programmaticallyCreatedSlider];
    [_programmaticallyCreatedSlider setTextColorForHighlightedState:[UIColor redColor]];
    [_programmaticallyCreatedSlider setMarkerImageOffsetFromSlider:5];
    [_programmaticallyCreatedSlider setMarkerValueOffsetFromSlider:10];
    [_programmaticallyCreatedSlider setDelegate:self] ;
    
    
    [scaledSlider setMaximumTrackImage:@"tvcalslider_slider_gray.png" withCapInsets:UIEdgeInsetsMake(0, 16, 0, 16) forState:UIControlStateNormal];
    [scaledSlider setMinimumTrackImage:@"tvcalslider_slider_blue.png" withCapInsets:UIEdgeInsetsMake(0, 16, 0, 16) forState:UIControlStateNormal];
    [scaledSlider setThumbImage:@"tvcalslider_slider_normal" forState:UIControlStateNormal withOffsetRelativeToCenterOfTrack:CGPointMake(0, 0)];
    [scaledSlider setThumbImage:@"tvcalslider_slider_hover" forState:UIControlStateHighlighted withOffsetRelativeToCenterOfTrack:CGPointMake(0, -15)];
    
    [_programmaticallyCreatedSlider setMaximumTrackImage:@"tvcalslider_slider_gray.png" withCapInsets:UIEdgeInsetsMake(0, 16, 0, 16) forState:UIControlStateNormal];
    [_programmaticallyCreatedSlider setMinimumTrackImage:@"tvcalslider_slider_blue.png" withCapInsets:UIEdgeInsetsMake(0, 16, 0, 16) forState:UIControlStateNormal];
    [_programmaticallyCreatedSlider setThumbImage:@"tvcalslider_slider_normal" forState:UIControlStateNormal withOffsetRelativeToCenterOfTrack:CGPointMake(0, 0)];
    [_programmaticallyCreatedSlider setThumbImage:@"tvcalslider_slider_hover" forState:UIControlStateHighlighted withOffsetRelativeToCenterOfTrack:CGPointMake(0, -15)];
}

- (IBAction)btnDecrementRange:(id)sender {
    TVCalibratedSliderRange range;
    range.maximumValue = 2;
    range.minimumValue = -5;
    [scaledSlider setRange:range];
    [_programmaticallyCreatedSlider setRange:range];
    _programmaticallyCreatedSlider.frame = CGRectMake(10, 0, 100, 150);
}

- (IBAction)btnIncrementRange:(id)sender {
    
    TVCalibratedSliderRange range;
    range.maximumValue = 8;
    range.minimumValue = 0;
    [scaledSlider setRange:range];
    [_programmaticallyCreatedSlider setRange:range];
    [_programmaticallyCreatedSlider setMarkerValueOffsetFromSlider:20];
    [_programmaticallyCreatedSlider setThumbImage:@"tvcalslider_slider_hover.png" forState:UIControlStateHighlighted withOffsetRelativeToCenterOfTrack:CGPointMake(0, -15)];
    [_programmaticallyCreatedSlider setTextPositionForHighlightedStateRelativeToThumbImage:CGPointMake(10, 10)];
    [_programmaticallyCreatedSlider setTextFontForHighlightedState:[UIFont boldSystemFontOfSize:18]];
    
}

- (void)valueChanged:(TVCalibratedSlider *)sender {
    NSLog(@"Delegate called");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

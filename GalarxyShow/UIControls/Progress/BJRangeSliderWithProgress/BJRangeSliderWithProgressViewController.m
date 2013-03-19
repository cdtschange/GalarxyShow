//
//  BJRangeSliderWithProgressViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "BJRangeSliderWithProgressViewController.h"
#import <GalarxyUIKitLib/BJRangeSliderWithProgress.h>

@interface BJRangeSliderWithProgressViewController ()

@end

@implementation BJRangeSliderWithProgressViewController
@synthesize slider;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc{

    [self setSlider:nil];
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

- (void)recordDemoFire:(NSTimer*)timer {
    self.slider.currentProgressValue += 0.6;
    
    if (self.slider.currentProgressValue >= self.slider.maxValue) {
        
        [self.slider setDisplayMode:BJRSWPAudioSetTrimMode];
        
        [timer invalidate];
    }
}

- (IBAction)didPressRecordDemo:(id)sender {
    [self.slider setDisplayMode:BJRSWPAudioRecordMode];
    
    self.slider.currentProgressValue = 0;
    self.slider.leftValue = 0;
    self.slider.rightValue = self.slider.maxValue;
    
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(recordDemoFire:) userInfo:nil repeats:YES];
}

- (void)playDemoFire:(NSTimer*)timer {
    self.slider.currentProgressValue += 0.2;
    
    if (self.slider.currentProgressValue >= self.slider.rightValue) {
        [self.slider setDisplayMode:BJRSWPAudioSetTrimMode];
        
        [timer invalidate];
    }
}

- (IBAction)didPressPlayDemo:(id)sender {
    [self.slider setDisplayMode:BJRSWPAudioPlayMode];
    self.slider.currentProgressValue = self.slider.leftValue;
    
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(playDemoFire:) userInfo:nil repeats:YES];
}
@end

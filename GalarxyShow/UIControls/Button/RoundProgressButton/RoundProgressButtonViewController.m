//
//  RoundProgressButtonViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/5/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "RoundProgressButtonViewController.h"

@interface RoundProgressButtonViewController ()

@end

@implementation RoundProgressButtonViewController
@synthesize progressView;
@synthesize progressSlider;
@synthesize playPauseButton;
@synthesize player;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.player = [[CEPlayer alloc] init];
    self.player.delegate = self;
    
    UIColor *tintColor = [UIColor orangeColor];
    [[UISlider appearance] setMinimumTrackTintColor:tintColor];
    [[CERoundProgressView appearance] setTintColor:tintColor];
    
    self.progressView.trackColor = [UIColor colorWithWhite:0.80 alpha:1.0];
    
    self.progressView.startAngle = (3.0*M_PI)/2.0;
}

- (void)viewDidUnload
{
    [self setProgressView:nil];
    [self setProgressSlider:nil];
    [self setPlayPauseButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)dealloc {
    [self setProgressView:nil];
    [self setProgressSlider:nil];
    [self setPlayPauseButton:nil];
    self.player = nil;
}

- (IBAction)progressSlider:(UISlider *)sender
{
    self.player.position = sender.value;
    self.progressView.progress = sender.value;
}

- (IBAction)playPauseButton:(UIButton *)sender
{
    if(sender.selected) // Shows the Pause symbol
    {
        sender.selected = NO;
        [self.player pause];
    }
    else    // Shows the Play symbol
    {
        sender.selected = YES;
        [self.player play];
    }
}



// MARK: CEPlayerDelegate methods

- (void) player:(CEPlayer *)player didReachPosition:(float)position
{
    self.progressView.progress = position;
    self.progressSlider.value = position;
}

- (void) playerDidStop:(CEPlayer *)player
{
    self.playPauseButton.selected = NO;
    self.progressView.progress = 0.0;
    self.progressSlider.value = 0.0;
}

@end

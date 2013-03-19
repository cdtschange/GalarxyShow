//
//  RoundProgressButtonViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/5/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/CERoundProgressView.h>
#import <GalarxyUIKitLib/CEPlayer.h>
#import "ControlBaseViewController.h"

@interface RoundProgressButtonViewController : ControlBaseViewController <CEPlayerDelegate>


@property (retain, nonatomic) IBOutlet CERoundProgressView *progressView;
@property (retain, nonatomic) IBOutlet UISlider *progressSlider;
- (IBAction)progressSlider:(UISlider *)sender;
- (IBAction)playPauseButton:(UIButton *)sender;
@property (retain, nonatomic) IBOutlet UIButton *playPauseButton;

@property (retain, nonatomic) CEPlayer *player;

@end

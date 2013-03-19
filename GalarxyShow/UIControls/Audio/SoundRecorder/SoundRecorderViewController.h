//
//  SoundRecorderViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/18/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ControlBaseViewController.h"

@interface SoundRecorderViewController : ControlBaseViewController<AVAudioPlayerDelegate>
{
    NSURL *recordedFile;
    AVAudioPlayer *player;
    AVAudioRecorder *recorder;
    BOOL isRecording;
}
@property (nonatomic) BOOL isRecording;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;

- (IBAction)playPause:(id)sender;

- (IBAction)startStopRecording:(id)sender;

@end

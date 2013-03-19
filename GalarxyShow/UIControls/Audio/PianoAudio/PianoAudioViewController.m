//
//  PianoAudioViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/19/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "PianoAudioViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>

@interface PianoAudioViewController ()

@end

@implementation PianoAudioViewController
@synthesize soundFile;

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
}

-(void)playSound:(NSString*)soundKey{
	
	NSString *path = [NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath],soundKey];
	
    NSLog(@"%@\n", path);
	
	SystemSoundID soundID;
	
	NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];
	
	AudioServicesCreateSystemSoundID((__bridge CFURLRef)filePath, &soundID);
	
	AudioServicesPlaySystemSound(soundID);
	
}
- (IBAction)DO:(id)sender{
	
	soundFile = [NSString stringWithFormat:@"pianoaudio_001.mp3"];
	
	[self playSound: soundFile];
	
}

- (IBAction)RE:(id)sender{
	
	soundFile = [NSString stringWithFormat:@"pianoaudio_002.mp3"];
	
	[self playSound: soundFile];
	
}


- (IBAction)MI:(id)sender{
	
	soundFile = [NSString stringWithFormat:@"pianoaudio_003.mp3"];
	
	
	[self playSound: soundFile];
	
}

- (IBAction)FA:(id)sender{
	
	soundFile = [NSString stringWithFormat:@"pianoaudio_004.mp3"];
	
	[self playSound: soundFile];
	
}

- (IBAction)SO:(id)sender{
	
	soundFile = [NSString stringWithFormat:@"pianoaudio_005.mp3"];
	
	[self playSound: soundFile];
	
}

- (IBAction)LA:(id)sender{
	
	soundFile = [NSString stringWithFormat:@"pianoaudio_006.mp3"];
	
	[self playSound: soundFile];
	
}

- (IBAction)SI:(id)sender{
	
	soundFile = [NSString stringWithFormat:@"pianoaudio_007.mp3"];
	
	[self playSound: soundFile];
	
}

- (IBAction)C:(id)sender{
	
	soundFile = [NSString stringWithFormat:@"pianoaudio_C.mp3"];
	
	[self playSound: soundFile];
	
	
}

- (IBAction)D:(id)sender{
	
	
	soundFile = [NSString stringWithFormat:@"pianoaudio_D.mp3"];
	
	
	[self playSound: soundFile];
	
	
}


- (IBAction)E:(id)sender{
	
	
	soundFile = [NSString stringWithFormat:@"pianoaudio_E.mp3"];
	
	
	[self playSound: soundFile];
	
	
}


- (IBAction)F:(id)sender{
    
	soundFile = [NSString stringWithFormat:@"pianoaudio_F.mp3"];
	
	[self playSound: soundFile];
	
}


- (IBAction)G:(id)sender{
	
	soundFile = [NSString stringWithFormat:@"pianoaudio_G.mp3"];
	
	[self playSound: soundFile];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
	self.soundFile =nil;
}
@end

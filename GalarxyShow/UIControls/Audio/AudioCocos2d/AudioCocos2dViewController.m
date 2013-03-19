//
//  AudioCocos2dViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/18/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "AudioCocos2dViewController.h"
#import <GalarxyUIKitLib/AudioEngineCocos2d.h>

@interface AudioCocos2dViewController ()

@end

@implementation AudioCocos2dViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc{
     [[AudioEngineCocos2d sharedEngine] stopBackgroundMusic];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[AudioEngineCocos2d sharedEngine] preloadBackgroundMusic:@"audiococos2d_1.mp3"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {
    [[AudioEngineCocos2d sharedEngine] playBackgroundMusic:@"audiococos2d_1.mp3"];
}

- (IBAction)pause:(id)sender {
    [[AudioEngineCocos2d sharedEngine] pauseBackgroundMusic];
}

- (IBAction)stop:(id)sender {
    [[AudioEngineCocos2d sharedEngine] stopBackgroundMusic];
}

- (IBAction)resume:(id)sender {
    [[AudioEngineCocos2d sharedEngine] resumeBackgroundMusic];
}

@end

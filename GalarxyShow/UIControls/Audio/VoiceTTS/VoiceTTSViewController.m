//
//  VoiceTTSViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/19/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "VoiceTTSViewController.h"
#import <GalarxyUIKitLib/FliteTTS.h>

@interface VoiceTTSViewController ()

@end

@implementation VoiceTTSViewController
@synthesize speakText;
@synthesize fliteEngine;

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
    self.fliteEngine = [[FliteTTS alloc] init];
    //    cmu_us_kal
    //    cmu_us_kal16
    //    cmu_us_awb
    //    cmu_us_rms
    //    cmu_us_slt
    [fliteEngine setVoice:@"cmu_us_awb"];
}

-(IBAction)speakBtn:(id)sender
{
    [fliteEngine setPitch:125.0 variance:11.0 speed:1.2];
    if (self.speakText.text.length <= 0) {
        [fliteEngine speakText:@"please input something that you want to speak."];
    }
    else
    {
        [fliteEngine speakText:self.speakText.text];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.speakText resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    self.fliteEngine=nil;
}

@end

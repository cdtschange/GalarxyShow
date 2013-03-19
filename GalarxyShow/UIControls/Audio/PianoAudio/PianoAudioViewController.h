//
//  PianoAudioViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/19/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@interface PianoAudioViewController : ControlBaseViewController{
	
	NSString *soundFile;
    
}

@property(nonatomic,retain) NSString *soundFile;

- (void)playSound:(NSString*)soundKey;

- (IBAction)DO:(id)sender;
- (IBAction)RE:(id)sender;
- (IBAction)MI:(id)sender;
- (IBAction)FA:(id)sender;
- (IBAction)SO:(id)sender;
- (IBAction)LA:(id)sender;
- (IBAction)SI:(id)sender;

- (IBAction)C:(id)sender;
- (IBAction)D:(id)sender;
- (IBAction)E:(id)sender;
- (IBAction)F:(id)sender;
- (IBAction)G:(id)sender;

@end

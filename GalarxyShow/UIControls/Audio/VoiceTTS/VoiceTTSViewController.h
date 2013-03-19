//
//  VoiceTTSViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/19/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class FliteTTS;
@interface VoiceTTSViewController : ControlBaseViewController
@property(nonatomic, weak) IBOutlet UITextField *speakText;
@property(nonatomic, strong) FliteTTS *fliteEngine;

@end

//
//  RRSGlowLabelViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/20/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class RRSGlowLabel;

@interface RRSGlowLabelViewController : ControlBaseViewController

@property (nonatomic, retain) IBOutlet RRSGlowLabel *label;
@property (nonatomic, retain) IBOutlet UISlider *glowSlider;

- (IBAction)adjustGlowAmount:(id)sender;

@end

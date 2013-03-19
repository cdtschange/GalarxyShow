//
//  MHRotaryKnobViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/11/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class MHRotaryKnob;

@interface MHRotaryKnobViewController : ControlBaseViewController

@property (nonatomic, retain) IBOutlet UISlider* slider;
@property (nonatomic, retain) IBOutlet UILabel* label;
@property (nonatomic, retain) IBOutlet MHRotaryKnob* rotaryKnob;

- (IBAction)sliderDidChange;
- (IBAction)rotaryKnobDidChange;
- (IBAction)toggleEnabled;
- (IBAction)toggleContinuous;
- (IBAction)goToMinimum;
- (IBAction)goToMaximum;
- (IBAction)toggleInteractionStyle:(id)sender;

@end

//
//  MultiDialViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/2/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@interface MultiDialViewDemoController : ControlBaseViewController

@property (nonatomic, weak) IBOutlet UILabel *selectedStringLabel;
@property (nonatomic, weak) IBOutlet UITextView *presetStringsView;

- (IBAction)switchPresetStrings:(id)sender;
- (IBAction)spinToRandom:(id)sender;

@end

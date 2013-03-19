//
//  UISoundMixerViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/13/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMGlowLabel.h"
#import "ControlBaseViewController.h"

@interface UISoundMixerViewController : ControlBaseViewController

@property (strong, nonatomic) IBOutlet UISlider *faderSlider;
@property (strong, nonatomic) IBOutlet SMGlowLabel *glow;
@end

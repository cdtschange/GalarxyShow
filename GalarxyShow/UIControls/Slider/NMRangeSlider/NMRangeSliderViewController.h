//
//  NMRangeSliderViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/13/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class NMRangeSlider;

@interface NMRangeSliderViewController : ControlBaseViewController

@property (weak, nonatomic) IBOutlet NMRangeSlider *standardSlider;
@property (weak, nonatomic) IBOutlet NMRangeSlider *metalSlider;
@property (weak, nonatomic) IBOutlet NMRangeSlider *steppedSlider;
@property (weak, nonatomic) IBOutlet NMRangeSlider *steppedContinuouslySlider;
@property (weak, nonatomic) IBOutlet NMRangeSlider *setValuesSlider;

@property (weak, nonatomic) IBOutlet NMRangeSlider *labelSlider;
@property (weak, nonatomic) IBOutlet UILabel *lowerLabel;
@property (weak, nonatomic) IBOutlet UILabel *upperLabel;

- (IBAction)labelSliderChanged:(NMRangeSlider*)sender;
@end

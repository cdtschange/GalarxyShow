//
//  F3BarGaugeViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/13/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class F3BarGauge;

@interface F3BarGaugeViewController : ControlBaseViewController

@property (strong, nonatomic) IBOutlet F3BarGauge *horizontalBar;
@property (strong, nonatomic) IBOutlet F3BarGauge *reversedBar;
@property (strong, nonatomic) IBOutlet F3BarGauge *verticalBar;
@property (strong, nonatomic) IBOutlet F3BarGauge *lcdBar;
@property (strong, nonatomic) IBOutlet F3BarGauge *peakHoldBar;
@property (strong, nonatomic) IBOutlet F3BarGauge *customThresholdBar;
@property (strong, nonatomic) IBOutlet F3BarGauge *customRangeBar;
@property (strong, nonatomic) IBOutlet UISlider *valueSlider;
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;

- (IBAction)didChangeValue:(id)sender;
- (IBAction)didReset:(id)sender;
@end

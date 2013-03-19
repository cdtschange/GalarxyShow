//
//  FXLabelViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/20/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class FXLabel;

@interface FXLabelViewController : ControlBaseViewController



@property (nonatomic, weak) IBOutlet FXLabel *label1;
@property (nonatomic, weak) IBOutlet FXLabel *label2;
@property (nonatomic, weak) IBOutlet FXLabel *label3;
@property (nonatomic, weak) IBOutlet FXLabel *label4;
@property (nonatomic, weak) IBOutlet FXLabel *label5;


@property (nonatomic, weak) IBOutlet FXLabel *labelOversampling;
@property (nonatomic, weak) IBOutlet UILabel *oversamplingLabel;
@property (nonatomic, weak) IBOutlet UISlider *oversamplingSlider;
@property (nonatomic, weak) IBOutlet UILabel *fontSizeLabel;
@property (nonatomic, weak) IBOutlet UISlider *fontSizeSlider;



@property (nonatomic, weak) IBOutlet FXLabel *labelShadow1;
@property (nonatomic, weak) IBOutlet FXLabel *labelShadow2;

- (IBAction)setOversampling:(UISlider *)slider;
- (IBAction)setFontSize:(UISlider *)slider;

@end

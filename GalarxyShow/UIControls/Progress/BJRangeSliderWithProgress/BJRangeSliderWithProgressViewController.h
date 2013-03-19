//
//  BJRangeSliderWithProgressViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class BJRangeSliderWithProgress;

@interface BJRangeSliderWithProgressViewController : ControlBaseViewController{
    BJRangeSliderWithProgress *slider;
    
}

@property (strong, nonatomic) IBOutlet BJRangeSliderWithProgress *slider;

- (IBAction)didPressRecordDemo:(id)sender;
- (IBAction)didPressPlayDemo:(id)sender;


@end

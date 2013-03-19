//
//  ILColorPickerViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/9/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/ILSaturationBrightnessPickerView.h>
#import <GalarxyUIKitLib/ILHuePickerView.h>
#import "ControlBaseViewController.h"

@interface ILColorPickerViewController : ControlBaseViewController<ILSaturationBrightnessPickerViewDelegate> {
    IBOutlet UIView *colorChip;
    IBOutlet ILSaturationBrightnessPickerView *colorPicker;
    IBOutlet ILHuePickerView *huePicker;
}


@end

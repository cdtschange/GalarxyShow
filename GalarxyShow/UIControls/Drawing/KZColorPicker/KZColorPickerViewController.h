//
//  KZColorPickerViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/9/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/KZColorPicker.h>
#import "ControlBaseViewController.h"

@class KZColorPickerViewController;

@protocol KZColorPickerViewControllerDelegate<NSObject>
@optional
- (void) defaultColorController:(KZColorPickerViewController *)controller didChangeColor:(UIColor *)color;
@end

@interface KZColorPickerViewController : ControlBaseViewController{
}
@property(nonatomic, assign) id<KZColorPickerViewControllerDelegate> delegate;
@property(nonatomic, retain) UIColor *selectedColor;

@end



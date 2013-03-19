//
//  V8HorizontalPickerViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/2/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/V8HorizontalPickerView.h>
#import "ControlBaseViewController.h"

@interface V8HorizontalPickerViewController : ControlBaseViewController<V8HorizontalPickerViewDelegate, V8HorizontalPickerViewDataSource> {
}

@property (nonatomic, strong) V8HorizontalPickerView *pickerView;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIButton *reloadButton;
@property (nonatomic, strong) UILabel *infoLabel;

@end

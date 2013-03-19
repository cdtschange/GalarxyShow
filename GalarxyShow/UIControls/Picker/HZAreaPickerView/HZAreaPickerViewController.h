//
//  HZAreaPickerViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/2/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/HZAreaPickerView.h>
#import "ControlBaseViewController.h"

@interface HZAreaPickerViewController : ControlBaseViewController<UITextFieldDelegate, HZAreaPickerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *areaText;
@property (weak, nonatomic) IBOutlet UITextField *cityText;
@property (copy, nonatomic) NSString *areaValue, *cityValue;
@property (strong, nonatomic) HZAreaPickerView *locatePicker;

-(void)cancelLocatePicker;

@end

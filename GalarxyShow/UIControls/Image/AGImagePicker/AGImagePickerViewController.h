//
//  AGViewController.h
//  AGImagePickerController Demo
//
//  Created by Artur Grigor on 2/16/12.
//  Copyright (c) 2012 Artur Grigor. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ControlBaseViewController.h"
#import <GalarxyUIKitLib/AGImagePickerController.h>

@interface AGImagePickerViewController : ControlBaseViewController
@property (nonatomic, strong) UIButton *openButton;
@property (nonatomic, strong) NSMutableArray *selectedPhotos;

@end

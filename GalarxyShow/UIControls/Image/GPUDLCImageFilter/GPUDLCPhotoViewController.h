//
//  PhotoViewController.h
//  DLCImagePickerController
//
//  Created by Dmitri Cherniak on 8/18/12.
//  Copyright (c) 2012 Backspaces Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUDLCImageFilterViewController.h"

@interface GPUDLCPhotoViewController : UIViewController<GPUDLCImageFilterDelegate>

@property (nonatomic, strong) UIButton *showPickerButton;

@end

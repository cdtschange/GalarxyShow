//
//  ThumbnailPickerViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/11/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"
#import <GalarxyUIKitLib/ThumbnailPickerView.h>

@interface ThumbnailPickerViewController : ControlBaseViewController<ThumbnailPickerViewDelegate,ThumbnailPickerViewDataSource>

@property (copy, nonatomic) NSArray *images;


- (IBAction)_reloadThumbnailPickerView;
- (IBAction)_sliderValueChanged:(UISlider *)sender;
- (void)_updateUIWithSelectedIndex:(NSUInteger)index;

@property (weak, nonatomic) IBOutlet UISlider *numberOfItemsSlider;
@property (weak, nonatomic) IBOutlet UISlider *selectedIndexSlider;
@property (weak, nonatomic) IBOutlet UILabel *numberOfItemsLabel;
@property (weak, nonatomic) IBOutlet UILabel *selectedIndexLabel;
@property (weak, nonatomic) IBOutlet UILabel *reloadTimeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet ThumbnailPickerView *thumbnailPickerView;
@end

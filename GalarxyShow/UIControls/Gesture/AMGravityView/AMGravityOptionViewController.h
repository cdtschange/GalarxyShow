//
//  AMGravityOptionViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AMGravityOptionViewController;
@protocol AMGravityOptionViewControllerDelegate <NSObject>

- (void)motionOption:(AMGravityOptionViewController *)moitonOption saveWithMotionScale:(double)motionScale;

@end

@interface AMGravityOptionViewController : UIViewController

@property (weak,nonatomic) IBOutlet UISlider *slider;
@property (assign) id<AMGravityOptionViewControllerDelegate> delegate;
- (IBAction)save:(UIButton *)sender;
- (IBAction)sliderChange:(UISlider *)sender;

@end

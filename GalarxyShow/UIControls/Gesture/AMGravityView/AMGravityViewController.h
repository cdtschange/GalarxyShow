//
//  AMGravityViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "AMGravityOptionViewController.h"
#import "ControlBaseViewController.h"

@interface AMGravityViewController : ControlBaseViewController<AMGravityOptionViewControllerDelegate>
{
    IBOutlet UIImageView *imageView;
    IBOutlet UILabel *accelerationX;
    IBOutlet UILabel *accelerationY;
    IBOutlet UILabel *accelerationZ;
}
@property (retain) IBOutlet UIImageView *imageView;
@property (readonly) CMMotionManager *motionManager;
@property (assign) double scale;

- (IBAction)driftingImage:(UIButton *)sender;
- (IBAction)showOptions:(UIButton *)sender;

@end

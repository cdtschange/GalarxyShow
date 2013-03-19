//
//  JSAnimatedImagesViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/12/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"
#import <GalarxyUIKitLib/JSAnimatedImagesView.h>

@interface JSAnimatedImagesViewController : ControlBaseViewController <JSAnimatedImagesViewDelegate>
@property (retain, nonatomic) IBOutlet JSAnimatedImagesView *animatedImagesView;
@property (retain, nonatomic) IBOutlet UIView *infoBox;

@end

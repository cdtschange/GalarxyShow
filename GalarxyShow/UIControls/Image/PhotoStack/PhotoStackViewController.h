//
//  PhotoStackViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/PhotoStackView.h>
#import "ControlBaseViewController.h"

@interface PhotoStackViewController : ControlBaseViewController<PhotoStackViewDataSource, PhotoStackViewDelegate>

@property (nonatomic, strong) PhotoStackView *photoStack;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

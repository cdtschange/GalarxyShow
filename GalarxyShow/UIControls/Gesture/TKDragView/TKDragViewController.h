//
//  TKDragViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"
#import <GalarxyUIKitLib/TKDragView.h>

@interface TKDragViewController : ControlBaseViewController<TKDragViewDelegate>

@property (nonatomic, strong) NSMutableArray *dragViews;

@property (nonatomic, strong) NSMutableArray *goodFrames;

@property (nonatomic, strong) NSMutableArray *badFrames;

@property BOOL canDragMultipleViewsAtOnce;

@property BOOL canUseTheSameFrameManyTimes;

@end

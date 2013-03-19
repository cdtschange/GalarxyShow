//
//  VurigCalendarViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/8/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/VRGCalendarView.h>
#import "ControlBaseViewController.h"

@interface VurigCalendarViewController : ControlBaseViewController<VRGCalendarViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

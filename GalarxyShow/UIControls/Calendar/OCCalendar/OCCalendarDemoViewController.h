//
//  OCCalendarDemoViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/8/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/OCCalendarViewController.h>
#import "ControlBaseViewController.h"

@interface OCCalendarDemoViewController : ControlBaseViewController <UIGestureRecognizerDelegate, OCCalendarDelegate> {
    OCCalendarViewController *calVC;
    
    UILabel *toolTipLabel;
}
- (IBAction)showCalendar:(id)sender;

@end

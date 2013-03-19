//
//  GCDiscreetNotificationViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/14/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class GCDiscreetNotificationView;

@interface GCDiscreetNotificationViewController : ControlBaseViewController <UITextFieldDelegate>

@property (nonatomic, retain) IBOutlet UISwitch *activitySwitch;
@property (nonatomic, retain) IBOutlet UISwitch *topBottomSwitch;
@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, retain) GCDiscreetNotificationView *notificationView;

- (IBAction) changeActivity:(id) sender;
- (IBAction) changeTopBottom:(id) sender;
- (IBAction) show;
- (IBAction) hide;
- (IBAction) hideAfter1sec;

@end

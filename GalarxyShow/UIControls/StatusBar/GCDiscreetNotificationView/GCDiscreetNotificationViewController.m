//
//  GCDiscreetNotificationViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/14/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "GCDiscreetNotificationViewController.h"
#import <GalarxyUIKitLib/GCDiscreetNotificationView.h>

@interface GCDiscreetNotificationViewController ()

@end

@implementation GCDiscreetNotificationViewController

@synthesize activitySwitch;
@synthesize topBottomSwitch;
@synthesize textField;
@synthesize notificationView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    notificationView = [[GCDiscreetNotificationView alloc] initWithText:self.textField.text
                                                           showActivity:self.activitySwitch.on
                                                     inPresentationMode:self.topBottomSwitch.on ?  GCDiscreetNotificationViewPresentationModeTop : GCDiscreetNotificationViewPresentationModeBottom
                                                                 inView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) show {
    [self.notificationView show:YES];
}

- (void) hide {
    [self.notificationView hide:YES];
}

- (IBAction) hideAfter1sec {
    [self.notificationView hideAnimatedAfter:1.0];
}

- (void) changeActivity:(id)sender {
    [self.notificationView setShowActivity:self.activitySwitch.on animated:YES];
}

- (void) changeTopBottom:(id)sender {
    [self.notificationView setPresentationMode:self.topBottomSwitch.on ?  GCDiscreetNotificationViewPresentationModeTop : GCDiscreetNotificationViewPresentationModeBottom];
}

- (BOOL) textFieldShouldReturn:(UITextField *)aTextField {
    [self.textField resignFirstResponder];
    [self.notificationView setTextLabel:self.textField.text animated:YES];
    return NO;
}

- (void)dealloc {
    activitySwitch = nil;
    topBottomSwitch = nil;
    textField = nil;
    notificationView = nil;
}

@end

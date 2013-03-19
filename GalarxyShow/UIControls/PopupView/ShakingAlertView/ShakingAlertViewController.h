//
//  ViewController.h
//  ShakingAlertView
//
//  Created by Luke on 21/09/2012.
//  Copyright (c) 2012 Luke Stringer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@interface ShakingAlertViewController : ControlBaseViewController <UIAlertViewDelegate>

- (IBAction)plainTextLoginTapped:(id)sender;
- (IBAction)sha1LoginTapped:(id)sender;
- (IBAction)md5LoginTaped:(id)sender;

@end

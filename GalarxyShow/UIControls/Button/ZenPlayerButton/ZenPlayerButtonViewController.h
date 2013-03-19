//
//  ZenPlayerButtonViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/4/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class ZenPlayerButton;

@interface ZenPlayerButtonViewController : ControlBaseViewController


@property (nonatomic, retain) ZenPlayerButton* zenPlayerButton;

- (IBAction) rewind:(id)sender;
- (IBAction) forward:(id)sender;
- (IBAction) changeState:(id)sender;
- (void) zenPlayerButtonDidTouchUpInside:(id)sender;

@end

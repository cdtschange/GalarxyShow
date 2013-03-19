//
//  UAViewController.h
//  UAModalPanel
//
//  Created by Matt Coneybeare on 1/8/12.
//  Copyright (c) 2012 Urban Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <GalarxyUIKitLib/UAModalPanel.h>
#import "ControlBaseViewController.h"

@interface UAModalPanelViewController : ControlBaseViewController<UAModalPanelDelegate>;

- (IBAction)showModalPanel:(id)sender;

@end

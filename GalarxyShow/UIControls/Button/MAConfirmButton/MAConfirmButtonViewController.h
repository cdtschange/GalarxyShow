//
//  MAConfirmButtonViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/8/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class MAConfirmButton;

@interface MAConfirmButtonViewController : ControlBaseViewController<UIAlertViewDelegate> {
	MAConfirmButton *resetButton;
}


@end

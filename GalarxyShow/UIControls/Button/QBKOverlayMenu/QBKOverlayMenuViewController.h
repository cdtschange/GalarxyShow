//
//  QBKOverlayMenuViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/5/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/QBKOverlayMenuView.h>
#import "ControlBaseViewController.h"

@interface QBKOverlayMenuViewController : ControlBaseViewController<QBKOverlayMenuViewDelegate>
{
    QBKOverlayMenuView *_qbkOverlayMenu;
}

@end

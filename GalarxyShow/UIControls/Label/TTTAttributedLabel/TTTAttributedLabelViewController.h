//
//  TTTAttributedLabelViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"
#import <GalarxyUIKitLib/TTTAttributedLabel.h>

@interface TTTAttributedLabelViewController : ControlBaseViewController<TTTAttributedLabelDelegate, UIActionSheetDelegate> {
    NSArray *_espressos;
}

@property (nonatomic, retain) NSArray *espressos;

@end

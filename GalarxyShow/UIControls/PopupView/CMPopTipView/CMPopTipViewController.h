//
//  CMPopTipViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/3/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"
#import <GalarxyUIKitLib/CMPopTipView.h>

@interface CMPopTipViewController : ControlBaseViewController<CMPopTipViewDelegate> {
}

@property (nonatomic, strong)	NSArray			*colorSchemes;
@property (nonatomic, strong)	NSDictionary	*contents;
@property (nonatomic, assign)	id				currentPopTipViewTarget;
@property (nonatomic, strong)	NSMutableArray	*visiblePopTipViews;

- (IBAction)buttonAction:(id)sender;


@end

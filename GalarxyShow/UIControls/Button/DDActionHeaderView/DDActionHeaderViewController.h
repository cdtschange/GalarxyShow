//
//  DDActionHeaderViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/2/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class DDActionHeaderView;

@interface DDActionHeaderViewController : ControlBaseViewController{
	DDActionHeaderView *actionHeaderView;
}

@property(nonatomic, retain) DDActionHeaderView *actionHeaderView;

- (void)itemAction:(id)sender;

@end

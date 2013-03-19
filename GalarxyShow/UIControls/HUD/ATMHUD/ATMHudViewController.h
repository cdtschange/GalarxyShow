//
//  ATMHudViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/11/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/ATMHudDelegate.h>
#import "ControlBaseViewController.h"

@interface ATMHudViewController : ControlBaseViewController<ATMHudDelegate, UITableViewDataSource, UITableViewDelegate> {
	UITableView *tv_demo;
	ATMHud *hud;
	
	NSArray *sectionHeaders;
	NSArray *sectionFooters;
	NSArray *cellCaptions;
	
	BOOL useFixedSize;
}

@property (nonatomic, retain) UITableView *tv_demo;
@property (nonatomic, retain) ATMHud *hud;

@property (nonatomic, retain) NSArray *sectionHeaders;
@property (nonatomic, retain) NSArray *sectionFooters;
@property (nonatomic, retain) NSArray *cellCaptions;

@property (nonatomic, assign) BOOL useFixedSize;

@end

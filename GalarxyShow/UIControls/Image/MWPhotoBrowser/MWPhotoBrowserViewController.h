//
//  MWPhotoBrowserViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/11/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"
#import <GalarxyUIKitLib/MWPhotoBrowser.h>

@interface MWPhotoBrowserViewController : ControlBaseViewController<MWPhotoBrowserDelegate>
@property (nonatomic, retain) NSArray *photos;
@property (weak, nonatomic) IBOutlet UITableView *myTable;

@end

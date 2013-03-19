//
//  MasterViewController.h
//  downloadManager
//
//  Created by Htain Lin Shwe on 11/7/12.
//  Copyright (c) 2012 Edenpod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGDownloadProgressCell.h"
#import "ControlBaseViewController.h"
@class SGDownloadDetailViewController;

@interface SGDownloadMasterViewController : ControlBaseViewController <SGDownloadProgressCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *ctable;

@property (strong, nonatomic) SGDownloadDetailViewController *detailViewController;

@end

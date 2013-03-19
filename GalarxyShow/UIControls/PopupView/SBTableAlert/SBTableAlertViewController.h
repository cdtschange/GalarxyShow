//
//  SBTableAlertViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/3/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/SBTableAlert.h>
#import "ControlBaseViewController.h"

@interface SBTableAlertViewController : ControlBaseViewController<SBTableAlertDelegate, SBTableAlertDataSource>{
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

//
//  StyledPageControlViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/10/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@interface StyledPageControlViewController : ControlBaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

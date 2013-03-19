//
//  TagsCloudLabelViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/20/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/TouchAbleLabel.h>
#import "ControlBaseViewController.h"

@interface TagsCloudLabelViewController : ControlBaseViewController<TouchAbleLabelDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSTimer *timer;
    NSMutableArray* TagLabels;
    
    NSMutableArray* LabelContent;
}

@property (retain, nonatomic) IBOutlet UITableView *tableref;

@end

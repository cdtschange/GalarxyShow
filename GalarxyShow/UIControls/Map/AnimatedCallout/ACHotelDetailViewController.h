//
//  HotelDetailViewController.h
//  AnimatedCallout
//
//  Created by Gordon on 2/15/11.
//  Copyright 2011 GeeksInKilts. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ACHotel;

@interface ACHotelDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate> 
@property (nonatomic, weak) IBOutlet UITableView *table;
@property (nonatomic, strong) ACHotel *hotel;

@end

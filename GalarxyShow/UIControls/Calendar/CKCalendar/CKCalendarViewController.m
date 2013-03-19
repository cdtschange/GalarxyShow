//
//  CKCalendarViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/8/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "CKCalendarViewController.h"

@interface CKCalendarViewController ()

@end

@implementation CKCalendarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    calendar.frame = CGRectMake(10, 60, 300, 470);
    calendar.delegate = self;
    [self.view addSubview:calendar];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date{
    NSLog(@"Date:%@",date);
}
@end

//
//  JPStupidButtonViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/6/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "JPStupidButtonViewController.h"

@interface JPStupidButtonViewController ()

@end

@implementation JPStupidButtonViewController

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
    self.view.layer.backgroundColor = [UIColor grayColor].CGColor;
    [stickyButton setMode:JPStupidButtonStickMode];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

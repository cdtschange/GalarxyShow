//
//  DragButtonViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/10/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "DragButtonViewController.h"
#import <GalarxyUIKitLib/HSCButton.h>

@interface DragButtonViewController ()

@end

@implementation DragButtonViewController

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
    
    HSCButton *tt = [[HSCButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    tt.backgroundColor = [UIColor redColor];
    tt.dragEnable = YES;
    [self.view addSubview:tt];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

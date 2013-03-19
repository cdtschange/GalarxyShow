//
//  StrikeThroughLabelViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "StrikeThroughLabelViewController.h"
#import <GalarxyUIKitLib/StrikeThroughLabel.h>

@interface StrikeThroughLabelViewController (){
    StrikeThroughLabel *_label;
}

@end

@implementation StrikeThroughLabelViewController

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
    CGRect frame = CGRectMake(315, 120, 310, 25);
    _label = [[StrikeThroughLabel alloc] initWithFrame:frame];
    _label.text = @"Strike-through Text";
    _label.textAlignment = UITextAlignmentCenter;
    
    frame = CGRectMake(315, 150, 310, 25);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:@"Toggle Strike-through" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_label];
    [self.view addSubview:button];
}

- (void)buttonPress:(id)sender {
    
    if (_label.strikeThroughEnabled) {
        _label.strikeThroughEnabled = NO;
    } else {
        _label.strikeThroughEnabled = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

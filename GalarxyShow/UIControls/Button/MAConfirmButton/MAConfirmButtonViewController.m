//
//  MAConfirmButtonViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/8/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "MAConfirmButtonViewController.h"
#import <GalarxyUIKitLib/MAConfirmButton.h>

@interface MAConfirmButtonViewController ()

- (void)setupView;
- (void)resetUI;
- (void)confirmAction:(id)sender;

@end

@implementation MAConfirmButtonViewController

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
    [self setupView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView{
    
    for(UIView *view in self.view.subviews){
        if ([view isKindOfClass:[MAConfirmButton class]]) {
            [view removeFromSuperview];
        }
    }
    
    MAConfirmButton *defaultButton = [MAConfirmButton buttonWithTitle:@"$9.99" confirm:@"BUY NOW"];
    [defaultButton addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    [defaultButton setAnchor:CGPointMake(200, 50)];
    [self.view addSubview:defaultButton];
    
    MAConfirmButton *tintedButton = [MAConfirmButton buttonWithTitle:@"Tinted" confirm:@"Confirm String"];
    [tintedButton addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    [tintedButton setTintColor:[UIColor colorWithRed:0.176 green:0.569 blue:0.820 alpha:1]];
    [tintedButton setAnchor:CGPointMake(200, 100)];
    [self.view addSubview:tintedButton];
    
    MAConfirmButton *disabledButton = [MAConfirmButton buttonWithDisabledTitle:@"DISABLED"];
    [disabledButton setAnchor:CGPointMake(200, 150)];
    [self.view addSubview:disabledButton];
    
    MAConfirmButton *toggleRightButton = [MAConfirmButton buttonWithTitle:@"$0.99" confirm:@"Toggled to Right"];
    toggleRightButton.toggleAnimation = MAConfirmButtonToggleAnimationRight;
    [toggleRightButton addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    [toggleRightButton setAnchor:CGPointMake(200, 200)];
    [self.view addSubview:toggleRightButton];
    
    resetButton = [MAConfirmButton buttonWithTitle:@"Reset" confirm:@"Are you sure?"];
    [resetButton addTarget:self action:@selector(resetUI) forControlEvents:UIControlEventTouchUpInside];
    [resetButton setTintColor:[UIColor colorWithRed:0.694 green:0.184 blue:0.196 alpha:1]];
    [resetButton setAnchor:CGPointMake(200, 250)];
    [self.view addSubview:resetButton];
    
}

- (void)resetUI{
    [self setupView];
}

- (void)confirmAction:(id)sender{
    [sender disableWithTitle:@"CONFIRMED"];
}

@end

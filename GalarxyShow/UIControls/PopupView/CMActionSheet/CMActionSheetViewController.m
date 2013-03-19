//
//  CMActionSheetViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/8/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "CMActionSheetViewController.h"
#import <GalarxyUIKitLib/CMActionSheet.h>

@interface CMActionSheetViewController ()

@end

@implementation CMActionSheetViewController

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
    
    UIButton* actionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [actionButton setTitle:@"Show" forState:UIControlStateNormal];
    [actionButton addTarget:self action:@selector(showActionSheet) forControlEvents:UIControlEventTouchUpInside];
    actionButton.frame = CGRectMake(0, 0, 220, 44);
    actionButton.center = self.view.center;
    actionButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:actionButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showActionSheet {
    CMActionSheet *actionSheet = [[CMActionSheet alloc] init];
    //actionSheet.title = @"Test Action sheet";
    
    // Customize
    [actionSheet addButtonWithTitle:@"First Button" type:CMActionSheetButtonTypeWhite block:^{
        NSLog(@"Dismiss action sheet with \"First Button\"");
    }];
    [actionSheet addSeparator];
    [actionSheet addButtonWithTitle:@"Close Button" type:CMActionSheetButtonTypeBlue block:^{
        NSLog(@"Dismiss action sheet with \"Close Button\"");
    }];
    
    // Present
    [actionSheet present];
}
@end

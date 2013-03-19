//
//  DDActionHeaderViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/2/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "DDActionHeaderViewController.h"
#import <GalarxyUIKitLib/DDActionHeaderView.h>

@interface DDActionHeaderViewController ()

@end

@implementation DDActionHeaderViewController
@synthesize actionHeaderView;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.actionHeaderView = [[DDActionHeaderView alloc] initWithFrame:self.view.bounds];
	
    // Set title
    self.actionHeaderView.titleLabel.text = @"Tap DDActionHeaderView Action Picker";
	
    // Create action items, have to be UIView subclass, and set frame position by yourself.
    UIButton *facebookButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [facebookButton addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [facebookButton setImage:[UIImage imageNamed:@"ddactoin_facebook"] forState:UIControlStateNormal];
    facebookButton.frame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    facebookButton.tag=1;
    facebookButton.imageEdgeInsets = UIEdgeInsetsMake(13.0f, 13.0f, 13.0f, 13.0f);
    facebookButton.center = CGPointMake(25.0f, 25.0f);
    
    UIButton *twitterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [twitterButton addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [twitterButton setImage:[UIImage imageNamed:@"ddactoin_twitter"] forState:UIControlStateNormal];
    twitterButton.frame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    twitterButton.tag=2;
    twitterButton.imageEdgeInsets = UIEdgeInsetsMake(13.0f, 13.0f, 13.0f, 13.0f);
    twitterButton.center = CGPointMake(75.0f, 25.0f);
    
    UIButton *mailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [mailButton addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [mailButton setImage:[UIImage imageNamed:@"ddactoin_mail"] forState:UIControlStateNormal];
    mailButton.frame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    mailButton.tag=3;
    mailButton.imageEdgeInsets = UIEdgeInsetsMake(13.0f, 13.0f, 13.0f, 13.0f);
    mailButton.center = CGPointMake(125.0f, 25.0f);
	
    // Set action items, and previous items will be removed from action picker if there is any.
    self.actionHeaderView.items = [NSArray arrayWithObjects:facebookButton, twitterButton, mailButton, nil];
	
    [self.view addSubview:self.actionHeaderView];
}

- (void)itemAction:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSLog(@"select:%d",btn.tag);
    // Reset action picker
    [self.actionHeaderView shrinkActionPicker];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.actionHeaderView = nil;
}


- (void)dealloc {
    self.actionHeaderView=nil;
}


@end

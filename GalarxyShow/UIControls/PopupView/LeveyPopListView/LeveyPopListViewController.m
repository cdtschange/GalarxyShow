//
//  LeveyPopListViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/4/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "LeveyPopListViewController.h"
#import <GalarxyUIKitLib/LeveyPopListView.h>

@interface LeveyPopListViewController ()<LeveyPopListViewDelegate>{
    NSArray *options;
    UILabel *infoLabel;
}

@end

@implementation LeveyPopListViewController

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
    UIButton *demoBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoBtn setTitle:@"Click" forState:UIControlStateNormal];
    demoBtn.frame = CGRectMake(100, 220, 120, 44);
    [demoBtn addTarget:self action:@selector(showListView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:demoBtn];
    
    infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 30)];
    infoLabel.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:infoLabel];
    
    options = [NSArray arrayWithObjects:
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"leveypoplist_facebook.png"],@"img",@"Facebook",@"text", nil],
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"leveypoplist_twitter.png"],@"img",@"Twitter",@"text", nil],
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"leveypoplist_tumblr.png"],@"img",@"Tumblr",@"text", nil],
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"leveypoplist_google-plus.png"],@"img",@"Google+",@"text", nil],
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"leveypoplist_linkedin.png"],@"img",@"LinkedIn",@"text", nil],
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"leveypoplist_pinterest.png"],@"img",@"Pinterest",@"text", nil],
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"leveypoplist_dribbble.png"],@"img",@"Dribbble",@"text", nil],
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"leveypoplist_deviant-art.png"],@"img",@"deviantArt",@"text", nil],
                 nil];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showListView
{
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"Share Photo to..." options:options frame:self.view.bounds];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];
}

#pragma mark - LeveyPopListView delegates
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex
{
    infoLabel.text = [NSString stringWithFormat:@"You have selected %@",[[options objectAtIndex:anIndex] objectForKey:@"text"]];
}
- (void)leveyPopListViewDidCancel
{
    infoLabel.text = @"You have cancelled";
}
@end

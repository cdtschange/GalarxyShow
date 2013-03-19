//
//  AllAroundPullViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/10/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "AllAroundPullViewController.h"
#import <GalarxyUIKitLib/AllAroundPullView.h>

@interface AllAroundPullViewController ()

@end

@implementation AllAroundPullViewController

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
    
    self.scrollView.alwaysBounceHorizontal = YES;
    self.scrollView.alwaysBounceVertical = YES;
    self.scrollView.contentSize = CGSizeMake(1024, 704);
    
    // top
    AllAroundPullView *topPullView = [[AllAroundPullView alloc] initWithScrollView:self.scrollView position:AllAroundPullViewPositionTop action:^(AllAroundPullView *view){
        NSLog(@"--");
        [view performSelector:@selector(finishedLoading) withObject:nil afterDelay:1.0f];
    }];
    [self.scrollView addSubview:topPullView];
    
    // bottom
    AllAroundPullView *bottomPullView = [[AllAroundPullView alloc] initWithScrollView:self.scrollView position:AllAroundPullViewPositionBottom action:^(AllAroundPullView *view){
        NSLog(@"--");
        [view performSelector:@selector(finishedLoading) withObject:nil afterDelay:1.0f];
    }];
    [self.scrollView addSubview:bottomPullView];
    
    // left
    AllAroundPullView *leftPullView = [[AllAroundPullView alloc] initWithScrollView:self.scrollView position:AllAroundPullViewPositionLeft action:^(AllAroundPullView *view){
        NSLog(@"--");
        [view performSelector:@selector(finishedLoading) withObject:nil afterDelay:1.0f];
    }];
    [self.scrollView addSubview:leftPullView];
    
    // right
    AllAroundPullView *rightPullView = [[AllAroundPullView alloc] initWithScrollView:self.scrollView position:AllAroundPullViewPositionRight action:^(AllAroundPullView *view){
        NSLog(@"--");
        [view performSelector:@selector(finishedLoading) withObject:nil afterDelay:1.0f];
    }];
    [self.scrollView addSubview:rightPullView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

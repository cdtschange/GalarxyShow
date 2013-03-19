//
//  SCGifExampleViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/11/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "SCGifExampleViewController.h"
#import <GalarxyUIKitLib/SCGIFImageView.h>

@interface SCGifExampleViewController ()

@end

@implementation SCGifExampleViewController

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
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"scgif_demo.gif" ofType:nil];
    SCGIFImageView* gifImageView = [[SCGIFImageView alloc] initWithGIFFile:filePath];
    gifImageView.frame = CGRectMake(0, 0, gifImageView.image.size.width, gifImageView.image.size.height);
    gifImageView.center = self.view.center;
    [self.view addSubview:gifImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

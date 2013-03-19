//
//  SDWebImageDetailViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/12/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "SDWebImageDetailViewController.h"
#import <GalarxyUIKitLib/UIImageView+WebCache.h>

@interface SDWebImageDetailViewController ()

- (void)configureView;
@end

@implementation SDWebImageDetailViewController
@synthesize imageURL = _imageURL;
@synthesize imageView = _imageView;

#pragma mark - Managing the detail item

- (void)setImageURL:(NSURL *)imageURL
{
    if (_imageURL != imageURL)
    {
        _imageURL = imageURL;
        [self configureView];
    }
}

- (void)configureView
{
    if (self.imageURL)
    {
        [self.imageView setImageWithURL:self.imageURL placeholderImage:nil options:SDWebImageProgressiveDownload];
    }
}

-(void)dealloc{
    self.imageView = nil;

}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}
- (void)goBack:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
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
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

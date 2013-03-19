//
//  ZCScrollNumLabelViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/21/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "ZCScrollNumLabelViewController.h"
#import <GalarxyUIKitLib/ZCWScrollNumView.h>

#define kAllFullSuperviewMask      UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;

@interface ZCScrollNumLabelViewController ()

@end

@implementation ZCScrollNumLabelViewController
@synthesize scrollNumber;

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
    CGRect tmp = {{0, 0}, {100, 100}};
    self.scrollNumber.numberSize = 8;
    UIImage *image = [[UIImage imageNamed:@"zcscrollnum_bj_numbg"] stretchableImageWithLeftCapWidth:10 topCapHeight:14];
    self.scrollNumber.backgroundView = [[UIImageView alloc] initWithImage:image];
    UIView *digitBackView = [[UIView alloc] initWithFrame:tmp];
    digitBackView.backgroundColor = [UIColor clearColor];
    digitBackView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    digitBackView.autoresizesSubviews = YES;
    image = [[UIImage imageNamed:@"zcscrollnum_money_bg"] stretchableImageWithLeftCapWidth:12 topCapHeight:12];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:image];
    bgImageView.frame = tmp;
    bgImageView.autoresizingMask = kAllFullSuperviewMask;
    [digitBackView addSubview:bgImageView];
    image = [[UIImage imageNamed:@"zcscrollnum_money_bg_mask"] stretchableImageWithLeftCapWidth:12 topCapHeight:12];
    UIImageView *bgMaskImageView = [[UIImageView alloc] initWithImage:image];
    bgMaskImageView.autoresizingMask = kAllFullSuperviewMask;
    bgMaskImageView.frame = tmp;
    [digitBackView addSubview:bgMaskImageView];
    
    self.scrollNumber.digitBackgroundView = digitBackView;
    self.scrollNumber.digitColor = [UIColor whiteColor];
    self.scrollNumber.digitFont = [UIFont systemFontOfSize:17.0];
    [self.scrollNumber didConfigFinish];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)none:(id)sender {
    [self.scrollNumber setNumber:rand() withAnimationType:ZCWScrollNumAnimationTypeNone animationTime:0.1];
}

- (IBAction)fromZero:(id)sender {
    [self.scrollNumber setNumber:rand() withAnimationType:ZCWScrollNumAnimationTypeNormal animationTime:0.3];
}

- (IBAction)fromLast:(id)sender {
    [self.scrollNumber setNumber:rand() withAnimationType:ZCWScrollNumAnimationTypeFromLast animationTime:0.3];
}

- (IBAction)fast:(id)sender {
    [self.scrollNumber setNumber:rand() withAnimationType:ZCWScrollNumAnimationTypeFast animationTime:0.1];
}

- (IBAction)random:(id)sender {
    [self.scrollNumber setNumber:rand() withAnimationType:ZCWScrollNumAnimationTypeRand animationTime:3];
}
- (void)dealloc {
    self.scrollNumber =nil;
}

@end

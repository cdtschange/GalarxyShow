//
//  ScratchMaskViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/12/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "ScratchMaskViewController.h"

@interface ScratchMaskViewController ()

@end

@implementation ScratchMaskViewController

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
    UIImage * sharpImage = [UIImage imageNamed:@"scratchmask_sharp_2.png"];
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((int)(self.view.bounds.size.width * .5 - sharpImage.size.width * .5),
																			(int)(self.view.bounds.size.height * .5 - sharpImage.size.height * .5),
																			sharpImage.size.width, sharpImage.size.height)];
	imageView.image = sharpImage;
	[self.view addSubview:imageView];
	
	UIImage * blurImage = [UIImage imageNamed:@"scratchmask_blur_2.png"];
	CGRect maskViewRect = CGRectMake((int)(self.view.bounds.size.width * .5 - sharpImage.size.width * .5),
									 (int)(self.view.bounds.size.height * .5 - sharpImage.size.height * .5),
									 blurImage.size.width, blurImage.size.height);
    ImageMaskView *view = [[ImageMaskView alloc] initWithFrame:maskViewRect image:blurImage];
	view.imageMaskFilledDelegate = self;
    
	[self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - ImageMaskFilledDelegate

- (void)imageMaskView:(ImageMaskView *)maskView cleatPercentWasChanged:(float)clearPercent {
	NSLog(@"percent: %.2f", clearPercent);
}

@end

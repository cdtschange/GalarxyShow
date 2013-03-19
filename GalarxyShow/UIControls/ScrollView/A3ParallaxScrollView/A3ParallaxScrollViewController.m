//
//  A3ParallaxScrollViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/11/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "A3ParallaxScrollViewController.h"
#import <GalarxyUIKitLib/A3ParallaxScrollView.h>

@interface A3ParallaxScrollViewController ()<UIScrollViewDelegate>{
    
    A3ParallaxScrollView *scrollView;
    UIImageView *imageViewMoon;
    int scrollViewWithMultiplier;
}

@end

@implementation A3ParallaxScrollViewController

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
    
    scrollViewWithMultiplier=6;
    // Do any additional setup after loading the view from its nib.
    // get forrest BG Image
    UIImage *backgroundImage = [UIImage imageNamed:@"a3parallax_forrest.png"];
    
    
    // init and set up the scrollview
    scrollView = [[A3ParallaxScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(backgroundImage.size.width*scrollViewWithMultiplier, self.view.frame.size.height+40);
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    scrollView.showsHorizontalScrollIndicator = scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.directionalLockEnabled = NO;
    [self.view addSubview:scrollView];
    
    
    // add star background
    UIImageView *imageViewStarsBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a3parallax_stars-backgorund.png"]];
    imageViewStarsBackground.contentMode = UIViewContentModeScaleToFill;
    CGRect frameImageViewStars = imageViewStarsBackground.frame;
    frameImageViewStars.origin.x = -30;
    frameImageViewStars.origin.y = -30;
    frameImageViewStars.size.width *=1.5;
    frameImageViewStars.size.height *=1.5;
    imageViewStarsBackground.frame = frameImageViewStars;
    [scrollView addSubview:imageViewStarsBackground withAcceleration:CGPointMake(((15)/scrollView.contentSize.width), -0.01)];
    
    
    // add moon
    imageViewMoon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a3parallax_moon.png"]];
    imageViewMoon.contentMode = UIViewContentModeScaleToFill;
    CGFloat mWitdh = self.view.frame.size.width;
    CGRect frameImageViewMoon = imageViewMoon.frame;
    frameImageViewMoon.size.height *= 0.50f;
    frameImageViewMoon.size.width *= 0.50f;
    frameImageViewMoon.origin.x = -frameImageViewMoon.size.width/2.0f;
    frameImageViewMoon.origin.y = -frameImageViewMoon.size.height * 0.25f;
    imageViewMoon.frame = frameImageViewMoon;
    CGFloat xAccelMoon = -(mWitdh+frameImageViewMoon.size.width/2.0f)/scrollView.contentSize.width;
    [scrollView addSubview:imageViewMoon withAcceleration:CGPointMake(xAccelMoon, 0.025)];
    
    
    // add background image
    for (int i = -1; i < scrollViewWithMultiplier+1; i++) {
        UIImageView *imageViewForrest = [[UIImageView alloc]initWithImage:backgroundImage];
        imageViewForrest.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewForrest.frame;
        frameImageView.origin.x = i*frameImageView.size.width;
        frameImageView.origin.y = 200.0f;
        frameImageView.size.height = self.view.frame.size.height-88.0f;
        imageViewForrest.frame = frameImageView;
        [scrollView addSubview:imageViewForrest withAcceleration:CGPointMake(0.05f, 0.05f)];
    }
    
    ////
    //// Add Trees
    // far
    UIImage *darkTreeImage = [UIImage imageNamed:@"a3parallax_tree-dark.png"];
    for (int i = -1; i < scrollViewWithMultiplier*20+1; i++) {
        UIImageView *imageViewTree = [[UIImageView alloc]initWithImage:darkTreeImage];
        imageViewTree.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewTree.frame;
        frameImageView.origin.x = i*(frameImageView.size.width+backgroundImage.size.width+self.view.frame.size.width/2.0)/20;
        frameImageView.origin.y = 140;
        frameImageView.size.height *= 0.7f;
        frameImageView.size.width *= 0.7f;
        imageViewTree.frame = frameImageView;
        [scrollView addSubview:imageViewTree withAcceleration:CGPointMake(0.2f, 0.2f)];
    }
    
    for (int i = -1; i < scrollViewWithMultiplier*14+1; i++) {
        UIImageView *imageViewTree = [[UIImageView alloc]initWithImage:darkTreeImage];
        imageViewTree.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewTree.frame;
        frameImageView.origin.x = i*(frameImageView.size.width+backgroundImage.size.width+self.view.frame.size.width/2.0)/14;
        frameImageView.origin.y = 220;
        frameImageView.size.height *= 0.8f;
        frameImageView.size.width *= 0.8f;
        imageViewTree.frame = frameImageView;
        [scrollView addSubview:imageViewTree withAcceleration:CGPointMake(0.4f, 0.4f)];
    }
    
    // middle
    UIImage *middleTreeImage = [UIImage imageNamed:@"a3parallax_tree-middle.png"];
    for (int i = -1; i < scrollViewWithMultiplier*10+1; i++) {
        UIImageView *imageViewTree = [[UIImageView alloc]initWithImage:middleTreeImage];
        imageViewTree.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewTree.frame;
        frameImageView.origin.x = i*(frameImageView.size.width+backgroundImage.size.width+self.view.frame.size.width/2.0)/10;
        frameImageView.origin.y = 300;
        frameImageView.size.height *= 0.90f;
        frameImageView.size.width *= 0.90f;
        imageViewTree.frame = frameImageView;
        [scrollView addSubview:imageViewTree withAcceleration:CGPointMake(0.6f, 0.6f)];
    }
    
    // near
    UIImage *treeImage = [UIImage imageNamed:@"a3parallax_tree.png"];
    for (int i = -1; i < scrollViewWithMultiplier*6+1; i++) {
        UIImageView *imageViewTree = [[UIImageView alloc]initWithImage:treeImage];
        imageViewTree.contentMode = UIViewContentModeScaleToFill;
        CGRect frameImageView = imageViewTree.frame;
        frameImageView.origin.x = i*(frameImageView.size.width+backgroundImage.size.width+self.view.frame.size.width/2.0)/6;
        frameImageView.origin.y = 400;
        frameImageView.size.height *= 1.0f;
        frameImageView.size.width *= 1.0f;
        imageViewTree.frame = frameImageView;
        [scrollView addSubview:imageViewTree withAcceleration:CGPointMake(0.8f, 0.8f)];
    }
    
    // add label
    UILabel *labelText = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-140.0f, self.view.frame.size.width, 40)];
    labelText.backgroundColor = [UIColor clearColor];
    labelText.textAlignment = NSTextAlignmentCenter;
    labelText.textColor = [UIColor redColor];
    labelText.font = [UIFont systemFontOfSize:24];
    labelText.text = @"P4r4L4X";
    [labelText sizeToFit];
    CGFloat xAccelText = -((self.view.frame.size.width-labelText.frame.size.width+20)/scrollView.contentSize.width);
    [scrollView addSubview:labelText withAcceleration:CGPointMake(xAccelText, 0)];
    
    // content offset
    scrollView.contentOffset = CGPointMake((scrollView.contentSize.width-scrollView.frame.size.width)/2.0f, 0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView{
    
    // calc moon frame, let's make a nice wave :D
    float normalizedContentOffsetX = aScrollView.contentOffset.x;
    
    normalizedContentOffsetX /= (aScrollView.contentSize.width-aScrollView.bounds.size.width)/2;
    normalizedContentOffsetX = MIN(2, normalizedContentOffsetX);
    normalizedContentOffsetX = MAX(0, normalizedContentOffsetX);
    
    CGFloat yMultiplier = cosf(normalizedContentOffsetX*M_PI);
    
    // remember orig transform
    CGAffineTransform trans = imageViewMoon.transform;
    
    // reset transform bacause frame won't return a useful frame if a transform is applied
    imageViewMoon.transform = CGAffineTransformIdentity;
    
    // do calculation
    CGRect newMoonFrame = imageViewMoon.frame;
    newMoonFrame.origin.y = newMoonFrame.size.height*0.66f*yMultiplier + (newMoonFrame.size.height*0.66f);
    
    // assign new frame
    imageViewMoon.frame = newMoonFrame;
    
    // apply original transform
    imageViewMoon.transform = trans;
}
@end

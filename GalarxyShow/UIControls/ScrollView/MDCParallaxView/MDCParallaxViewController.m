//
//  MDCParallaxViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/11/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "MDCParallaxViewController.h"
#import <GalarxyUIKitLib/MDCParallaxView.h>

@interface MDCParallaxViewController ()<UIScrollViewDelegate>

@end

@implementation MDCParallaxViewController

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
    CGRect frame = CGRectMake(100, 100, 320, 480);
    
    UIImage *backgroundImage = [UIImage imageNamed:@"mdcparallax_background.png"];
    CGRect backgroundRect = CGRectMake(0, 0, frame.size.width, backgroundImage.size.height);
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:backgroundRect];
    backgroundImageView.image = backgroundImage;
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    CGRect textRect = CGRectMake(0, 0, frame.size.width, 400.0f);
    UITextView *textView = [[UITextView alloc] initWithFrame:textRect];
    textView.text = NSLocalizedString(@"Permission is hereby granted, free of charge, to any person obtaining "
                                      @"a copy of this software and associated documentation files (the "
                                      @"\"Software\"), to deal in the Software without restriction, including "
                                      @"without limitation the rights to use, copy, modify, merge, publish, "
                                      @"distribute, sublicense, and/or sell copies of the Software, and to "
                                      @"permit persons to whom the Software is furnished to do so, subject to "
                                      @"the following conditions...\"", nil);
    textView.textAlignment = NSTextAlignmentCenter;
    textView.font = [UIFont systemFontOfSize:14.0f];
    textView.textColor = [UIColor darkTextColor];
    textView.editable = NO;
    
    MDCParallaxView *parallaxView = [[MDCParallaxView alloc] initWithBackgroundView:backgroundImageView
                                                                     foregroundView:textView];
    parallaxView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    parallaxView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    parallaxView.backgroundHeight = 250.0f;
    parallaxView.scrollViewDelegate = self;
    [self.view addSubview:parallaxView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate Protocol Methods

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%@:%@", [self class], NSStringFromSelector(_cmd));
}

@end

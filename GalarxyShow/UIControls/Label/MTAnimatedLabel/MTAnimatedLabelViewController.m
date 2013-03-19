//
//  MTAnimatedLabelViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/21/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "MTAnimatedLabelViewController.h"
#import  <GalarxyUIKitLib/MTAnimatedLabel.h>

#define kMaxTranslation 190.0f
@interface MTAnimatedLabelViewController (){
    
    CGFloat sliderInitialX;
}

@end

@implementation MTAnimatedLabelViewController
@synthesize animatedLabel;
@synthesize slider;

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
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.slider addGestureRecognizer:pan];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.animatedLabel startAnimating];
    sliderInitialX = self.slider.frame.origin.x;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.animatedLabel stopAnimating];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pan:(UIPanGestureRecognizer *)gr
{
    if (gr.state == UIGestureRecognizerStateBegan) {
        [self.animatedLabel stopAnimating];
    }
    
    if (gr.state == UIGestureRecognizerStateChanged) {
        
        CGPoint t = [gr translationInView:self.view]; //get Translation
        
        CGRect f = self.slider.frame;
        f.origin.x = MAX(sliderInitialX, MIN(kMaxTranslation, f.origin.x+t.x)); //enforce slider bounds
        self.slider.frame = f;
        
        self.animatedLabel.alpha = 1-(self.slider.frame.origin.x/(kMaxTranslation*0.5 - sliderInitialX)); //calc label alpha
        
        [gr setTranslation:CGPointZero inView:self.view]; //reset translation
        
    }
    
    if (gr.state == UIGestureRecognizerStateEnded) {
        
        
        [UIView animateWithDuration:0.1 animations:^{
            CGRect f = self.slider.frame;
            f.origin.x = sliderInitialX;
            self.slider.frame = f;
        } completion:^(BOOL finished) {
            [self.animatedLabel startAnimating];
            self.animatedLabel.alpha = 1.0f;
        }];
        
    }
}

-(void)dealloc{
    
    [self setAnimatedLabel:nil];
    [self setSlider:nil];
}
@end

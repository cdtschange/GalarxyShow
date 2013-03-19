//
//  WCSliderBeforeAfterViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "WCSliderBeforeAfterViewController.h"
#import <GalarxyUIKitLib/WCSlider.h>
#import <GalarxyUIKitLib/WCBeforeAfter.h>

@interface WCSliderBeforeAfterViewController ()

@end

@implementation WCSliderBeforeAfterViewController

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
    
    WCBeforeAfter *before = [[WCBeforeAfter alloc] initWithLeftSideImage:[UIImage imageNamed:@"wcslider_final.jpg"] rightSideImage:[UIImage imageNamed:@"wcslider_original.jpg"]];
    before.frame = CGRectMake(0, 0, 224, 300);
    UIImageView *slider = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wcslider_slider"]];
    
    before.sliderView = [[WCSlider alloc] initWithFrame:CGRectMake(0, 0, slider.frame.size.width, before.frame.size.height)];
    [before.sliderView addSubview:slider];
    before.sliderView.contentMode = UIViewContentModeCenter;
    
    slider.center = CGPointMake(slider.center.x, before.sliderView.center.y);
    
    [self.view addSubview:before];
//    before.center = self.view.center;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

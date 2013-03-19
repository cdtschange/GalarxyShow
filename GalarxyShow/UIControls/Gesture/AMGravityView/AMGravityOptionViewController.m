//
//  AMGravityOptionViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "AMGravityOptionViewController.h"

@interface AMGravityOptionViewController ()
{
    //    id<MotionOptionViewControllerDelegate> delegate;
    double scale;
}
@end

@implementation AMGravityOptionViewController
@synthesize delegate;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)sliderChange:(UISlider *)sender
{
    scale = sender.value;
}

- (IBAction)save:(UIButton *)sender
{
    NSLog(@"Slider value : %f", scale);
    [self.delegate motionOption:self saveWithMotionScale:scale];
}

@end

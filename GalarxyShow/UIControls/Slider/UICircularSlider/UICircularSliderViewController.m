//
//  UICircularSliderViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/13/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "UICircularSliderViewController.h"
#import <GalarxyUIKitLib/UICircularSlider.h>

@interface UICircularSliderViewController ()


@property (unsafe_unretained, nonatomic) IBOutlet UISlider *slider;
@property (unsafe_unretained, nonatomic) IBOutlet UIProgressView *progressView;
@property (unsafe_unretained, nonatomic) IBOutlet UICircularSlider *circularSlider;
@end

@implementation UICircularSliderViewController
@synthesize slider = _slider;
@synthesize progressView = _progressView;
@synthesize circularSlider = _circularSlider;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc{
    
	[self setProgressView:nil];
	[self setCircularSlider:nil];
	[self setSlider:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	[self.circularSlider addTarget:self action:@selector(updateProgress:) forControlEvents:UIControlEventValueChanged];
	[self.circularSlider setMinimumValue:self.slider.minimumValue];
	[self.circularSlider setMaximumValue:self.slider.maximumValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateProgress:(UISlider *)sender {
	float progress = translateValueFromSourceIntervalToDestinationInterval(sender.value, sender.minimumValue, sender.maximumValue, 0.0, 1.0);
	[self.progressView setProgress:progress];
	[self.circularSlider setValue:sender.value];
	[self.slider setValue:sender.value];
}

@end

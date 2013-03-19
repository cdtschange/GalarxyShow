//
//  TISpringLoadedViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/11/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "TISpringLoadedViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <GalarxyUIKitLib/TISpringLoadedSpinnerView.h>
#import <GalarxyUIKitLib/TISpringLoadedView.h>

@interface TISpringLoadedViewController ()
{
	TISpringLoadedSpinnerView * spinnerView;
	TISpringLoadedView * springLoadedView;
	CADisplayLink * displayLink;
}

@end

@implementation TISpringLoadedViewController

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
    
    springLoadedView = [[TISpringLoadedView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
	[springLoadedView setRestCenter:CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds))]; // Set where the view should spring back to.
	[springLoadedView setSpringConstant:500]; // Set a spring constant. Effectively, as you increase this, the speed at which the spring returns to rest increases
	[springLoadedView setDampingCoefficient:15]; // A damping coefficient. Shouldn't be negative or you'll bounce off screen.
	[springLoadedView setInheritsPanVelocity:YES]; // Setting to YES allows you to throw the view. Doesn't play nice with panDistanceLimits.
	[springLoadedView setBackgroundColor:[UIColor whiteColor]];
	[self.view addSubview:springLoadedView];
	
	// Like the one in the Letterpress app by Loren Brichter (atebits.com)
	spinnerView = [[TISpringLoadedSpinnerView alloc] initWithFrame:CGRectInset(springLoadedView.bounds, 15, 15)];
	[springLoadedView addSubview:spinnerView];
	
	// Create the display link. I use one to handle all the views.
	displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkTick:)];
	[displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:(id)kCFRunLoopCommonModes];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	[springLoadedView setRestCenter:CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds))];
}

- (void)displayLinkTick:(CADisplayLink *)link {
	[spinnerView simulateSpringWithDisplayLink:link];
	[springLoadedView simulateSpringWithDisplayLink:link];
}

- (void)dealloc {
	[displayLink invalidate];
}


@end

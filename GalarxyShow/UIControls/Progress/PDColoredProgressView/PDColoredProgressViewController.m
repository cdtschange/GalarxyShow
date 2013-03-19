//
//  PDColoredProgressViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "PDColoredProgressViewController.h"
#import <GalarxyUIKitLib/PDColoredProgressView.h>

@interface PDColoredProgressViewController ()

@end

@implementation PDColoredProgressViewController

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
    NSArray *colors = [NSArray arrayWithObjects:
					   [UIColor redColor],
					   [UIColor purpleColor],
					   [UIColor blueColor],
					   [UIColor colorWithRed: 27.0/255.0 green: 175.0/255.0 blue: 57.0/255.0 alpha: 1],
					   [UIColor orangeColor],
					   [UIColor magentaColor],
					   [UIColor brownColor],
					   [UIColor blackColor],
					   nil];
	
	int i = 0;
	
	for(i = 0 ; i < [colors count] ; i++)
	{
		PDColoredProgressView *progressView = [[PDColoredProgressView alloc] initWithProgressViewStyle: UIProgressViewStyleDefault];
		CGRect frame = progressView.frame;
		frame.size.width = 300;
		frame.origin.x = 10;
		frame.origin.y = 10 * (i + 1) + 10 * i;
		progressView.frame = frame;
        [progressView setProgress:(i+1) * (1.0/[colors count])];
		[progressView setTintColor: [colors objectAtIndex: i]];
		[self.view addSubview: progressView];
	}
	
	i+= 3;
	
	//draw an original UIProgressView to compare to the PDColoredProgressView
	UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle: UIProgressViewStyleDefault];
	CGRect frame = progressView.frame;
	frame.size.width = 300;
	frame.origin.x = 10;
	frame.origin.y = 10 * (i + 1) + 10 * i;
	progressView.frame = frame;
    progressView.progress = 0.5;
	[self.view addSubview: progressView];
	
	PDColoredProgressView *pView = [[PDColoredProgressView alloc] initWithProgressViewStyle: UIProgressViewStyleDefault];
	frame = pView.frame;
	frame.size.width = 300;
	frame.origin.x = 10;
	frame.origin.y = 10 * (i + 1) + 10 * i + 20;
	pView.frame = frame;
	pView.progress = 0.5;
	[pView setTintColor: [UIColor blackColor]];
	[self.view addSubview: pView];
	
	/** Draw a progressview and set the progress animated **/
	PDColoredProgressView *animatedProgressView = [[PDColoredProgressView alloc] initWithProgressViewStyle: UIProgressViewStyleDefault];
	frame = pView.frame;
	frame.origin.y += 50;
	animatedProgressView.frame = frame;
	[animatedProgressView setProgress: 0.75 animated: YES];
	[animatedProgressView setTintColor: [UIColor redColor]];
	[self.view addSubview: animatedProgressView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

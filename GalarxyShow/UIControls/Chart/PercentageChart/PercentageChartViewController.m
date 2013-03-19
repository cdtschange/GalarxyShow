//
//  PercentageChartViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/8/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "PercentageChartViewController.h"
#import <GalarxyUIKitLib/PercentageChart.h>

@interface PercentageChartViewController ()
{
    CGFloat _percentage;
}
@end

@implementation PercentageChartViewController

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
    self.navigationItem.leftBarButtonItem = [UIManager createCloseBarButtonItem:self];
    
    _percentage = 10.0;
    
    
    UIColor *orange = [UIColor colorWithRed:0.83 green:0.38 blue:0.0 alpha:1.0];
    
    [chart setMainColor:orange];
    [chart setSecondaryColor:[UIColor darkGrayColor]];
    [chart setLineColor:[UIColor orangeColor]];
    [chart setFontName:@"Helvetica-Bold"];
    [chart setFontSize:30.0];
    [chart setText:@"progress"];
    
    [chart setPercentage:73.5];
}
- (void)goBack:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}
-(void) onGo:(id)sender
{
    chart.percentage = _percentage;
    _percentage +=20;
    if( _percentage > 100.0 )
        _percentage -= 101.0;
}
@end

//
//  CharViewController.m
//  CharViewTest
//
//  Created by star  on 9/18/12.
//  Copyright (c) 2012 star . All rights reserved.
//

#import "JTYBatteryBarChartViewController.h"
#import <GalarxyUIKitLib/BatteryChartView.h>

@interface JTYBatteryBarChartViewController ()

@end

@implementation JTYBatteryBarChartViewController

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
    int px, py;
    
    
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        
        if ( self.interfaceOrientation == UIDeviceOrientationLandscapeLeft || self.interfaceOrientation == UIDeviceOrientationLandscapeRight)
        {
            px = 1024-40;
            py = 768-44;
        }
        
    }
    
//    ChartView *v = [[ChartView alloc] initWithFrame:CGRectMake(0, 0, px, py)];
	
	NSArray *g1 = [NSArray arrayWithObjects:
                   [NSNumber numberWithFloat:78],
                   [NSNumber numberWithFloat:82],
                   
                   [NSNumber numberWithFloat:90.2],
                   [NSNumber numberWithFloat:94.1],
                   [NSNumber numberWithFloat:92.5],
                   [NSNumber numberWithFloat:93.9],
                   [NSNumber numberWithFloat:95.2],
                   [NSNumber numberWithFloat:93.5],nil];
    
    NSArray *g2 = [NSArray arrayWithObjects:
                   [NSNumber numberWithFloat:38],
                   [NSNumber numberWithFloat:42],
                   [NSNumber numberWithFloat:50.2],
                   [NSNumber numberWithFloat:54.1],
                   [NSNumber numberWithFloat:52.5],
                   [NSNumber numberWithFloat:53.9],
                   [NSNumber numberWithFloat:55.2],
                   [NSNumber numberWithFloat:53.5],nil];
    
    NSArray *g = [NSArray arrayWithObjects:g1, g2, nil];
//    NSArray *g = [NSArray arrayWithObjects:g1,  nil];
    
    NSArray *xL = [NSArray arrayWithObjects:@"2002",@"2003",@"2004",@"2005",@"2006",@"2007",@"2008",@"2009", nil];
    NSArray *ct = [NSArray arrayWithObjects:@"某某历年销量水平柱状图",@"某某历年销量水平柱状图详细介绍", nil];
    
//	v.groupData = g;
//    v.xAxisLabel = xL;
//    v.chartTitle = ct;
//    v.chartType = GRChartType;
////    v.chartType = REDChartType;
//    v.backgroundColor = [UIColor clearColor];
//	
//    v.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
//    
//    [self.view addSubview:v];
//	
//	[v release];
    
    
    NSDictionary* dic = [NSDictionary  dictionaryWithObjectsAndKeys:g,@"groupData",xL,@"xAxisLabel",ct,@"chartTitle", nil];
    #define CHAR_VIEW_FRAME CGRectMake(0, 0, px, py)
    BatteryChartView *v2 = [[BatteryChartView alloc] initWithFrame:CHAR_VIEW_FRAME withArrary:dic withType:GRChartType];
    [self.view addSubview:v2];
                        
                        
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end

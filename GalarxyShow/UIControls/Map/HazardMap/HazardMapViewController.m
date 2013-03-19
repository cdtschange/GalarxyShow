//
//  HazardMapViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/22/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "HazardMapViewController.h"
#import <GalarxyUIKitLib/HazardMap.h>
#import <GalarxyUIKitLib/HazardMapView.h>

@interface HazardMapViewController ()

@end

@implementation HazardMapViewController

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
    NSString *hazardPath = [[NSBundle mainBundle] pathForResource:@"UShazard.20081229.pga.5pc50"
                                                           ofType:@"bin"];
    HazardMap *hazards = [[HazardMap alloc] initWithHazardMapFile:hazardPath];
    
    // Position and zoom the map to just fit the grid loaded on screen
    [map setVisibleMapRect:[hazards boundingMapRect]];
    
    float locations[] = {100.22569199999998,26.876812,
        100.233836,26.876952,
        100.14611000000002,26.862355,
        100.23457800000006,26.883319,
        100.261212,27.097237};
    MKMapPoint* points = malloc(sizeof(CLLocationCoordinate2D) * 5);
    for (int i = 0; i < 5; i++) {
        CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(locations[2*i+1], locations[2*i]);
        points[i] = MKMapPointForCoordinate(coord);
    }
    MKPolyline *line = [MKPolyline polylineWithPoints:points count:5];
    
    
    // Add the earthquake hazard map to the map view
    [map addOverlay:hazards];
    
    [map addOverlay:line];
    
    NSArray *overlays = [map overlays];
    NSLog(@"overlays: %i", [overlays count]);
    
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKPolyline class]])
    {
        MKPolylineView *lineview = [[MKPolylineView alloc] initWithOverlay:overlay];
        lineview.fillColor = [UIColor redColor];
        lineview.strokeColor=[[UIColor redColor] colorWithAlphaComponent:0.5];
        lineview.lineWidth=2.0;
        return lineview;
    } else {
        HazardMapView *view = [[HazardMapView alloc] initWithOverlay:overlay];
        return view;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

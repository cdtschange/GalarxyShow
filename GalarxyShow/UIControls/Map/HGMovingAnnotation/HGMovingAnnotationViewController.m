//
//  HGMovingAnnotationViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/22/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "HGMovingAnnotationViewController.h"
#import <GalarxyUIKitLib/HGMovingAnnotation.h>
#import <GalarxyUIKitLib/HGMovingAnnotationView.h>

@interface HGMovingAnnotationViewController ()

@end

@implementation HGMovingAnnotationViewController

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
    
	// create the path for the moving object
	NSString *nmeaLogPath = [[NSBundle mainBundle] pathForResource:@"path" ofType:@"nmea"];
	HGMapPath *path = [[HGMapPath alloc] initFromFile:nmeaLogPath];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didLoadPath:) name:kPathLoadedNotification object:path];
}
- (void)goBack:(id)sender {
    NSString *nmeaLogPath = [[NSBundle mainBundle] pathForResource:@"path" ofType:@"nmea"];
    HGMapPath *path = [[HGMapPath alloc] initFromFile:nmeaLogPath];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:kPathLoadedNotification object:path];
    [self dismissModalViewControllerAnimated:YES];
}

-(void)dealloc{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) didLoadPath : (NSNotification*) notification
{
	// initialize our moving object
	HGMapPath *path = (HGMapPath*)[notification object];
	HGMovingAnnotation *movingObject = [[HGMovingAnnotation alloc] initWithMapPath:path]; //the annotation retains its path
	
	// add the annotation to the map
	[_mapView addAnnotation:movingObject];
	
	// zoom the map around the moving object
	MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
	MKCoordinateRegion region = MKCoordinateRegionMake(MKCoordinateForMapPoint(movingObject.currentLocation), span);
	[_mapView setRegion:region animated:YES];
	
	// start moving the object
	[movingObject start];
}


#pragma mark -
#pragma mark MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation;
{
	static NSString *kMovingAnnotationViewId = @"HGMovingAnnotationView";
	
	HGMovingAnnotationView *annotationView = (HGMovingAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:kMovingAnnotationViewId];
	if (!annotationView) {
		annotationView = [[HGMovingAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kMovingAnnotationViewId];
	}
	
	//configure the annotation view
	annotationView.image = [UIImage imageNamed:@"symbol-moving-annotation.png"];
	annotationView.bounds = CGRectMake(0, 0, 20, 20); //initial bounds (default)
	annotationView.mapView = mapView;
	
	return annotationView;
	
}
@end

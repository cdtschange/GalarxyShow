//
//  MapAnnotationSpikeViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/21/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "MapAnnotationSpikeViewController.h"
#import <GalarxyUIKitLib/SplikeBasicMapAnnotation.h>
#import <GalarxyUIKitLib/SplikeCalloutMapAnnotation.h>
#import <GalarxyUIKitLib/SplikeCalloutMapAnnotationView.h>

@interface MapAnnotationSpikeViewController ()
{
	SplikeCalloutMapAnnotation *calloutAnnotation;
	MKAnnotationView *selectedAnnotationView;
	SplikeBasicMapAnnotation *customAnnotation;
	SplikeBasicMapAnnotation *normalAnnotation;
    
}

@end

@implementation MapAnnotationSpikeViewController
@synthesize mapView = _mapView;

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
    
	self.mapView.delegate = self;
	
	customAnnotation = [[SplikeBasicMapAnnotation alloc] initWithLatitude:38.6335 andLongitude:-90.2045];
	[self.mapView addAnnotation:customAnnotation];
	
	normalAnnotation = [[SplikeBasicMapAnnotation alloc] initWithLatitude:38 andLongitude:-90.2045];
	normalAnnotation.title = @"                                                         ";
	[self.mapView addAnnotation:normalAnnotation];
	
	CLLocationCoordinate2D coordinate = {38.315, -90.2045};
	[self.mapView setRegion:MKCoordinateRegionMake(coordinate,
												   MKCoordinateSpanMake(1, 1))];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
	if (view.annotation == customAnnotation) {
		if (calloutAnnotation == nil) {
            calloutAnnotation = [[SplikeCalloutMapAnnotation alloc] initWithLatitude:view.annotation.coordinate.latitude
																	   andLongitude:view.annotation.coordinate.longitude];
		} else {
			calloutAnnotation.latitude = view.annotation.coordinate.latitude;
			calloutAnnotation.longitude = view.annotation.coordinate.longitude;
		}
		[self.mapView addAnnotation:calloutAnnotation];
		selectedAnnotationView = view;
	}
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
	if (calloutAnnotation && view.annotation == customAnnotation) {
		[self.mapView removeAnnotation: calloutAnnotation];
	}
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	if (annotation == calloutAnnotation) {
		SplikeCalloutMapAnnotationView *calloutMapAnnotationView = (SplikeCalloutMapAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"SplikeCalloutAnnotation"];
		if (!calloutMapAnnotationView) {
			calloutMapAnnotationView = [[SplikeCalloutMapAnnotationView alloc] initWithAnnotation:annotation
																			 reuseIdentifier:@"SplikeCalloutAnnotation"];
			calloutMapAnnotationView.contentHeight = 78.0f;
			UIImage *asynchronyLogo = [UIImage imageNamed:@"mapsplike_asynchrony-logo-small.png"];
			UIImageView *asynchronyLogoView = [[UIImageView alloc] initWithImage:asynchronyLogo];
			asynchronyLogoView.frame = CGRectMake(5, 2, asynchronyLogoView.frame.size.width, asynchronyLogoView.frame.size.height);
			[calloutMapAnnotationView.contentView addSubview:asynchronyLogoView];
		}
		calloutMapAnnotationView.parentAnnotationView = selectedAnnotationView;
		calloutMapAnnotationView.mapView = self.mapView;
		return calloutMapAnnotationView;
	} else if (annotation == customAnnotation) {
		MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
																			   reuseIdentifier:@"SplikeCustomAnnotation"];
		annotationView.canShowCallout = NO;
		annotationView.pinColor = MKPinAnnotationColorGreen;
		return annotationView;
	} else if (annotation == normalAnnotation) {
		MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
																			   reuseIdentifier:@"SplikeNormalAnnotation"];
		annotationView.canShowCallout = YES;
		annotationView.pinColor = MKPinAnnotationColorPurple;
		return annotationView;
	}
	
	
	return nil;
}

@end

//
//  AnimatedCalloutViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/22/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "AnimatedCalloutViewController.h"
#import "ACHotelDetailViewController.h"
#import "ACHotel.h"
#import "ACHotelAnnotation.h"
#import "UIManager.h"

@interface AnimatedCalloutViewController ()
{
    NSArray *hotels;
}
- (void)showAnnotations;
@end

@implementation AnimatedCalloutViewController
- (id)init {
	if (!(self = [super initWithNibName:@"AnimatedCalloutViewController" bundle:nil])) {
		return nil;
	}
	return self;
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (void)goBack:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem = [UIManager createCloseBarButtonItem:self];
    
    
	MKCoordinateRegion startupRegion;
	
	// Coordinates for part of downtown San Francisco - around Moscone West, no less.
	startupRegion.center = CLLocationCoordinate2DMake(37.785334, -122.406964);
	startupRegion.span = MKCoordinateSpanMake(0.003515, 0.007129);
	[self.mapView setRegion:startupRegion animated:YES];
	[self.mapView setShowsUserLocation:NO];
	
	// Our superclass needs access to the data for the custom callout without knowing implementation details.
	self.detailDataSource = self;
	
	ACHotelDetailViewController *controller = [[ACHotelDetailViewController alloc] initWithNibName:@"ACHotelDetailTableView" bundle:nil];
	self.calloutDetailController = controller;
	
	[self showAnnotations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAnnotations {
	NSMutableArray *hotelAnnotations = [NSMutableArray arrayWithCapacity:4];
	for (NSDictionary *hotel in self.hotels) {
		
		ACHotel *theHotel = [[ACHotel alloc] init];
		theHotel.name = [hotel objectForKey:@"name"];
		theHotel.street = [hotel objectForKey:@"street"];
		theHotel.city = [hotel objectForKey:@"city"];
		theHotel.state = [hotel objectForKey:@"state"];
		theHotel.zip = [hotel objectForKey:@"zip"];
		theHotel.phone = [hotel objectForKey:@"phone"];
		theHotel.url = [hotel objectForKey:@"url"];
		theHotel.latitude = [[hotel objectForKey:@"latitude"] doubleValue];
		theHotel.longitude = [[hotel objectForKey:@"longitude"] doubleValue];
		
		ACHotelAnnotation *annotation = [[ACHotelAnnotation alloc] initWithLatitude:theHotel.latitude longitude:theHotel.longitude];
		annotation.hotel = theHotel;
		
		[hotelAnnotations addObject:annotation];
		
	}
	
	[self.mapView addAnnotations:hotelAnnotations];
}


#pragma mark -
#pragma mark GIKCalloutDetailDataSource

// Data object for the detail view of the callout.
- (void)detailController:(UIViewController *)detailController detailForAnnotation:(id)annotation {
	[(ACHotelDetailViewController *)detailController setHotel:[(ACHotelAnnotation *)annotation hotel]];
}

#pragma mark Accessors

- (NSArray *)hotels {
	if (hotels == nil) {
		hotels = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ACHotels" ofType:@"plist"]];
	}
	return hotels;
}
@end

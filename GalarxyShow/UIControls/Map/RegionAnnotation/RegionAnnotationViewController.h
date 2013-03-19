//
//  ViewController.h
//  RCLocationManager_SampleProject
//
//  Created by Ricardo Caballero Moral on 04/08/12.
//  Copyright (c) 2012 Ricardo Caballero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import <GalarxyUIKitLib/RegionAnnotation.h>
#import <GalarxyUIKitLib/RegionAnnotationView.h>
#import <GalarxyUIKitLib/RCLocationManager.h>
#import "ControlBaseViewController.h"

@interface RegionAnnotationViewController : ControlBaseViewController

@property (nonatomic, assign) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIView *infoBox;;

- (IBAction)addRegion:(id)sender;
@end

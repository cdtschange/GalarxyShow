//
//  MapAnnotationSpikeViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/21/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ControlBaseViewController.h"

@interface MapAnnotationSpikeViewController : ControlBaseViewController<MKMapViewDelegate>
@property (nonatomic, weak) IBOutlet MKMapView *mapView;

@end

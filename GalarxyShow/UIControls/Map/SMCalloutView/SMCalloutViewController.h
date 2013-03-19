//
//  SMCalloutViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/22/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/SMCalloutView.h>
#import <MapKit/MapKit.h>
#import "ControlBaseViewController.h"

@interface SMCalloutViewController : ControlBaseViewController<MKMapViewDelegate, SMCalloutViewDelegate>

@end

@interface SMCalloutMapAnnotation : NSObject <MKAnnotation>
@property (nonatomic, copy) NSString *title, *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@end

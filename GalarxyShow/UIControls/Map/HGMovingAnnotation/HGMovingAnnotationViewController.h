//
//  HGMovingAnnotationViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/22/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ControlBaseViewController.h"

@interface HGMovingAnnotationViewController : ControlBaseViewController<MKMapViewDelegate> {
    
	IBOutlet MKMapView *_mapView;
}


@end

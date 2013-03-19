//
//  VPPMapClusterViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/22/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"
#import <MapKit/MapKit.h>
#import <GalarxyUIKitLib/VPPMapHelperDelegate.h>
#import <GalarxyUIKitLib/VPPMapHelper.h>

@interface VPPMapClusterViewController : ControlBaseViewController<VPPMapHelperDelegate>

@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@end

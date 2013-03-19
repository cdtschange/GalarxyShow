//
//  iCodeMapViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/22/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ControlBaseViewController.h"

@interface iCodeMapViewController : ControlBaseViewController<MKMapViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableview;
@property (nonatomic, weak) IBOutlet MKMapView *mapView;

-(void)loadOurAnnotations;


@end

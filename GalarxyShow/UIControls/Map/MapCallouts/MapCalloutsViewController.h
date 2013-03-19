//
//  MapCalloutsViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/22/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"
#import <MapKit/MapKit.h>

@class MapCalloutsDetailViewController;

@interface MapCalloutsViewController : ControlBaseViewController<MKMapViewDelegate>

@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) MapCalloutsDetailViewController *detailViewController;

@property (nonatomic, strong) NSMutableArray *mapAnnotations;

+ (CGFloat)annotationPadding;
+ (CGFloat)calloutHeight;

- (IBAction)cityAction:(id)sender;
- (IBAction)bridgeAction:(id)sender;
- (IBAction)allAction:(id)sender;


@end

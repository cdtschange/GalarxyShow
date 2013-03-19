//
//  CustomMKMapViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/23/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@protocol MapViewControllerDidSelectDelegate;

@interface CustomMKMapViewController : UIViewController<MKMapViewDelegate>


@property(nonatomic,strong)IBOutlet MKMapView *mapView;

@property(nonatomic,assign)id<MapViewControllerDidSelectDelegate> delegate;

- (void)resetAnnitations:(NSArray *)data;
@end

@protocol MapViewControllerDidSelectDelegate <NSObject>

@optional
- (void)customMKMapViewDidSelectedWithInfo:(id)info;

@end
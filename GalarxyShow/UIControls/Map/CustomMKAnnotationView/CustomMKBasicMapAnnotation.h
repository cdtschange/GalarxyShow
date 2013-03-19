#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomMKBasicMapAnnotation : NSObject <MKAnnotation> 

@property (nonatomic, copy) NSString *title;

- (id)initWithLatitude:(CLLocationDegrees)latitude
		  andLongitude:(CLLocationDegrees)longitude;
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end

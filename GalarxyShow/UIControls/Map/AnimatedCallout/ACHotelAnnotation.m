//
//  HotelAnnotation.m
//  AnimatedCallout
//
//  Created by Gordon on 2/14/11.
//  Copyright 2011 GeeksInKilts. All rights reserved.
//

#import "ACHotelAnnotation.h"
#import "ACHotel.h"

@interface ACHotelAnnotation ()

@end


@implementation ACHotelAnnotation
@synthesize hotel;

- (void)dealloc {
	self.hotel =nil;
}

- (id)initWithLatitude:(CLLocationDegrees)theLatitude longitude:(CLLocationDegrees)theLongitude {
	if (!(self = [super initWithLatitude:theLatitude longitude:theLongitude])) {
		return nil;
	}
	
	return self;
}

- (NSString *)title {
	return [self.hotel name];
}

@end

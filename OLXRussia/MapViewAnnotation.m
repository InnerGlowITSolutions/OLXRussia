//
//  MapViewAnnotation.m
//  Map
//
//  Created by sadik on 2/26/13.
//  Copyright (c) 2013 sedin. All rights reserved.
//

#import "MapViewAnnotation.h"

@implementation MapViewAnnotation
@synthesize title, coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d {
	self=[super init];
	title = ttl;
	coordinate = c2d;
	return self;
}



@end

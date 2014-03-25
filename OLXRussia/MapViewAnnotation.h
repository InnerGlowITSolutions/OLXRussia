//
//  MapViewAnnotation.h
//  Map
//
//  Created by sadik on 2/26/13.
//  Copyright (c) 2013 sedin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapViewAnnotation : NSObject<MKAnnotation>{
    
	NSString *title;
	CLLocationCoordinate2D coordinate;
    
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString *)Locationtitle andCoordinate:(CLLocationCoordinate2D)c2d;


@end

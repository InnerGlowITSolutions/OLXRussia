//
//  MapViewController.h
//  OLXRussia
//
//  Created by Rejo Joseph on 20/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface MapViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager* locationManager;
    CLLocationCoordinate2D CurrentLocationCoordinate;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)dismissMap:(id)sender;
@end

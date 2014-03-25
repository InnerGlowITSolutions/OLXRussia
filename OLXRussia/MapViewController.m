//
//  MapViewController.m
//  OLXRussia
//
//  Created by Rejo Joseph on 20/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import "MapViewController.h"
#import "MapViewAnnotation.h"
@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [locationManager startUpdatingLocation];
    
    CurrentLocationCoordinate = CLLocationCoordinate2DMake(locationManager.location.coordinate.latitude,locationManager.location.coordinate.longitude);
    NSLog(@"CURRENT LAN %f LON %f", locationManager.location.coordinate.latitude,locationManager.location.coordinate.longitude);

    MapViewAnnotation *pin = [[MapViewAnnotation alloc] initWithTitle:@"MyLocation" andCoordinate:CurrentLocationCoordinate];
    
    
    MKMapRect zoomRect = MKMapRectNull;
    for (id <MKAnnotation> annotation in _mapView.annotations)
    {
        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.1, 0.1);
        if (MKMapRectIsNull(zoomRect)) {
            zoomRect = pointRect;
        } else {
            zoomRect = MKMapRectUnion(zoomRect, pointRect);
        }
        
        
    }
    [_mapView addAnnotation:pin];
    [_mapView setVisibleMapRect:zoomRect animated:YES];
    
    [super viewDidLoad];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKAnnotationView *AnnotationView = nil;
    if ([annotation isKindOfClass:MKUserLocation.class])
    {
        AnnotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"UserLocation"];
        if (AnnotationView == nil)  {
            AnnotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"UserLocation"];
        }
        else
        {
        AnnotationView.annotation = annotation;
        AnnotationView.enabled = YES;
        AnnotationView.canShowCallout = YES;
        AnnotationView.image = [UIImage imageNamed:@"map_pin.png"];
        }
    }
    
        return AnnotationView;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissMap:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

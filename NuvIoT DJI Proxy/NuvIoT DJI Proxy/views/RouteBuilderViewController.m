//
//  RouteBuilderViewController.m
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/12/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

#import <DJISDK/DJISDK.h>
#import <VideoPreviewer/VideoPreviewer.h>

#pragma clang diagnostic pop

#import "RouteBuilderViewController.h"


@interface RouteBuilderViewController ()

@end

@implementation RouteBuilderViewController

- (instancetype)init
{
    if (self = [super init]) {
        
        self.editPoints = [[NSMutableArray alloc] init];
        
    }
    
    return self;
}

- (void)addPoint:(CGPoint)point withMapView:(MKMapView *)mapView
{
    
    CLLocationCoordinate2D coordinate = [mapView convertPoint:point toCoordinateFromView:mapView];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    [_editPoints addObject:location];
    MKPointAnnotation* annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = location.coordinate;
    [mapView addAnnotation:annotation];
    
}

- (void)cleanAllPointsWithMapView:(MKMapView *)mapView
{
    [_editPoints removeAllObjects];
    NSArray* annos = [NSArray arrayWithArray:mapView.annotations];
    for (int i = 0; i < annos.count; i++) {
        id<MKAnnotation> ann = [annos objectAtIndex:i];
        
        if (![ann isEqual:self.aircraftAnnotation]) { //Add it to check if the annotation is the aircraft's and prevent it from removing
            [mapView removeAnnotation:ann];
        }
        
    }
}

- (NSArray *)wayPoints
{
    return self.editPoints;
}

-(void)updateAircraftLocation:(CLLocationCoordinate2D)location withMapView:(MKMapView *)mapView
{
    if (self.aircraftAnnotation == nil) {
        self.aircraftAnnotation = [[AircraftAnnotation alloc] initWithCoordiante:location];
        [mapView addAnnotation:self.aircraftAnnotation];
    }
    
    [self.aircraftAnnotation setCoordinate:location];
}

-(void)updateAircraftHeading:(float)heading
{
    if (self.aircraftAnnotation) {
        [self.aircraftAnnotation updateHeading:heading];
    }
}
@end

//
//  MapController.m
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/12/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapController.h"
#import "WayPoint.h"

@interface MapController ()

@end

@implementation MapController

- (instancetype)init
{
    if (self = [super init]) {
        
        self.editPoints = [[NSMutableArray alloc] init];
        
    }
    
    return self;
}

- (void)addPoint:(CGPoint)point withMapView:(MKMapView *)mapView{
    WayPoint *wayPoint = [[WayPoint alloc] init];

    CLLocationCoordinate2D coordinate = [mapView convertPoint:point toCoordinateFromView:mapView];
    wayPoint.geoLocation = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    wayPoint.index = (int)_editPoints.count + 1;
    wayPoint.title = [NSString stringWithFormat:@"Way Point %d", wayPoint.index];
    wayPoint.speedMS = (_editPoints.count > 0) ? ((WayPoint*)_editPoints[_editPoints.count - 1]).speedMS : 1.0f;
    wayPoint.altitude = (_editPoints.count > 0) ? ((WayPoint*)_editPoints[_editPoints.count - 1]).altitude : 1.0f;
    wayPoint.notes = @"";
    
    [_editPoints addObject:wayPoint];
    MKPointAnnotation* annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = wayPoint.geoLocation.coordinate;
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

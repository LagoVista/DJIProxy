//
//  DJIAircraftAnnotation.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/12/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef AircraftAnnotation_h
#define AircraftAnnotation_h
#import <MapKit/MapKit.h>
#import "AircraftAnnotationView.h"

@interface AircraftAnnotation : NSObject<MKAnnotation>

@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic, weak) AircraftAnnotationView* annotationView;

-(id) initWithCoordiante:(CLLocationCoordinate2D)coordinate;

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

-(void) updateHeading:(float)heading;

@end

#endif /* DJIAircraftAnnotation_h */

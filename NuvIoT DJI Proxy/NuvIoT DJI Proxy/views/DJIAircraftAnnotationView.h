//
//  DJIAircraftAnnotationView.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/12/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef DJIAircraftAnnotationView_h
#define DJIAircraftAnnotationView_h

#import <MapKit/MapKit.h>

@interface DJIAircraftAnnotationView : MKAnnotationView

-(void) updateHeading:(float)heading;

@end

#endif /* DJIAircraftAnnotationView_h */

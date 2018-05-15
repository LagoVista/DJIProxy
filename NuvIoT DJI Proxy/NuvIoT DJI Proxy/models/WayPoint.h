//
//  WayPoint.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/13/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef WayPoint_h
#define WayPoint_h

#import <MapKit/MapKit.h>
#import "JSONModelLib.h"

@interface WayPoint : JSONModel

@property (strong, nonatomic) CLLocation *geoLocation;
@property (strong, nonatomic) NSString *title;
@property float altitude;
@property float speedMS;
@property int index;

@property (strong, nonatomic) NSString *notes;

@end

#endif /* WayPoint_h */

//
//  WayPointTableViewCell.m
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/13/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WayPointTableViewCell.h"

@interface WayPointTableViewCell()

@property(nonatomic, strong) IBOutlet UILabel* pointIndex;
@property(nonatomic, strong) IBOutlet UILabel* title;
@property(nonatomic, strong) IBOutlet UILabel* location;

@end

@implementation WayPointTableViewCell

-(void) setWayPoint:(WayPoint *)wayPoint {
    _pointIndex.text = [NSString stringWithFormat: @"%d.", wayPoint.index];
    _title.text = wayPoint.title;
    _location.text = [NSString stringWithFormat: @"%f - %f",
                      wayPoint.geoLocation.coordinate.latitude, wayPoint.geoLocation.coordinate.longitude];
}

@end

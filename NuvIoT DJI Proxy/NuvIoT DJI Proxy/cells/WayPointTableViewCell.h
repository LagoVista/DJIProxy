//
//  WayPointTableViewCell.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/13/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef WayPointTableViewCell_h
#define WayPointTableViewCell_h

#import "../models/WayPoint.h"
#import <UIKit/UIKit.h>

@interface WayPointTableViewCell : UITableViewCell
-(void) setWayPoint:(WayPoint *)wayPoint;
@end

#endif /* WayPointTableViewCell_h */

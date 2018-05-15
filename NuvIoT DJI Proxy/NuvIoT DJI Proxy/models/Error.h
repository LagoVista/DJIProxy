//
//  Error.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/15/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef Error_h
#define Error_h

#import "JSONModel.h"

@interface Error : JSONModel
@property (strong, nonatomic) NSString *message;
@end

#endif /* Error_h */

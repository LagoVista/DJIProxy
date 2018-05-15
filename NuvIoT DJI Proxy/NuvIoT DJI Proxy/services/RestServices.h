//
//  RestServices.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/14/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef RestServices_h
#define RestServices_h
#import "JSONModelLib.h"

@interface RestServices : NSObject

FOUNDATION_EXPORT NSString *const ROOT_SERVICE_URI;

-(void)postMessage:(NSString *) path postData:(JSONModel *) model completion:(void (^)(id responseObject, NSError *error))completion;

@end

#endif /* RestServices_h */

//
//  RestServices.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/14/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef RestServices_h
#define RestServices_h
#include "AuthRequest.h"
#include "../models/AuthResponse.h"

#import "JSONModelLib.h"

@interface RestServices : NSObject

FOUNDATION_EXPORT NSString *const ROOT_SERVICE_URI;

-(void)postMessage:(NSString *) path postData:(JSONModel *) model completion:(void (^)(id responseObject, NSError *error))completion;
-(void)refreshAuthToken:(AuthRequest*)authRequest completion:(void (^)(InvokeResultAuthResponse *responseObject, NSError *error))completion; 

-(NSString *)getAuthToken;

@end

#endif /* RestServices_h */

//
//  AuthServices.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/14/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef AuthServices_h
#define AuthServices_h
#include "RestServices.h"
#include "AuthRequest.h"

#include "../models/AuthResponse.h"
@interface AuthServices : RestServices

-(void)login:(AuthRequest*)request completion:(void (^)(AuthResponse *responseObject, NSError *error))completion;;

@end
#endif /* AuthServices_h */

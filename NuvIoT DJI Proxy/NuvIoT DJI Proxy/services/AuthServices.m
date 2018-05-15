//
//  AuthServices.m
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/14/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "AuthServices.h"
#include "../models/AuthRequest.h"
@implementation AuthServices

-(void)login:(AuthRequest*)authRequest completion:(void (^)(id responseObject, NSError *error))completion; {
    [self postMessage:@"/api/v1/auth" postData:authRequest completion:^(id responseObject, NSError *error) {
        if (responseObject) {
            completion(responseObject, nil);
            // do what you want with the response object here
        } else {
            completion(nil, error);
        }}
     ];
}
@end

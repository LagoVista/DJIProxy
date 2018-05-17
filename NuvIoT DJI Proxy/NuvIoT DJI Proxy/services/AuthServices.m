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
#include "../models/AuthResponse.h"
#include "../models/InvokeResult.h"
@implementation AuthServices

-(void)login:(AuthRequest*)authRequest completion:(void (^)(InvokeResultAuthResponse *responseObject, NSError *error))completion; {
    [self postMessage:@"/api/v1/auth" postData:authRequest completion:^(NSData *responseObject, NSError *error) {
        if (responseObject) {
            NSString *json = [[NSString alloc] initWithData:responseObject encoding:NSNonLossyASCIIStringEncoding];
            NSLog(@"%@",json);
            NSError *err;
            
            InvokeResultAuthResponse *authResponse = [[InvokeResultAuthResponse alloc] initWithString:json error:&err];
            if(err) {
                NSLog(@"%@", err.userInfo);
            }
            else if(authResponse.successful)
            {
                NSLog(@"SUCCESS!");
            }
            else
            {
                NSLog(@"Not success %@", authResponse.errors[0].message);
            }
           
            completion(authResponse, nil);
            // do what you want with the response object here
        } else {
            completion(nil, error);
        }}
     ];
}
@end

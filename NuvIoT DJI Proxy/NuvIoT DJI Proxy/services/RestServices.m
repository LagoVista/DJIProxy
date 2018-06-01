//
//  RestServices.m
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/14/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RestServices.h"
#import "JSONModelLib.h"
#import "User.h"

@implementation RestServices

NSString *const ROOT_SERVICE_URI = @"https://api.nuviot.com";

-(void)refreshAuthToken:(AuthRequest*)authRequest completion:(void (^)(InvokeResultAuthResponse *responseObject, NSError *error))completion; {
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

-(NSString*) getAuthToken {
    return [User current].accessToken;
}

-(void)postMessage:(NSString *) path postData:(JSONModel *) model completion:(void (^)(id responseObject, NSError *error))completion {
    NSString *str = [NSString stringWithFormat:@"%@%@", ROOT_SERVICE_URI, path];
    NSURL *url = [NSURL URLWithString:str];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField: @"Content-Type"];// the request is JSON
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField: @"Accept"];      // the expected response is also JSON

    NSLog(@"%@",url);
    
    NSString *postString = [model toJSONString];
    NSLog(@"%@", postString);
    
    NSData *postData = [model toJSONData];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                                           fromData:postData completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                                                               if (!data) {
                                                                   NSLog(@"Error %@", error);
                                                                   if (completion) {
                                                                       dispatch_async(dispatch_get_main_queue(), ^{
                                                                           completion(nil, error);
                                                                       });
                                                                   }
                                                                   return;
                                                               }
                                                               
                                                               if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                                                   
                                                                   NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
                                                                   NSLog(@"HTTP status code: %ld", (long)statusCode);
                                                                   
                                                                   if (statusCode != 200) {
                                                                       if(data) {
                                                                           NSString *json = [[NSString alloc] initWithData:data encoding:NSNonLossyASCIIStringEncoding];
                                                                           NSLog(@"%@", json);
                                                                       }
                                                                       
                                                                       dispatch_async(dispatch_get_main_queue(), ^{
                                                                           completion(nil, [NSError errorWithDomain:@"not success http response" code:statusCode userInfo:nil ]);
                                                                       });
                                                                       return;
                                                                   }
                                                               }
                                                               
                                                               if (completion) {
                                                                   dispatch_async(dispatch_get_main_queue(), ^{
                                                                       completion(data, nil);
                                                                   });
                                                               }
                                                           }];
    [uploadTask resume];
}

@end

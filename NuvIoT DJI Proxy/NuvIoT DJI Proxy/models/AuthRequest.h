//
//  AuthRequest.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/14/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef AuthRequest_h
#define AuthRequest_h

#import "JSONModel.h"

@interface AuthRequest : JSONModel
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *appId;
@property (nonatomic, strong) NSString *deviceId;
@property (nonatomic, strong) NSString *appInstanceId;
@property (nonatomic, strong) NSString *grantType;
@property (nonatomic, strong) NSString *clientType;
@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, strong) NSString *refreshToken;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;
@end

#endif /* AuthRequest_h */

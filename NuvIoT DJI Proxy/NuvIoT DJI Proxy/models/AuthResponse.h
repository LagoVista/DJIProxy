//
//  AuthResponse.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/14/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef AuthResponse_h
#define AuthResponse_h

#import "JSONModel.h"
#import "EntityHeader.h"

@interface AuthResponse : JSONModel

@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *accessTokenExpiresUTC;
@property (nonatomic, strong) NSString *refreshToken;
@property (nonatomic, strong) NSString *refreshTokenExpiresUTC;
@property (nonatomic, strong) NSString *AppInstanceId;

@property bool isLockedOut;
@property (nonatomic, strong) EntityHeader *user;
@property (nonatomic, strong) EntityHeader *org;
@property (nonatomic, strong) NSArray<EntityHeader *> *roles;
@end

#endif /* AuthResponse_h */

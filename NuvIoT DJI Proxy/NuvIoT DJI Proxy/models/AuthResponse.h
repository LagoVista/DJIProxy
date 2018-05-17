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
#import "InvokeResult.h"

@interface AuthResponse : JSONModel

@property (nonatomic) NSString *accessToken;
@property (nonatomic) NSString *accessTokenExpiresUTC;
@property (nonatomic) NSString *refreshToken;
@property (nonatomic) NSString *refreshTokenExpiresUTC;
@property (nonatomic) NSString *appInstanceId;

@property bool isLockedOut;
@property (nonatomic) EntityHeader *user;
@property (nonatomic) EntityHeader *org;
@property (nonatomic) NSArray<EntityHeader *> *roles;

@end

@interface InvokeResultAuthResponse : InvokeResult

@property (nonatomic) AuthResponse *result;

@end

#endif /* AuthResponse_h */

//
//  User.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/14/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef User_h
#define User_h

#include "JSONModel.h"

@interface User : JSONModel

@property BOOL isAuthenticated;
@property (nonatomic, strong) NSString *appInstanceId;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *refreshToken;
@property (nonatomic, strong) NSString *accessTokenExpiresUTC;
@property (nonatomic, strong) NSString *refreshTokenExpiresUTC;

@property (readonly) bool accessTokenValid;
@property (readonly) bool refreshTokenValid;

+(User *) load;
+(User *) current;
-(void) save;

@end

#endif /* User_h */

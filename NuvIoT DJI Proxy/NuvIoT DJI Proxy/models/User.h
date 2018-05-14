//
//  User.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/14/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef User_h
#define User_h

@interface User : NSObject

@property BOOL *IsAuthenticated;
@property (nonatomic, strong) NSString *UserId;
@property (nonatomic, strong) NSString *UserName;
@property (nonatomic, strong) NSString *OrgId;
@property (nonatomic, strong) NSString *OrgName;
@property (nonatomic, strong) NSString *Email;
@property (nonatomic, strong) NSString *AuthToken;
@property (nonatomic, strong) NSString *RefreshToken;

-(void) load;
-(void) save;

@end

#endif /* User_h */

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
@property (nonatomic, strong) NSString *emailAddress;
@property (nonatomic, strong) NSString *password;

@end

#endif /* AuthRequest_h */

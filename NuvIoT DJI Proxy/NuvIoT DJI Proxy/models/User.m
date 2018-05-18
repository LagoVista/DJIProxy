//
//  User.m
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/14/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "User.h"

@implementation User

// According to this files written are automatically encrypted until the user first unlocks the device, should
// be acceptable for securing access/refresh tokens.
// https://developer.apple.com/documentation/uikit/core_app/protecting_the_user_s_privacy/encrypting_your_app_s_files

+(User *) load {
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"userinfo.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        NSError *err;
        User *user = [[User alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] error:&err];
        
        if(!err) {
            return user;
        }
        else {
            NSLog(@"%@ - %@", err, err.userInfo);
        }
    }
  
    User *user = [User alloc];
    user.isAuthenticated = false;
    return user;
}

-(void) save {
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"userinfo.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    
    NSString *json = [self toJSONString];
    
    // The main act...
    [[json dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
}

@end

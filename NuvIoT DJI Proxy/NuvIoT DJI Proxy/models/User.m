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

static User* currentUser;

+(User *) current {
    if(currentUser == nil){
        @throw [NSException exceptionWithName:@"User not initialized" reason:@"Attempt to access current user prior to initializtion" userInfo:nil];
    }
    
    return currentUser;
}

+(User *) load {
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"userinfo.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        NSError *err;
        User *user = [[User alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] error:&err];
        
        if(!err) {
            currentUser = user;
            return user;
        }
        else {
            NSLog(@"%@ - %@", err, err.userInfo);
        }
    }
 
    User *user = [User alloc];
    user.isAuthenticated = false;
    currentUser = user;
    return user;
}

-(bool) accessTokenValid {
    if(!self.isAuthenticated){
        return false;
    }
    
    if(self.accessTokenExpiresUTC == nil) {
        return false;
    }
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    
    NSDate *expriationDateWithBuffer = [[dateFormat dateFromString:self.accessTokenExpiresUTC] dateByAddingTimeInterval:-5 * 60];

    return [expriationDateWithBuffer compare:[NSDate date]] == NSOrderedDescending;
}

-(bool) refreshTokenValid {
    if(!self.isAuthenticated) {
        return false;
    }
    
    return true;
}

-(void) save {
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"userinfo.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    currentUser = self;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    
    NSString *json = [self toJSONString];
    
    // The main act...
    [[json dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
}

@end

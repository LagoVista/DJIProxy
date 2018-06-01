//
//  NuvIoT_DJI_ProxyTests.m
//  NuvIoT DJI ProxyTests
//
//  Created by Kevin D. Wolf on 6/1/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "User.h"

@interface NuvIoT_DJI_ProxyTests : XCTestCase

@end

@implementation NuvIoT_DJI_ProxyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAccessTokenExpires {
    User *user = [User load];
    user.isAuthenticated = true;
    NSDate *expiresInPast = [[NSDate date] dateByAddingTimeInterval:-60 * 60];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    user.accessTokenExpiresUTC = [dateFormat stringFromDate:expiresInPast];

    XCTAssertFalse(user.accessTokenValid);
  }

// We will say that the access token has expired if it is within 5 minutes of expiration date to account for time differences
- (void)testAccessTokenExpiresFiveMinuteBuffer {
    User *user = [User load];
    user.isAuthenticated = true;
    NSDate *expiresInPast = [[NSDate date] dateByAddingTimeInterval:+4.5 * 60];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    user.accessTokenExpiresUTC = [dateFormat stringFromDate:expiresInPast];
    
    XCTAssertFalse(user.accessTokenValid);
}

- (void)testAccessTokenValid {
    User *user = [User load];
    user.isAuthenticated = true;
    NSDate *expiresInFuture = [[NSDate date] dateByAddingTimeInterval:60 * 60];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    user.accessTokenExpiresUTC = [dateFormat stringFromDate:expiresInFuture];
    NSLog(@"%@", user.accessTokenExpiresUTC);
    
    XCTAssertTrue(user.accessTokenValid);
}

@end

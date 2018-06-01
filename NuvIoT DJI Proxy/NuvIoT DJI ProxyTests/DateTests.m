//
//  DateTests.m
//  NuvIoT DJI ProxyTests
//
//  Created by Kevin D. Wolf on 6/1/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface DateTests : XCTestCase

@end

@implementation DateTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testToJSONDate {
    NSDate *date = [NSDate date];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    NSString *newString = [dateFormat stringFromDate:date];
    NSLog(@"DATE AS FORMATTED %@", newString);
 }

- (void)testFromJSON {
    NSDate *date = [NSDate date];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    NSString *newString = [dateFormat stringFromDate:date];
    
    NSDate *restoredDate = [dateFormat dateFromString:newString];
   
    NSLog(@"DATE AS FORMATTED %@ - Original %@", newString, restoredDate);
}

@end

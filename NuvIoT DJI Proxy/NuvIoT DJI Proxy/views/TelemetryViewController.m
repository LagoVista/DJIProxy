//
//  TelemetryViewController.m
//  DJISdkDemo
//
//  Created by Kevin D. Wolf on 4/29/18.
//  Copyright © 2018 DJI. All rights reserved.
//

#import "TelemetryViewController.h"
#import <Foundation/Foundation.h>
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

#import <DJISDK/DJISDK.h>

#pragma clang diagnostic pop

@interface TelemetryViewController () <DJIFlightControllerDelegate>

@end

@implementation TelemetryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if([DJISDKManager product]){
        if([[DJISDKManager product] isKindOfClass:[DJIAircraft class]]){
            DJIFlightController		* fc = ((DJIAircraft *)[DJISDKManager product]).flightController;
            fc.delegate = self;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)postMessage:(NSString *) path postData:(NSData*) postData {
    NSString *str = [NSString stringWithFormat:@"http://mobileapptracker.sftlog.development.iothost.net:8085%@",path];
    NSURL *url = [NSURL URLWithString:str];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                                               fromData:postData completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                                                                   // Handle response here
                                                               }];
    
    [uploadTask resume];
}

-(void)flightController:(DJIFlightController *)fc didUpdateState:(DJIFlightControllerState *)state {
    NSDictionary *dict = @{@"latitude": [[NSNumber alloc] initWithDouble:state.aircraftLocation.coordinate.latitude],
                           @"longitude":[[NSNumber alloc] initWithDouble:state.aircraftLocation.coordinate.longitude],
                           @"altitude": [[NSNumber alloc] initWithDouble:state.aircraftLocation.altitude],
                           @"heading": [[NSNumber alloc] initWithDouble:fc.compass.heading]
                           };
    NSError *err;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&err];
    
    [self postMessage:@"/sensor/dji001/location" postData:jsonData];
}

- (IBAction)sendTelemetryTap:(UIButton*)sender {
    NSError *err;

    NSDictionary *dict = @{@"latitude": [[NSNumber alloc] initWithDouble:27.5],
                           @"longitude":[[NSNumber alloc] initWithDouble:-81],
                           @"altitude": [[NSNumber alloc] initWithDouble:250],
                           @"heading": [[NSNumber alloc] initWithDouble:120]
                           };
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&err];
    
    [self postMessage:@"/sensor/dji001/location" postData:jsonData];

     //       NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
   //     NSData *postData = [json dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
}
@end

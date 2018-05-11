//
//  ViewController.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/4/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

#import <DJISDK/DJISDK.h>
#import "MQTTClient.h"
#import <MQTTClient/MQTTSessionManager.h>

@interface ViewController : UIViewController<DJISDKManagerDelegate,MQTTSessionDelegate>

-(IBAction)onOpenClick :(id)sender;

@end


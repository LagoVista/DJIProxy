//
//  AppDelegate.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/4/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "./models/User.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, atomic) User *user;

@end


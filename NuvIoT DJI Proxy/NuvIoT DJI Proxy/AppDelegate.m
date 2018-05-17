//
//  AppDelegate.m
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/4/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

#import <DJISDK/DJISDK.h>
#import "./views/LoginViewController.h"

#pragma clang diagnostic pop

#import "User.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

static AppDelegate *_theApp;

+(AppDelegate *) theApp {
    return _theApp;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _theApp = self;
    
    self.user = [User load];
    
    UINavigationController *rootViewController;
    
    if(self.user.isAuthenticated) {
        rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc]
                                                                                 initWithNibName:@"ViewController"  bundle:nil]];
    }
    else {
        rootViewController = [[UINavigationController alloc] initWithRootViewController:[[LoginViewController alloc]
                                                                                         initWithNibName:@"LoginViewController"  bundle:nil]];
    }

    [rootViewController.navigationBar setBackgroundColor:[UIColor blackColor]];
    [rootViewController setToolbarHidden:YES];
    [self customizeAppearance];
    
    self.window.rootViewController = rootViewController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void) customizeAppearance {
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(double)(0x2a)/255 green:(double)(0x3b)/255 blue:(double)(0x55)/255 alpha:1.0]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

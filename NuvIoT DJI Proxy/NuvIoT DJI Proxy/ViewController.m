//
//  ViewController.m
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/4/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import "ViewController.h"
#import <DJISDK/DJISDK.h>

@interface ViewController ()<DJISDKManagerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerApp];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)registerApp {
    [DJISDKManager registerAppWithDelegate:self];
}

-(void)appRegisteredWithError:(NSError *)error {
    NSString *message = @"Register app failed.";
    if(error) {
        message = @"Register app failed, please enter your app key.";
    }
    else {
        NSLog(@"register app success");
    }
    
    [self showAlertWithTitle:@"Register App" withMessage:message];    
}

-(void) showAlertWithTitle:(NSString *)title withMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

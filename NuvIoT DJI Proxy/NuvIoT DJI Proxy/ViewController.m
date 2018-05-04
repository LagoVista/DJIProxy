//
//  ViewController.m
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/4/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import "ViewController.h"
#import "TelemetryViewController.h"
#import <DJISDK/DJISDK.h>

@interface ViewController ()<DJISDKManagerDelegate, DJIFlightControllerDelegate>

@property (nonatomic, weak) DJIBaseProduct* product;

@property (weak, nonatomic) IBOutlet UILabel *productModel;
@property (weak, nonatomic) IBOutlet UILabel *productConnectionStatus;
@property (weak, nonatomic) IBOutlet UILabel *version;

@property (weak, nonatomic) IBOutlet UIButton *connectButton;

@end

@implementation ViewController

-(IBAction)onOpenClick :(id)sender {
    TelemetryViewController *vc = [[TelemetryViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void) productConnected:(DJIBaseProduct *)product {
    if(product) {
        self.product = product;
        [self.connectButton setEnabled:YES];
    }
    else {
        _productConnectionStatus.text = @"Status: trying to connect";
        _productModel.hidden = YES;
    }
    [self updateStatusBasedOn:product];
}

-(void)flightController:(DJIFlightController* )fc didUpdateState:(DJIFlightControllerState * _Nonnull)state {
    
}

-(void) updateStatusBasedOn:(DJIBaseProduct*)connectedProduct {
    if(connectedProduct) {
        _productConnectionStatus.text = @"Connected!";
        self.product = connectedProduct;
        _productModel.text = [NSString stringWithFormat:NSLocalizedString(@"Model: \%@",@""), connectedProduct.model];
        _productModel.hidden = NO;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerApp];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)registerApp {
    [DJISDKManager registerAppWithDelegate:self];
}

-(void)appRegisteredWithError:(NSError *)error {
    NSString *message = @"Register App Status.";
    if(error) {
        message = @"Register app failed, please enter your app key.";
    }
    else {
        message = @"Register App Success!";
        NSLog(@"App got registered");
        [DJISDKManager startConnectionToProduct];
    }
    
    [self showAlertWithTitle:@"Registration Status" withMessage:message];
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

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
#import "MQTTClient.h"

@interface ViewController ()<DJISDKManagerDelegate, DJIFlightControllerDelegate>

@property (nonatomic, weak) DJIBaseProduct* product;

@property (nonatomic, strong) MQTTSession *mqttSession;
@property (strong, nonatomic) MQTTSessionManager *manager;

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

-(IBAction)onSendMsgClick:(id)sender {
    NSString *msg = @"{'status':'ok'}";
    NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    [self.mqttSession publishData:data onTopic:@"drone/status/dji001"];
}

-(void) mqttConnect {
    MQTTCFSocketTransport *transport = [[MQTTCFSocketTransport alloc] init];
    transport.host = @"mqttdev.nuviot.com";
    transport.port = 1883;
    
    _mqttSession = [[MQTTSession alloc] init];
    _mqttSession.userName = @"kevinw";
    _mqttSession.password = @"Test1234";
    _mqttSession.transport = transport;
    
    [self.mqttSession addObserver:self forKeyPath:@"status"
                          options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    
    [_mqttSession connectWithConnectHandler:^(NSError *error) {
        if(error) {
            NSLog(@"NOPE");
        }
        else {
            [self.mqttSession subscribeTopic:@"drone/action/dji001"];
            NSLog(@"Yup");
    
        }
    }];
}

- (void)newMessage:(MQTTSession *)session
              data:(NSData *)data
           onTopic:(NSString *)topic
               qos:(MQTTQosLevel)qos
          retained:(BOOL)retained
               mid:(unsigned int)mid {
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Message Contents: %@", str);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    switch (self.mqttSession.status) {
        case MQTTSessionStatusCreated:
            NSLog(@"Session Created");
            break;
        case MQTTSessionStatusConnecting:
            NSLog(@"Connecting` ");
            break;
        case MQTTSessionStatusConnected:
            NSLog(@"Connected");
            break;
        case MQTTSessionStatusDisconnecting:
            NSLog(@"Disconnecting");
            break;
        case MQTTSessionStatusClosed:
            NSLog(@"Status Closed");
            break;
        case MQTTSessionStatusError:
            NSLog(@"Status Error");
            break;
    }
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
    [self mqttConnect];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidDisappear:(BOOL)animated {
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

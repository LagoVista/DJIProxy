//
//  LoginViewController.m
//  UserManagement
//
//  Created by Kevin D. Wolf on 5/14/18.
//  Copyright © 2018 Software Logistics. All rights reserved.
//

#import "LoginViewController.h"
#import "AuthServices.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.activityIndicator.hidden = true;
    _email.text = @"kevinw@slsys.net";
    _password.text = @"Test1234";
    self.navigationItem.title = @"NavIoT - DJI Proxy";
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)login:(AuthRequest*)request {
    AuthServices *srvc = [[AuthServices alloc] init];
    [srvc login:request completion:^(AuthResponse *responseObject, NSError *error) {
        
        if (responseObject) {
            NSLog(@"Got Response Object");
            // do what you want with the response object here
        } else {
            self.activityIndicator.hidden = true;
            [self.activityIndicator stopAnimating];
            self.loginButton.enabled = true;
            self.email.enabled = true;
            self.password.enabled = true;
            
            NSLog(@"Got failure");
        }}];
}

-(IBAction)onLoginClick:(id)sender {
    self.activityIndicator.hidden = false;
    [self.activityIndicator startAnimating];
     self.loginButton.enabled = false;
     self.email.enabled = false;
     self.password.enabled = false;
  
    AuthRequest *authRequest = [[AuthRequest alloc] init];
    authRequest.email = _email.text;
    authRequest.userName = _email.text;
    authRequest.password = _password.text;
    authRequest.grantType = @"PASSWORD";
    authRequest.clientType = @"MobileApp";
    authRequest.appId = @"DJIMOBILEPROXY";
    
    [self performSelectorInBackground:@selector(login:) withObject:authRequest];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

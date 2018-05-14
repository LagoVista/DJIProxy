//
//  LoginViewController.m
//  UserManagement
//
//  Created by Kevin D. Wolf on 5/14/18.
//  Copyright © 2018 Software Logistics. All rights reserved.
//

#import "LoginViewController.h"

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
    
    self.navigationItem.title = @"NavIoT - DJI Proxy";    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onLoginClick:(id)sender {
    self.activityIndicator.hidden = false;
    [self.activityIndicator startAnimating];
    self.loginButton.enabled = false;
    self.email.enabled = false;
    self.password.enabled = false;
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

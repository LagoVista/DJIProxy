//
//  LoginViewController.h
//  UserManagement
//
//  Created by Kevin D. Wolf on 5/14/18.
//  Copyright © 2018 Software Logistics. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "AuthServices.h"

@interface LoginViewController : UIViewController

-(void)login:(AuthRequest *)request;

@end

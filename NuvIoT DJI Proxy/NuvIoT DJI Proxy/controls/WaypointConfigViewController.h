//
//  WaypointConfigViewController.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/12/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WaypointConfigViewController;

@protocol WaypointConfigViewControllerDelegate <NSObject>

- (void)cancelBtnActionInDJIWaypointConfigViewController:(WaypointConfigViewController *)waypointConfigVC;
- (void)finishBtnActionInDJIWaypointConfigViewController:(WaypointConfigViewController *)waypointConfigVC;

@end

@interface WaypointConfigViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *altitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *autoFlightSpeedTextField;
@property (weak, nonatomic) IBOutlet UITextField *maxFlightSpeedTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *actionSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *headingSegmentedControl;

@property (weak, nonatomic) id <WaypointConfigViewControllerDelegate>delegate;

- (IBAction)cancelBtnAction:(id)sender;
- (IBAction)finishBtnAction:(id)sender;

@end

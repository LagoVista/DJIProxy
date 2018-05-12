//
//  DJIAircraftAnnotationView.m
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/12/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#import "DJIAircraftAnnotationView.h"
#import "DJIAircraftAnnotationView.h"

@implementation DJIAircraftAnnotationView

- (instancetype)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        self.enabled = NO;
        self.draggable = NO;
        self.image = [UIImage imageNamed:@"aircraft.png"];
    }
    
    return self;
}

-(void) updateHeading:(float)heading
{
    self.transform = CGAffineTransformIdentity;
    self.transform = CGAffineTransformMakeRotation(heading);
}

@end

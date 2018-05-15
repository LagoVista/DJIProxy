//
//  LagoVistaModal.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/15/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef LagoVistaModal_h
#define LagoVistaModal_h

#import "JSONModel.h"
#import "EntityHeader.h"

@interface LagoVistaModel : JSONModel

@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) EntityHeader *createdBy;
@property (strong, nonatomic) EntityHeader *createdDate;
@property (strong, nonatomic) EntityHeader *lastUpdatedBy;
@property (strong, nonatomic) EntityHeader *lastUpdateDate;
@property (strong, nonatomic) EntityHeader *Organization;

@end

#endif /* LagoVistaModal_h */

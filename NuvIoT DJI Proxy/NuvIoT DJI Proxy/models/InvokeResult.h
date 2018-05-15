//
//  InvokeResult.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/15/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef InvokeResult_h
#define InvokeResult_h

#import "JSONModel.h"

@interface InvokeResult : JSONModel
@property BOOL successful;
@property NSArray *errors;
@property JSONModel *result;
@end

#endif /* InvokeResult_h */

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
#import "Error.h"

@protocol Error;

@interface Error : JSONModel
@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) NSString *errorCode;
@property BOOL systemError;
@property (strong, nonatomic) NSString *details;
@end


@interface InvokeResult: JSONModel
@property BOOL successful;
@property NSString *resultId;
@property NSArray<Error *> <Error> *errors;
@property NSArray<Error *> <Error> *warnings;
@end

@interface InvokeResultEx: JSONModel
@property BOOL successful;
@property NSString *resultId;
@property NSArray<Error *> <Error> *errors;
@property NSArray<Error *> <Error> *warnings;
@property (nonatomic) NSString <Optional> *result;
@end

#endif /* InvokeResult_h */

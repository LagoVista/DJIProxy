//
//  EntityHeader.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/15/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef EntityHeader_h
#define EntityHeader_h

@interface EntityHeader : JSONModel

@property (strong) NSString *id;
@property (strong) NSString *text;

@end

#endif /* EntityHeader_h */

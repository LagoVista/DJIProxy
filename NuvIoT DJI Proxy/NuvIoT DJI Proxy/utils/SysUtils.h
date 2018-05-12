//
//  SysUtils.h
//  NuvIoT DJI Proxy
//
//  Created by Kevin D. Wolf on 5/12/18.
//  Copyright © 2018 Software Logistics, LLC. All rights reserved.
//

#ifndef SysUtils_h
#define SysUtils_h

#define WeakRef(__obj) __weak typeof(self) __obj = self
#define WeakReturn(__obj) if(__obj ==nil)return;

#define DEGREE(x) ((x)*180.0/M_PI)
#define RADIAN(x) ((x)*M_PI/180.0)

extern void ShowMessage(NSString *title, NSString *message, id target, NSString *cancleBtnTitle);

#endif /* SysUtils_h */

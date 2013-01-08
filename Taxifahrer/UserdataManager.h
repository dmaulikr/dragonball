//
//  UserdataManager.h
//  Taxifahrer
//
//  Created by Kevin Wagner on 08.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UDKey_Username @"username"
#define UDKey_Password @"password"
#define UDKey_Phone @"phone"
#define UDKey_Firma @"firma"

@interface UserdataManager : NSObject
@property (nonatomic,copy) NSString* username;
@property (nonatomic,copy) NSString* password;
@property (nonatomic,copy) NSString* phone;
@property (nonatomic,copy) NSString* firma;

+(UserdataManager*) getInstance;

-(void) saveData;
-(void) loadData;
@end

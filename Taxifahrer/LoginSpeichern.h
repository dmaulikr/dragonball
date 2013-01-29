//
//  LoginSpeichern.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 29.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginSpeichern : NSObject

#define UDKey_Username @"Username"
#define UDKey_Password @"password"

@property (nonatomic, copy) NSString* username;
@property (nonatomic,copy) NSString* password;

+(LoginSpeichern*) getInstance;

-(void) saveData;
-(void) loadData;

@end

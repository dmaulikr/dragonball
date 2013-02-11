//
//  LoginRequest.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 23.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDXML.h"

#define TaxiCallerDeviceType 1 //0=iPhone

#define XMLTagRequest @"request"
#define XMLTagResponse @"response"XMLTagDeviceType
#define XMLTagDeviceType @"devicetype"
#define XMLTagDeviceID @"deviceid"

#define XMLTagUpdate @"update"
#define XMLTagReactivate @"reactivate"
#define XMLTagUsername @"username"
#define XMLTagPassword @"password"

#define UDKeyUsername @"username"
#define UDKeyPassword @"password"

#define XMLTagStatus @"status"

@interface LoginRequest : NSObject
{
    NSMutableData* _receivedData;
    NSURLConnection* _connection;
}

@property (copy) NSString* password;
@property (copy) NSString* username;

+(LoginRequest*) getInstance;
-(void)requestActivation:(NSString*)username :(NSString*)password;

@end


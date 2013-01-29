//
//  EmailRequest.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 29.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDXML.h"

#define TaxiCallerDeviceType 1 //0=iPhone

#define XMLTagRequest @"request"
#define XMLTagResponse @"response"

#define XMLTagStatus @"status"
#define XMLTagEmail @"email"

#define XMLTagUsername @"username"

@interface EmailRequest : NSObject
{
    NSMutableData* _receivedData;
    NSURLConnection* _connection;
}

+(EmailRequest*) getInstance;
-(void) sendPasswordRequest:(NSString*) email;

@end

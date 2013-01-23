//
//  UserdataManager.h
//  Taxifahrer
//
//  Created by Kevin Wagner on 14.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDXML.h"

#define TaxiCallerDeviceType 1 //0=iPhone

#define XMLTagRequest @"request"
#define XMLTagResponse @"response"XMLTagDeviceType
#define XMLTagDeviceType @"devicetype"
#define XMLTagDeviceID @"deviceid"

#define XMLTagSalutation @"salutation"
#define XMLTagLastName @"lastname"
#define XMLTagForename @"forename"
#define XMLTagTaxiID @"taxiid"
#define XMLTagCompany @"company"
#define XMLTagStreet @"street"
#define XMLTagStreetNumber @"streetnumber"
#define XMLTagPLZ @"plz"
#define XMLTagZip @"zip"
#define XMLTagCity @"city"
#define XMLTagEmail @"email"
#define XMLTagTaxiSize @"taxisize"
#define XMLTagAdvertiserID @"advertiserid"
#define XMLTagPhone @"phone"
#define XMLTagLicensePlate @"licenseplate"

#define XMLTagUpdate @"update"
#define XMLTagReactivate @"reactivate"
#define XMLTagUsername @"username"
#define XMLTagPassword @"password"

#define UDKeyUsername @"username"
#define UDKeyPassword @"password"

@interface UserdataManager : NSObject

{
    NSMutableData* _receivedData;
    NSURLConnection* _connection;
}
+(UserdataManager*) getInstance;

-(void)requestRegistrationWithSalutation:(int)salutation
								lastName:(NSString*)lastname
								forename:(NSString*)forename
								username:(NSString*)username
								  taxiID:(NSString*)taxiID
								 company:(NSString*)company
								  street:(NSString*)street
							streetnumber:(NSString*)streetnumber
									 plz:(NSString*)plz
									city:(NSString*)city
								taxisize:(int)taxisize
							 advertiseID:(NSString*)advertiseID
								   phone:(NSString*)phone
                            licenseplate:(NSString*)licenseplate;

/*
 #define UDKey_Email @"email"
 #define UDKey_Username @"username"
 #define UDKey_Password @"password"
 #define UDKey_Phone @"phone"
 
 @property (nonatomic, copy) NSString* email;
 @property (nonatomic,copy) NSString* username;
 @property (nonatomic,copy) NSString* password;
 @property (nonatomic,copy) NSString* phone;
 
 +(UserdataManager*) getInstance;
 
 -(void) saveData;
 -(void) loadData;
 */


@end

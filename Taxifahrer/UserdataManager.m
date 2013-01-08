//
//  UserdataManager.m
//  Taxifahrer
//
//  Created by Kevin Wagner on 08.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//
#import "UserdataManager.h"

@implementation UserdataManager
static UserdataManager* umanager = nil;

@synthesize username;
@synthesize password;
@synthesize phone;

+(UserdataManager*)getInstance
{
    if (umanager == nil) {
        umanager = [[UserdataManager alloc] init];
    }
    return umanager;
}

-(void) saveData
{
    NSUserDefaults* userdaten = [NSUserDefaults standardUserDefaults];
    [userdaten setObject:self.username forKey:UDKey_Username];
    [userdaten setObject:self.password forKey:UDKey_Password];
    [userdaten setObject:self.phone forKey:UDKey_Phone];
    [userdaten setObject:self.firma forKey:UDKey_Firma];
    [userdaten synchronize];
}

-(void) loadData
{
    NSUserDefaults* userdaten = [NSUserDefaults standardUserDefaults];
    self.username = [userdaten objectForKey:UDKey_Username];
    self.password = [userdaten objectForKey:UDKey_Password];
    self.phone = [userdaten objectForKey:UDKey_Phone];
    self.firma = [userdaten objectForKey:UDKey_Firma];
}

@end

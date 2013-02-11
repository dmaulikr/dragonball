//
//  LoginSpeichern.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 29.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "LoginSpeichern.h"

@implementation LoginSpeichern
static LoginSpeichern* umanager = nil;

@synthesize username;
@synthesize password;


+(LoginSpeichern*)getInstance
{
    if (umanager == nil) {
        umanager = [[LoginSpeichern alloc] init];
    }
    return umanager;
}

-(void) saveData
{
    NSUserDefaults* userdaten = [NSUserDefaults standardUserDefaults];
    [userdaten setObject:self.username forKey:UDKey_Username];
    [userdaten setObject:self.password forKey:UDKey_Password];
    [userdaten synchronize];
}

-(void) loadData
{
    NSUserDefaults* userdaten = [NSUserDefaults standardUserDefaults];
    self.username = [userdaten objectForKey:UDKey_Username];
    self.password = [userdaten objectForKey:UDKey_Password];
}

@end

//
//  DataManager.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 22.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

static DataManager* DataManager_manager = nil;

@synthesize mapBrightness;

#define UDKeyBrightness @"brightness"

+(DataManager*) getInstance
{
    if (DataManager_manager == nil)
    {
        DataManager_manager = [[DataManager alloc] init];
    }
    return DataManager_manager;
}

-(void) saveMapBrightness:(float)brightness
{
    NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
    mapBrightness = brightness;
    NSString* b = [[NSString alloc] initWithFormat:@"%f",mapBrightness];
    [userdefaults setObject:b forKey:UDKeyBrightness];
    [userdefaults synchronize];
}

-(void)showAcceptCustomerPendingAlert{
	_customerPendingAlert = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"DIALOG_TITLE_CUSTOMER_ACCEPTANCE_PENDING", @"") message:NSLocalizedString(@"DIALOG_NOTE_CUSTOMER_ACCEPTANCE_PENDING", @"") delegate:nil cancelButtonTitle:@"Weiter" otherButtonTitles:nil];
	[_customerPendingAlert show];
    
}

@end

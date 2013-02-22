//
//  DataManager.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 22.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

@synthesize mapBrightness;

#define UDKeyBrightness @"brightness"

-(void) saveMapBrightness:(float)brightness
{
    NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
    mapBrightness = brightness;
    NSString* b = [[NSString alloc] initWithFormat:@"%f",mapBrightness];
    [userdefaults setObject:b forKey:UDKeyBrightness];
    [userdefaults synchronize];
}

@end

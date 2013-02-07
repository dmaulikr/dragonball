//
//  JobGenerator.h
//  Taxifahrer
//
//  Created by Kevin Wagner on 01.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#define kJobGeneratorNewJob @"kJobGeneratorNewJob"

@interface JobGenerator : NSObject
{
    int jobcheck;
}

@property (nonatomic,retain) NSMutableArray* JobArray;

-(void) JobAngekommen:(NSNotification*) notification;



@end

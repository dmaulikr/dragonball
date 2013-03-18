//
//  JobGenerator.h
//  Taxifahrer
//
//  Created by Kevin Wagner on 01.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NOTIFICATION_NEWJOB @"newjob"

@interface JobGenerator : NSObject
+(JobGenerator*) getInstance; // SINGLETON-Funktion
-(void) starteGenerator;
-(void) jobsSenden;

@property (nonatomic,retain) NSMutableArray* beispieljobs;

@end



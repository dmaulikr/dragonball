//
//  JobGenerator.h
//  Taxifahrer
//
//  Created by Kevin Wagner on 01.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NOTIFICATION_NEWJOB @"newjob"
#define NOTIFICATION_ACCEPTJOB @"acceptjob"


@interface JobGenerator : NSObject
+(JobGenerator*) getInstance; // SINGLETON-Funktion
-(void) starteGenerator;
-(void) jobsSenden;
-(void) angenommendenJobSenden;

@property (nonatomic,retain) NSMutableArray* beispieljobs;
@property (nonatomic,retain) NSMutableArray* acceptJobs;

@end



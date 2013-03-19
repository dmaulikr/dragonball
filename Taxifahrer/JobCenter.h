//
//  JobCenter.h
//  kartemitbild
//
//  Created by Dennis Brunne on 09.02.13.
//  Copyright (c) 2013 talex. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NOTIFICATION_JOBCENTERHASNEWJOBS @"NOTIFICATION_JOBCENTERHASNEWJOBS"
#define NOTIFICATION_JOBCENTERHASNEWJOBS2 @"NOTIFICATION_JOBCENTERHASNEWJOBS2"
@class statusbar;

@interface JobCenter : NSObject
{
    NSMutableArray* acceptedJobs;
}

+(JobCenter*) getInstance;

@property (nonatomic,retain) NSMutableArray* offeneJobs;
@property (nonatomic,retain) NSMutableArray* acceptedJobs;
@property (nonatomic,retain) NSMutableArray* finishedJobs;
@end

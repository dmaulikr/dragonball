//
//  JobCenter.h
//  kartemitbild
//
//  Created by Dennis Brunne on 09.02.13.
//  Copyright (c) 2013 talex. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NOTIFICATION_JOBCENTERHASNEWJOBS @"NOTIFICATION_JOBCENTERHASNEWJOBS"

@interface JobCenter : NSObject
+(JobCenter*) getInstance;

@property (nonatomic,retain) NSMutableArray* offeneJobs;

@end

//
//  JobCenter.m
//  kartemitbild
//
//  Created by Dennis Brunne on 09.02.13.
//  Copyright (c) 2013 talex. All rights reserved.
//

#import "JobCenter.h"
#import "JobGenerator.h"
#import "CJob.h"

@implementation JobCenter

static JobCenter* jobcenter_fernbedienung = nil;

@synthesize offeneJobs;

+(JobCenter*) getInstance
{
    if (jobcenter_fernbedienung == nil)
    {
        jobcenter_fernbedienung = [[JobCenter alloc] init];
    }
    return jobcenter_fernbedienung;
}

-(id) init
{
    self = [super init];
    if (self)
    {
        //Object inizialisieren
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jobEmpfangen) name:NOTIFICATION_NEWJOB object:nil];
        offeneJobs = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) jobEmpfangen:(NSNotification*) briefumschlag //notification
{
    [offeneJobs removeAllObjects];
    
    NSLog(@"jobEmpfangen");
    if (briefumschlag != nil)
    {
        CJob* job = (CJob*) briefumschlag.object;
        
        [offeneJobs addObject:job];
    }
}

@end

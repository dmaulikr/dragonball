//
//  JobCenter.m
//  kartemitbild
//
//  Created by Kevin Wagner on 09.02.13.
//  Copyright (c) 2013 talex. All rights reserved.
//

#import "JobCenter.h"
#import "JobGenerator.h"
#import "CJob.h"

@implementation JobCenter

static JobCenter* jobcenter_fernbedienung = nil;

@synthesize offeneJobs;
@synthesize acceptedJobs;

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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jobEmpfangen:) name:NOTIFICATION_NEWJOB object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AcceptJobEmpfangen:) name:NOTIFICATION_ACCEPTJOB object:nil];
        offeneJobs = [[NSMutableArray alloc] init];
        acceptedJobs = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) jobEmpfangen:(NSNotification*) briefumschlag //notification
{
    
    NSLog(@"jobEmpfangen aufgerufen");
    [offeneJobs removeAllObjects];
 
    NSLog(@" Übertrage anommende Jobs in eigenes Array");
    NSMutableArray* incommingjobarray = (NSMutableArray*) briefumschlag.object;
    
    if (incommingjobarray != nil && [incommingjobarray count] > 0)
    {
        for (int i = 0; i < [incommingjobarray count]; i++)
        {
            CJob* job = [incommingjobarray objectAtIndex:i];
            [offeneJobs addObject:job];
          
        }
        
    
        
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_JOBCENTERHASNEWJOBS object:offeneJobs];
    }
}

-(void) AcceptJobEmpfangen:(NSNotification*) Acceptbriefumschlag
{
    NSMutableArray* incommingacceptjob = (NSMutableArray*) Acceptbriefumschlag.object;
    
    if (incommingacceptjob != nil && [incommingacceptjob count] > 0)
    {
        for (int i = 0; i < [incommingacceptjob count]; i++)
        {
            NSLog(@"Die Forschleife wurde aufgerufen");
            CJob* Acceptjob = [incommingacceptjob objectAtIndex:incommingacceptjob];
            [acceptedJobs addObject:Acceptjob];
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_JOBCENTERHASNEWJOBS2 object:acceptedJobs];
    }
}

@end

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
@synthesize angenommeneJobs;

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
        
        offeneJobs = [[NSMutableArray alloc] init];
        angenommeneJobs = [[NSMutableArray alloc] init];
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
    }
}

-(void) jobAnnehmen:(CJob*) job
{
    NSLog(@"Job wurde angenommen");
    [angenommeneJobs addObject:job];
    
    if (angenommeneJobs != nil && [angenommeneJobs count] > 0) {
        for (int i=0; i < [angenommeneJobs count];i++) {
            CJob* j = [angenommeneJobs objectAtIndex:i];
            NSLog(@"%@",job.street);
        }
    }
}

@end

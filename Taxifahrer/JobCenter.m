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

-(void) jobEmpfangen:(NSNotification*) briefumschlag
{
    
<<<<<<< HEAD
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
=======
    // Eigenes Array leeren
    [offeneJobs removeAllObjects];
    
    // Array aus Notification auspacken
    NSMutableArray* array = (NSMutableArray*) briefumschlag.object;
    
    // Wenn Jobs in ausgepacktem Array, Jobs aus ausgepacktem Array in eigenes Array packen
    if (array != nil && [array count] > 0)
    {
        for (int i = 0; i < [array count];i++) {
            CJob* job = [array objectAtIndex:i];
            [offeneJobs addObject:job];
>>>>>>> 78f2ccee329a8316cf78dd94cf6eb7126674299e
        }
    }
}

@end

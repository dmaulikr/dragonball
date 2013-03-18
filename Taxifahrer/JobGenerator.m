//
//  JobGenerator.m
//  kartemitbild
//
//  Created by Kevin Wagner on 2/10/13.
//  Copyright (c) 2013 Dennis Brunne. All rights reserved.
//

#import "JobGenerator.h"
#import "CJob.h"

@implementation JobGenerator

static JobGenerator* generator = nil;
@synthesize beispieljobs;
@synthesize acceptJobs;

+(JobGenerator*) getInstance
{
    if (generator == nil)
    {
        generator = [[JobGenerator alloc] init];
    }
    return generator;
}

-(void) starteGenerator
{
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(jobsSenden) userInfo:nil repeats:NO];
   
    
    [self angenommendenJobSenden];
    
}

-(void) jobsSenden
{
    NSLog(@"Jobs senden");
    beispieljobs = [[NSMutableArray alloc]init];
    
    CJob* beispieljob = nil;
    CJob* beispieljob2 = nil;
    CJob* beispieljob3 = nil;
    
    int zahl = arc4random()%5;
    NSLog(@"Generator hat %d gewürfelt.", zahl);
    
    if (zahl == 0)
    {
        beispieljob = [[CJob alloc] init];
        beispieljob.token = @"HH12345";
        beispieljob.street = @"Jungfernstieg 1";
        beispieljob.taxisize = @"3";
        beispieljob.latitude = @"53.5533";
        beispieljob.longitude = @"10.005";
        beispieljob.name = @"Schmidt";
        beispieljob.jobstatus = @"open";
   
        beispieljob2 = [[CJob alloc] init];
        beispieljob2.token = @"HH78912";
        beispieljob2.street = @"Hauptstrasse 1";
        beispieljob2.taxisize = @"1";
        beispieljob2.latitude = @"53.5573";
        beispieljob2.longitude = @"10.009";
        beispieljob2.name = @"Meier";
        beispieljob2.jobstatus = @"open";
        
        [beispieljobs addObject:beispieljob];
        [beispieljobs addObject:beispieljob2];
    }
    
    else if (zahl == 1)
    {
 
        beispieljob = [[CJob alloc] init];
        beispieljob.token = @"HH78fdf";
        beispieljob.street = @"Trollstraße";
        beispieljob.taxisize = @"2";
        beispieljob.latitude = @"53.5578";
        beispieljob.longitude = @"10.010";
        beispieljob.name = @"Becker";
        beispieljob.jobstatus = @"open";
  
        beispieljob2 = [[CJob alloc] init];
        beispieljob2.token = @"HH666";
        beispieljob2.street = @"Himmelsweg";
        beispieljob2.taxisize = @"4";
        beispieljob2.latitude = @"53.5588";
        beispieljob2.longitude = @"10.016";
        beispieljob2.name = @"Varian";
        beispieljob2.jobstatus = @"open";
          
        [beispieljobs addObject:beispieljob];
        [beispieljobs addObject:beispieljob2];
    }
    else if (zahl == 2)
    {
        
        beispieljob = [[CJob alloc] init];
        beispieljob.token = @"NY1252";
        beispieljob.street = @"Broadway";
        beispieljob.taxisize = @"4";
        beispieljob.latitude = @"54.12";
        beispieljob.longitude = @"10";
        beispieljob.name = @"Yorkia";
        beispieljob.jobstatus = @"open";
        
        [beispieljobs addObject:beispieljob];
    }
    
    else if (zahl == 3)
    {
        beispieljob = [[CJob alloc] init];
        beispieljob.token = @"HH6612";
        beispieljob.street = @"Fegefeuer";
        beispieljob.taxisize = @"4";
        beispieljob.latitude = @"53.5";
        beispieljob.longitude = @"10.12";
        beispieljob.name = @"Monster";
        beispieljob.jobstatus = @"open";
        
        beispieljob2 = [[CJob alloc] init];
        beispieljob2.token = @"HH666";
        beispieljob2.street = @"Himmelsweg";
        beispieljob2.taxisize = @"4";
        beispieljob2.latitude = @"54";
        beispieljob2.longitude = @"10";
        beispieljob2.name = @"Gott";
        beispieljob2.jobstatus = @"open";
        
        beispieljob3 = [[CJob alloc] init];
        beispieljob3.token = @"HH777";
        beispieljob3.street = @"Höllenpforte";
        beispieljob3.latitude = @"53.5573";
        beispieljob3.longitude = @"10.009";
        beispieljob3.longitude = @"10";
        beispieljob3.name = @"Luzifer";
        beispieljob3.jobstatus = @"open";
        
        [beispieljobs addObject:beispieljob];
        [beispieljobs addObject:beispieljob2];
        [beispieljobs addObject:beispieljob3];
    }
    
    else if (zahl == 4)
    {
        beispieljob = [[CJob alloc]init];
        beispieljob.token = @"ff854fdf";
        beispieljob.street = @"Entenhausen";
        beispieljob.taxisize = @"3";
        beispieljob.longitude = @"54";
        beispieljob.latitude = @"10";
        beispieljob.name = @"Dagobert";
        beispieljob.jobstatus = @"open";
        
        beispieljob2 = [[CJob alloc] init];
        beispieljob2.token = @"HH7836";
        beispieljob2.street = @"Winterfeste";
        beispieljob2.taxisize = @"4";
        beispieljob2.latitude = @"53.5575";
        beispieljob2.longitude = @"10.012";
        beispieljob2.name = @"Jarl Kevin";
        beispieljob2.jobstatus = @"open";
        
        [beispieljobs addObject:beispieljob];
        [beispieljobs addObject:beispieljob2];
    }
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NEWJOB object:beispieljobs];
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(jobsSenden) userInfo:nil repeats:NO];
}

-(void) angenommendenJobSenden
{
    NSLog(@"AngenommendeJobSenden aufgerufen");
    
    acceptJobs = [[NSMutableArray alloc]init];
    CJob* acceptJob = nil;
    
    acceptJob = [[CJob alloc] init];
    acceptJob.token = @"HHAcpt";
    acceptJob.street = @"AceptedStreet";
    acceptJob.taxisize = @"1";
    acceptJob.latitude = @"53.5578";
    acceptJob.longitude = @"10.010";
    acceptJob.name = @"Aceptor";
    acceptJob.jobstatus = @"accepted";
    
    [acceptJobs addObject:acceptJob];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_ACCEPTJOB object:acceptJobs];
}

@end

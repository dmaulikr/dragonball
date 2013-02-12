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
}

-(void) jobsSenden
{
    beispieljobs = [[NSMutableArray alloc] init];
    
    NSLog(@"Job Senden");
    CJob* beispieljob = nil;
    CJob* beispieljob2 = nil;
    
    int zahl = arc4random()%2;
    if (zahl == 0)
    {
        NSLog(@"JobGenerator == 0");
        beispieljob = [[CJob alloc] init];
        beispieljob.token = @"HH12345";
        beispieljob.street = @"Jungfernstieg 1";
        beispieljob.taxisize = @"3";
        beispieljob.latitude = @"53.5533";
        beispieljob.longitude = @"10.005";
        beispieljob.name = @"Schmidt";
        
        NSLog(@"Jobgenerator == 1");
        beispieljob2 = [[CJob alloc] init];
        beispieljob2.token = @"HH78912";
        beispieljob2.street = @"Hauptstrasse 1";
        beispieljob2.taxisize = @"1";
        beispieljob2.latitude = @"53.56";
        beispieljob2.longitude = @"10.009";
        beispieljob2.name = @"Meier";
        
        [beispieljobs addObject:beispieljob];
        [beispieljobs addObject:beispieljob2];
    }
    
    else if (zahl == 1)
    {
        NSLog(@"Jobgenerator == %d" , zahl);
        beispieljob = [[CJob alloc] init];
        beispieljob.token = @"HH78fdf";
        beispieljob.street = @"Trollallee";
        beispieljob.taxisize = @"2";
        beispieljob.latitude = @"53.5578";
        beispieljob.longitude = @"10.010";
        beispieljob.name = @"Becker";
        
        NSLog(@"Jobgenerator == %d" , zahl);
        beispieljob2 = [[CJob alloc] init];
        beispieljob2.token = @"HH666";
        beispieljob2.street = @"Himmelsweg";
        beispieljob2.taxisize = @"4";
        beispieljob2.latitude = @"53.57";
        beispieljob2.longitude = @"10.016";
        beispieljob2.name = @"Varian";
        
        [beispieljobs addObject:beispieljob];
        [beispieljobs addObject:beispieljob2];
    }
    
    else if (zahl == 2)
    {
        NSLog(@"Jobgenerator == %d" , zahl);
        beispieljob = [[CJob alloc] init];
        beispieljob.token = @"HH78fdf";
        beispieljob.street = @"Trollallee";
        beispieljob.taxisize = @"2";
        beispieljob.latitude = @"53.5578";
        beispieljob.longitude = @"10.010";
        beispieljob.name = @"Becker";
    }
    else
    {
        NSLog(@"Jobgenerator == %d" , zahl);
        beispieljob = [[CJob alloc] init];
        beispieljob.token = @"HH666";
        beispieljob.street = @"Himmelsweg";
        beispieljob.taxisize = @"4";
        beispieljob.latitude = @"53.5588";
        beispieljob.longitude = @"10.016";
        beispieljob.name = @"Varian";
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NEWJOB object:beispieljobs];
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(jobsSenden) userInfo:nil repeats:NO];
    
}

@end

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
    CJob* beispieljob = nil;
    
    int zahl = arc4random()%3;
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
    }
    
        else if (zahl == 1)
    {
        NSLog(@"Jobgenerator == 1");
        beispieljob = [[CJob alloc] init];
        beispieljob.token = @"HH78912";
        beispieljob.street = @"Hauptstrasse 1";
        beispieljob.taxisize = @"1";
        beispieljob.latitude = @"53.5573";
        beispieljob.longitude = @"10.009";
        beispieljob.name = @"Meier";
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
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NEWJOB object:beispieljob];
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(jobsSenden) userInfo:nil repeats:NO];
    
}

@end

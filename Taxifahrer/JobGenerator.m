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
    beispieljobs = [[NSMutableArray alloc]init];
    
    
    CJob* beispieljob = nil;
    CJob* beispieljob1 = nil;
    CJob* beispieljob2 = nil;
    CJob* beispieljob3 = nil;
    
    int zahl = arc4random()%1;
    
    NSLog(@"Jobgenerator hat eine %d gewuerfelt" , zahl);
    if (zahl == 0)
    {
        NSLog(@"Jobgenerator == %d", zahl);
        
        beispieljob.token = @"HH12345";
        beispieljob.street = @"Jungfernstieg 1";
        beispieljob.taxisize = @"3";
        beispieljob.latitude = @"53.5533";
        beispieljob.longitude = @"10.005";
        beispieljob.name = @"Schmidt";
   
    
        
        beispieljob1.token = @"HH78912";
        beispieljob1.street = @"Hauptstrasse 1";
        beispieljob1.taxisize = @"1";
        beispieljob1.latitude = @"53.5573";
        beispieljob1.longitude = @"10.009";
        beispieljob1.name = @"Meier";
        
        [beispieljobs addObject:beispieljob];
        [beispieljobs addObject:beispieljob1];
    }
    
    else if (zahl == 1)
    {
        NSLog(@"Jobgenerator == %d" , zahl);
        
        beispieljob2.token = @"HH78fdf";
        beispieljob2.street = @"Trollallee";
        beispieljob2.taxisize = @"2";
        beispieljob2.latitude = @"53.5578";
        beispieljob2.longitude = @"10.010";
        beispieljob2.name = @"Becker";
  
      
        
        beispieljob3.token = @"HH666";
        beispieljob3.street = @"Himmelsweg";
        beispieljob3.taxisize = @"4";
        beispieljob3.latitude = @"53.5588";
        beispieljob3.longitude = @"10.016";
        beispieljob3.name = @"Varian";
        
        [beispieljobs addObject:beispieljob2];
        [beispieljobs addObject:beispieljob3];
    }
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NEWJOB object:beispieljobs];
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(jobsSenden) userInfo:nil repeats:NO];
    
}

@end

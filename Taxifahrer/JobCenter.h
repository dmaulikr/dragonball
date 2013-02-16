//
//  JobCenter.h
//  kartemitbild
//
//  Created by Dennis Brunne on 09.02.13.
//  Copyright (c) 2013 talex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJob.h"

@interface JobCenter : NSObject
+(JobCenter*) getInstance;


@property (nonatomic,retain) NSMutableArray* offeneJobs;
@property (nonatomic,retain) NSMutableArray* angenommeneJobs;

-(void) jobAnnehmen:(CJob*) job;



@end

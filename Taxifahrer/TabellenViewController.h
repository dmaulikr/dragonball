//
//  TabellenViewController.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 16.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JobCenter;
@class TabMainViewController;
@interface TabellenViewController : UIViewController
#define NOTIFICATION_DETAILFORJOB @"job"

{
    NSMutableArray* allejobs;
    IBOutlet UITableView* tabelle;
    NSString* jobname;
    
    JobCenter* jobcenterzeiger;
}

@property (nonatomic,retain) NSMutableArray* alleJobs;

@end

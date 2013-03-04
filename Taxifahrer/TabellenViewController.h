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
@class ViewMediator;
@class MapViewController;
@interface TabellenViewController : UIViewController
#define NOTIFICATION_DETAILFORJOB @"job"

{
    NSMutableArray* allejobs;
    IBOutlet UITableView* tabelle;
    NSString* jobname;
    
    JobCenter* jobcenterzeiger;
}

@property (nonatomic,retain) NSMutableArray* alleJobs;
@property (nonatomic,retain) IBOutlet ViewMediator* mediator;
@property (nonatomic,retain) MapViewController* karte;
-(IBAction)Profil:(id)sender;

@end

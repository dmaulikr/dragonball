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
    NSMutableArray* aceptedJobs;
    IBOutlet UITableView* tabelle;
    NSString* jobname;
    
    JobCenter* jobcenterzeiger;
}

@property (nonatomic,retain) NSMutableArray* offeneJobs;
@property (nonatomic,retain) NSMutableArray* acceptedJobs;
@property (nonatomic,retain) NSMutableArray* beendeteJobs;
@property (nonatomic,retain) IBOutlet ViewMediator* mediator;
@property (nonatomic,retain) MapViewController* karte;
-(IBAction)Profil:(id)sender;

@end

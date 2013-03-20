//
//  TabellenViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 16.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "TabellenViewController.h"
#import "ViewMediator.h"
#import "TabMainViewController.h"
#import "JobCenter.h"
#import "CJob.h"
#import "JobButton.h"

@interface TabellenViewController ()


@end

@implementation TabellenViewController
@synthesize mediator;
@synthesize karte;
@synthesize offeneJobs;
@synthesize acceptedJobs;
@synthesize beendeteJobs;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad des TabellenVC aufgerufen.");
    self.title = NSLocalizedString( @"STR_SCREEN_TITLE_JOBS",@"");
    
    UIImageView* imgMap = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"darkmap.png"]];
    [self.view addSubview:imgMap];
    tabelle.backgroundColor = [UIColor clearColor];
    [self.view bringSubviewToFront:tabelle];

    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    jobcenterzeiger = [JobCenter getInstance];
    offeneJobs = jobcenterzeiger.offeneJobs;
    aceptedJobs = jobcenterzeiger.acceptedJobs;
    beendeteJobs = jobcenterzeiger.finishedJobs;
    
    NSLog(@"JobArray Zähler: %d", allejobs.count);
   
    [tabelle reloadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(neuladen:) name:NOTIFICATION_JOBCENTERHASNEWJOBS object:nil];
}

-(void)neuladen:(NSNotification*) briefchen
{
    NSLog(@"Lade Daten neu");
    [tabelle reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated
{
    TabMainViewController* tabMain = [[ViewMediator getInstance] tabMainController];
    tabMain.view.frame = CGRectMake(0, 367, 320, 49);
    [self.view addSubview:tabMain.view];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //int anzahl = [allejobs count];
    //return anzahl;
    
    switch(section){
        case 0:
            return [offeneJobs count];
            break;
        case 1:
            return [aceptedJobs count];
            break;
        case 2:
            return nil;
            break;
    }
}

-(void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        NSLog(@"Abbrechen gedrückt");
    }
    
    else if (buttonIndex == 1)
    {
        NSLog(@"Ok gedrückt");
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    int reihe = indexPath.row;
    CJob* beispieljob = [offeneJobs objectAtIndex:reihe];
    
    jobname = beispieljob.name;
    cell.textLabel.text = jobname;
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Die Row kann man sich aus dem indexPath-Parameter holen
	int reihe = indexPath.row;
    
	// Den Job bekommt man dann ganz normal aus dem Array
	CJob* job = [offeneJobs objectAtIndex:reihe];
    
	// Mit dem Job kann mann dann weiterarbeiten
    // Hier posten wir den Job mit einer Notification, die ich dafür geschaffen habe.
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_DETAILFORJOB object:job];
    
    [[ViewMediator getInstance] showMapView];
    NSLog(@"Reihe: %d / Job: %@", reihe, jobname);
}

@end

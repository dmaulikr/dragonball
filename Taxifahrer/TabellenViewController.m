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

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"AUFGERUFEN WORDEN ICH BIN!");
    
    
    UIImageView* imgMap = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"darkmap.png"]];
    [self.view addSubview:imgMap];
    tabelle.backgroundColor = [UIColor clearColor];
    [self.view bringSubviewToFront:tabelle];

    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    jobcenterzeiger = [JobCenter getInstance];
    allejobs = jobcenterzeiger.offeneJobs;
    
    NSLog(@"%d", allejobs.count);
   

    
    [tabelle reloadData];
    [NSTimer scheduledTimerWithTimeInterval:00.01 target:self selector:@selector(neuladen) userInfo:nil repeats:NO];
}


-(void)neuladen
{
    NSLog(@"Lade Daten neu");
    [tabelle reloadData];
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(neuladen) userInfo:nil repeats:NO];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int anzahl = [allejobs count];
    return anzahl;
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
    CJob* beispieljob = [allejobs objectAtIndex:reihe];
    
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
	CJob* job = [allejobs objectAtIndex:reihe];
    
	// Mit dem Job kann mann dann weiterarbeiten
    // Hier posten wir den Job mit einer Notification, die ich dafür geschaffen habe.
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_DETAILFORJOB object:job];
    

    //UINavigationController *navController = self.navigationController;
    //[[self retain] autorelease];
    //[navController pushViewController:self.karte animated:NO];
    //[navController pushViewController:karte animated:NO];
    
    [[ViewMediator getInstance] showMapView];
    if (reihe == 0)
    {
        NSLog(@"Reihe: %d", reihe);
    }
    
    else if (reihe == 1)
    {
        NSLog(@"Reihe: %d", reihe);
    }
    
    else if (reihe == 2)
    {
        NSLog(@"Reihe: %d", reihe);
    }
}

@end

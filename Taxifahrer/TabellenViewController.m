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
    
    NSLog(@"Es gibt %d jobs" , allejobs.count);
    
    for (int i = 0; i<[allejobs count]; i++)
    {
        i = indexPath.row;
        CJob* beispieljob = [allejobs objectAtIndex:i];
        
        jobname = beispieljob.name;
        cell.textLabel.text = jobname;
        cell.textLabel.textColor = [UIColor whiteColor];
        
        return cell;
    }
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    NSLog(@"RowZahl: %d",row);
    
    if (row == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Donnerfels" message:@"12 Grad" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    
    else if (row == 1)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Donnerfels" message:@"12 Grad" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    
    else if (row == 2)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Donnerfels" message:@"12 Grad" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

@end

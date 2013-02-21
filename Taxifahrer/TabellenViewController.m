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
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"AUFGERUFEN WORDEN ICH BIN!");
    
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tableView) userInfo:nil repeats:NO];
    
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
       
        return cell;
        
        
    
    }
    
    
    
    
    /* for (int i = 0; i < [alleJobs count];i++) {
     CJob* beispieljob = [alleJobs objectAtIndex:i];
     
     double breitengrad = [beispieljob.latitude doubleValue];
     double laengengrad = [beispieljob.longitude doubleValue];
     CLLocationCoordinate2D unsereKoordinate = CLLocationCoordinate2DMake(breitengrad, laengengrad);
     
     // Wir erschaffen ein Objekt vom Typ ImageAnnotation. Dieses haben wir selbst definiert
     ImageAnnotation* jobAnnotation = [[ImageAnnotation alloc] initWithCoordinate:unsereKoordinate];
     // Das Objekt wird zur Karte addiert (das Objekt, noch nicht das Bild)
     jobAnnotation.mytitle = ANNOTATION_GREENJOB;
     jobAnnotation.job = beispieljob;
     [mapview addAnnotation:jobAnnotation];
     
     }
*/
    

}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end

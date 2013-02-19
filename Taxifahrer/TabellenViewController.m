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
    NSMutableArray* allejobs = jobcenterzeiger.offeneJobs;
    
    NSLog(@"%d", allejobs.count);
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
    //int i = indexPath.row;
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    for (int i = 0; i < [allejobs count];i++)
    {
    CJob* job = [allejobs objectAtIndex:i];

        NSString* test = allejobs;
        cell.textLabel.text = allejobs.count;
        
        return cell;
       
    }
    //[NSTimer scheduledTimerWithTimeInterval:5.00 target:self selector:@selector(self) userInfo:nil repeats:NO];
    
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end

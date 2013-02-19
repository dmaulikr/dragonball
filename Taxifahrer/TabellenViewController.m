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

@interface TabellenViewController ()

@end

@implementation TabellenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(tableView:) userInfo:nil repeats:NO];


}

-(void) viewDidAppear:(BOOL)animated
{
    TabMainViewController* tabMain = [[ViewMediator getInstance] tabMainController];
    tabMain.view.frame = CGRectMake(0, 367, 320, 49);
    [self.view addSubview:tabMain.view];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    JobCenter* jobcenterzeiger = [JobCenter getInstance];
    allejobs = jobcenterzeiger.offeneJobs;
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    for (int i = 0; i < [allejobs count];i++)
    {
    CJob* beispieljob = [allejobs objectAtIndex:i];

        NSString* test = beispieljob.name;
      
        cell.textLabel.text = test;
       
    }
    
    return cell;
    
    
    [NSTimer scheduledTimerWithTimeInterval:5.00 target:self selector:@selector(self) userInfo:nil repeats:NO];
    
}



- (NSInteger)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    int anzahl = [allejobs count];
    NSLog(@"NSinteger: %d aus allejobs gezahelt" , anzahl);
    return anzahl;
    
    

    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
  //  int anzahl = [ARRAY count];
  //  return anzahl;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

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
    
    int anzahl = [ARRAY count];
    return anzahl;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

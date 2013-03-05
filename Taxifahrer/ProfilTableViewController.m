//
//  ProfilTableViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 05.03.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "ProfilTableViewController.h"
#import "ViewMediator.h"
#import "MapViewController.h"

@interface ProfilTableViewController ()

@end

@implementation ProfilTableViewController

@synthesize mediator;
@synthesize Map;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.Map = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
        
        [mottocell retain];
        //[HelligkeitViewController retain];
        
        [[NSBundle mainBundle] loadNibNamed:@"MottoCell" owner:self options:nil];
        //[[NSBundle mainBundle] loadNibNamed:@"HelligkeitViewController" owner:self options:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Karte" style:UIBarButtonItemStylePlain target:self action:@selector(Karte:)];
    self.navigationItem.leftBarButtonItem = rightButton;
    [rightButton release];
}

-(void) viewDidAppear:(BOOL)animated
{
    NSLog(@"LOL");
    /*HelligkeitViewController* HelligkeitVC = [[ViewMediator getInstance] HelligkeitController];
    HelligkeitVC.view.frame = CGRectMake(100, 200, 160, 49);
    [self.view addSubview:HelligkeitVC.view];*/
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = mottocell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Karte:(id)sender
{
    NSLog(@"Wechsle von Profil zu Karte");
    
    UINavigationController *navController = self.navigationController;
    [[self retain] autorelease];
    // [navController popViewControllerAnimated:NO];
    [navController pushViewController:self.Map animated:NO];
}

@end

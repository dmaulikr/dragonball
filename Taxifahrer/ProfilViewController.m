//
//  ProfilViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 22.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "ProfilViewController.h"
#import "HelligkeitViewController.h"
#import "ViewMediator.h"
#import "MapViewController.h"

@interface ProfilViewController ()

@end

@implementation ProfilViewController

@synthesize mediator;
@synthesize Map;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.Map = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
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
    HelligkeitViewController* HelligkeitVC = [[ViewMediator getInstance] HelligkeitController];
    HelligkeitVC.view.frame = CGRectMake(0, 200, 320, 49);
    [self.view addSubview:HelligkeitVC.view];
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

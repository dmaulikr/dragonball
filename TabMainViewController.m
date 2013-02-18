//
//  TabMainViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 16.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "TabMainViewController.h"
#import "ViewMediator.h"

@interface TabMainViewController ()

@end

@implementation TabMainViewController
@synthesize lblAuftraege;
@synthesize lblBezahlen;
@synthesize lblKarte;
@synthesize lblStandby;
@synthesize lblVerfuegbar;

@synthesize mediator;

@synthesize btnKarte;
@synthesize btnAuftraege;
@synthesize btnBezahlen;
@synthesize btnStandby;
@synthesize btnVerfuegbar;

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
    // Do any additional setup after loading the view from its nib.
    
    /*lblKarte.text = NSLocalizedString(@"LABEL_TABMAINKARTE", @"");
    lblAuftraege.text = NSLocalizedString(@"LABEL_TABMAINAUFTRAG", @"");
    lblBezahlen.text = NSLocalizedString(@"LABEL_TABMAINBEZAHLEN", @"");
    lblVerfuegbar.text = NSLocalizedString(@"LABEL_TABMAINVERFUEGBAR", @"");
    lblStandby.text = NSLocalizedString(@"LABEL_TABMAINSTANDBY", @"");*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)KarteButtonPressed:(id)sender
{
    NSLog(@"KartenButton gedrückt.");
    
    if (mediator != nil) {
        [mediator showMapView];
    }
}

- (IBAction)AuftragButtonPressed:(id)sender
{
    NSLog(@"AuftragButton gedrückt.");
    
    if (mediator != nil) {
        [mediator showTableView];
    }
}

- (IBAction)BezahlenButtonPressed:(id)sender
{
    NSLog(@"BezahlenButton gedrückt.");
}

- (IBAction)VerfuegbarButtonPressed:(id)sender
{
    NSLog(@"VerfügbarButton gedrückt.");
}

- (IBAction)StandbyButtonPressed:(id)sender
{
    NSLog(@"StandbyButton gedrückt.");
}

- (void)dealloc {
    [btnKarte release];
    [btnAuftraege release];
    [btnBezahlen release];
    [btnVerfuegbar release];
    [btnStandby release];
    
    [lblKarte release];
    [lblAuftraege release];
    [lblBezahlen release];
    [lblVerfuegbar release];
    [lblStandby release];
    [super dealloc];
}

@end
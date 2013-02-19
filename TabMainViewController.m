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
    
    lblKarte.text = NSLocalizedString(@"LABEL_TABMAINKARTE", @"");
    lblAuftraege.text = NSLocalizedString(@"LABEL_TABMAINAUFTRAG", @"");
    lblBezahlen.text = NSLocalizedString(@"LABEL_TABMAINBEZAHLEN", @"");
    lblVerfuegbar.text = NSLocalizedString(@"LABEL_TABMAINVERFUEGBAR", @"");
    lblStandby.text = NSLocalizedString(@"LABEL_TABMAINSTANDBY", @"");
    
    VerfuegbarCheck = 0;
    StandbyCheck = 0;
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
   
    if (VerfuegbarCheck == 0)
    {
        UIImage * btnbusy = [UIImage imageNamed:@"tab5_busy.png"];
        [btnVerfuegbar setImage:btnbusy forState:UIControlStateNormal];
        UIImage * btnfree = [UIImage imageNamed:@"tab5_free.png"];
        [btnVerfuegbar setImage:btnfree forState:UIControlStateHighlighted];

        VerfuegbarCheck = 1;
        
        lblVerfuegbar.text = NSLocalizedString(@"LABEL_TABMAINBESCHAEFTIGT", @"");
    }
    else
    {
        UIImage * btnfree = [UIImage imageNamed:@"tab5_free.png"];
        [btnVerfuegbar setImage:btnfree forState:UIControlStateNormal];
        UIImage * btnbusy = [UIImage imageNamed:@"tab5_busy.png"];
        [btnVerfuegbar setImage:btnbusy forState:UIControlStateHighlighted];
        VerfuegbarCheck = 0;
        
        lblVerfuegbar.text = NSLocalizedString(@"LABEL_TABMAINVERFUEGBAR", @"");
    }
}

- (IBAction)StandbyButtonPressed:(id)sender
{
    NSLog(@"StandbyButton gedrückt.");
    
    if (StandbyCheck == 0)
    {
        UIImage * btnstanbdy = [UIImage imageNamed:@"tab5_standbyoff.png"];
        [btnStandby setImage:btnstanbdy forState:UIControlStateNormal];
        UIImage * btnstandbyoff = [UIImage imageNamed:@"tab5_standby.png"];
        [btnStandby setImage:btnstandbyoff forState:UIControlStateHighlighted];
        
        StandbyCheck = 1;
        
        lblStandby.text = NSLocalizedString(@"LABEL_TABMAINSTANDBYOFF", @"");
    }
    else
    {
        UIImage * btnstandby = [UIImage imageNamed:@"tab5_standby.png"];
        [btnStandby setImage:btnstandby forState:UIControlStateNormal];
        UIImage * btnstandbyoff = [UIImage imageNamed:@"tab5_standbyoff.png"];
        [btnStandby setImage:btnstandbyoff forState:UIControlStateHighlighted];
        StandbyCheck = 0;
        
        lblStandby.text = NSLocalizedString(@"LABEL_TABMAINSTANDBY", @"");
    }
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

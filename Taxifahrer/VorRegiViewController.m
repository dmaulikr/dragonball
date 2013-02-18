//
//  VorRegiViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 05.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "VorRegiViewController.h"
#import "ViewMediator.h"

@interface VorRegiViewController ()

@end

@implementation VorRegiViewController

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
    
    //LABELS
    _lblAGBAkzeptieren.text = NSLocalizedString(@"LABEL_VORREGIAGBAKZEPTIEREN", @"");
    _lblUnsereAGBs.text = NSLocalizedString(@"LABEL_VORREGIUNSEREAGBS", @"");
    _lblZurRegi.text = NSLocalizedString(@"LABEL_VORREGIZURREGI", @""); 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonAGB:(id)sender
{
    NSLog(@"AGB pressed, gehe nach AGB");
    [[ViewMediator getInstance] vonVorRegiZuAGB];
}

-(IBAction)buttonRegi:(id)sender
{
    NSLog(@"Weiter pressed, gehe nach Regi");
    [[ViewMediator getInstance] vonVorRegiZuRegi];
}

- (void)dealloc {
    [_lblAGBAkzeptieren release];
    [_lblUnsereAGBs release];
    [_lblZurRegi release];
    [super dealloc];
}
@end

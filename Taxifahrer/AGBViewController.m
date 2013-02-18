//
//  AGBViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 05.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "AGBViewController.h"
#import "ViewMediator.h"

@interface AGBViewController ()

@end

@implementation AGBViewController

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
    
    // Labels
    _lblUeberschrift.text = NSLocalizedString(@"LABEL_AGBHEADLINE", @"");
    _lblAGBs.text = NSLocalizedString(@"LABEL_AGBTEXT", @"");
    _lblZurRegiButton.text = NSLocalizedString(@"LABEL_AGBZURREGIBUTTON", @"");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonZuRegi:(id)sender
{
    NSLog(@"Einverstanden pressed, gehe nach Regi");
    [[ViewMediator getInstance] vonAGBZuRegi];
}

-(IBAction)buttonZuLogin:(id)sender
{
    NSLog(@"Will aber AGBs! pressed, gehe nach Login");
    [[ViewMediator getInstance] vonAGBZuVorRegi];
}

- (void)dealloc {
    [_lblUeberschrift release];
    [_lblAGBs release];
    [_lblZurRegiButton release];
    [super dealloc];
}
@end

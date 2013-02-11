//
//  AnfangViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 29.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "AnfangViewController.h"
#import "AnfangViewController.h"
#import "ViewMediator.h"
#import "LoginSpeichern.h"
#import "LoginRequest.h"
#import "MapViewController.h"
#import "LoginScreenViewController.h"


@interface AnfangViewController ()

@end

@implementation AnfangViewController

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
    
    LoginSpeichern* um = [LoginSpeichern getInstance];
    [um loadData];
    
    if (um.username != nil && [um.username isEqualToString:@""] == false && um.password != nil && [um.password isEqualToString:@""] == false)
    {
        LoginRequest* request  = [LoginRequest getInstance];
        [request requestActivation:um.username :um.password];
        
        [[ViewMediator getInstance] vonAnfangZuMap];
    }
    else
    {
        // Wenn nicht, gehe zum LoginBildschirm
        [[ViewMediator getInstance] vonAnfangZuLogin];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)zumLoginWechseln:(id)sender
{
    [[ViewMediator getInstance] vonAnfangZuLogin];
}

@end
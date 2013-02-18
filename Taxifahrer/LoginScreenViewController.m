//
//  LoginScreenViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 23.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

//Username: Test1@test.de
//Passwort: 637a2d

#import "LoginScreenViewController.h"
#import "LoginRequest.h"
#import "ViewMediator.h"
#import "UserdataManager.h"
#import "LoginSpeichern.h"

@implementation LoginScreenViewController
{
    @public
    LoginScreenViewController* lsvc;
}

@synthesize txtUsername;
@synthesize txtPassword;
@synthesize btnLogin;
@synthesize lblErgebnis;

- (void)viewDidLoad
{
    [super viewDidLoad];
   // self.loadData;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
   /* self.navigationItem.leftBarButtonItem=nil;
    self.navigationItem.hidesBackButton=YES;
    [self.navigationController setNavigationBarHidden:YES];*/
    
    // LABELS
    /*_lblEmail.text = NSLocalizedString(@"LABEL_LOGINEMAIL", @"");
    _lblPasswort.text = NSLocalizedString(@"LABEL_LOGINPASSWORT", @"");
    _lblPasswortVergessen.text = NSLocalizedString(@"LABEL_LOGINPASSWORTVERGESSEN", @"");
    _lblNeuRegistrieren.text = NSLocalizedString(@"LABEL_LOGINNEUREGISTRIEREN", @""); */
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonGedrueckt:(id)sender {
    NSLog(@"button gedrueckt");
    
    LoginRequest* request  = [LoginRequest getInstance];
    [request requestActivation:txtUsername.text :txtPassword.text];
    
    request.username = txtUsername.text;
    request.password = txtPassword.text;
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)buttonRegi:(id)sender {
    NSLog(@"Regi pressed");
    [[ViewMediator getInstance] vonLoginZuVorRegi];
}

- (IBAction)buttonMap:(id)sender {
    NSLog(@"Map pressed");
    [[ViewMediator getInstance] vonLoginZuMap];
   
}

-(IBAction)buttonPasswortZuruecksetzen:(id)sender
{
    NSLog(@"PW pressed");
    [[ViewMediator getInstance] vonLoginZuPW];
}



- (void)dealloc {
    [_lblEmail release];
    [_lblPasswort release];
    [_lblPasswortVergessen release];
    [_lblNeuRegistrieren release];
    [super dealloc];
}
@end

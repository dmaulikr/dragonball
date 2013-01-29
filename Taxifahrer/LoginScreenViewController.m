//
//  LoginScreenViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 23.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

// Test@test.de
// 677497

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

    LoginSpeichern* um = [LoginSpeichern getInstance];
    
    txtPassword.text = um.password;
    txtUsername.text = um.username;
    
    [um saveData];
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)buttonRegi:(id)sender {
    NSLog(@"Regi pressed");
    [[ViewMediator getInstance] vonLoginZuRegi];
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


@end

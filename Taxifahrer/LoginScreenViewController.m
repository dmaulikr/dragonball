//
//  LoginScreenViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 23.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "LoginScreenViewController.h"
#import "LoginRequest.h"
#import "ViewMediator.h"
#import "ConfigRequest.h"

@implementation LoginScreenViewController
@synthesize txtUsername;
@synthesize txtPassword;
@synthesize btnLogin;
@synthesize lblErgebnis;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
    
    [[ConfigRequest getInstance]requestConfig:txtUsername:txtPassword];
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

@end

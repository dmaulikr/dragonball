//
//  LoginScreenViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 23.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "LoginScreenViewController.h"
#import "LoginRequest.h"

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
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end

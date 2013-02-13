//
//  PasswortZuruecksetzenViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 29.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "PasswortZuruecksetzenViewController.h"
#import "EmailRequest.h"
#import "ViewMediator.h"

@interface PasswortZuruecksetzenViewController ()

@end

@implementation PasswortZuruecksetzenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)PWButton:(id)sender
{
    if (_txtEmail.text != nil && [_txtEmail.text isEqualToString:@""] == false) {
        [[EmailRequest getInstance] sendPasswordRequest:_txtEmail.text];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erfolg!" message:@"Dein Passwort wurde an die angegebene E-Mail gesendet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"OK", nil];
        [alert show];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) backToLogin:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

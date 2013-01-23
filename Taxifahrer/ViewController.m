//
//  ViewController.m
//  Taxifahrer
//
//  Created by Kevin Wagner on 08.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "ViewController.h"
#import "UserdataManager.h"
@interface ViewController ()

@end

@implementation ViewController

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






-(IBAction) speichern:(id)sender
{
    
    
    if (txtEmail == nil || [txtEmail.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"OK", nil];
        [alert show];
    }

    else if (txtPhone == nil || [txtPhone.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"OK", nil];
        [alert show];
    }
    else if (txtlastName == nil || [txtlastName.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"OK", nil];
        [alert show];
    }
    else if (txtforename == nil || [txtforename.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"OK", nil];
        [alert show];
    }
    else if (txtStreet == nil || [txtStreet.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"OK", nil];
        [alert show];
    }
    else if (txtStreetnumber == nil || [txtStreetnumber.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"OK", nil];
        [alert show];
    }
    else if (txtPLZ == nil || [txtPLZ.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"OK", nil];
        [alert show];
    }
    else

    
    
    
    {
    
    UserdataManager* usermanager = [[UserdataManager alloc] init];
    
    
        [usermanager requestRegistrationWithSalutation:1 lastName:txtlastName.text forename:txtforename.text username:txtEmail.text taxiID:@"12345" company:@"Taxi Alex" street:txtStreet.text streetnumber:txtStreetnumber.text plz:txtPLZ.text city:@"Hamburg" taxisize:5 advertiseID:@"" phone:txtPhone.text licenseplate:@"HH-R10"];}
}






-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}




-(void) animateTextField: (UITextField*) textField up: (BOOL) up distance: (int) distance
{
    const int movementDistance = distance;
    const float movementDuration = 0.3f;
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}


-(IBAction)nachobenschieben:(id)sender
{
    [self animateTextField: sender up: NO distance: -140];
}


-(IBAction)positionwiederherstellen:(id)sender;
{
    [self animateTextField: sender up: NO distance: 140];
}

- (void)dealloc {
    
    [super dealloc];
}
@end

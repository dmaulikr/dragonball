//
//  ViewController.m
//  Taxifahrer
//
//  Created by Kevin Wagner on 08.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "ViewController.h"
#import "UserdataManager.h"
#import "ViewMediator.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //LABELS
    _lblEmail.text = NSLocalizedString(@"LABEL_REGIEMAIL", @"");
    _lblTelefon.text = NSLocalizedString(@"LABEL_REGITELEFON", @"");
    _lblVorname.text = NSLocalizedString(@"LABEL_REGIVORNAME", @"");
    _lblNachname.text = NSLocalizedString(@"LABEL_REGINACHNAME", @"");
    _lblStrasse.text = NSLocalizedString(@"LABEL_REGISTRASSE", @"");
    _lblHausnummer.text = NSLocalizedString(@"LABEL_REGIHAUSNUMMER", @"");
    _lblPostleitzahl.text = NSLocalizedString(@"LABEL_REGIPOSTLEITZAHL", @"");
    _lblRegistrieren.text = NSLocalizedString(@"LABEL_REGIREGIBUTTON", @""); 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// Registrierung
-(IBAction) speichern:(id)sender
{
    if (txtEmail == nil || [txtEmail.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }

    else if (txtPhone == nil || [txtPhone.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if (txtlastName == nil || [txtlastName.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if (txtforename == nil || [txtforename.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if (txtStreet == nil || [txtStreet.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if (txtStreetnumber == nil || [txtStreetnumber.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if (txtPLZ == nil || [txtPLZ.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fehler" message:@"Bitte fülle alle Felder aus." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
    
    UserdataManager* usermanager = [[UserdataManager alloc] init];
    
    
        [usermanager requestRegistrationWithSalutation:1 lastName:txtlastName.text forename:txtforename.text username:txtEmail.text taxiID:@"12345" company:@"Taxi Alex" street:txtStreet.text streetnumber:txtStreetnumber.text plz:txtPLZ.text city:@"Hamburg" taxisize:5 advertiseID:@"" phone:txtPhone.text licenseplate:@"HH-R10"];}
    
    //[self.navigationController popViewControllerAnimated:YES];
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

- (void)dealloc
{
    [_lblEmail release];
    [_lblTelefon release];
    [_lblVorname release];
    [_lblNachname release];
    [_lblStrasse release];
    [_lblHausnummer release];
    [_lblPostleitzahl release];
    [_lblRegistrieren release];
    [super dealloc];
}

@end

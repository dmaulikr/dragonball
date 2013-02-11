//
//  ViewController.h
//  Taxifahrer
//
//  Created by Kevin Wagner on 08.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ViewController : UIViewController
{
    IBOutlet UITextField* txtEmail;
    IBOutlet UITextField* txtPassword;
    IBOutlet UITextField* txtPhone;
    IBOutlet UITextField* txtlastName;
    IBOutlet UITextField* txtforename;
    IBOutlet UITextField* txtStreet;
    IBOutlet UITextField* txtStreetnumber;
    IBOutlet UITextField* txtPLZ;
    
    
    IBOutlet UIButton* btnSpeichern;
}

-(IBAction) registrieren:(id)sender;
-(IBAction)nachobenschieben:(id)sender;
-(IBAction)positionwiederherstellen:(id)sender;

@end

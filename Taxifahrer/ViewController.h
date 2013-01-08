//
//  ViewController.h
//  Taxifahrer
//
//  Created by Kevin Wagner on 08.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UITextField* txtUsername;
    IBOutlet UITextField* txtPassword;
    IBOutlet UITextField* txtPhone;
    
    IBOutlet UIButton* btnSpeichern;
}

-(IBAction) registrieren:(id)sender;

@end

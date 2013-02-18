//
//  PasswortZuruecksetzenViewController.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 29.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasswortZuruecksetzenViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *txtEmail;
@property (retain, nonatomic) IBOutlet UILabel *lblUeberschrift;
@property (retain, nonatomic) IBOutlet UILabel *lblEmail;
@property (retain, nonatomic) IBOutlet UILabel *lblPasswortZuschickenButton;
@property (retain, nonatomic) IBOutlet UILabel *lblAnmeldenButton;

-(IBAction)PWButton:(id)sender;
-(IBAction)backToLogin:(id)sender;

@end

//
//  LoginScreenViewController.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 23.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginScreenViewController : UIViewController
{
    IBOutlet UITextField* txtUsername;
    IBOutlet UITextField* txtPassword;
    IBOutlet UIButton* btnLogin;
    IBOutlet UILabel* lblErgebnis;
}

@property (nonatomic,retain) IBOutlet UITextField* txtUsername;
@property (nonatomic,retain) IBOutlet UITextField* txtPassword;
@property (nonatomic,retain) IBOutlet UIButton* btnLogin;
@property (nonatomic,retain) IBOutlet UILabel* lblErgebnis;
- (IBAction)buttonGedrueckt:(id)sender;

@end

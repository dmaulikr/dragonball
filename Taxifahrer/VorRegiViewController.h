//
//  VorRegiViewController.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 05.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VorRegiViewController : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *lblAGBAkzeptieren;
@property (retain, nonatomic) IBOutlet UILabel *lblUnsereAGBs;
@property (retain, nonatomic) IBOutlet UILabel *lblZurRegi;
-(IBAction)buttonAGB:(id)sender;
-(IBAction)buttonRegi:(id)sender;

@end

//
//  AGBViewController.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 05.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGBViewController : UIViewController

- (IBAction)buttonZuRegi:(id)sender;
- (IBAction)buttonZuLogin:(id)sender;

@property (retain, nonatomic) IBOutlet UILabel *lblUeberschrift;
@property (retain, nonatomic) IBOutlet UILabel *lblAGBs;
@property (retain, nonatomic) IBOutlet UILabel *lblZurRegiButton;


@end

//
//  ProfilViewController.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 22.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewMediator;

@interface ProfilViewController : UIViewController

@property (nonatomic,retain) IBOutlet ViewMediator* mediator;

-(IBAction)Karte:(id)sender;

@end

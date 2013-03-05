//
//  ProfilTableViewController.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 05.03.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MottoCell.h"

@class ViewMediator;
@class MapViewController;
@class HelligkeitViewController;

@interface ProfilTableViewController : UITableViewController
{
    IBOutlet MottoCell* mottocell;
    
    HelligkeitViewController* HelligkeitViewController;
}

@property (nonatomic,retain) IBOutlet ViewMediator* mediator;
@property (nonatomic,retain) MapViewController* Map;

-(IBAction)Karte:(id)sender;

@end

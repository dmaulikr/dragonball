//
//  ProfilViewController.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 22.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewMediator;
@class MapViewController;
@class HelligkeitViewController;

@interface ProfilViewController : UIViewController

@property (nonatomic,retain) IBOutlet ViewMediator* mediator;
@property (nonatomic,retain) MapViewController* Map;

-(IBAction)Karte:(id)sender;

@end

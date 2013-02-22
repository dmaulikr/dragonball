//
//  HelligkeitViewController.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 22.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewMediator;

@interface HelligkeitViewController : UIViewController

@property (retain, nonatomic) IBOutlet UISlider *slider;
@property (retain, nonatomic) IBOutlet UILabel *lblTitel;

@property (nonatomic,retain) IBOutlet ViewMediator* mediator;

-(IBAction) valueChanged:(id)sender;

@end

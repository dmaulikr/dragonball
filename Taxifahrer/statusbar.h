//
//  statusbar.h
//  Taxifahrer
//
//  Created by Kevin Wagner on 11.03.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewMediator;
@class MapViewController;
@class JobCenter;
@interface statusbar : UIViewController
{
    IBOutlet UIButton *btnanfahrt;
    IBOutlet UIButton *btnbinda;
    IBOutlet UIButton *btnbeginneauftrag;
    IBOutlet UIButton *btnfertig;
    IBOutlet UIButton *btnbeschwerde;
    int anfahrt;
}
@property (retain, nonatomic) IBOutlet UIButton *btnanfahrt;
@property (retain, nonatomic) IBOutlet UIButton *btnbinda;
@property (retain, nonatomic) IBOutlet UIButton *btnbeginneauftrag;
@property (retain, nonatomic) IBOutlet UIButton *btnfertig;
@property (retain, nonatomic) IBOutlet UIButton *btnbeschwerde;
@property (nonatomic,retain) IBOutlet ViewMediator* mediator;
@property (nonatomic,retain) MapViewController* mapvc;
@property (nonatomic,retain) JobCenter* jc;

-(IBAction) btnanfahrtPressed;
-(IBAction)btnbindaPressed;
-(IBAction)btnBeginneAuftragPressed;
-(IBAction)btnfertigPressed;
-(void) angenommenejobszubeendetejobs;


@end

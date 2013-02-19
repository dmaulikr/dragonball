//
//  TabMainViewController.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 16.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewMediator;

@interface TabMainViewController : UIViewController
{
    IBOutlet UIButton* btnKarte;
    IBOutlet UIButton* btnAuftraege;
    IBOutlet UIButton* btnBezahlen;
    IBOutlet UIButton* btnVerfuegbar;
    IBOutlet UIButton* btnStandby;
    
    UILabel *lblKarte;
    UILabel *lblAuftraege;
    UILabel *lblBezahlen;
    UILabel *lblVerfuegbar;
    UILabel *lblStandby;
    
    int VerfuegbarCheck;
    int StandbyCheck;
}

@property (nonatomic,retain) IBOutlet UIButton* btnKarte;
@property (nonatomic,retain) IBOutlet UIButton* btnAuftraege;
@property (nonatomic,retain) IBOutlet UIButton* btnBezahlen;
@property (nonatomic,retain) IBOutlet UIButton* btnVerfuegbar;
@property (nonatomic,retain) IBOutlet UIButton* btnStandby;

@property (retain, nonatomic) IBOutlet UILabel *lblKarte;
@property (retain, nonatomic) IBOutlet UILabel *lblAuftraege;
@property (retain, nonatomic) IBOutlet UILabel *lblBezahlen;
@property (retain, nonatomic) IBOutlet UILabel *lblVerfuegbar;
@property (retain, nonatomic) IBOutlet UILabel *lblStandby;

@property (nonatomic,retain) IBOutlet ViewMediator* mediator;

-(IBAction) KarteButtonPressed:(id)sender;
-(IBAction) AuftragButtonPressed:(id)sender;
-(IBAction) BezahlenButtonPressed:(id)sender;
-(IBAction) VerfuegbarButtonPressed:(id)sender;
-(IBAction) StandbyButtonPressed:(id)sender;

@end

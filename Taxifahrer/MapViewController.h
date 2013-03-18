//
//  MapViewController.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 23.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@class ViewMediator;
@class CJob;
@class ProfilTableViewController;


#define MAP_DELTA_RANGE 0.0600 // 0.0025

@class ImageAnnotation;
@class TabMainViewController;
@class statusbar;

#define NOTIFICATION_DETAILTWOFORJOB @"job"

@interface MapViewController : UIViewController <MKMapViewDelegate>
{
    UIImageView* imgDetail;
    UILabel* lblName;
    UILabel* lblStrasse;
    UILabel* lblOrt;
    UILabel* lblDetails;
    UILabel* lblTime;
    UILabel* lblAnnehmen;
    
    UIImageView* imgKm;
    UIImageView* imgZeit;
    UIImageView* imgUhr;
    
    UIButton* bigBackButton;
    UIButton* btnJobYes;
    UIButton* btnJobNo;
    
    CJob* displayedJob;
    TabMainViewController* tabMain;
    statusbar* statustab;
    
    NSMutableArray* allejobs;
}

@property (nonatomic,retain) UIImageView* imgDetail;

@property (retain, nonatomic) IBOutlet MKMapView *mapview;
@property (retain, nonatomic) IBOutlet UILabel *lblKoordinate;
@property (nonatomic,retain) IBOutlet ViewMediator* mediator;
@property (nonatomic,retain) ProfilTableViewController* Profil;


- (IBAction)buttonZuRegi:(id)sender;

-(void) jobsZeichnen;
-(void) locationErhalten:(NSNotification*) nachricht;
-(void) locationFehler:(NSNotification*) nachricht;
-(void) showYesAndNoButton;
-(void) wiedertabmainzeigen;

-(IBAction)Profil:(id)sender;
-(IBAction) rejectButtonPressed:(id)sender;

@end

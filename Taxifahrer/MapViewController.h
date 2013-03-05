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
@class ProfilViewController;


#define MAP_DELTA_RANGE 0.0600 // 0.0025

@class ImageAnnotation;
@class TabMainViewController;

@interface MapViewController : UIViewController <MKMapViewDelegate>
{
    UIImageView* imgDetail;
    UILabel* lblName;
    UILabel* lblStrasse;
    UILabel* lblOrt;
    UILabel* lblDetails;
    UILabel* lblTime;
    UILabel* lblAnnehmen;
    UILabel* lblPLZ;
    
    UIImageView* imgKm;
    UIImageView* imgZeit;
    UIImageView* imgUhr;
    
    UIButton* bigBackButton;
    
    CJob* displayedJob;
    TabMainViewController* tabMain;
}

@property (nonatomic,retain) UIImageView* imgDetail;

@property (retain, nonatomic) IBOutlet MKMapView *mapview;
@property (retain, nonatomic) IBOutlet UILabel *lblKoordinate;
@property (nonatomic,retain) IBOutlet ViewMediator* mediator;
@property (nonatomic,retain) ProfilViewController* Profil;


- (IBAction)buttonZuRegi:(id)sender;

-(void) jobsZeichnen;
-(void) locationErhalten:(NSNotification*) nachricht;
-(void) locationFehler:(NSNotification*) nachricht;

-(IBAction)Profil:(id)sender;

@end

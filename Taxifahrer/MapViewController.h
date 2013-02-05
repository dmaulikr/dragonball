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

#define MAP_DELTA_RANGE 0.0600 // 0.0025

@class ImageAnnotation;

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (retain, nonatomic) IBOutlet MKMapView *mapview;

@property (retain, nonatomic) IBOutlet UILabel *lblKoordinate;


//-(void) locationErhalten:(NSNotification*) nachricht;
//-(void) locationFehler:(NSNotification*) nachricht;

@end

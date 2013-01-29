//
//  ImageAnnotation.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 29.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <MapKit/MapKit.h>
#import "MapViewController.h"

@interface ImageAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    NSString* mytitle;
    NSString* mysubtitle;
    UIImageView* m_ImageView;
  }

@property (nonatomic,copy) NSString* mytitle;
@property (nonatomic,copy) NSString* mysubtitle;

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;
@property (nonatomic,retain) UIImageView* m_ImageView;

-(void) setTitle:(NSString*) title;
-(void) setSubtitle:(NSString*) subtitle;
-(id)initWithCoordinate:(CLLocationCoordinate2D) c;

@end

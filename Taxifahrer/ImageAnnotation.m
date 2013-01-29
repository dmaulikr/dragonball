//
//  ImageAnnotation.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 29.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "ImageAnnotation.h"
#import "MapViewController.h"

@implementation ImageAnnotation
@synthesize coordinate;
@synthesize m_ImageView;
@synthesize mytitle;
@synthesize mysubtitle;

- (NSString *)subtitle{
	return mysubtitle;
}

- (NSString *)title{
	return mytitle;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
	mytitle = @"TAXI";
    coordinate=c;
    self.m_ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"owntaxi2.png"]];
	return self;
}

-(void) setSubtitle:(NSString *)subtitle
{
    self.mysubtitle = subtitle;
}

-(void) setTitle:(NSString*) title
{
    self.mytitle = title;
}


@end
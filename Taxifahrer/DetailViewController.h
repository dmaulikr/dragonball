//
//  DetailViewController.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 25.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewMediator;
@class CJob;

@interface DetailViewController : UIViewController
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
    
    CJob* displayedJob;
}

@property (nonatomic,retain) UIImageView* imgDetail;

@end

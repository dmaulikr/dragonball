//
//  DetailViewController.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 25.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewMediator;

@interface DetailViewController : UIViewController
{
    UIImageView* d_ImageView;
}

@property (nonatomic,retain) UIImageView* d_ImageView;

@end

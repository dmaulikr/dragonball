//
//  statusbar.h
//  Taxifahrer
//
//  Created by Kevin Wagner on 11.03.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "ViewController.h"

@interface statusbar : ViewController
{
    int anfahrt;
}
@property (retain, nonatomic) IBOutlet UIButton *btnanfahrt;
@property (retain, nonatomic) IBOutlet UIButton *btnbinda;
@property (retain, nonatomic) IBOutlet UIButton *btnbeginneauftrag;
@property (retain, nonatomic) IBOutlet UIButton *btnfertig;
@property (retain, nonatomic) IBOutlet UIButton *btnbeschwerde;


@end

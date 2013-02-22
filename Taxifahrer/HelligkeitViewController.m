//
//  HelligkeitViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 22.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "HelligkeitViewController.h"
#import "DataManager.h"

@interface HelligkeitViewController ()

@end

@implementation HelligkeitViewController
@synthesize slider;
@synthesize lblTitel;
@synthesize mediator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(IBAction) valueChanged:(id)sender
{
    DataManager* manager = [DataManager getInstance];
    [manager saveMapBrightness:slider.value];
}

- (void)dealloc {
    [slider release];
    [lblTitel release];
    [super dealloc];
}

@end

//
//  statusbar.m
//  Taxifahrer
//
//  Created by Kevin Wagner on 11.03.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "statusbar.h"

@interface statusbar ()

@end

@implementation statusbar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    anfahrt = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)btn1blinkenlassen
{
    if (anfahrt == 0)
    {
        self.btnanfahrt.highlighted = YES;
        wait(1);
        self.btnanfahrt.highlighted = NO;
        [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(btn1blinkenlassen) userInfo:NO repeats:nil];
    }
}

- (void)dealloc {
    [_btnanfahrt release];
    [_btnbinda release];
    [_btnbeginneauftrag release];
    [_btnfertig release];
    [_btnbeschwerde release];
    [super dealloc];
}
@end

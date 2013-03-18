//
//  statusbar.m
//  Taxifahrer
//
//  Created by Kevin Wagner on 11.03.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "statusbar.h"
#import "ViewMediator.h"
#import "MapViewController.h"

@interface statusbar ()


@end


@implementation statusbar
@synthesize btnanfahrt;
@synthesize btnbeginneauftrag;
@synthesize btnfertig;
@synthesize btnbinda;
@synthesize btnbeschwerde;
@synthesize mediator;
@synthesize mapvc;

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
    [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(btn1blinkenlassen) userInfo:NO repeats:nil];
    btnanfahrt.enabled = YES;
    btnbeginneauftrag.enabled = NO;
    btnbeschwerde.enabled = YES;
    btnbinda.enabled = NO;
    btnfertig.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Notiz an mich (Kevin)
//Status 0 muss noch hinzugefuegt werden
//Bedenke, dass beim freischalten nach Erledigung des Auftrages ein neuer Auftrag verfuegbar sein muss, damit die Dinger wieder blinken/es nutzbar ist



-(IBAction) btnanfahrtPressed
{
    anfahrt = 1;
    NSLog(@"Anfahrt wurde gedrueckt");
    btnanfahrt.enabled = NO;
    btnbinda.enabled = YES;
}

-(IBAction)btnbindaPressed
{
    NSLog(@"BinDa wurde gedrueckt");
    btnbinda.enabled = NO;
    btnbeginneauftrag.enabled = YES;
}

-(IBAction)btnBeginneAuftragPressed
{
    NSLog(@"BeginneAuftrag gedrueckt");
    btnbeginneauftrag.enabled = NO;
    btnfertig.enabled = YES;
}

-(IBAction)btnfertigPressed
{
    NSLog(@"Fertig gedrueckt");
    btnfertig.enabled = NO;
    anfahrt = 0;
    btnanfahrt.enabled = YES;
    MapViewController* zeiger = [MapViewController getInstance];
    [zeiger wiedertabmainzeigen];
    
}




//Blinkfunktionen
-(void)btn1blinkenlassen
{
    if (anfahrt == 0 && btnanfahrt.enabled == YES)
    {
        btnanfahrt.highlighted = YES;
        [NSTimer scheduledTimerWithTimeInterval:1.00 target:self selector:@selector(btn1blinkenlassen2) userInfo:NO repeats:nil];
       
    }
    
}


-(void)btn1blinkenlassen2
{
    if (anfahrt == 0 && btnanfahrt.enabled == YES)
    {
        
        btnanfahrt.highlighted = NO;
        [NSTimer scheduledTimerWithTimeInterval:1.00 target:self selector:@selector(btn1blinkenlassen) userInfo:NO repeats:nil];
        
    }
    
}

//Blinkfunktionen Ende

- (void)dealloc {
    [btnanfahrt release];
    [btnbinda release];
    [btnbeginneauftrag release];
    [btnfertig release];
    [btnbeschwerde release];
    [super dealloc];
}
@end

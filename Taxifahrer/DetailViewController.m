//
//  DetailViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 25.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

/*
 Gedankengang Dennis:
 
 User drückt auf einen Job 
 -> Der DetailViewController wird gestartet 
 -> Der gedrückte Job wird daran gesendet 
 -> Das Image (job_red3.png) wird erstellt und das Array der Tabelle mit den enthaltenen Jobs wird ausgewertet und auf den/das (?) Image gelegt
 -> Das Image wird samt Informationen auf die Karte gelegt (Genau wie die TabMains, nehme ich mal an) 
 -> Nebenbei wird noch ein Button über die komplette Karte gelegt (Hinter dem Image), dass wenn man drauf drückt auf die normale Karte kommt
*/

#import "DetailViewController.h"
#import "TabellenViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize d_ImageView;

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
    
    self.d_ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"job_red3.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

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
#import "JobButton.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize imgDetail;


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
    
    // -------- Code aus Thorstens Projekt -imgDetail bereits erstellt ----------
    
    imgDetail = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PortraitDetail2.png"]];
    imgDetail.frame = CGRectMake(0, 0, imgDetail.image.size.width, imgDetail.image.size.height);
    [self.view addSubview:imgDetail];
    
    // ..
    
    UIFont* f1 = [UIFont systemFontOfSize: 18.0f];
    UIFont* f2 = [UIFont systemFontOfSize: 13.0f];
    
    lblName = [[UILabel alloc] initWithFrame:CGRectMake(13, 14, 227, 21)];
    [lblName setTextColor:[UIColor whiteColor]];
    [lblName setFont:f1];
    [lblName setBackgroundColor:[UIColor clearColor]];
    [imgDetail addSubview:lblName];
    
    lblAnnehmen = [[UILabel alloc] initWithFrame:CGRectMake(36, 186, 252, 24)];
    [lblAnnehmen setTextColor:[UIColor whiteColor]];
    [lblAnnehmen setFont:f1];
    [lblAnnehmen setBackgroundColor:[UIColor clearColor]];
    lblAnnehmen.textAlignment = UITextAlignmentCenter;
    lblAnnehmen.text = NSLocalizedString(@"STR_LABEL_DOACCEPT", @"");
    [imgDetail addSubview:lblAnnehmen];
    
    // ..
    
    
    lblStrasse = [[UILabel alloc] initWithFrame:CGRectMake(13, 38, 227, 21)];
    [lblStrasse setTextColor:[UIColor whiteColor]];
    [lblStrasse setFont:f1];
    [lblStrasse setBackgroundColor:[UIColor clearColor]];
    [imgDetail addSubview:lblStrasse];
    
    lblOrt = [[UILabel alloc] initWithFrame:CGRectMake(13, 58, 227, 21)];
    [lblOrt setTextColor:[UIColor whiteColor]];
    [lblOrt setFont:f1];
    [lblOrt setBackgroundColor:[UIColor clearColor]];
    [imgDetail addSubview:lblOrt];
    
    lblDetails = [[UILabel alloc] initWithFrame:CGRectMake(13, 80, 227, 50)];
    [lblDetails setTextColor:[UIColor whiteColor]];
    [lblDetails setFont:f2];
    [lblDetails setNumberOfLines:3];
    [lblDetails setBackgroundColor:[UIColor clearColor]];
    [imgDetail addSubview:lblDetails];
    
    lblTime = [[UILabel alloc] initWithFrame:CGRectMake(190, 190, 120, 20)];
    [lblTime setTextColor:[UIColor colorWithRed:210.0f/255.0f green:130.0f/255.0f blue:95.0f/255.0f alpha:1.0]];
    [lblTime setFont:f1];
    [lblTime setNumberOfLines:1];
    [lblTime setBackgroundColor:[UIColor clearColor]];
    [imgDetail addSubview:lblTime];
    
    imgKm = [[UIImageView alloc] initWithFrame:CGRectMake(13, 165, 95, 45)];
    imgKm.contentMode = UIViewContentModeScaleAspectFit;
    [imgDetail addSubview:imgKm];
    imgZeit = [[UIImageView alloc] initWithFrame:CGRectMake(180, 165, 79, 45)];
    [imgDetail addSubview:imgZeit];
    
    imgUhr = [[UIImageView alloc] initWithFrame:CGRectMake(150, 163, 25, 33)];
    imgUhr.image = [UIImage imageNamed:@"gelbeuhr.png"];
    [imgDetail addSubview:imgUhr];
    imgDetail.hidden = YES;
    
    bigBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bigBackButton.titleLabel.text = @"";
    bigBackButton.enabled = NO;
    bigBackButton.frame = CGRectMake(0, 0, imgDetail.frame.size.width, imgDetail.frame.size.height);
    [bigBackButton addTarget:self action:@selector(hideJobDetails) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bigBackButton];
    
    button.Job = Job;
    
    lblName.text = job.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
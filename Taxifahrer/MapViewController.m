//
//  MapViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 23.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

//#import "SimpleLocationManager.h"
#import "MapViewController.h"
#import "ImageAnnotation.h"
#import "CJob.h"
#import "JobButton.h"
#import "JobGenerator.h"
#import "JobCenter.h"
#import "ViewMediator.h"
#import "TabMainViewController.h"
#import "ProfilViewController.h"
#import "TabellenViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapview;
@synthesize mediator;
@synthesize Profil;
@synthesize imgDetail;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.Profil = [[ProfilViewController alloc] initWithNibName:@"ProfilViewController" bundle:nil];
    
    NSLog(@"viewDidLoad des MapViewControllers");
    [mapview setShowsUserLocation:YES];
    //Springe zum Ort des Benutzers
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Profil" style:UIBarButtonItemStylePlain target:self action:@selector(Profil:)];
    self.navigationItem.leftBarButtonItem = rightButton;
    [rightButton release];

    JobGenerator* zeiger = [JobGenerator getInstance];
    [zeiger starteGenerator];
    
    _lblKoordinate.text = @"Noch keine Daten";
    //Hier wird der SimpleLocationManager gestartet
    //[[SimpleLocationManager getInstance] startUpdatingLocation];
    
    // Ort zuweisen
    MKCoordinateRegion region;
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 53.55f;
    coordinate.longitude = 10.0f;
    
    /* coordinate.latitude = coordinate.latitude;
    coordinate.longitude = coordinate.longitude; */
    
    NSLog(@"%f, %f", coordinate.latitude, coordinate.longitude);
    
    region.center = coordinate;
    region.span.longitudeDelta=MAP_DELTA_RANGE;
    region.span.latitudeDelta=MAP_DELTA_RANGE;
    mapview.region=region;
    
    mapview.delegate=self;

    ImageAnnotation* taxiAnnotation = [[ImageAnnotation alloc] initWithCoordinate:coordinate];
    taxiAnnotation.mytitle = ANNOTATION_TAXI;
    [mapview addAnnotation:taxiAnnotation];
    
    [self jobsZeichnen];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jobDetail:) name:NOTIFICATION_DETAILFORJOB object:nil];
    
    
    imgDetail.hidden = YES;
    bigBackButton.enabled = NO;
    bigBackButton.hidden = YES;

    
    
}

-(void) viewDidAppear:(BOOL)animated
{
    tabMain = [[ViewMediator getInstance] tabMainController];
    tabMain.view.frame = CGRectMake(0, 367, 320, 49);
    [self.view addSubview:tabMain.view];
}

-(void) jobsZeichnen
{
    NSLog(@"jobsZeichnen");
    
    // Alle alten Annotations loeschen
    [mapview removeAnnotations:mapview.annotations];
    
    JobCenter* jobcenterzeiger = [JobCenter getInstance];
    NSMutableArray* alleJobs = jobcenterzeiger.offeneJobs;
    
    for (int i = 0; i < [alleJobs count];i++) {
        CJob* beispieljob = [alleJobs objectAtIndex:i];
        
        double breitengrad = [beispieljob.latitude doubleValue];
        double laengengrad = [beispieljob.longitude doubleValue];
        CLLocationCoordinate2D unsereKoordinate = CLLocationCoordinate2DMake(breitengrad, laengengrad);
        
        // Wir erschaffen ein Objekt vom Typ ImageAnnotation. Dieses haben wir selbst definiert
        ImageAnnotation* jobAnnotation = [[ImageAnnotation alloc] initWithCoordinate:unsereKoordinate];
        // Das Objekt wird zur Karte addiert (das Objekt, noch nicht das Bild)
        jobAnnotation.mytitle = ANNOTATION_GREENJOB;
        jobAnnotation.job = beispieljob;
        [mapview addAnnotation:jobAnnotation];
        
    }
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(jobsZeichnen) userInfo:nil repeats:NO];
}

#pragma mark implementation of MKMapViewDelegate

- (MKAnnotationView *) mapView: (MKMapView *) mapView viewForAnnotation: (id<MKAnnotation>) annotation
{
    static NSString* CustomerAnnotationIdentifier = @"pin";
    
    // Ist es eine unserer Pins oder ein Pin vom System (ImageAnnotation ist von uns)
    if ([annotation isKindOfClass:[ImageAnnotation class]])
    {
        // Malfläche vom Typ MKAnnotationView erschaffen
        MKAnnotationView *_annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:CustomerAnnotationIdentifier];
        
        ImageAnnotation* neueAnnotation = (ImageAnnotation*) annotation;
        
        if ([neueAnnotation.mytitle isEqualToString:ANNOTATION_GREENJOB])
        {
            
            CGPoint temp_annocenter = _annotationView.center;
            _annotationView.userInteractionEnabled=YES;
            //_annotationView.backgroundColor = [UIColor whiteColor];
            _annotationView.frame = CGRectMake(_annotationView.frame.origin.x, _annotationView.frame.origin.y, 80.0f, 47.0f);
            _annotationView.center = temp_annocenter;
            
            // Button auf Malfläche kleben
            ImageAnnotation* JobAnnotation = (ImageAnnotation*) annotation;
            [_annotationView addSubview:JobAnnotation.m_ImageView];
            JobAnnotation.m_ImageView.center = CGPointMake(_annotationView.frame.size.width/2, _annotationView.frame.size.height/2);
            
            CJob* Job = JobAnnotation.Job;
            
            // Button für Annotation erschaffen
            JobButton* button = [JobButton buttonWithType:UIButtonTypeCustom];
            [button setImage:JobAnnotation.m_ImageView.image forState:UIControlStateNormal];
            
            //button.backgroundColor = [UIColor redColor];
            button.frame = CGRectMake(0, 0, _annotationView.frame.size.width, _annotationView.frame.size.height);
            [button addTarget:self action:@selector(buttonGedrueckt:) forControlEvents:UIControlEventTouchUpInside];
            [_annotationView addSubview:button];
            
            button.Job = Job;
            
            // UILabel mit Namen des Kunden hinzufügen
            UILabel* meinLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, -3, 74, 23)];
            meinLabel.text = Job.street;
            meinLabel.textAlignment = NSTextAlignmentCenter;
            meinLabel.font = [UIFont fontWithName:@"Arial" size:10.0];
            meinLabel.textColor = [UIColor greenColor];
            meinLabel.backgroundColor = [UIColor clearColor];
            [_annotationView addSubview:meinLabel];
            
            UILabel* meinLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(3, 6, 74, 23)];
            meinLabel2.text = Job.name;
            meinLabel2.textAlignment = NSTextAlignmentCenter;
            meinLabel2.font = [UIFont fontWithName:@"Arial" size:10.0];
            meinLabel2.textColor = [UIColor greenColor];
            meinLabel2.backgroundColor = [UIColor clearColor];
            [_annotationView addSubview:meinLabel2];
            
            UILabel* meinLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(3, 15, 74, 23)];
            meinLabel3.text = Job.taxisize;
            meinLabel3.textAlignment = NSTextAlignmentCenter;
            meinLabel3.font = [UIFont fontWithName:@"Arial" size:10.0];
            meinLabel3.textColor = [UIColor greenColor];
            meinLabel3.backgroundColor = [UIColor clearColor];
            [_annotationView addSubview:meinLabel3];
            
            // Malfläche zurückliefern
            return _annotationView;
            
        }
        else if ([neueAnnotation.mytitle isEqualToString:ANNOTATION_TAXI])
        {
            neueAnnotation.m_ImageView.image = [UIImage imageNamed:@"mapTaxi20.png"];
            _annotationView.frame = CGRectMake(_annotationView.frame.origin.x, _annotationView.frame.origin.y, 26.0f, 15.0f);
            neueAnnotation.m_ImageView.frame =CGRectMake(_annotationView.frame.origin.x, _annotationView.frame.origin.y, 26.0f, 15.0f);
            [_annotationView addSubview:neueAnnotation.m_ImageView];
            return _annotationView;
        }
    }
    return nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidDisappear:(BOOL)animated
{
    // Wenn der ViewController von der Bildfäche verschwindet, braucht er keine Nachrichten mehr, daher meldet er sich
    // .. für alle Nachrichten beim NotificationCenter ab
}

-(void) buttonGedrueckt:(id)sender
{
    NSLog(@"Button gedrückt!");
    
    JobButton* jb = (JobButton*) sender;
    CJob* unserJob = jb.job;
    
    NSLog(@"Job für %@ wurde ausgewählt.", unserJob.name);
}

-(void) locationErhalten:(NSNotification*) nachricht
{
    NSLog(@"locationErhalten");
    
    // Wir packen das CLLocation* aus dem übergebenen NSNotification-Objekt (dem StandardObjekt für Nachrichten aus dem NSNotifictionCenter) aus.
    // Hier muss man wissen, welchen Typ das Objekt in der Nachricht haben soll. Da wir wissen, dass die Nachricht vom SimpleLocationManager kommt und wir den SimpleLocationManager selbst geschrieben haben, wandeln wir das Objekt in der Nachricht in eine CLLocation um.
    // Der Anhang der Nachricht befindet sich in dem Property .object.
    CLLocation* loc = (CLLocation*) nachricht.object;
    
    // Aus dem Location-Objekt holen wir uns nun eine Koordinate.
    CLLocationCoordinate2D coord = loc.coordinate;
    
    // Diese geben wir nun auf dem Bildschirm aus.
    NSString* bildschirmtext = [[NSString alloc] initWithFormat:@"Längengrad: %f  Breitengrad: %f",coord.longitude,coord.latitude];
    self.lblKoordinate.text = bildschirmtext;
}

-(void) locationFehler:(NSNotification*) nachricht
{
    NSLog(@"Fehler!");
}

-(IBAction)Profil:(id)sender
{
    NSLog(@"DONE");
    
    UINavigationController *navController = self.navigationController;
    [[self retain] autorelease];
   // [navController popViewControllerAnimated:NO];
    [navController pushViewController:self.Profil animated:NO];
}

-(void) jobDetail:(NSNotification*) notification
{
    displayedJob = (CJob*) notification.object;
    
    imgDetail = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PortraitDetail2.png"]];
    imgDetail.frame = CGRectMake(0, 0, imgDetail.image.size.width, imgDetail.image.size.height);
    [self.view addSubview:imgDetail];
    
    // ..
    
    UIFont* f1 = [UIFont systemFontOfSize: 18.0f];
    UIFont* f2 = [UIFont systemFontOfSize: 13.0f];
    
    lblName.text = displayedJob.name;
    lblName = [[UILabel alloc] initWithFrame:CGRectMake(3, 3, 74, 21)];
    [lblName setTextColor:[UIColor whiteColor]];
    [lblName setFont:f1];
    [lblName setBackgroundColor:[UIColor clearColor]];
    [imgDetail addSubview:lblName];
    
    /*
    lblAnnehmen = [[UILabel alloc] initWithFrame:CGRectMake(36, 186, 252, 24)];
    [lblAnnehmen setTextColor:[UIColor whiteColor]];
    [lblAnnehmen setFont:f1];
    [lblAnnehmen setBackgroundColor:[UIColor clearColor]];
    lblAnnehmen.textAlignment = UITextAlignmentCenter;
    lblAnnehmen.text = NSLocalizedString(@"STR_LABEL_DOACCEPT", @"");
    [imgDetail addSubview:lblAnnehmen];
    */
    // ..
    
    lblStrasse.text = displayedJob.street;
    lblStrasse = [[UILabel alloc] initWithFrame:CGRectMake(13, 38, 227, 21)];
    [lblStrasse setTextColor:[UIColor whiteColor]];
    [lblStrasse setFont:f1];
    [lblStrasse setBackgroundColor:[UIColor clearColor]];
    [imgDetail addSubview:lblStrasse];
    
    /*
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
    */
    bigBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bigBackButton.titleLabel.text = @"";
    bigBackButton.enabled = YES;
    bigBackButton.frame = CGRectMake(0, 0, imgDetail.frame.size.width, imgDetail.frame.size.height);
    [bigBackButton addTarget:self action:@selector(hideJobDetails) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bigBackButton];
}

-(IBAction)hideJobDetails
{
    NSLog(@"HIDEJOBDETAILLSLSSSSS");
  
    
    [self.view addSubview:mapview];
    [self.view addSubview:tabMain.view];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

@end

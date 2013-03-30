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
#import "ProfilTableViewController.h"
#import "TabellenViewController.h"
#import "DataManager.h"
#import "statusbar.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapview;
@synthesize mediator;
@synthesize Profil;
@synthesize imgDetail;
static MapViewController* MapView = nil;

+(MapViewController*) getInstance
{
    if (MapView == nil)
    {
        MapView = [[MapViewController alloc] init];
    }
    return MapView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.Profil = [[ProfilTableViewController alloc] initWithNibName:@"ProfilTableViewController" bundle:nil];
    
    NSLog(@"viewDidLoad des MapViewControllers [MapViewController]");
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
    
    NSLog(@"X: %f, Y: %f [MapViewController]", coordinate.latitude, coordinate.longitude);
    
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
    
    ButtonZaehler = 0;
    JobDetailsZaehler = 0;
}

-(void) viewDidAppear:(BOOL)animated
{
    tabMain = [[ViewMediator getInstance] tabMainController];
    tabMain.view.frame = CGRectMake(0, 367, 320, 49);
    [self.view addSubview:tabMain.view];
    

}

-(void) jobsZeichnen
{
    NSLog(@"jobsZeichnen [MapViewController]");
    
    // Alle alten Annotations loeschen
    [mapview removeAnnotations:mapview.annotations];
    
    JobCenter* jobcenterzeiger = [JobCenter getInstance];
    alleJobs = jobcenterzeiger.offeneJobs;
    
    for (i = 0; i < [alleJobs count];i++) {
        beispieljob = [alleJobs objectAtIndex:i];
        
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
            meinLabel.backgroundColor = [UIColor clearColor];
            [_annotationView addSubview:meinLabel];
            
            UILabel* meinLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(3, 6, 74, 23)];
            meinLabel2.text = Job.name;
            meinLabel2.textAlignment = NSTextAlignmentCenter;
            meinLabel2.font = [UIFont fontWithName:@"Arial" size:10.0];
            meinLabel2.backgroundColor = [UIColor clearColor];
            [_annotationView addSubview:meinLabel2];
            
            UILabel* meinLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(3, 15, 74, 23)];
            meinLabel3.text = Job.taxisize;
            meinLabel3.textAlignment = NSTextAlignmentCenter;
            meinLabel3.font = [UIFont fontWithName:@"Arial" size:10.0];
            meinLabel3.backgroundColor = [UIColor clearColor];
            [_annotationView addSubview:meinLabel3];
            
            if ([Job.jobstatus isEqualToString:@"accepted"])
            {
                meinLabel.textColor = [UIColor redColor];
                meinLabel2.textColor = [UIColor redColor];
                meinLabel3.textColor = [UIColor redColor];
            }
            else if ([Job.jobstatus isEqualToString:@"open"])
            {
                meinLabel.textColor = [UIColor greenColor];
                meinLabel2.textColor = [UIColor greenColor];
                meinLabel3.textColor = [UIColor greenColor];
            }
            
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
    NSLog(@"Button gedrückt! [MapViewController]");
    
    JobButton* jb = (JobButton*) sender;
    unserJob = jb.job;
    
    NSLog(@"Job für %@ wurde ausgewählt. [MapViewController]", unserJob.name);
    
   // CJob* newjob = [allejobs objectAtIndex:unserJob];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_DETAILTWOFORJOB object:unserJob];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jobDetail:) name:NOTIFICATION_DETAILTWOFORJOB object:nil];
}

-(void) locationErhalten:(NSNotification*) nachricht
{
    NSLog(@"locationErhalten [MapViewController]");
    
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
    NSLog(@"Fehler! [MapViewController]");
}

-(IBAction)Profil:(id)sender
{
    NSLog(@"zum Profil wechseln [MapViewController]");
    
    UINavigationController *navController = self.navigationController;
    [[self retain] autorelease];
    [navController pushViewController:self.Profil animated:YES];
}

-(void) jobDetail:(NSNotification*) notification
{
    displayedJob = (CJob*) notification.object;
    
    if (JobDetailsZaehler == 0)
    {
    
    imgDetail = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PortraitDetail2.png"]];
    imgDetail.frame = CGRectMake(0, 0, imgDetail.image.size.width, imgDetail.image.size.height);
    [self.view addSubview:imgDetail];
    [self.view bringSubviewToFront:imgDetail];
        
    UIFont* f1 = [UIFont systemFontOfSize: 18.0f];
    UIFont* f2 = [UIFont systemFontOfSize: 13.0f];
    
    lblName = [[UILabel alloc] initWithFrame:CGRectMake(45, 38, 227, 21)];
    [lblName setFont:f1];
    [lblName setBackgroundColor:[UIColor clearColor]];
    [lblName setTextColor:[UIColor redColor]];
    lblName.text = [NSString stringWithFormat:@"Name: %@", displayedJob.name];
    [imgDetail addSubview:lblName];
    
    lblStrasse = [[UILabel alloc] initWithFrame:CGRectMake(45, 70, 227, 21)];
    [lblStrasse setTextColor:[UIColor redColor]];
    [lblStrasse setFont:f1];
    [lblStrasse setBackgroundColor:[UIColor clearColor]];
    lblStrasse.text = [NSString stringWithFormat:@"Strasse: %@", displayedJob.street];
    [imgDetail addSubview:lblStrasse];
    
    bigBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bigBackButton.titleLabel.text = @"";
    bigBackButton.enabled = YES;
    bigBackButton.frame = CGRectMake(0, 0, imgDetail.frame.size.width, imgDetail.frame.size.height);
    [bigBackButton addTarget:self action:@selector(hideJobDetails) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bigBackButton];
    
    lblAnnehmen = [[UILabel alloc] initWithFrame:CGRectMake(36, 186, 252, 24)];
    [lblAnnehmen setTextColor:[UIColor whiteColor]];
    [lblAnnehmen setFont:f1];
    [lblAnnehmen setBackgroundColor:[UIColor clearColor]];
    lblAnnehmen.textAlignment = UITextAlignmentCenter;
    lblAnnehmen.text = NSLocalizedString(@"STR_LABEL_DOACCEPT", @"");
    [imgDetail addSubview:lblAnnehmen];
    
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
    
    imgUhr = [[UIImageView alloc] initWithFrame:CGRectMake(150, 150, 25, 33)];
    imgUhr.image = [UIImage imageNamed:@"gelbeuhr.png"];
    [imgDetail addSubview:imgUhr];
    
    //imgDetail.hidden = YES;
    CLLocationCoordinate2D coordinate;
    
    coordinate.latitude = [displayedJob.latitude doubleValue];
    coordinate.longitude = [displayedJob.longitude doubleValue];
    
    [mapview setCenterCoordinate:coordinate];
        
    JobDetailsZaehler = 1;
    }
    else 
    {
        imgDetail.hidden = NO;
        [self.view bringSubviewToFront:imgDetail];
        bigBackButton.enabled = YES;
        [self.view bringSubviewToFront:bigBackButton];
        
        lblName.text = [NSString stringWithFormat:@"Name: %@", displayedJob.name];
        lblStrasse.text = [NSString stringWithFormat:@"Strasse: %@", displayedJob.street];
    
    }
    [self showYesAndNoButton];
}

-(IBAction)hideJobDetails
{
    NSLog(@"HIDEJOBDETAILLSLSSSSS");
    
    imgDetail.hidden = YES;
    bigBackButton.enabled = NO;
    
    [self.view addSubview:mapview];
    [self.view addSubview:tabMain.view];
}

-(void) showYesAndNoButton
{
    if (ButtonZaehler == 0)
    {
    
    NSLog(@"showYesAndNoButton");
    btnJobNo = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnJobNo setBackgroundImage:[UIImage imageNamed:@"no.png"] forState:UIControlStateNormal];
    btnJobNo.frame = CGRectMake(48, 273, 78, 67);
    [btnJobNo addTarget:self action:@selector(rejectButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    btnJobNo.titleLabel.text = NSLocalizedString(@"JOB_NO", @"");
    [btnJobNo setTitle:NSLocalizedString(@"JOB_NO", @"") forState:UIControlStateNormal];
    
    btnJobYes = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnJobYes setBackgroundImage:[UIImage imageNamed:@"yes.png"] forState:UIControlStateNormal];
    btnJobYes.frame = CGRectMake(196, 273, 78, 67);
    [btnJobYes addTarget:self action:@selector(acceptJob:) forControlEvents:UIControlEventTouchUpInside];
    [btnJobYes setTitle:NSLocalizedString(@"JOB_YES", @"") forState:UIControlStateNormal];
    
    [self.view addSubview:btnJobNo];
    [self.view bringSubviewToFront:btnJobNo];
    
    [self.view addSubview:btnJobYes];
    [self.view bringSubviewToFront:btnJobYes];
    
    }
    else 
    {
        btnJobNo.hidden = NO;
        btnJobYes.hidden = NO;
        
        [self.view bringSubviewToFront:btnJobNo];
        [self.view bringSubviewToFront:btnJobYes];
    }
    
   // [self adjustDetailView];
}

-(void) hideYesAndNoButton
{
    /*NSLog(@"hideYesAndNoButton");
    if (btnJobNo != nil && [btnJobNo superview] != nil)
        [btnJobNo removeFromSuperview];
    if (btnJobYes != nil && [btnJobYes superview] != nil)
        [btnJobYes removeFromSuperview];
    
    btnJobNo = nil;
    btnJobYes = nil;
    */
    
    btnJobNo.hidden = YES;
    btnJobYes.hidden = YES;
    
    if (ButtonZaehler == 0)
    {
    ButtonZaehler = 1;
    }
    //[mapview removeAnnotation:btnJobYes];
    //[mapview removeAnnotation:btnJobNo];
}

- (IBAction)acceptJob:(id)sender
{
    JobCenter* Center = [[JobCenter alloc] init];
    
    NSLog(@"%@", unserJob.jobstatus);
    
    //unserJob.jobstatus = @"accepted";
    [Center.acceptedJobs addObject:unserJob];
    
    [allejobs removeObjectAtIndex:unserJob];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_ACCEPTEDJOB object:Center.acceptedJobs];
    
    //[allejobs removeObject:i];

    [self hideYesAndNoButton];
    self.navigationItem.rightBarButtonItem = nil;
    
    int minuten = 0;
    NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
    [[DataManager getInstance] showAcceptCustomerPendingAlert];
    //[[DataManager getInstance] requestAcceptClient:[userdefaults stringForKey:UDKeyUserName] :[userdefaults stringForKey:UDKeyPassword] :self.displayedJob : minuten];
    
    [self hideYesAndNoButton];
    [self hideJobDetails];
    lblAnnehmen.text = [NSString stringWithFormat:@"Auftrag angenommenn."];
    
    //[self.view addSubview:mapview];
    //[self.view addSubview:tabMain.view];
 
    //[self.view bringSubviewToFront:statustab.view];
    
    statustab = [[ViewMediator getInstance] statusmvc];
    statustab.view.frame = CGRectMake(0, 320, 320, 49);
    [self.view addSubview:statustab.view];
}

-(IBAction) rejectButtonPressed:(id)sender {
    NSLog(@"rejectButtonPressed");
    [self hideYesAndNoButton];
    
    // Job auf schwarze Liste setzen, damit er nicht mehr angezeigt wird
    //DataManager* manager = [DataManager getInstance];
    //[manager addToBlackList:self.displayedJob.token];
   
    //Hier soll eig. zur aktuellen Userposition gesprungen werden.
    MKCoordinateRegion region;
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 53.55f;
    coordinate.longitude = 10.0f;
    [mapview setCenterCoordinate:coordinate];
    
    [self hideJobDetails];
}



-(void) wiedertabmainzeigen
{
    NSLog(@"wiedertabmainanzeigen");
    
    statustab = [[ViewMediator getInstance] statusmvc];
    [statustab.view removeFromSuperview];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

@end

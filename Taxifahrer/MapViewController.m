//
//  MapViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 23.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "MapViewController.h"
#import "ImageAnnotation.h"
//#import "SimpleLocationManager.h"
#import "CJob.h"
#import "JobButton.h"
#import "JobGenerator.h"
#import "JobCenter.h"
#import "ViewMediator.h"


@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapview;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad des MapViewControllers");
    [mapview setShowsUserLocation:YES];
    //Springe zum Ort des Benutzers

    JobGenerator* zeiger = [JobGenerator getInstance];
    [zeiger starteGenerator];
    
    JobCenterZeiger = [JobCenter getInstance];
    
    _lblKoordinate.text = @"Noch keine Daten";
    // Hier wird der SimpleLocationManager gestartet
   // [[SimpleLocationManager getInstance] startUpdatingLocation];
    
    // Ort zuweisen
    MKCoordinateRegion region;
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 53.55f;
    coordinate.longitude = 10.0f;
    /*
    coordinate.latitude = coordinate.latitude;
    coordinate.longitude = coordinate.longitude;
   */
    
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
     
}

- (IBAction)buttonZuRegi:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
/*
-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Hier meldet sich der ViewController als Empfänger für die Daten des SimpleLocationManager beim NotificationCenter an
    // Schaut euch locationErhalten und locationFehler an. Dies sind Funktionen, die hier in der Klasse von uns 'aus freien Stücken' definiert werden. Der Dopppelpunkt hinter beiden Funktionen zeigt an, dass noch ein Objekt übergeben wird.
    // Bei diesem Objekt handelt es sich um das CLLocation-Objek, dass vom SimpleLocationManager an die Nachricht gehängt wurde (sowie eine Datei an eine EMail gehangen wird).
    
     NSLog(@"Melde mich beim Observer an...");
     [[NSNotificationCenter defaultCenter] addObserver:self
     selector:@selector(locationErhalten:)
    // name:kSimpleLocationManagerLocationUpdateNotification  object:nil];
    
       [mapview setCenterCoordinate:mapview.userLocation.coordinate];
    [[NSNotificationCenter defaultCenter] addObserver:self
     selector:@selector(locationFehler:)
     name:kSimpleLocationManagerLocationUpdateErrorNotification  object:nil];
    
    [[NSNotificationCenter defaultCenter] addobserver:self selector:@selector(JobAngekommen:) name:kJobGeneratorNewJob object:nil];
    

}
*/

-(void)JobAngekommen
{
    
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
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) buttonGedrueckt:(id)sender {
    NSLog(@"buttonGedrueckt");
    JobButton* jb = (JobButton*) sender;
    CJob* unserJob = jb.job;
    
    NSLog(@"Job für %@ wurde ausgewaehlt",unserJob.name);
    [JobCenterZeiger jobAnnehmen:jb.job];
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

- (void)dealloc {
    [super dealloc];
}
@end

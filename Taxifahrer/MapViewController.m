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

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapview;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad des MapViewControllers");
    
    
    _lblKoordinate.text = @"Noch keine Daten";
    // Hier wird der SimpleLocationManager gestartet
//    [[SimpleLocationManager getInstance] startUpdatingLocation];
    
    // Ort zuweisen
    MKCoordinateRegion region;
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 53.55f;
    coordinate.longitude = 10.0f;
    
    NSLog(@"%f, %f", coordinate.latitude, coordinate.longitude);
    
	region.center = coordinate;
    region.span.longitudeDelta=MAP_DELTA_RANGE;
	region.span.latitudeDelta=MAP_DELTA_RANGE;
	mapview.region=region;
    
    mapview.delegate=self;
    
    CJob* beispielJob = [[CJob alloc] init ];
    beispielJob.token = @"HH12345";
    beispielJob.street = @"Jungfernstieg 1";
    beispielJob.taxisize = @"3";
    beispielJob.latitude = @"53.5533";
    beispielJob.longitude = @"10.005";
    beispielJob.name = @"Schmidt";
    
    double breitengrad = [beispielJob.latitude doubleValue];
    double laengengrad = [beispielJob.longitude doubleValue];
    CLLocationCoordinate2D unsereKoordinate = CLLocationCoordinate2DMake(breitengrad, laengengrad);
    
    // Wir erschaffen ein Objekt vom Typ ImageAnnotation. Dieses haben wir selbst definiert
    ImageAnnotation* JobAnnotation = [[ImageAnnotation alloc] initWithCoordinate:unsereKoordinate];
    // Das Objekt wird zur Karte addiert (das Objekt, noch nicht das Bild)
    JobAnnotation.mytitle = ANNOTATION_GREENJOB;
    JobAnnotation.Job = beispielJob;
    [mapview addAnnotation:JobAnnotation];
    
    
    ImageAnnotation* taxiAnnotation = [[ImageAnnotation alloc] initWithCoordinate:coordinate];
    taxiAnnotation.mytitle = ANNOTATION_TAXI;
    [mapview addAnnotation:taxiAnnotation];
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
            
            // Gelbes Taxi auf Malfläche kleben
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
            UILabel* meinLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, 3, 74, 23)];
            meinLabel.text = Job.name;
            meinLabel.textAlignment = NSTextAlignmentCenter;
            meinLabel.font = [UIFont fontWithName:@"Marker-Felt" size:10.0];
            meinLabel.textColor = [UIColor greenColor];
            meinLabel.backgroundColor = [UIColor clearColor];
            [_annotationView addSubview:meinLabel];
            
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
     name:kSimpleLocationManagerLocationUpdateNotification  object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self
     selector:@selector(locationFehler:)
     name:kSimpleLocationManagerLocationUpdateErrorNotification  object:nil]; 
    

}
*/
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

-(void) buttonGedrueckt:(id)sender
{
    NSLog(@"Button gedrückt!");
    
    JobButton* JB = (JobButton*) sender;
    CJob* unserJob = JB.Job;
    
    NSLog(@"Job für %@ wurde ausgewählt.", unserJob.name);
}
/*
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
*/
- (void)dealloc {
    [super dealloc];
}
@end

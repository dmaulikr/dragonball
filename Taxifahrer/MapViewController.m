//
//  MapViewController.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 23.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "MapViewController.h"
#import "ImageAnnotation.h"
#import "SimpleLocationManager.h"

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
    [[SimpleLocationManager getInstance] startUpdatingLocation];
    
    // Ort zuweisen
    MKCoordinateRegion region;
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = coordinate.latitude;
    coordinate.longitude = coordinate.longitude;
    
	region.center = coordinate;
    region.span.longitudeDelta=MAP_DELTA_RANGE;
	region.span.latitudeDelta=MAP_DELTA_RANGE;
	mapview.region=region;
    
    mapview.delegate=self;
    
    // Wir erschaffen ein Objekt vom Typ ImageAnnotation. Dieses haben wir selbst definiert
    ImageAnnotation* taxiAnnotation = [[ImageAnnotation alloc] initWithCoordinate:coordinate];
    // Das Objekt wird zur Karte addiert (das Objekt, noch nicht das Bild)
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
        
        // Gelbes Taxi auf Malfläche kleben
        ImageAnnotation* taxiAnnotation = (ImageAnnotation*) annotation;
        [_annotationView addSubview:taxiAnnotation.m_ImageView];
        
        // Malfläche zurückliefern
        return _annotationView;
    }
    return nil;
}

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

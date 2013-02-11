//
//  SimpleLocationManager.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 29.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "SimpleLocationManager.h"

@implementation SimpleLocationManager


// Das unten stehende Konstrukt macht den CoreLocation-Manager zum Singleton, kennt Ihr schon.

static SimpleLocationManager* simpleloc = nil;

+(SimpleLocationManager*) getInstance {
    if (simpleloc == nil) {
        simpleloc = [[SimpleLocationManager alloc] init];
        
    }
    return simpleloc;
}

- (id) init{
	self = [super init];
	if (self != nil) {
        // Hier wird der "richtige" CLLocationManager erschaffen, der von Apple für uns bereitgestellt wurde, um die
        // .. komplexe Elektronik eines GPS-Empfängers hinter einem Objective-C-Objekt zu verbergen
        
		_locationmanager = [CLLocationManager new];
        _locationmanager.distanceFilter = 10.0; // Nur alle 10 Meter prüfen
        _locationmanager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
	}
	return self;
}

-(void)startUpdatingLocation{
    // Mit dieser Zeile sagen wir dem CLLocationManager, dass diese unsere Klasse der Empfänger für GPS-Nachrichten sein soll
    
    NSLog(@"startUpdatingLocation");
	_locationmanager.delegate = self;
    
    // Hiermit starten wir den GPS-Dienst
	[_locationmanager startUpdatingLocation];
}

-(void)stopUpdatingLocation{
    // Hier wird der LocationManager angehalten und der benötigte Speicher freigegeben
    [_locationmanager stopUpdatingLocation];
    _locationmanager.delegate = nil;
    [_locationmanager release];
}

// Die Delegate-Funktionen, über die der CLLocationManager uns mitteilt, dass er unsere Position herausgefunden hat
// .. (oder irgendwas schief gelaufen ist)

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    // Diese Funktion wird vom CLLocationManager automatisch aufgerufen, wenn er eine neue Position heruasgefunden hat.
    // Allerdings findet nur der Aufruf automatisch statt, was jetzt folgt, bestimmen wir selbst.
    // Wir belassen es erstmal dabei die Koordinaten auszugeben und die Position an die anderen Objekte zu senden.
   
    CLLocationCoordinate2D koordinate = newLocation.coordinate;
    double latitude = koordinate.latitude;
    double longitude = koordinate.longitude;
    NSLog(@"Koordinate %f %f",longitude,latitude);
    
    // Wir senden an alle Klassen, die es interessiert, die Nachricht, dass vom GPS eine neue Position getracked wurde.
    // Die Position (newlocation) senden wir gleich mit.
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kSimpleLocationManagerLocationUpdateNotification object:newLocation];
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    // Diese Funktion wird vom CLLocationManager automatisch aufgerufen, wenn bei der Ortung ein Fehler passiert ist.
    // Wir zeigen auf der Konsole an, dass ein Fehler aufgetreten ist und leiten diese Nachricht an alle interessierten Klassen weiter
    
    NSLog(@"LocationManager Fehler");
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kSimpleLocationManagerLocationUpdateErrorNotification object: error];
}

@end

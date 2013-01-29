//
//  SimpleLocationManager.h
//  Taxifahrer
//
//  Created by Dennis Brunne on 29.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//


// Diese Nachrichten werden von dem SimpleLocationManager verschickt
#define kSimpleLocationManagerLocationUpdateNotification @"kSimpleLocationManagerLocationUpdateNotification"
#define kSimpleLocationManagerLocationUpdateErrorNotification @"kSimpleLocationManagerLocationUpdateErrorNotification"


// Achtung! Um die GPS-Dienste nutzen zu können, muss das CoreLocation-Framework eingebunden werden.
// Dazu links in der Projektleiste auf das eigene Projekt klicken, dann oben auf 'Build Phases', dann auf die Zeile
// .. 'Link binary with libraries' und dann auf '+' und das CoreLocation-Framework doppelt klicken

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


// Wir müssen weiter der CLLocationManager-Klasse versprechen, dass wir uns an Ihr Protokoll halten und ein
// .. paar Funktionen einbauen, (siehe .m-File), über die die CLLocationManager-Klasse mit uns kommuniziert.
@interface SimpleLocationManager : NSObject <CLLocationManagerDelegate>
{
    CLLocationManager* _locationmanager;
}
+(SimpleLocationManager*) getInstance;

-(void)startUpdatingLocation;
-(void)stopUpdatingLocation;

@end

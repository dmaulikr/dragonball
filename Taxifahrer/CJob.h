//
//  CJob.h
//  TaxiDriver
//
//  Created by Thorsten Neff on 05.01.12.
//  Copyright (c) 2012 Thorsten Neff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJob : NSObject 
{
    NSString* token;		// das eindeutige Kennzeichen des Jobs
    NSString* street;		// Straße + Hausnummer des Abholortes
    NSString* plz;		// Postleitzahl des Abholortes
    NSString* city;		// Stadt des Abholortes
    NSString* longitude;	// Längengrad des Abholortess
    NSString* latitude;	// Breitengrad des Abholortes
    NSString* time;		// Zeit-Code für Abholzeitpunkt
    NSString* taxisize;	// Anzahl der Personen
    NSString* name;		// Name des Auftraggebers
    NSString* phone;		// Telefonnummer des Auftraggebers
    NSString* jobdone;		// Flag, ob Job schon beendet wurde ("0" offen,"1" beendet)
    NSString* userinfo;	// Zusätzliche Bemerkung des Auftraggebers (Beispiel: 					"bitte nicht anschellen, komme raus")
    NSString* distance;	// Entfernung 
    NSString* jobstatus;	// ist der Job schon angenommen? ("open","accepted")
    NSString* iconurl;		// Eine Url mit einer Bild-Adresse, derzeit nicht genutzt
}

@property (strong) NSString* token;
@property (strong) NSString* street;
@property (strong) NSString* plz;
@property (strong) NSString* city;
@property (strong) NSString* longitude;
@property (strong) NSString* latitude;
@property (strong) NSString* time;
@property (strong) NSString* taxisize;
@property (strong) NSString* name;
@property (strong) NSString* phone;
@property (strong) NSString* jobdone;
@property (strong) NSString* userinfo;
@property (strong) NSString* distance;
@property (strong) NSString* jobstatus;
@property (strong) NSString* iconurl;

@end

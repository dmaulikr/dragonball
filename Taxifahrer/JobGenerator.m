//
//  JobGenerator.m
//  Taxifahrer
//
//  Created by Kevin Wagner on 01.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "JobGenerator.h"
#import "CJob.h"

@implementation JobGenerator


/*NSString* token;		// das eindeutige Kennzeichen des Jobs
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
 NSString* iconurl;		// Eine Url mit einer Bild-Adresse, derzeit nicht genutzt*/






-(void) ArrayErstellen
{
  NSMutableArray* JA = [[NSMutableArray alloc]init];
   
    
    
}

-(void) FestgelegtenAuftragGenerieren

{
    CJob* job = [[CJob alloc]init];
    
    job.token = @"Job-Ab343";
    job.street = @"Germaniaplatz";
    job.plz = @"45355";
    job.longitude = @"6.9518103";
    job.latitude = @"51.4748754";
    job.time = @"15:30";
    job.taxisize = @"1";
    job.name = @"Herr ZuFaulZumGehen";
    job.phone = @"0201575858";
    job.jobdone = @"0";
    job.jobstatus = @"open";
    job.userinfo = @"-";
    job.distance = @"5000000000"; //Wird sicherlich mit den GPS eintragen. Zu Testzwecken auf 5000000000 (Da wir angeblich in den USA sind)
    job.iconurl = @"";
    [self.JobArray addObject:job.token];
    [self.JobArray addObject:job.street];
    [self.JobArray addObject:job.plz];
    [self.JobArray addObject:job.longitude];
    [self.JobArray addObject:job.latitude];
    [self.JobArray addObject:job.time];
    [self.JobArray addObject:job.taxisize];
    [self.JobArray addObject:job.name];
    [self.JobArray addObject:job.phone];
    [self.JobArray addObject:job.jobdone];
    [self.JobArray addObject:job.jobstatus];
    [self.JobArray addObject:job.userinfo];
    [self.JobArray addObject:job.distance];
    //Iconurl ausgelassen
    
    
    
}

-(void) JobFrage
{

}


-(void) OffeneJobs
{
    //Für Samstag erstellt
}





@end

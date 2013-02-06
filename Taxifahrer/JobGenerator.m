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
@synthesize JobArray;


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





- (void)viewDidLoad
{
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Job verfuegbar" message:@"Möchten Sie diesen Job annehmen?" delegate:self cancelButtonTitle:@"Ja" otherButtonTitles:@"Nein", nil];
    [alert show];
}


- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0)
    {
        NSLog(@"Ja");
        //Job angenommen! Job belegen und ausführen
    }
    else
    {
        NSLog(@"Nein");
        //Man wird nicht nocheinmal über den Job unterrichtet
    }
}

-(void) ArrayErstellen
{
 JobArray = [[NSMutableArray alloc]init];
   
}

-(void) FestgelegtenAuftragGenerieren1

{
    CJob* job1 = [[CJob alloc]init];
    
    job1.token = @"Job-Ab343";
    job1.street = @"Germaniaplatz";
    job1.plz = @"45355";
    job1.longitude = @"6.9518103";
    job1.latitude = @"51.4748754";
    job1.time = @"15:30";
    job1.taxisize = @"1";
    job1.name = @"Herr ZuFaulZumGehen";
    job1.phone = @"0201575858";
    job1.jobdone = @"0";
    job1.jobstatus = @"open";
    job1.userinfo = @"-";
    job1.distance = @"5000000000"; //Wird sicherlich mit den GPS eintragen. Zu Testzwecken auf 5000000000 (Da wir angeblich in den USA sind)
    job1.iconurl = @"";
    [self.JobArray addObject:job1];
    //Iconurl ausgelassen
    
//Altert frage: Möchtest Du den Job, ja oder nein? Wenn ja, färbe job grün, wenn nein, halt nicht
   
}




-(void) FestgelegtenAuftragGenerieren2
{
    CJob* job2 = [[CJob alloc]init];
    job2.token = @"Job-fds";
    job2.street = @"Johannes-Brokamp-Straße 11";
    job2.plz = @"45355";
    job2.latitude = @"51.476570";
    job2.longitude = @"6.957730";
    job2.time = @"15:25";
    job2.taxisize = @"3";
    job2.name = @"Koenig Kevin";
    job2.phone = @"0201454545";
    job2.jobdone = @"0"; 
    job2.jobstatus= @"closed"; //Job hat schon ein anderer übernommen
    job2.userinfo =@"";
    job2.distance = @"4";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Job verfuegbar" message:@"Möchten Sie diesen Job annehmen?" delegate:self cancelButtonTitle:@"Ja" otherButtonTitles:@"Nein", nil];
    [alert show];
  //Wenn Ja mach das und das
    //wenn nein mach das und das 

    [self.JobArray addObject:job2];
    
    
}









@end

//
//  JobGenerator.m
//  Taxifahrer
//
//  Created by Kevin Wagner on 01.02.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "JobGenerator.h"
#import "CJob.h"
#import "MapViewController.h"
#import "ImageAnnotation.h"
#import "SimpleLocationManager.h"
#import "JobButton.h"

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
    jobcheck=1;
    [[NSNotificationCenter defaultCenter] postNotificationName: kJobGeneratorNewJob object:JobArray];

    //Iconurl ausgelassen
    
    
    // BUTTON
    // DRAUFKLEBEN
    
    MKAnnotationView *_annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:CustomerAnnotationIdentifier];
    
    ImageAnnotation* neueAnnotation = (ImageAnnotation*) annotation;
    
    CGPoint temp_annocenter = _annotationView.center;
    _annotationView.userInteractionEnabled=YES;
    _annotationView.frame = CGRectMake(_annotationView.frame.origin.x, _annotationView.frame.origin.y, 80.0f, 47.0f);
    _annotationView.center = temp_annocenter;
    
    // Button für Job 1 auf Malfläche kleben
    ImageAnnotation* JobAnnotation = (ImageAnnotation*) annotation;
    [_annotationView addSubview:JobAnnotation.m_ImageView];
    JobAnnotation.m_ImageView.center = CGPointMake(_annotationView.frame.size.width/2, _annotationView.frame.size.height/2);
    
    CJob* Job = JobAnnotation.Job;
    
    // Button für Annotation erschaffen
    JobButton* button = [JobButton buttonWithType:UIButtonTypeCustom];
    [button setImage:JobAnnotation.m_ImageView.image forState:UIControlStateNormal];
    
    button.frame = CGRectMake(0, 0, _annotationView.frame.size.width, _annotationView.frame.size.height);
    [button addTarget:self action:@selector(buttonGedrueckt:) forControlEvents:UIControlEventTouchUpInside];
    [_annotationView addSubview:button];
    
    button.Job = Job;
    
    // UILabel mit Namen des Kunden hinzufügen
    UILabel* Job1Street = [[UILabel alloc] initWithFrame:CGRectMake(3, -3, 74, 23)];
    Job1Street.text = Job.street;
    Job1Street.textAlignment = NSTextAlignmentCenter;
    Job1Street.font = [UIFont fontWithName:@"Arial" size:10.0];
    //Job1Street.textColor = [UIColor greenColor];
    Job1Street.backgroundColor = [UIColor clearColor];
    [_annotationView addSubview:Job1Street];
    
    UILabel* Job1Name = [[UILabel alloc] initWithFrame:CGRectMake(3, 6, 74, 23)];
    Job1Name.text = Job.name;
    Job1Name.textAlignment = NSTextAlignmentCenter;
    Job1Name.font = [UIFont fontWithName:@"Arial" size:10.0];
    //Job1Name.textColor = [UIColor greenColor];
    Job1Name.backgroundColor = [UIColor clearColor];
    [_annotationView addSubview:Job1Name];
    
    UILabel* Job1Taxisize = [[UILabel alloc] initWithFrame:CGRectMake(3, 15, 74, 23)];
    Job1Taxisize.text = Job.taxisize;
    Job1Taxisize.textAlignment = NSTextAlignmentCenter;
    Job1Taxisize.font = [UIFont fontWithName:@"Arial" size:10.0];
    //Job1Taxisize.textColor = [UIColor greenColor];
    Job1Taxisize.backgroundColor = [UIColor clearColor];
    [_annotationView addSubview:Job1Taxisize];
    
    
    if 	([job1.jobstatus isEqualToString:@"open"])
    {
        NSLog(@"Job ist offen, zum Array adden");
        [self.JobArray addObject:job1];
        
        Job1Name.textColor = [UIColor greenColor];
        Job1Street.textColor = [UIColor greenColor];
        Job1Taxisize.textColor = [UIColor greenColor];
    }
    
    else
    {
        NSLog(@"Job1 ist vergeben");
        [self.JobArray removeAllObjects];
        
        Job1Name.textColor = [UIColor redColor];
        Job1Street.textColor = [UIColor redColor];
        Job1Taxisize.textColor = [UIColor redColor];
    }
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
    jobcheck = 2;
    [[NSNotificationCenter defaultCenter] postNotificationName: kJobGeneratorNewJob object:JobArray];
    
    // BUTTON
    // DRAUFKLEBEN
    
    MKAnnotationView *_annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:CustomerAnnotationIdentifier];
    
    ImageAnnotation* neueAnnotation = (ImageAnnotation*) annotation;
    
    CGPoint temp_annocenter = _annotationView.center;
    _annotationView.userInteractionEnabled=YES;
    _annotationView.frame = CGRectMake(_annotationView.frame.origin.x, _annotationView.frame.origin.y, 80.0f, 47.0f);
    _annotationView.center = temp_annocenter;
    
    // Button für Job 2 auf Malfläche kleben
    ImageAnnotation* JobAnnotation = (ImageAnnotation*) annotation;
    [_annotationView addSubview:JobAnnotation.m_ImageView];
    JobAnnotation.m_ImageView.center = CGPointMake(_annotationView.frame.size.width/2, _annotationView.frame.size.height/2);
    
    CJob* Job = JobAnnotation.Job;
    
    // Button für Annotation erschaffen
    JobButton* button = [JobButton buttonWithType:UIButtonTypeCustom];
    [button setImage:JobAnnotation.m_ImageView.image forState:UIControlStateNormal];
    
    button.frame = CGRectMake(0, 0, _annotationView.frame.size.width, _annotationView.frame.size.height);
    [button addTarget:self action:@selector(buttonGedrueckt:) forControlEvents:UIControlEventTouchUpInside];
    [_annotationView addSubview:button];
    
    button.Job = Job;
    
    // UILabel mit Namen des Kunden hinzufügen
    UILabel* Job2Street = [[UILabel alloc] initWithFrame:CGRectMake(3, -3, 74, 23)];
    Job2Street.text = Job.street;
    Job2Street.textAlignment = NSTextAlignmentCenter;
    Job2Street.font = [UIFont fontWithName:@"Arial" size:10.0];
    //Job2Street.textColor = [UIColor greenColor];
    Job2Street.backgroundColor = [UIColor clearColor];
    [_annotationView addSubview:Job2Street];
    
    UILabel* Job2Name = [[UILabel alloc] initWithFrame:CGRectMake(3, 6, 74, 23)];
    Job2Name.text = Job.name;
    Job2Name.textAlignment = NSTextAlignmentCenter;
    Job2Name.font = [UIFont fontWithName:@"Arial" size:10.0];
    //Job2Name.textColor = [UIColor greenColor];
    Job2Name.backgroundColor = [UIColor clearColor];
    [_annotationView addSubview:Job2Name];
    
    UILabel* Job2Taxisize = [[UILabel alloc] initWithFrame:CGRectMake(3, 15, 74, 23)];
    Job2Taxisize.text = Job.taxisize;
    Job2Taxisize.textAlignment = NSTextAlignmentCenter;
    Job2Taxisize.font = [UIFont fontWithName:@"Arial" size:10.0];
    //Job2Taxisize.textColor = [UIColor greenColor];
    Job2Taxisize.backgroundColor = [UIColor clearColor];
    [_annotationView addSubview:Job2Taxisize];
    
    
    
    if 	([job2.jobstatus isEqualToString:@"open"])
    {
        NSLog(@"Job ist offen, zum Array adden");
        [self.JobArray addObject:job2];
        
        Job2Name.textColor = [UIColor greenColor];
        Job2Street.textColor = [UIColor greenColor];
        Job2Taxisize.textColor = [UIColor greenColor];
    }
    
    else
    {
        NSLog(@"Job2 ist vergeben");
        [self.JobArray removeAllObjects];
        
        Job2Name.textColor = [UIColor redColor];
        Job2Street.textColor = [UIColor redColor];
        Job2Taxisize.textColor = [UIColor redColor];
    }
    
}

-(void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        NSLog(@"Ja, Job annehmen");
        
        
        
        if (jobcheck == 2)
        {
            CJob* job2 = [[CJob alloc]init];
            NSLog(@"Es handelt sich um Job 2.");
            job2.jobstatus = @"closed";
            NSLog(@"Job2 wurde auf closed gesetzt");
            
            // Funktioniert das so überhaupt? Weil an sich erstellt er ja dann hier einen neuen UILabel oder nicht?
            UILabel* Job2Street = [[UILabel alloc] initWithFrame:CGRectMake(3, -3, 74, 23)];
            UILabel* Job2Name = [[UILabel alloc] initWithFrame:CGRectMake(3, 6, 74, 23)];
            UILabel* Job2Taxisize = [[UILabel alloc] initWithFrame:CGRectMake(3, -3, 74, 23)];
            
            Job2Name.textColor = [UIColor redColor];
            Job2Street.textColor = [UIColor redColor];
            Job2Taxisize.textColor = [UIColor redColor];
        }
        
        else if (jobcheck == 1)
        {
            CJob* job1 = [[CJob alloc]init];
            NSLog(@"Es handelt sich um Job 1.");
            job1.jobstatus = @"closed";
            NSLog(@"Job1 wurde auf closed gesetzt");
            
            // Funktioniert das so überhaupt? Weil an sich erstellt er ja dann hier einen neuen UILabel oder nicht?
            UILabel* Job1Street = [[UILabel alloc] initWithFrame:CGRectMake(3, -3, 74, 23)];
            UILabel* Job1Name = [[UILabel alloc] initWithFrame:CGRectMake(3, 6, 74, 23)];
            UILabel* Job1Taxisize = [[UILabel alloc] initWithFrame:CGRectMake(3, -3, 74, 23)];
            
            Job1Name.textColor = [UIColor redColor];
            Job1Street.textColor = [UIColor redColor];
            Job1Taxisize.textColor = [UIColor redColor];
        }
        
    }
    else
    {
        NSLog(@"Nein");
        [self.JobArray removeAllObjects];
    }
}












@end

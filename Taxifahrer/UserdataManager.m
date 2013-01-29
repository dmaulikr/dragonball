//
//  UserdataManager.m
//  Taxifahrer
//
//  Created by Kevin Wagner on 14.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "UserdataManager.h"
#import "LoginScreenViewController.h"

@implementation UserdataManager
static UserdataManager* umanager = nil;



+(UserdataManager*)getInstance
{
    if (umanager == nil) {
        umanager = [[UserdataManager alloc] init];
    }
    return umanager;
}

-(void)requestRegistrationWithSalutation:(int)salutation
								lastName:(NSString*)lastname
								forename:(NSString*)forename
								username:(NSString*)username
								  taxiID:(NSString*)taxiID
								 company:(NSString*)company
								  street:(NSString*)street
							streetnumber:(NSString*)streetnumber
									 plz:(NSString*)plz
									city:(NSString*)city
								taxisize:(int)taxisize
							 advertiseID:(NSString*)advertiseID
								   phone:(NSString*)phone
                            licenseplate:(NSString*)licenseplate
{
    
	//expected request XML
	//<request>
	//		<deviceid>E767475F7645674897A98685876C8579886</deviceid>
	//		<devicetype>0</devicetype>
	//		<salutation>1</salutation>
	//		<lastname>Muster</lastname>
	//		<forename>Hans</forename>
	//		<username>flandy84</username>
	//		<taxiid>nbw34ZK</taxiid>
	//		<company>Holmich AG</company>
	//		<street>Stehweg</street>
	//		<streetnumber>14 b</streetnumber>
	//		<plz>74891</plz>
	//		<city>Schlaghausen</city>
	//		<taxisize>4</taxisize>
	//		<advertiserid>FW7K</advertiserid>
	//		<phone>01716045512</phone>
    //      <update>0</update>
    //      <reactivate>1</reactivate>
	//</request>
    
	//generate XML request
	DDXMLElement *root = (DDXMLElement *)[DDXMLNode elementWithName: XMLTagRequest];
	[root addChild:[DDXMLNode elementWithName:XMLTagDeviceID stringValue: [UIDevice currentDevice].uniqueIdentifier]];
	[root addChild:[DDXMLNode elementWithName:XMLTagDeviceType stringValue:[[NSNumber numberWithInt:TaxiCallerDeviceType] stringValue]]];
	[root addChild:[DDXMLNode elementWithName:XMLTagSalutation stringValue:[[NSNumber numberWithInt:salutation] stringValue]]];
	[root addChild:[DDXMLNode elementWithName:XMLTagLastName stringValue: lastname]];
	[root addChild:[DDXMLNode elementWithName:XMLTagForename stringValue: forename]];
	[root addChild:[DDXMLNode elementWithName:XMLTagUsername stringValue: username]];
	[root addChild:[DDXMLNode elementWithName:XMLTagTaxiID stringValue: taxiID]];
	[root addChild:[DDXMLNode elementWithName:XMLTagCompany stringValue:company]];
	[root addChild:[DDXMLNode elementWithName:XMLTagStreet stringValue: street]];
	[root addChild:[DDXMLNode elementWithName:XMLTagStreetNumber stringValue: streetnumber]];
	[root addChild:[DDXMLNode elementWithName:XMLTagPLZ stringValue: plz]];
	[root addChild:[DDXMLNode elementWithName:XMLTagCity stringValue: city]];
	[root addChild:[DDXMLNode elementWithName:XMLTagTaxiSize stringValue:[[NSNumber numberWithInt: taxisize] stringValue]]];
    [root addChild:[DDXMLNode elementWithName:XMLTagLicensePlate stringValue:licenseplate]];
    
	[root addChild:[DDXMLNode elementWithName:XMLTagAdvertiserID stringValue: advertiseID]];
	[root addChild:[DDXMLNode elementWithName:XMLTagPhone stringValue: phone]];
	[root addChild:[DDXMLNode elementWithName:XMLTagUpdate stringValue:@"0"]];
    [root addChild:[DDXMLNode elementWithName:XMLTagReactivate stringValue:@"0"]];
    
    // String aus Daten erstellen
    NSString* xmlstring = [root XMLString];
    NSLog(@"Ausgabe: %@",xmlstring);
    
    DDXMLDocument *xmlDoc = [[DDXMLDocument alloc] initWithXMLString:xmlstring options:0 error:nil];
    NSData* xmldata = [xmlDoc XMLDataWithOptions:DDXMLNodeCompactEmptyElement];
    
    // Ulfs Testserver
    NSString* urlString = @"http://176.9.180.230/newdriver";
    
    // Das Request-Objekt
    NSMutableURLRequest* urlrequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: urlString] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    [urlrequest setHTTPMethod:@"POST"];
    
    // Hier hängen wir unsere XML-Daten dran
    [urlrequest setHTTPBody: xmldata];
    
    // Hier erschaffen wir ein Sammelbecken für die Daten, die aus dem Internet geladen werden
    _receivedData = [[NSMutableData data] retain];// data collector (for http-response-body data)
    
    // Hier starten wir die Verbindung
    _connection = [[NSURLConnection alloc] initWithRequest:urlrequest delegate:self];
}

// CALLBACK-Funktionen

// wird für jedes Datenpaket aufgerufen, dass von Netzwerkkarte empfangen wird
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"didReceiveData");
    [_receivedData appendData:data];
}

// wird aufgerufen, wenn es zu einem Fehler kommt
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	NSLog(@"received data - error!!!: %@", [error description]);
}

// wird aufgerufen, wenn alle Datenpakete empfangen wurden
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"didFinishLaunching");
    NSString *receivedDataString = [[NSString alloc] initWithData:_receivedData encoding:NSUTF8StringEncoding] ;
    NSLog(@"when finished: received: %@",receivedDataString);
    
    DDXMLDocument *xmlDoc = [[DDXMLDocument alloc] initWithData: _receivedData options:0 error:nil];
	DDXMLElement* rootElement = [xmlDoc rootElement];
    NSString* username = [[rootElement elementForName:XMLTagUsername] stringValue];
    NSString* password = [[rootElement elementForName:XMLTagPassword] stringValue];
    
    // Mit den Strings username und password koennen wir jetzt weiterarbeiten
    NSLog(@"Username: %@",username);
    NSLog(@"Passwort: %@",password);
    
    // Wir können Sie zum Beispiel für die spätere Nutzung auf dem Gerät speichern
    NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setObject:username forKey:UDKeyUsername];
    [userdefaults setObject:password forKey:UDKeyPassword];
    [userdefaults synchronize];
}

@end
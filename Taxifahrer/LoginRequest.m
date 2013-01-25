//
//  LoginRequest.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 23.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "LoginRequest.h"
#import "ViewMediator.h"
@implementation LoginRequest

static LoginRequest* loginrequest = nil;
+(LoginRequest*) getInstance {
    if (loginrequest == nil) {
        loginrequest = [[LoginRequest alloc] init];
    }
    return loginrequest;
}

-(void)requestActivation:(NSString*)username :(NSString*)password
{
	//expected request XML
	//<request>
	//		<deviceid>E767475F7645674897A98685876C8579886</deviceid>
	//		<devicetype>0</devicetype>
	//		<nickid>65481</nickid>
	//		<password>iforget</password>
    //      <update>0</update>
    //      <reactivate>1</reactivate>
	//</request>
	
    //username=@"neff9@taxi.de";
    //password=@"c3d246";
    
	//generate XML request
	DDXMLElement *root = (DDXMLElement *)[DDXMLNode elementWithName: XMLTagRequest];
	[root addChild:[DDXMLNode elementWithName:XMLTagDeviceID stringValue: [UIDevice currentDevice].uniqueIdentifier]];
	[root addChild:[DDXMLNode elementWithName:XMLTagDeviceType stringValue:[[NSNumber numberWithInt:TaxiCallerDeviceType] stringValue]]];
	[root addChild:[DDXMLNode elementWithName:XMLTagUsername stringValue:username]];
	[root addChild:[DDXMLNode elementWithName:XMLTagPassword stringValue:password]];
	[root addChild:[DDXMLNode elementWithName:XMLTagUpdate stringValue:@"0"]];
    [root addChild:[DDXMLNode elementWithName:XMLTagReactivate stringValue:@"1"]];
    
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
    NSString* status = [[rootElement elementForName:XMLTagStatus] stringValue];
    if ([status isEqualToString:@"ok"]) {
        NSLog(@"Login-Daten erfolgreich");
          [[ViewMediator getInstance] vonLoginZuMap];
    } else {
        NSLog(@"Login fehlgeschlagen");
    }
}


@end

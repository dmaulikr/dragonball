//
//  EmailRequest.m
//  Taxifahrer
//
//  Created by Dennis Brunne on 29.01.13.
//  Copyright (c) 2013 Kevin Wagner. All rights reserved.
//

#import "EmailRequest.h"

@implementation EmailRequest


static EmailRequest* erequest = nil;
+(EmailRequest*) getInstance {
    if (erequest == nil){
        erequest= [[EmailRequest alloc] init];
    }
    return erequest;
}

-(void) sendPasswordRequest:(NSString*) email
{
    //expected request XML
	//<request>
	//		<email>neff@taxibutton.de</email>
	//</request>
	
	//generate XML request
	DDXMLElement *root = (DDXMLElement *)[DDXMLNode elementWithName: XMLTagRequest];
    [root addChild:[DDXMLNode elementWithName:XMLTagEmail stringValue:email]];
    
    NSString* xmlstring = [root XMLString];
    NSLog(@"Ausgabe: %@",xmlstring);
    
    DDXMLDocument *xmlDoc = [[DDXMLDocument alloc] initWithXMLString:xmlstring options:0 error:nil];
    NSData* xmldata = [xmlDoc XMLDataWithOptions:DDXMLNodeCompactEmptyElement];
    
    // Ulfs Testserver
    NSString* urlString = @"http://176.9.180.230/driver/password";
    
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
    
    DDXMLDocument *xmldoc = [[DDXMLDocument alloc] initWithData: _receivedData options:0 error:nil];
    DDXMLElement* rootElement = [xmldoc rootElement];
    NSString* status = [[rootElement elementForName:XMLTagUsername] stringValue];
    if ([status isEqualToString:@"ok"])
    {
        NSLog(@"Passwort-Link wurde an EMail-Adresse gesendet");
    }
    else {
        // Email-Adresse konnto nicht zugeordnet werden falsch
        NSLog(@"EMail-Adresse unbekannt");
    }
}


@end

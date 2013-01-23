
//Info: The goal is to create an NSXML style API that can used in environments without NSXML (e.g. iPhone). 
//Open-Source-Project-Website:http://code.google.com/p/kissxml/
//Doc-Reference from Apple: http://developer.apple.com/mac/library/documentation/Cocoa/Conceptual/NSXML_Concepts/Articles/CreatingXMLDoc.html
//Usage: Import this Header-File to use the XML-Framework
//Setup:
/*
 After adding the DDXML files to your Xcode project, click Project -> Edit Project Settings
 
 You'll be adding this to your compiler instructions (All Configurations, All Settings)
 
 * OTHER_LDFLAGS = -lxml2
 * HEADER_SEARCH_PATHS = /usr/include/libxml2 
 
 */



#import "DDXMLNode.h"
#import "DDXMLElement.h"
#import "DDXMLDocument.h"
#import "DDXMLElementAdditions.h"

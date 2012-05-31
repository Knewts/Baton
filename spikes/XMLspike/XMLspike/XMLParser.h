//
//  XMLParser.h
//  PopulationFromXMLTest
//
//  Created by Geoffrey Pamerleau on 4/11/11.
//  Copyright 2011 US Air Force Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@class song;

@interface XMLParser : NSObject<NSXMLParserDelegate> {
    
    AppDelegate *app;
    
	// an ad hoc string to hold element value
	NSMutableString *currentElementValue;
	// song object
	song *songToParse;
	// array of song objects
	NSMutableArray *allSongs;
}

@property (nonatomic, retain) song *songToParse;
@property (nonatomic, retain) NSMutableArray *allSongs;

-(NSMutableArray*)getSongs;
- (XMLParser *) initXMLParser;
- (void)parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict;
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName;
@end

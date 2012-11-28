//
//  XMLParser.h
//  PopulationFromXMLTest
//
//  Created by Geoffrey Pamerleau on 4/11/11.
//  Copyright 2011 US Air Force Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
//#import "song.h"

//@class song;

@interface XMLParser : NSObject<NSXMLParserDelegate> {
    
	// an ad hoc string to hold element value
	NSMutableString * currentElementValue;

    //instance variables
    NSMutableArray * layout;
    
    NSMutableDictionary * button;
    NSMutableDictionary * plane;
    NSMutableDictionary * threshold;
    NSMutableArray * planesAndThresholds;
    
    NSString * currentUIElementBeingParsed;
    NSString * currentSubElementBeingParsed;
    NSString * currentSubElementValue;
    
    BOOL waitingForThreshold;
    
}//end instance variables

- (XMLParser *) initXMLParser;

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes: (NSDictionary *)attributeDict;
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

- (BOOL)isStartUIElement:(NSString *)elementName;
- (BOOL)isEndUIElement:(NSString *)elementName;
- (BOOL)isStartSubElement:(NSString *)elementName;
- (BOOL)isEndSubElement:(NSString *)elementName;

- (void)addPlaneToLayout;

- (NSData *)parser:(NSXMLParser *)parser resolveExternalEntityName:(NSString *)name systemID:(NSString *)systemID;
- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError;

@end
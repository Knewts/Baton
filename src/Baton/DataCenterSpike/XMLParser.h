//
//  XMLParser.h
//  DataCenterSpike
//
//  Created by Andy Stratton on 7/15/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BatonUICreator.h"

@class AddLayoutViewController;

@interface XMLParser : NSObject <NSXMLParserDelegate> {
    
    AddLayoutViewController *addLayoutViewController;
    
    CGRect screenFrame;
    BatonUICreator *buic;
    
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
    
}//end interface

-(id)initWithScreenFrame:(CGRect)frame;
-(UIView *) getView;

- (id) initXMLParser;

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
//
//  XMLParser.h
//  DataCenterSpike
//
//  Created by Andy Stratton on 7/15/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BatonUICreator.h"

@interface XMLParser : NSObject
{
    CGRect screenFrame;
    BatonUICreator *buic;
    
    // an ad hoc string to hold element value
	NSMutableString *currentElementValue;
}

-(id)initWithScreenFrame:(CGRect)frame;
-(XMLParser *)initXMLParser;

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

-(UIView *) getView;

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes: (NSDictionary *)attributeDict;
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;
- (NSData *)parser:(NSXMLParser *)parser resolveExternalEntityName:(NSString *)name systemID:(NSString *)systemID;

@end

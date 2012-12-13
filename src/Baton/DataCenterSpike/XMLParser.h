//
//  XMLParser.h
//  DataCenterSpike
//
//  Created by Tim Weidner on 7/15/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "LayoutList.h"
#import "Layout.h"

@class AddLayoutViewController;

@interface XMLParser : NSObject <NSXMLParserDelegate> {
    
   //We don't need a reference to the view controller as all the data is being passed via the calls in the viewcontroller
    //AddLayoutViewController *addLayoutViewController;
    

    
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
    NSMutableString * currentSubElementValue;
    
    BOOL waitingForThreshold;
    
}//end interface

//This soft property will let us grab a reference to the list of layouts stored in the appdelegate
@property (nonatomic, assign) LayoutList * layouts;


#pragma mark XMLParserHeader
- (id) initXMLParser;

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes: (NSDictionary *)attributeDict;
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

- (BOOL)isStartUIElement:(NSString *)elementName;
- (BOOL)isEndUIElement:(NSString *)elementName;
- (BOOL)isStartSubElement:(NSString *)elementName;
- (BOOL)isEndSubElement:(NSString *)elementName;

- (void)addPlaneToLayout;

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError;

@end
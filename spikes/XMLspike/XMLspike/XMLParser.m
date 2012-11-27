//
//  XMLParser.m
//  PopulationFromXMLTest
//
//  Created by Geoffrey Pamerleau on 4/11/11.
//  Copyright 2011 US Air Force Academy. All rights reserved.
//

#import "XMLParser.h"
//#import "song.h"

@implementation XMLParser


- (XMLParser *) initXMLParser {
	
    //NSLog(@"INIT xml parser");
	[super init];
    
    layout = [[NSMutableArray alloc] init];
    
    currentUIElementBeingParsed = [[NSString alloc] init];
    currentSubElementBeingParsed = [[NSString alloc] init];
    currentSubElementValue = [[NSString alloc] init];
    
	return self;
}//end init

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    
    if ([self isStartUIElement:elementName] == YES) { //if elementName is a UIElement
    
        currentUIElementBeingParsed = [[NSString alloc] initWithString:elementName];
    }
    else if ([self isStartSubElement:elementName] == YES) { //IF elementName is a Sub-element
        
        currentSubElementBeingParsed = [[NSString alloc] initWithString:elementName];
    }
    else if ([elementName isEqualToString:@"LAYOUT"]) {
        
    }
    else {
        
        NSLog(@"How did i get here?");
    }
    
}//end didStartElement


//begin foundCharacters
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (!currentElementValue) {
        // init the ad hoc string with the value     
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    }
    else {
        // append value to the ad hoc string    
		[currentElementValue appendString:string];
    }
    
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [string stringByTrimmingCharactersInSet:whitespace];
    if ([trimmed length] != 0) {
        
        currentSubElementValue = [[NSString alloc] initWithString:string];
        
    }//end if trimmed length not 0

}//end foundCharacters


//begin didEndElement
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI 
qualifiedName:(NSString *)qName {
    ///
    if ([elementName isEqualToString:@"LAYOUT"]) {
        
        //send array to andy
        
        //NSLog(@"EndElement - reached layout, end of document");
        // We reached the end of the XML document
        return;
    }

	if ([self isEndUIElement:elementName] == YES) {
        
        //correct UIElement dict added to array and released
        //NSLog(@"End UI Element: %@", currentUIElementBeingParsed);
    }
    
    else if ([self isEndSubElement:elementName] == YES) {
        //add current subelement && value to uie dict
        
        //release sub element & value
        [currentSubElementValue release];
        [currentSubElementBeingParsed release];
        
    }//end if end of sub element
    
    else {
        // The parser hit one of the element values. 
        NSLog(@"EndElement - found element value");
        // This syntax is possible because User object 
        // property names match the XML user element names  
        //[songToParse setValue:currentElementValue forKey:elementName];
    }
    [currentElementValue release];
    currentElementValue = nil;
    NSLog(@"");

}//end didEndElement


//************************END BUILT IN METHODS***********************************************


//begin isStartUIElement
- (BOOL)isStartUIElement:(NSString *)elementName {
    
    BOOL ret = NO;
    
    //CHECKING IF INCOMING ELEMENT IS A UI ELEMENT
    if ([elementName isEqualToString:@"BUTTON"]) {
        
        ret = YES;
        button = [[NSMutableDictionary alloc] init];
        
    } //end if element==button
    
    else if ([elementName isEqualToString:@"PLANE"]) {
        
        ret = YES;
        plane = [[NSMutableDictionary alloc] init];
        
    }//end if element==plane
    
    else if ([elementName isEqualToString:@"THRESHOLD"]) {
        
        ret = YES;
        threshold = [[NSMutableDictionary alloc] init];
        
    }//end if element==threshold
    
    return ret;
}//end isStartUIElement


//begin isEndUIElement
- (BOOL)isEndUIElement:(NSString *)elementName {
    
    BOOL ret = NO;
    
    //CHECKING IF INCOMING ELEMENT IS A UI ELEMENT
    if ([elementName isEqualToString:@"BUTTON"]) {
        
        ret = YES;
        [layout addObject:[NSArray arrayWithObjects:@"BUTTON", button, nil]];
        [button release];
        
    } //end if element==button
    
    else if ([elementName isEqualToString:@"PLANE"]) {
        
        ret = YES;
        //add dict to nsarray
        //release dict
        
        //wait for possibly more than 1 threshold
        
    }//end if element==plane
    
    else if ([elementName isEqualToString:@"THRESHOLD"]) {
        
        ret = YES;
        //add dict to nsarray
        
        //wait for more than 1 threshold
        
    }//end if element==threshold
    
    else {
        //not a UIElement
    }
    
    return ret;
}//end is End of a UIElement


//begin is Start of a SubElement
- (BOOL)isStartSubElement:(NSString *)elementName {
    
    BOOL ret = NO;
    
    if ([currentUIElementBeingParsed isEqualToString:@"BUTTON"]) { //only check for known button subelements
        
        if ([elementName isEqualToString:@"X"] || 
            [elementName isEqualToString:@"Y"] || 
            [elementName isEqualToString:@"WIDTH"] || 
            [elementName isEqualToString:@"HEIGHT"] || 
            [elementName isEqualToString:@"TOGGLE"] || 
            [elementName isEqualToString:@"COMMAND"] || 
            [elementName isEqualToString:@"PARAMETERS"] || 
            [elementName isEqualToString:@"TOGGLE_OFF_COMMAND"] || 
            [elementName isEqualToString:@"TOGGLE_OFF_PARAMETERS"] || 
            [elementName isEqualToString:@"TEXT"] || 
            [elementName isEqualToString:@"BGCOLOR_ON"] || 
            [elementName isEqualToString:@"BGCOLOR_OFF"]) {  
            
            ret = YES;
            
        }//end if subelement being parsed is a valid button sub-element
    } //end if currentuielement is a button
    
    else if ([currentUIElementBeingParsed isEqualToString:@"PLANE"]) { //only check for plane subelements
        
        if ([elementName isEqualToString:@"X"] || 
            [elementName isEqualToString:@"Y"] || 
            [elementName isEqualToString:@"XSCALE"] || 
            [elementName isEqualToString:@"YSCALE"] || 
            [elementName isEqualToString:@"XMAX"] || 
            [elementName isEqualToString:@"YMAX"] || 
            [elementName isEqualToString:@"WIDTH"] || 
            [elementName isEqualToString:@"HEIGHT"] || 
            [elementName isEqualToString:@"ACCEL"] || 
            [elementName isEqualToString:@"COMMAND"] || 
            [elementName isEqualToString:@"PARAMETERS"]) { 
            
            ret = YES;
            
        }//end if sub-element being parsed is a valid plane sub-element
    } //end if uielement is a plane
    
    else if ([currentUIElementBeingParsed isEqualToString:@"THRESHOLD"]) { //only check for threshold subelements
        
        if ([elementName isEqualToString:@"HAXIS"] || 
            [elementName isEqualToString:@"VALUE"] || 
            [elementName isEqualToString:@"COMMAND"] || 
            [elementName isEqualToString:@"PARAMETERS"] || 
            [elementName isEqualToString:@"COLOR"] || 
            [elementName isEqualToString:@"NEG_TO_POS"] || 
            [elementName isEqualToString:@"POS_TO_NEG"]) { 
            
            ret = YES;
            
        }//end if sub element being parsed is a valid threshold sub-element
    } //end if uielement is a threshold
    
    else {
        NSLog(@"UNHANDLED: %@", elementName);
    }//end if 

    return ret;
}//end is Start of a SubElement


//begin is End of a SubElement
- (BOOL)isEndSubElement:(NSString *)elementName {
    
    BOOL ret = NO;
    
    NSLog(@"is end of sub element? cUIEBP: %@ \teN: %@ \tcSEBP: %@ \tcSEV: %@", currentUIElementBeingParsed, elementName, currentSubElementBeingParsed, currentSubElementValue);
    
    if ([currentUIElementBeingParsed isEqualToString:@"BUTTON"] && [elementName isEqualToString:currentSubElementBeingParsed]) { //only check for known button subelements
        
        ret = YES;
        [button setObject:currentSubElementValue forKey:elementName];
                
    } //end if current ui element is a button
    
    else if ([currentUIElementBeingParsed isEqualToString:@"PLANE"] && [elementName isEqualToString:currentSubElementBeingParsed]) { //only check for plane subelements
        
        ret = YES;
        [plane setObject:currentSubElementValue forKey:elementName];
        
    } //end if current ui element is a plane
    
    else if ([currentUIElementBeingParsed isEqualToString:@"THRESHOLD"] && [elementName isEqualToString:currentSubElementBeingParsed]) { //only check for threshold subelements
        
        ret = YES;
        [threshold setObject:currentSubElementValue forKey:elementName];
        
    } //end if current ui element is a threshold
    
    else {
        NSLog(@"UNHANDLED: %@", elementName);
    }//end if 
    
    return ret;
    
}//end is End of a SubElement

//********************************************************************************

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSLog(@"Parser error occured %@",parseError);
}//end parseErrorOccurred

- (NSData *)parser:(NSXMLParser *)parser resolveExternalEntityName:(NSString *)name systemID:(NSString *)systemID {
    
    NSLog(@"entered resolveExternalEntityName");
    
    //NSLog(name);
    NSString *string = [[NSString alloc] initWithString:@" "];
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return data;

}//end resolveExternalEntityName

- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError {
    
    NSLog(@"entered validationErrorOccurred");
    
} //end validation error occurred

// end of XMLParser.m file
@end

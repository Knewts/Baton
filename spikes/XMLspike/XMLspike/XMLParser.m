//
//  XMLParser.m
//  PopulationFromXMLTest
//
//  Created by Geoffrey Pamerleau on 4/11/11.
//  Copyright 2011 US Air Force Academy. All rights reserved.
//

#import "XMLParser.h"
#import "song.h"

@implementation XMLParser
@synthesize songToParse;
@synthesize allSongs;



NSMutableDictionary *plane;
NSMutableDictionary *threshold;
NSMutableDictionary *button;

NSMutableArray *layout;
NSString *currentUIElementBeingParsed;




- (XMLParser *) initXMLParser {
	NSLog(@"INIT xml parser");
	[super init];
	
    // init array of song objects 
	//allSongs = [[NSMutableArray alloc] init];
    
    layout = [[NSMutableArray alloc] init];
    
	NSLog(@"Init Done");
	return self;
}//end init

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    
    NSLog(@"StartElement - %@", elementName);
    
    
    if ([elementName isEqualToString:@"button"]) {
        
        NSMutableDictionary *button = [[NSMutableDictionary alloc] init];
        NSString *currentUIElementBeingParsed = [[NSString alloc] initWithString:elementName];
        //NSLog(@"Current uielement being parsed: %@", currentUIElementBeingParsed);
        
    } //end if element==button
    
    else if ([elementName isEqualToString:@"plane"]) {
        
        NSMutableDictionary *plane = [[NSMutableDictionary alloc] init];
        NSString *currentUIElementBeingParsed = [[NSString alloc] initWithString:elementName];
        
    }//end if element==plane
    
    else if ([elementName isEqualToString:@"threshold"]) {

        NSMutableDictionary *threshold = [[NSMutableDictionary alloc] init];
        NSString *currentUIElementBeingParsed = [[NSString alloc] initWithString:elementName];
        
    }//end if element==threshold
    
    //all
    else if ([elementName isEqualToString:@"command"]) {
        
        if ([currentUIElementBeingParsed isEqualToString:@"button"]) {
            
        } //end if uielement is a button
        else if ([currentUIElementBeingParsed isEqualToString:@"plane"]) {
            
        } //end if uielement is a plane
        else if ([currentUIElementBeingParsed isEqualToString:@"threshold"]) {
            
        } //end if uielement is a threshold
        
    }//end if element==command
    else if ([elementName isEqualToString:@"parameters"]) { 
        
        if ([currentUIElementBeingParsed isEqualToString:@"button"]) {
            
        } //end if uielement is a button
        else if ([currentUIElementBeingParsed isEqualToString:@"plane"]) {
            
        } //end if uielement is a plane
        else if ([currentUIElementBeingParsed isEqualToString:@"threshold"]) {
            
        } //end if uielement is a threshold
        
    }//end if element==parameters
    
    //button&plane
    else if ([elementName isEqualToString:@"width"]) {        
    }//end if element==width
    else if ([elementName isEqualToString:@"height"]) {        
    }//end if element==height
    
    //button
    else if ([elementName isEqualToString:@"x"]) {        
    }//end if element==x
    else if ([elementName isEqualToString:@"y"]) {        
    }//end if element==y
    else if ([elementName isEqualToString:@"toggle"]) {        
    }//end if element==toggle
    else if ([elementName isEqualToString:@"text"]) {        
    }//end if element==text
    else if ([elementName isEqualToString:@"bgcoloron"]) {        
    }//end if element==bgcoloron
    else if ([elementName isEqualToString:@"bgcoloroff"]) {        
    }//end if element==bgcoloroff
    
    //plane
    else if ([elementName isEqualToString:@"xscale"]) {        
    }//end if element==xscale
    else if ([elementName isEqualToString:@"yscale"]) {        
    }//end if element==yscale
    else if ([elementName isEqualToString:@"accel"]) {        
    }//end if element==accel
    
    //threshold
    else if ([elementName isEqualToString:@"haxis"]) {        
    }//end if element==haxis
    else if ([elementName isEqualToString:@"value"]) {        
    }//end if element==value
    
}//end didStartElement

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    //NSLog(@"entered foundCharacters");
    
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
        NSLog(@"foundCharacters - Processing value for : %@", string);
    }
    

}//end foundCharacters

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSLog(@"Parser error occured %@",parseError);
}//end parseErrorOccurred

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI 
qualifiedName:(NSString *)qName {
    
    NSLog(@"EndElement - %@", elementName);
    
    if ([elementName isEqualToString:@"layout"]) {
        NSLog(@"EndElement - reached layout, end of document");
        // We reached the end of the XML document
        return;
    }
	else if ([elementName isEqualToString:@"button"]) {
        // We are done with user entry – add the parsed user 
        // object to our user array
        //NSLog(@"EndElement - button");
        //[allSongs addObject:self.songToParse];
        // release user object
        //[songToParse release];
        //songToParse= nil;
    
    } //end if element==button
    
    else if ([elementName isEqualToString:@"plane"]) {
        // We are done with user entry – add the parsed user 
        // object to our user array
        //NSLog(@"EndElement - plane");
        //[allSongs addObject:self.songToParse];
        // release user object
        //[songToParse release];
        //songToParse= nil;
    
    } //end if element==plane
    
    else if ([elementName isEqualToString:@"threshold"]) {
        // We are done with user entry – add the parsed user 
        // object to our user array
        //NSLog(@"EndElement - threshold");
        //[allSongs addObject:self.songToParse];
        // release user object
        //[songToParse release];
        //songToParse= nil;
        
    } //end if element==threshold
    
    //all
    else if ([elementName isEqualToString:@"command"]) {        
    }//end if element==command
    else if ([elementName isEqualToString:@"parameters"]) {        
    }//end if element==parameters
    
    //button&plane
    else if ([elementName isEqualToString:@"width"]) {        
    }//end if element==width
    else if ([elementName isEqualToString:@"height"]) {        
    }//end if element==height
    
    //button
    else if ([elementName isEqualToString:@"x"]) {        
    }//end if element==x
    else if ([elementName isEqualToString:@"y"]) {        
    }//end if element==y
    else if ([elementName isEqualToString:@"toggle"]) {        
    }//end if element==toggle
    else if ([elementName isEqualToString:@"text"]) {        
    }//end if element==text
    else if ([elementName isEqualToString:@"bgcoloron"]) {        
    }//end if element==bgcoloron
    else if ([elementName isEqualToString:@"bgcoloroff"]) {        
    }//end if element==bgcoloroff
    
    //plane
    else if ([elementName isEqualToString:@"xscale"]) {        
    }//end if element==xscale
    else if ([elementName isEqualToString:@"yscale"]) {        
    }//end if element==yscale
    else if ([elementName isEqualToString:@"accel"]) {        
    }//end if element==accel
    
    //threshold
    else if ([elementName isEqualToString:@"haxis"]) {        
    }//end if element==haxis
    else if ([elementName isEqualToString:@"value"]) {        
    }//end if element==value
    
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

-(NSMutableArray*)getSongs {
	return allSongs;
}//end getSongs

// end of XMLParser.m file
@end

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
NSSTring *currentSubElementBeingParsed;



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
        
        NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
        
        if ([currentUIElementBeingParsed isEqualToString:@"button"]) {
            //set flag to add command to button Dict
        } //end if uielement is a button
        else if ([currentUIElementBeingParsed isEqualToString:@"plane"]) {
            //set flag to add command to plane Dict
        } //end if uielement is a plane
        else if ([currentUIElementBeingParsed isEqualToString:@"threshold"]) {
            //set flag to add command to threshold Dict
        } //end if uielement is a threshold
        
    }//end if element==command
    
    else if ([elementName isEqualToString:@"parameters"]) { 
        
        NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
        
    }//end if element==parameters
    
    //button&plane
    else if ([elementName isEqualToString:@"x"]) {  
        
        if ([currentUIElementBeingParsed isEqualToString:@"button"]) {
            
            //set flag to add x to button Dict
            NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
            
        } //end if uielement is a button
        else if ([currentUIElementBeingParsed isEqualToString:@"plane"]) {
            
            //set flag to add x to plane Dict
            NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
            
        } //end if uielement is a plane
        
    }//end if element==x
    
    else if ([elementName isEqualToString:@"y"]) { 
        
        if ([currentUIElementBeingParsed isEqualToString:@"button"]) {
            //set flag to add y to button Dict
            NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
            
        } //end if uielement is a button
        else if ([currentUIElementBeingParsed isEqualToString:@"plane"]) {
            //set flag to add y to plane Dict
            NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
            
        } //end if uielement is a plane
        
    }//end if element==y
    
    else if ([elementName isEqualToString:@"width"]) { 
        
        if ([currentUIElementBeingParsed isEqualToString:@"button"]) {
            //set flag to add width to button Dict
            NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
        } //end if uielement is a button
        else if ([currentUIElementBeingParsed isEqualToString:@"plane"]) {
            //set flag to add width to plane Dict
            NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
        } //end if uielement is a plane
        
    }//end if element==width
    
    else if ([elementName isEqualToString:@"height"]) {
        
        if ([currentUIElementBeingParsed isEqualToString:@"button"]) {
            //set flag to add height to button Dict
            NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
        } //end if uielement is a button
        else if ([currentUIElementBeingParsed isEqualToString:@"plane"]) {
            //set flag to add height to plane Dict
            NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
        } //end if uielement is a plane
        
    }//end if element==height
    
    //button
    else if ([elementName isEqualToString:@"toggle"]) {
        //set flag to add toggle to button Dict
        NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
    }//end if element==toggle
    else if ([elementName isEqualToString:@"text"]) {   
        //set flag to add text to button Dict
        NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
    }//end if element==text
    else if ([elementName isEqualToString:@"bgcoloron"]) {    
        //set flag to add bgcoloron to button Dict
        NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
    }//end if element==bgcoloron
    else if ([elementName isEqualToString:@"bgcoloroff"]) {  
        //set flag to add bgcoloroff to button Dict
        NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
    }//end if element==bgcoloroff
    
    //plane
    else if ([elementName isEqualToString:@"xscale"]) {   
        //set flag to add xscale to plane Dict
        NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
    }//end if element==xscale
    else if ([elementName isEqualToString:@"yscale"]) {   
        //set flag to add yscale to plane Dict
        NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
    }//end if element==yscale
    else if ([elementName isEqualToString:@"accel"]) {   
        //set flag to add accel to plane Dict
        NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
    }//end if element==accel
    
    //threshold
    else if ([elementName isEqualToString:@"haxis"]) {        
        //set flag to add haxis to threshold Dict
        NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
    }//end if element==haxis
    else if ([elementName isEqualToString:@"value"]) {  
        //set flag to add value to threshold Dict
        NSString *currentSubElementBeingParsed = [[NSString alloc] initWithString:currentSubElementBeingParsed];
    }//end if element==value
    
    
    //finish these up and add each element to the current temp NSMutableDictionary
    
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
    
    
    //enumerate through flags to determine where the element value gets stored
    
    
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [string stringByTrimmingCharactersInSet:whitespace];
    if ([trimmed length] != 0) {
        NSLog(@"foundCharacters - Processing value for : %@", string);
    }
    

}//end foundCharacters

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI 
qualifiedName:(NSString *)qName {
    
    NSLog(@"EndElement - %@", elementName);
    
    if ([elementName isEqualToString:@"layout"]) {
        
        //send array to andy
        
        NSLog(@"EndElement - reached layout, end of document");
        // We reached the end of the XML document
        return;
    }
    
    //add Dict to array
	else if ([elementName isEqualToString:@"button"]) {
        // We are done with user entry – add the parsed user 
        // object to our user array
        //NSLog(@"EndElement - button");
        //[allSongs addObject:self.songToParse];
        // release user object
        //[songToParse release];
        //songToParse= nil;
    
    } //end if element==button
    
    //add dict to array
    else if ([elementName isEqualToString:@"plane"]) {
        // We are done with user entry – add the parsed user 
        // object to our user array
        //NSLog(@"EndElement - plane");
        //[allSongs addObject:self.songToParse];
        // release user object
        //[songToParse release];
        //songToParse= nil;
    
    } //end if element==plane
    
    //add dict to array
    else if ([elementName isEqualToString:@"threshold"]) {
        // We are done with user entry – add the parsed user 
        // object to our user array
        //NSLog(@"EndElement - threshold");
        //[allSongs addObject:self.songToParse];
        // release user object
        //[songToParse release];
        //songToParse= nil;
        
    } //end if element==threshold
    
    //enumerate through elements and close the active one
    //possibly unnecessary
    
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

-(NSMutableArray*)getSongs {
	return allSongs;
}//end getSongs

// end of XMLParser.m file
@end

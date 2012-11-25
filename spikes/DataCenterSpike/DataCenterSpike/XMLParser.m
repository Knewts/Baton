//
//  XMLParser.m
//  DataCenterSpike
//
//  Created by Andy Stratton on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XMLParser.h"
#import "BatonEventHandler.h"
#import "BatonUICreator.h"

@interface XMLParser ()

@end

@implementation XMLParser

// Gets the XML Mock Object ready.
// The frame passed in should be the full size of the screen.
- (id) initWithScreenFrame:(CGRect)frame
{
    screenFrame = frame;
    buic = [[BatonUICreator alloc] init];
    return self;
}

/*
 *   This function will create a BatonEventHandler object. Then we will pass NSArrays through
 * the BatonUICreator object which should return Baton_UI_Element object pointers. These will then 
 * be passed on to the [BEH addUIElement] function. This function will apply itself as the delegate 
 * for handing command execution.
 *
 *   For this spike, each command returned by an object will be a DEBUGPRINT along with a statement to
 * be printed. This action should be handled by the [BEH executeCommand:withArguments] function.
 * 
 *  This had better work...
 */

- (UIView *) getView
{
    // Create the BatonEventHandler. It will be returned to the base view to take over the screen.
    BatonEventHandler *beh = [[BatonEventHandler alloc] initWithFrame:screenFrame];
    
    // This is where we add the actual UIElements to the beh object.
        //Create an array of Keys and and array of parameters.
    
    NSMutableDictionary *planeParams = [[NSMutableDictionary alloc] init ];
    [planeParams setObject:@"10" forKey:@"X"];
    [planeParams setObject:@"10" forKey:@"Y"];
    [planeParams setObject:@"100" forKey:@"WIDTH"];
    [planeParams setObject:@"200" forKey:@"HEIGHT"];
    [planeParams setObject:@"0" forKey:@"ACCEL"];
    
    NSMutableDictionary *buttonParams = [[NSMutableDictionary alloc] init ];
    [buttonParams setObject:@"10" forKey:@"X"];
    [buttonParams setObject:@"250" forKey:@"Y"];
    [buttonParams setObject:@"130" forKey:@"WIDTH"];
    [buttonParams setObject:@"100" forKey:@"HEIGHT"];
    [buttonParams setObject:@"0" forKey:@"TOGGLE"];
    [buttonParams setObject:@"My Button" forKey:@"TEXT"];
    [buttonParams setObject:@"0035F7" forKey:@"BGCOLOR"];
    
    //    [planeParams setObject:@"0" forKey:@"XRANGE_MIN"];
    //    [planeParams setObject:@"30" forKey:@"XRANGE_MAX"];
    NSArray *planeArray = [NSArray arrayWithObjects:@"PLANE",planeParams, nil];
    NSArray *buttonArray = [NSArray arrayWithObjects:@"BUTTON",buttonParams, nil];
    
    
    NSArray *finalArray = [NSArray arrayWithObjects:planeArray,buttonArray, nil];
    //TODO:
    for (NSArray *array in finalArray)
    {
        Baton_UI_Element *temp = [buic CreateObjectFrom:array];
        [beh addUIElement:temp];
    }
    
    // Return the full beh object with subviews in place.
    return beh;
}//end getView

- (XMLParser *) initXMLParser {
	NSLog(@"INIT xml parser");
	//[super init];
    
    //irish guy
    //app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
	
    // init array of song objects 
	//allSongs = [[NSMutableArray alloc] init];
	NSLog(@"Init Done");
	return self;
}//end init

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    
    NSLog(@"entered StartElement");
    
    if ([elementName isEqualToString:@"song"]) {
        NSLog(@"song element found – create a new instance of song class...");
        //songToParse = [[song alloc] init];
        //We do not have any attributes in the song elements, but if
        // you do, you can extract them here: 
        // song.att = [[attributeDict objectForKey:@"<att name>"] ...];
    }
}//end didStartElement

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    NSLog(@"entered foundCharacters");
    
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
        NSLog(@"Processing value for : %@", string);
    }
    
    
}//end foundCharacters

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSLog(@"Parser error occured %@",parseError);
}//end parseErrorOccurred

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName {
    
    NSLog(@"entered EndElement");
    
    if ([elementName isEqualToString:@"songs"]) {
        // We reached the end of the XML document
        return;
    }
	else if ([elementName isEqualToString:@"song"]) {
        // We are done with user entry – add the parsed user 
        // object to our user array
        //[allSongs addObject:self.songToParse];
        // release user object
        //[songToParse release];
        //songToParse= nil;
    }
    else {
        // The parser hit one of the element values. 
        // This syntax is possible because User object 
        // property names match the XML user element names  
        //[songToParse setValue:currentElementValue forKey:elementName];
    }
    //[currentElementValue release];
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
@end

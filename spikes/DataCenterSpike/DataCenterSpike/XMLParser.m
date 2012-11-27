//
//  XMLParser.m
//  DataCenterSpike
//
//  Created by Andy Stratton on 7/15/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
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
    BatonEventHandler *BEH = [BatonEventHandler new];
    BatonUICreator *BUIC = [BatonUICreator new];
    /*
     *      DICTIONARY REQUIRED PARAMETERS:
     *  X       - X position on the screen (integer)
     *  Y       - Y position on the screen (integer)
     *  WIDTH   - width of the on-screen display
     *  HEIGHT  - height of the on-screen display
     *  ACCEL   - 1 or 0. 1 is ON, 0 is OFF.
     */
    
    NSMutableDictionary *plane = [NSMutableDictionary new];
    [plane setObject:@"10" forKey:@"X"];
    [plane setObject:@"150" forKey:@"Y"];
    [plane setObject:@"20" forKey:@"XSCALE"];
    [plane setObject:@"15" forKey:@"YSCALE"];
    [plane setObject:@"300" forKey:@"WIDTH"];
    [plane setObject:@"100" forKey:@"HEIGHT"];
    [plane setObject:@"0" forKey:@"ACCEL"];
    [plane setObject:@"LOG" forKey:@"COMMAND"];
    [plane setObject:@"Plane works" forKey:@"PARAMETERS"];
    
    NSMutableDictionary *plane2 = [NSMutableDictionary new];
    [plane2 setObject:@"10" forKey:@"X"];
    [plane2 setObject:@"300" forKey:@"Y"];
    [plane2 setObject:@"20" forKey:@"XSCALE"];
    [plane2 setObject:@"15" forKey:@"YSCALE"];
    [plane2 setObject:@"300" forKey:@"WIDTH"];
    [plane2 setObject:@"100" forKey:@"HEIGHT"];
    [plane2 setObject:@"1" forKey:@"ACCEL"];
    [plane2 setObject:@"LOG" forKey:@"COMMAND"];
    [plane2 setObject:@"Plane works" forKey:@"PARAMETERS"];
    
    NSMutableDictionary *threshold = [NSMutableDictionary new];
    [threshold setObject:@"1" forKey:@"HAXIS"];
    [threshold setObject:@"8" forKey:@"VALUE"];
    [threshold setObject:@"LOG" forKey:@"COMMAND"];
    [threshold setObject:@"Y Thresh Works" forKey:@"PARAMETERS"];
    [threshold setObject:@"THRESHOLD" forKey:@"TYPE"];
    
    
    NSMutableDictionary *threshold2 = [NSMutableDictionary new];
    [threshold2 setObject:@"THRESHOLD" forKey:@"TYPE"];
    [threshold2 setObject:@"0000FF" forKey:@"COLOR"];
    [threshold2 setObject:@"0" forKey:@"HAXIS"];
    [threshold2 setObject:@"10" forKey:@"VALUE"];
    [threshold2 setObject:@"LOG" forKey:@"COMMAND"];
    [threshold2 setObject:@"0" forKey:@"NEG_TO_POS"];
    [threshold2 setObject:@"X Thresh Works" forKey:@"PARAMETERS"];
    
    NSMutableDictionary *threshold3 = [NSMutableDictionary new];
    [threshold3 setObject:@"THRESHOLD" forKey:@"TYPE"];
    [threshold3 setObject:@"0" forKey:@"HAXIS"];
    [threshold3 setObject:@"-10" forKey:@"VALUE"];
    [threshold3 setObject:@"LOG" forKey:@"COMMAND"];
    [threshold3 setObject:@"0" forKey:@"POS_TO_NEG"];
    [threshold3 setObject:@"X Thresh Works" forKey:@"PARAMETERS"];
    
    NSMutableDictionary *button = [NSMutableDictionary new];
    [button setObject:@"10" forKey:@"X"];
    [button setObject:@"10" forKey:@"Y"];
    [button setObject:@"200" forKey:@"WIDTH"];
    [button setObject:@"100" forKey:@"HEIGHT"];
    [button setObject:@"0" forKey:@"TOGGLE"];
    [button setObject:@"LOG" forKey:@"COMMAND"];
    [button setObject:@"Button Down works" forKey:@"PARAMETERS"];
    [button setObject:@"Button" forKey:@"TEXT"];
    //[button setObject:@"FF0000" forKey:@"BGCOLOR_ON"];  
    //[button setObject:@"FFFF00" forKey:@"BGCOLOR_OFF"];
    
    NSMutableDictionary *button2 = [NSMutableDictionary new];
    [button2 setObject:@"215" forKey:@"X"];
    [button2 setObject:@"10" forKey:@"Y"];
    [button2 setObject:@"100" forKey:@"WIDTH"];
    [button2 setObject:@"30" forKey:@"HEIGHT"];
    [button2 setObject:@"1" forKey:@"TOGGLE"];
    [button2 setObject:@"LOG" forKey:@"COMMAND"];
    [button2 setObject:@"Button Down works" forKey:@"PARAMETERS"];
    [button2 setObject:@"BLUE" forKey:@"TEXT"];
    [button2 setObject:@"6495ED" forKey:@"BGCOLOR_ON"];  
    [button2 setObject:@"3670AA" forKey:@"BGCOLOR_OFF"];
    
    NSMutableDictionary *button3 = [NSMutableDictionary new];
    [button3 setObject:@"250" forKey:@"X"];
    [button3 setObject:@"50" forKey:@"Y"];
    [button3 setObject:@"30" forKey:@"WIDTH"];
    [button3 setObject:@"100" forKey:@"HEIGHT"];
    [button3 setObject:@"0" forKey:@"TOGGLE"];
    [button3 setObject:@"LOG" forKey:@"COMMAND"];
    [button3 setObject:@"Button Down works" forKey:@"PARAMETERS"];
    [button3 setObject:@"" forKey:@"TEXT"];
    [button3 setObject:@"FF0000" forKey:@"BGCOLOR_ON"];  
    [button3 setObject:@"FFFF00" forKey:@"BGCOLOR_OFF"];
    
    [BEH addUIElement:[BUIC CreateObjectFrom:[NSArray arrayWithObjects:@"BUTTON", button, nil]]];
    [BEH addUIElement:[BUIC CreateObjectFrom:[NSArray arrayWithObjects:@"BUTTON", button2, nil]]];
    [BEH addUIElement:[BUIC CreateObjectFrom:[NSArray arrayWithObjects:@"BUTTON", button3, nil]]];
    [BEH addUIElement:[BUIC CreateObjectFrom:[NSArray arrayWithObjects:@"PLANE", plane, threshold, threshold2, threshold3, nil]]];
    [BEH addUIElement:[BUIC CreateObjectFrom:[NSArray arrayWithObjects:@"PLANE", plane2, threshold, threshold2, threshold3, nil]]];    

    return BEH;
    
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

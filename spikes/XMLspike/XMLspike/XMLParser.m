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

- (XMLParser *) initXMLParser {
	NSLog(@"INIT xml parser");
	[super init];
    
    //irish guy
    //app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
	
    // init array of song objects 
	allSongs = [[NSMutableArray alloc] init];
	NSLog(@"Init Done");
	return self;
}//end init

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    
    NSLog(@"entered StartElement");
    
    if ([elementName isEqualToString:@"song"]) {
        NSLog(@"song element found – create a new instance of song class...");
        songToParse = [[song alloc] init];
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
        [allSongs addObject:self.songToParse];
        // release user object
        [songToParse release];
        songToParse= nil;
    }
    else {
        // The parser hit one of the element values. 
        // This syntax is possible because User object 
        // property names match the XML user element names  
        [songToParse setValue:currentElementValue forKey:elementName];
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

-(NSMutableArray*)getSongs {
	return allSongs;
}//end getSongs

// end of XMLParser.m file
@end

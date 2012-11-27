//
//  AppDelegate.m
//  XMLspike
//
//  Created by Tim Weidner on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "XMLParser.h"

@implementation AppDelegate

@synthesize window = _window;

//irish
@synthesize listArray;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"layout" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlPath];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    
    XMLParser *theParser = [[XMLParser alloc] initXMLParser];
    
    [xmlParser setDelegate:theParser];
    //[xmlParser setShouldResolveExternalEntities:YES];
    
    BOOL worked = [xmlParser parse];
    
    if (worked) {
        //NSLog(@"Amount: %lu", theParser.getSongs.count);
        
    }
    else {
        NSLog(@"boo");
    }
    
}//end app did finish launching

@end

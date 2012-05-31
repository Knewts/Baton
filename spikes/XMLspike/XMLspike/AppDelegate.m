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
@synthesize listArray;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://timmaha.com:8080/songs.xml"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
    
    XMLParser *theParser = [[XMLParser alloc] initXMLParser];
    
    [xmlParser setDelegate:theParser];
    
    BOOL worked = [xmlParser parse];
    
    if (worked) {
        NSLog(@"yay");
    }
    else {
        NSLog(@"boo");
    }
}

@end

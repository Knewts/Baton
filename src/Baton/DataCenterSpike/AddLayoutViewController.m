//
//  AddLayoutViewController.m
//  DataCenterSpike
//
//  Created by Tim Weidner on 11/19/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "AddLayoutViewController.h"
#import "XMLParser.h"


@implementation AddLayoutViewController
@synthesize layoutURL;


-(IBAction)userHitCancelButton:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}//end user hit cancel


-(IBAction)userHitDoneButton:(id)sender {
    
    //make sure valid url (regex for http:// .com
    
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"layout" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlPath];
    
    //NSData *xmlData = [NSData dataWithContentsOfURL:candidateURL];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    
    XMLParser *parser = [[XMLParser alloc] initXMLParser];
    [xmlParser setDelegate:parser];
    
    //NSURL *candidateURL = [NSURL URLWithString:layoutURL.text];
    //if (candidateURL && candidateURL.scheme && candidateURL.host) {
        // candidate is a well-formed url with:
        //  - a scheme (like http://)
        //  - a host (like stackoverflow.com)
    [xmlParser parse];
        
        
        
    //}  
    //handle for bad url
    
    [self dismissModalViewControllerAnimated:YES];
    
}//end user hit done



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end

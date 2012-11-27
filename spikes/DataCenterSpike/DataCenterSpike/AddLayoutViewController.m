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
    
    //handle for bad url
    
    
    //NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"songs" ofType:@"xml"];
    //NSData *xmlData = [NSData dataWithContentsOfFile:xmlPath];
    //NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    
    //XMLParser *theParser = [[XMLParser alloc] initXMLParser];
    
    //[xmlParser setDelegate:theParser];
    //[xmlParser setShouldResolveExternalEntities:YES];
    
    //BOOL worked = [xmlParser parse];
    
    //if (worked) {
        //NSLog(@"Amount: %lu", theParser.getSongs.count);
   //     NSLog(@"yay");

        
   // }
   // else {
    //    NSLog(@"boo");
   // }
    
    
    
}//end user hit done


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end

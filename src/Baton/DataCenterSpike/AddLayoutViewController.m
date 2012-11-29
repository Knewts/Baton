//
//  AddLayoutViewController.m
//  DataCenterSpike
//
//  Created by Tim Weidner on 11/19/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "AddLayoutViewController.h"

@implementation AddLayoutViewController
@synthesize layoutURL;
@synthesize errorHandler;


-(void)viewDidLoad
{
    [super viewDidLoad];
    errorHandler = [[AppDelegate sharedAppdelegate] error];
}

-(IBAction)userHitCancelButton:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}//end user hit cancel


-(IBAction)userHitDoneButton:(id)sender {
    
    //make sure valid url (regex for http:// .com
    
    NSURL * xmlURL = [[NSURL alloc] initWithString:layoutURL.text];
    NSError * error;
    if ([xmlURL checkResourceIsReachableAndReturnError:&error]) {
        [errorHandler reportError:error];
    }
    else {
        
        NSData *xmlData = [NSData dataWithContentsOfURL:xmlURL];
    
        NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    
        XMLParser *parser = [[XMLParser alloc] initXMLParser];
        
        [xmlParser setDelegate:parser];
    
        [xmlParser parse];
    }
        
        
    //}  
    //handle for bad url
    
    [self dismissModalViewControllerAnimated:YES];
    
}//end user hit done



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
/*
NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"layout" ofType:@"xml"];
NSData *xmlData = [NSData dataWithContentsOfFile:xmlPath];

NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];*/
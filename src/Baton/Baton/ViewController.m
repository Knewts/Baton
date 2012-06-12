//
//  ViewController.m
//  Baton
//
//  Created by Matthew Knewtson on 4/6/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize hostAddr;
@synthesize portNum;
@synthesize message;
@synthesize sock;

- (void)viewDidLoad
{
    
    sock = [[GCDUDPSocketController alloc] init];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}
- (IBAction)SendMessage:(id)sender
{
    
    NSInteger port = 0;
    
    
    if([[NSScanner scannerWithString:[portNum text]] scanInteger:&port] && port > 1024 && port < 65536)
    {
        OSCMessage * mess = [[OSCMessage alloc] initWithAddress:@"/foo"];
        
        [mess addString:[message text]];
        
        [sock sendMessage:mess toHost:[hostAddr text] onPort:port];
            
    }
    else {
        NSLog(@"Invalid port number: %@",portNum.text);
    }
    
}
@end

//
//  ErrorHandler.m
//  DataCenterSpike
//
//  Created by Matthew Knewtson on 11/10/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "ErrorHandler.h"

@implementation ErrorHandler

@synthesize sock;
@synthesize delegate;

-(id)initWithDelegate:(AppDelegate *) delegateIn
{
    self.delegate = delegateIn;
    self.sock = [[GCDUDPSocketController alloc] init];
    return self;
}

-(BOOL)reportError:(NSString *)error
{
    //if the configuration calls for reporting errors to OSC
    if([[[delegate configuration] objectForKey:@"reportErrorsOverOSC"] boolValue])
    {
        
        //we need to build the OSC message with the error in it.
        OSCMessage * errorMessage = [[OSCMessage alloc] initWithAddress:@"/error"];
        [errorMessage addObject:[OSCString oscStringfromString:error]];
        
        //then figure out if the configuration wants the errors to go to a different OSC server.
        //Basically, there are two options, one specified in config page where most of the OSC messages go,
        //and one that can be specified by the user on the configuration page.
        NSNumber * port;
        NSString * host;
        
        //if the user wants errors to go somewhere else.
        if ([[[delegate configuration] objectForKey:@"differentServerForErrorReporting"] boolValue]) {
            
            //set the host and port to go there.
            host = [[delegate configuration] objectForKey:@"errorIP"];
            port = [[delegate configuration] objectForKey:@"errorPort"];
            
        }
        else {
            
            //otherwise, use the standard.
            host = [[delegate configuration] objectForKey:@"hostIP"];
            port = [[delegate configuration] objectForKey:@"hostPort"];
        }
        
        [sock sendMessage:errorMessage toHost:host onPort:[port intValue]];
    }
    NSLog(@"%@",error);
    return true;
}

@end

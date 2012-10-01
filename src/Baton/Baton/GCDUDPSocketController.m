//
//  SocketController.m
//  Baton
//
//  Created by Matthew Knewtson on 4/21/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "GCDUDPSocketController.h"

@implementation GCDUDPSocketController

@synthesize sock;

- (id)init
{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    sock = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:mainQueue];
    return self;
}

- (id)initWithAddress:(NSString *)host
{
    [self initWithAddress:host onPort:1337];
    return self;
}

- (id)initWithAddress:(NSString *)host onPort:(uint16_t)port
{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    sock = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:mainQueue];
    
    NSError * error = nil;

    if(![sock connectToHost:host onPort:port error:&error])
    {
        NSLog(@"error connecting to %@ on port %d: %@",host,port,error);
    }
    return self;
}

- (void)sendMessage:(OSCMessage *)message toHost:(NSString *)host onPort:(uint16_t)port
{   
    //short timeout in case we get lots of messages
    [sock sendData:[message writeToData] toHost:host port:port withTimeout:2.0 tag:0];
    [message release];
}
@end

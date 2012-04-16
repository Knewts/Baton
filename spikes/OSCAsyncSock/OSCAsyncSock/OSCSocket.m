//
//  OSCSocket.m
//  OSCAsyncSock
//
//  Created by Matthew Knewtson on 3/12/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "OSCSocket.h"

@implementation OSCSocketDelegate

-(OSCSocketDelegate*)init
{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    socket = [[[GCDAsyncUdpSocket alloc] initWithDelegate: self delegateQueue:mainQueue] autorelease];
    
    return self;
}

-(BOOL)connectToAddress:(NSString *)addr onPort:(uint16_t)port
{
    //TODO: Handle errors here instead of just hiding the NSError.
    return [socket connectToHost:addr onPort:port error:&error];
}
-(void)socket:(GCDAsyncUdpSocket *)sock didConnectToHost:(NSString*)host port:(uint16_t)port
{
    

}
@end

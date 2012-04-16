//
//  AppDelegate.m
//  test
//
//  Created by Matthew Knewtson on 3/12/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "AppDelegate.h"
#define CRLF [GCDAsyncSocket CRLFData]
@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    sock = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:mainQueue];
    
    NSString * host = @"127.0.0.1";
    uint16_t port = 1337;
    NSError * error = nil;
    
    if(![sock connectToHost:host onPort:port error:&error])
    {
        NSLog(@"error connecting to %@ on port %d: %@",host,port,error);
    }
    
    
}

-(void)socket:(GCDAsyncSocket *) socket didConnectToHost:(NSString *)host port:(uint16_t)port
{
    [socket readDataToData:CRLF withTimeout:-1 tag:1];

    
}
-(void)socket:(GCDAsyncSocket *) socket didReadData:(NSData *)data withTag:(long)tag
{
    NSString * message = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, [data length] - 2)] encoding:NSUTF8StringEncoding];
            NSLog(@"%@\n",message);
    if(tag == 1)
    {
        [socket writeData:[@"USER ObjCBot dot bla :Objective C IRC Bot\r\n" dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
        [socket writeData:[@"NICK Obby\r\n" dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
        [socket writeData:[@"JOIN #test\r\n" dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
        [socket readDataToData:CRLF withTimeout:-1 tag:2];
    }
    if(tag == 2)
    {
        [socket readDataToData:CRLF withTimeout:-1 tag:2];
        }

@end

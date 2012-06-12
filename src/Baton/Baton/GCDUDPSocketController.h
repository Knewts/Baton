//
//  SocketController.h
//  Baton
//
//  Created by Matthew Knewtson on 4/21/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "GCDAsyncUdpSocket.h"
#import "OSCMessage.h"

@interface GCDUDPSocketController : NSObject
{
    GCDAsyncUdpSocket * sock;
}

@property (nonatomic, retain) GCDAsyncUdpSocket * sock;

-(id)initWithAddress: (NSString *) host;
-(id)initWithAddress:(NSString *)host onPort:(uint16_t) port;
-(void)sendMessage:(OSCMessage *) message toHost:(NSString *)host onPort:(uint16_t)port;

@end

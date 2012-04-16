//
//  OSCSocket.h
//  OSCAsyncSock
//
//  Created by Matthew Knewtson on 3/12/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncUdpSocket.h"
@interface OSCSocketDelegate : NSObject
{
    GCDAsyncUdpSocket * socket;
    NSError * error;
}

-(OSCSocketDelegate*)init;
-(BOOL)connectToAddress:(NSString *)addr onPort:(uint16_t)port;

@end

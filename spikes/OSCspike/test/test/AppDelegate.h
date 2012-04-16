//
//  AppDelegate.h
//  test
//
//  Created by Matthew Knewtson on 3/12/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"
#import "IrcMessage.h"
@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    GCDAsyncSocket * sock;
    GCDAsyncReadPacket * readdata;
    GCDAsyncWritePacket * output;
}
@property (assign) IBOutlet NSWindow *window;

@end

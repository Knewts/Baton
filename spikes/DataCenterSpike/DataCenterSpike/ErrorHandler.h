//
//  ErrorHandler.h
//  DataCenterSpike
//
//  Created by Matthew Knewtson on 11/10/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSCLib.h"
#import "GCDUDPSocketController.h"
#import "BatonConfiguration.h"

@interface ErrorHandler : NSObject
{
    GCDUDPSocketController * sock;
    
}
@property (atomic, retain) GCDUDPSocketController * sock;
@property (atomic, assign) BatonConfiguration * config;

-(id)initWithConfiguration:(BatonConfiguration *) config;

-(BOOL)reportError:(NSString *) error;

@end

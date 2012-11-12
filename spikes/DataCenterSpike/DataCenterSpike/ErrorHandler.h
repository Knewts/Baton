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
#import "AppDelegate.h"

@interface ErrorHandler : NSObject
{
    GCDUDPSocketController * sock;
    AppDelegate * delegate;
    
}
@property (atomic, retain) GCDUDPSocketController * sock;
@property (nonatomic,retain) AppDelegate * delegate;

-(id)initWithDelegate:(AppDelegate *) delegateIn;

-(BOOL)reportError:(NSString *) error;

@end

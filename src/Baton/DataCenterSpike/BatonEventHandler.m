//
//  DataCenter.m
//  DataCenterSpike
//
//  Created by Andy Stratton on 6/7/12.
//  Copyright (c) 2012 Western Michigan University
//  All rights reserved.
//


/* This class acts as the central controller for all UI
 * elements and session variables. of this class.
 * This handler() will then take the appropriate action based
 * on the command/argument pairing in the message.
 *
 * This class should be initialized by the XML parser using the
 * data supplied by the user. Included in this data can be 
 * variable information such as port numbers or player ID.
 *
 * Initially there will be two sets of Key/Value pairs used to 
 * hold custom variables. Both sets will use the CAPITALIZED
 * form of the variable name for the key. One set will then 
 * pair the variable name with a value while the other 
 * identifies the variables type. 
 *
 * This class will be able to modify these values or transmit
 * them to a server via the OSC message controller. OSC 
 * messages will be handled through a separate class called 
 * from the handler() of this class.
 */


#import "BatonEventHandler.h"

@implementation BatonEventHandler

@synthesize sock;
@synthesize config;

// Set the size of the view on initialization.
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        sock = [[AppDelegate sharedAppdelegate] sock];
        config = [[AppDelegate sharedAppdelegate] config];
    }
    
    return self;	
}


// Adds an element to the screen
-(void)addUIElement:(UIView <Baton_UI_Element> *) batonUI
{
    // Set this as the delegate to handle the commands
    [batonUI setDelegate:self];
    // Add the object to the screen.
    [self addSubview:batonUI];
}

-(void)executeCommand: (UIView <Baton_UI_Element> *) sender
{
    if ([sender.commandString isEqualToString:@"LOG"]) {
        NSLog(@"%@",sender.commandArguments);
    }
    else if ([sender.commandString isEqualToString:@"SENDOSC"])
    {
        OSCMessage * message = [[OSCMessage alloc] initWithAddress:[NSString stringWithFormat:@"/Baton/%@",sender.commandArguments]];
        [message addObject:[OSCString oscStringfromString:sender.commandArguments]];
        NSString * host = [config getObjectForKey:@"hostIP"];
        NSNumber * port = [config getObjectForKey:@"hostPort"];
        [sock sendMessage:message toHost:host onPort:[port intValue]];
    }
    
}

@end

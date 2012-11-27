//
//  OSCFormater.h
//  Baton
//
//  Created by Matthew Knewtson on 4/23/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//
//  NOTE: OSCMessages should never be autoreleased. If they're in the autorelease pool after being sent to the GCD asynchronous socket, we'll encounter segfault errors.

#import <Foundation/Foundation.h>
#import "OSClib.h"
#import "OSCObject.h"
@interface OSCMessage : NSObject
{
    OSCString * address;
    NSMutableString * typeString;
    NSMutableData * data;
}

@property (atomic,retain) OSCString * address;
@property (atomic,retain) NSMutableString * typeString;
@property (atomic,retain) NSMutableData * data;

-(id) initWithAddress:(NSString *)_address;

//+(id) oscMessagetoAddress:(NSString *) address;

//This method is an abstract method that controls the addition of any sort of object to the message.
//That means this code currently comforms to the open close principle.  as such, THIS CODE IS CLOSED TO CHANGE.
//Any additional OSCObjects should be written as a seperate class that implements the OSCObject protocal.
-(BOOL) addObject:(NSObject <OSCObject> *) object;

-(NSData *) writeToData;

@end

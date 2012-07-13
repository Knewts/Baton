//
//  OSCFormater.h
//  Baton
//
//  Created by Matthew Knewtson on 4/23/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSCstring.h"
#import "OSCObject.h"
@interface OSCMessage : NSObject
{
    OSCstring * address;
    NSMutableString * typeString;
    NSMutableData * data;
}

@property (atomic,retain) OSCstring * address;
@property (atomic,retain) NSMutableString * typeString;
@property (atomic,retain) NSMutableData * data;

-(id) initWithAddress:(NSString *)_address;

//+(id) oscMessagetoAddress:(NSString *) address;
//the first add function is an abstraction of the other add functions.  It's going to take some time and work to write implementations for each of the types, however.

-(BOOL) addObject:(OSCObject *) object;
-(BOOL) addInt32:(int32_t)num;
-(BOOL) addFloat32:(Float32)num;
-(BOOL) addString:(NSString *)string;
-(BOOL) addBlob:(NSData *) blob;


-(NSData *) writeToData;

@end

//
//  OSCstring.h
//  Baton
//
//  Created by Matthew Knewtson on 4/24/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//
//  According to http://opensoundcontrol.org/spec-1_0 an OSC String is 
//  A sequence of non-null ASCII characters followed by a null, followed by 0-3 additional null characters to make the total number of bits a multiple of 32.

#import <Foundation/Foundation.h>
#import "OSCObject.h"

@interface OSCString : NSObject <OSCObject>
{
    NSData * data;
    NSUInteger length;
}

@property (atomic, retain) NSData * data;
@property (atomic) NSUInteger length;


-(NSData *)finishAndReturnData;
-(NSString *)getTypeString;
-(id)initWithString:(NSString *)inString;
+(id)oscStringfromString:(NSString *)inString;

@end

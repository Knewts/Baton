//
//  OSCFormater.h
//  Baton
//
//  Created by Matthew Knewtson on 4/23/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSCstring.h"
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
//this can be done.  It might be benificial to do it this way, too.


-(BOOL) addInt32:(int32_t)num;
-(BOOL) addFloat32:(Float32)num;
-(BOOL) addString:(NSString *)string;
-(BOOL) addBlob:(NSData *) blob;


-(NSData *) writeToData;

@end

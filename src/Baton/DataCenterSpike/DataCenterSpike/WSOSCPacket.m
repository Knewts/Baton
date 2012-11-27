//
//  WSOSCPacket.m
//  WSOSC
//
//  Created by Woon Seung Yeo on Thu Mar 04 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "WSOSCPacket.h"

#define BUNDLE  @"#bundle"
#define	SLASH   @"/"


@implementation WSOSCPacket

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeInt:_type forKey:@"OSCPacketType"];
    [coder encodeObject:_content forKey:@"OSCPacketContent"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if (self = [super init]) {
        _type = [coder decodeIntForKey:@"OSCPacketType"];
        _content = [coder decodeObjectForKey:@"OSCPacketContent"];
    }
    return self;
}

- (void)dealloc {
    [_content release];
    [super dealloc];
}

- (id)init {
    self = [super init];
    return self;
}

- (id)initWithDataFrom:(NSString *)data {
    self = [super init];
    [self parseFrom:data];
    return self;
}


+ (id)packetParsedFrom:(NSString *)data {
    return [[[self alloc] initWithDataFrom:data] autorelease];
}

- (void)parseFrom:(NSString *)data {
    // Check the length of string: if not a multiple of 4, invalid.
    if ([data length] % 4) {
        _type = 0;
        NSLog(@"Not a valid OSC packet: size is not a multiple of 4.");
        return;
    }
    // Check if it's a message or a bundle
    if ([[data substringWithRange:NSMakeRange(0,7)] isEqualToString:BUNDLE]) {
        _type = 2;      // Bundle!
        //_content = [[WSOSCBundle alloc] init];
        //[_content parseFrom:data];
        _content = [[WSOSCBundle alloc] initWithDataFrom:data];
    }
    else if ([[data substringWithRange:NSMakeRange(0,1)] isEqualToString:SLASH]) {
         _type = 1;     // Message!
        //_content = [[WSOSCMessage alloc] init];
        //[_content parseFrom:data];
        _content = [[WSOSCMessage alloc] initWithDataFrom:data];
    }
    else {
        _type = -1;      // Invalid!
        NSLog(@"Not a valid OSC packet: neither a message nor a bundle.");
    }
    return;
}


- (int)type {
    return _type;
}

- (id)content {
    return _content;
}

@end

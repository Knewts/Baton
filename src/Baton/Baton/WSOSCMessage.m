//
//  WSOSCMessage.m
//  WSOSC
//
//  Created by Woon Seung Yeo on Fri Mar 05 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "WSOSCMessage.h"


@implementation WSOSCMessage

- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeBool:_hasTypeTag forKey:@"OSCMessageHasTypeTag"];
    [coder encodeObject:_addressString forKey:@"OSCAddressString"];
	[coder encodeObject:_addressPattern forKey:@"OSCAddressPattern"];
	[coder encodeObject:_typeTagString forKey:@"OSCTypeTagString"];
	[coder encodeObject:_arguments forKey:@"OSCArguments"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if (self = [super init]) {
        _hasTypeTag = [coder decodeBoolForKey:@"OSCMessageHasTypeTag"];
        _addressString = [coder decodeObjectForKey:@"OSCAddressString"];
        _addressPattern = [coder decodeObjectForKey:@"OSCAddressPattern"];
        _typeTagString = [coder decodeObjectForKey:@"OSCTypeTagString"];
        _arguments = [coder decodeObjectForKey:@"OSCArguments"];
        
        [_addressString retain];
        [_addressPattern retain];
        [_typeTagString retain];
        [_arguments retain];
    }
    return self;
}

- (void)dealloc {
    [_addressString release];
    [_addressPattern release];
    [_typeTagString release];
    [_arguments release];
    [super dealloc];
}

- (id)init {
    if (self = [super init]) {
        _hasTypeTag = YES;
        _addressString = [[NSString alloc] init];
        _addressPattern = [[NSMutableArray alloc] init];
        _typeTagString = [[NSString alloc] init];
        _arguments = [[NSMutableArray alloc] init];
    }
	return self;
}


- (id)initWithDataFrom:(NSString *)data {
    if (self = [super init]) {
        _hasTypeTag = YES;
        _addressString = [[NSString alloc] init];
        _addressPattern = [[NSMutableArray alloc] init];
        _typeTagString = [[NSString alloc] init];
        _arguments = [[NSMutableArray alloc] init];
        [self parseFrom:data];
    }
	return self;
}

+ (id)messageParsedFrom:(NSString *)data {
    return [[[self alloc] initWithDataFrom:data] autorelease];
}

- (void)parseFrom:(NSString *)data {
    // Variables necessary for parsing arguments
    int *argumentInt32;
    float *argumentFloat32;
    const char *argumentChar;
    NSString *argumentString;

    int index;
    
    // Parse address pattern
    _addressString = [[data componentsSeparatedByString:@"\0"] objectAtIndex:0];
    _addressPattern = [_addressString pathComponents];
    
    // Parse typetag string
    int typeTagIndex = [_addressString length] + (4 - ([_addressString length]%4) + 1);
    NSString *tagsAndArguments = [data substringFromIndex:typeTagIndex];

    // Parse typeTag
    _typeTagString = 
        [[tagsAndArguments componentsSeparatedByString:@"\0"] objectAtIndex:0];
    int pointer = 
        ([_typeTagString length]+1) + (4 - ( ([_typeTagString length]+1) % 4 ) - 1);
    
    for (index = 0; index < [_typeTagString length]; index++) {
        switch ([_typeTagString characterAtIndex:index]) {
			case 'f':
                argumentChar = 
                [[tagsAndArguments substringWithRange:NSMakeRange(pointer,4)] cString];
                argumentFloat32 = (float *)argumentChar;
                [_arguments addObject:[NSNumber numberWithFloat:*argumentFloat32]];
                pointer += 4;
				break;
			case 'i':
                argumentChar = 
                [[tagsAndArguments substringWithRange:NSMakeRange(pointer,4)] cString];
                argumentInt32 = (int *)argumentChar;
                [_arguments addObject:[NSNumber numberWithInt:*argumentInt32]];
                pointer += 4;
				break;
			case 's':
                argumentString = 
                [[[tagsAndArguments substringFromIndex:pointer]
                componentsSeparatedByString:@"\0"] objectAtIndex:0];
                [_arguments addObject:argumentString];
                pointer += [argumentString length] + 4 - ([argumentString length]%4);
                break;

            // From here, types not implemented yet...
			case 'b':
                //arguments = [arguments stringByAppendingString:@", <OSC-blob>"];
                //pointer += 4;
				break;
            case 'h':
                //arguments = [arguments stringByAppendingString:@", <64 bit big-endian two's complement integer>"];
                //pointer += 4;
                break;
            case 't':
                //arguments = [arguments stringByAppendingString:@", <OSC-timetag>"];
                //pointer += 4;
                break;
            case 'd':
                //arguments = [arguments stringByAppendingString:@", <64 bit IEEE 754 floating point>"];
                //pointer += 4;
                break;
            case 'S':
                //arguments = [arguments stringByAppendingString:@", <Alternate type represented as an OSC-string>"];
                //pointer += 4;
                break;
            case 'c':
                //arguments = [arguments stringByAppendingString:@", <32 bit ASCII character>"];
                //pointer += 4;
                break;
            case 'r':
                //arguments = [arguments stringByAppendingString:@", <32 bit RGBA color>"];
                //pointer += 4;
                break;
            case 'm':
                //arguments = [arguments stringByAppendingString:@", <4 byte MIDI message>"];
                //pointer += 4;
                break;
            case 'T':
                //arguments = [arguments stringByAppendingString:@", <True>"];
                //pointer += 4;
                break;
            case 'F':
                //arguments = [arguments stringByAppendingString:@", <False>"];
                //pointer += 4;
                break;
            case 'N':
                //arguments = [arguments stringByAppendingString:@", <Nil>"];
                //pointer += 4;
                break;
            case 'I':
                //arguments = [arguments stringByAppendingString:@", <Infinitum>"];
                //pointer += 4;
                break;
            case '[':
                //arguments = [arguments stringByAppendingString:@", ["];
                //pointer += 4;
                break;
            case ']':
                //arguments = [arguments stringByAppendingString:@", ]"];
                //pointer += 4;
                break;
		}
    }
}    


- (BOOL)hasTypeTag {
    return _hasTypeTag;
}

- (NSString *)addressString {
    return _addressString;
}

- (NSArray *)addressPattern {
    return _addressPattern;
}

- (NSString *)typeTagString {
    return _typeTagString;
}

- (NSMutableArray *)arguments {
    return _arguments;
}

- (int)numberOfAddressPatterns {
    return [_addressPattern count];
}

- (NSString *)addressPatternAtIndex:(int)index {
    return [_addressPattern objectAtIndex:index];
}

- (char)typeTagAtIndex:(int)index {
    return [_typeTagString characterAtIndex:index];
}

- (int)numberOfArguments {
    return [_arguments count];
}

- (id)argumentAtIndex:(int)index {
    return [_arguments objectAtIndex:index];
}

@end

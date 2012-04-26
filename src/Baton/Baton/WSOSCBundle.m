//
//  WSOSCBundle.m
//  WSOSC
//
//  Created by Woon Seung Yeo on Fri Mar 05 2004.
//  Copyright (c) 2004 __MyCompanyName__. All rights reserved.
//

#import "WSOSCBundle.h"

#define TIMETAG_POINTER 8
#define TIMETAG_LENGTH 8
#define BUNDLESIZE_LENGTH 4

int _numberOfBundles;
NSNumber *_bundleTimeTag;
NSMutableArray *_bundles; 

@implementation WSOSCBundle

- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeInt:_numberOfBundles forKey:@"OSCNumberOfBundles"];
	[coder encodeObject:_bundleTimeTag forKey:@"OSCBundleTimeTag"];
	[coder encodeObject:_bundles forKey:@"OSCBundles"];
}

- (id)initWithCoder:(NSCoder *)coder {
	if (self = [super init]) {
        _numberOfBundles = [coder decodeIntForKey:@"OSCNumberOfBundles"];
        _bundleTimeTag = [coder decodeObjectForKey:@"OSCBundleTimeTag"];
        _bundles  = [coder decodeObjectForKey:@"OSCBundles"];
        
        [_bundleTimeTag retain];
        [_bundles retain];
    }
    return self;
}

- (void)dealloc {
    [_bundleTimeTag release];
    [_bundles release];
    [super dealloc];
}

- (id)init {
    if (self = [super init]) {
        _numberOfBundles = 0;
        _bundleTimeTag = [[NSNumber alloc] init];
        _bundles = [[NSMutableArray alloc] init];
    }
	return self;
}

- (id)initWithDataFrom:(NSString *)data {
    if (self = [super init]) {
        _numberOfBundles = 0;
        _bundleTimeTag = [[NSNumber alloc] init];
        _bundles = [[NSMutableArray alloc] init];
        [self parseFrom:data];
    }
	return self;
}

+ (id)bundleParsedFrom:(NSString *)data {
    return [[[self alloc] initWithDataFrom:data] autorelease];
}

- (void)parseFrom:(NSString *)data {    
    // Divide data into timetag and bundle(s)
    //const char *timeTagString = 
    //    [[data substringWithRange:NSMakeRange(TIMETAG_POINTER, TIMETAG_LENGTH)] cString];

    // Parse timetag: to be implemented.
    //NSLog(@"Timetag string hahaha: %s", timeTagString);    
    
    // Parse bundles
    int *bundleSize;
    int pointer = TIMETAG_POINTER + TIMETAG_LENGTH;
    
    _numberOfBundles = 0;
    
    while (pointer < [data length]) {
        bundleSize = 
            (int *) [[data substringWithRange:NSMakeRange(pointer, BUNDLESIZE_LENGTH)] cString];
        pointer += BUNDLESIZE_LENGTH;

        WSOSCMessage *message = [[WSOSCMessage alloc] init];
        [message parseFrom:[data substringWithRange:NSMakeRange(pointer, *bundleSize)]];
        [_bundles addObject:message];
        [message release];
        
        _numberOfBundles ++;
        pointer += *bundleSize;
    }
}    

- (int)numberOfBundles {
    return _numberOfBundles;
}

- (NSNumber *)bundleTimeTag {
    return _bundleTimeTag;
}

- (NSMutableArray *)bundles {
    return _bundles;
}

- (WSOSCMessage *)bundleAtIndex:(int)index {
    return [_bundles objectAtIndex:index];
}


@end

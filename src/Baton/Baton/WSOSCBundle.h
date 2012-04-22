//
//  WSOSCBundle.h
//  WSOSC
//  Version 1.0
//  Created by Woon Seung Yeo on Fri Mar 05 2004.
//  Copyright (c) 2004 CCRMA, Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WSOSCMessage.h>


@interface WSOSCBundle : NSObject {
    int _numberOfBundles;
    NSNumber *_bundleTimeTag;
    NSMutableArray *_bundles;   // Get instances of WSOSCMessage as elements
}

- (id)initWithDataFrom:(NSString *)data;
+ (id)bundleParsedFrom:(NSString *)data;

- (void)parseFrom:(NSString *)data;

- (int)numberOfBundles;
- (NSNumber *)bundleTimeTag;
- (NSMutableArray *)bundles;
- (WSOSCMessage *)bundleAtIndex:(int)index;

@end

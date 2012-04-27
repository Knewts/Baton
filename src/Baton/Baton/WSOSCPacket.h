//
//  WSOSCPacket.h
//  WSOSC
//  Version 0.1
//  Created by Woon Seung Yeo on Thu Mar 04 2004.
//  Copyright (c) 2004 CCRMA, Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSOSCBundle.h"


@interface WSOSCPacket : NSObject {
    int _type;
    id _content;
}

- (id)initWithDataFrom:(NSString *)data;
+ (id)packetParsedFrom:(NSString *)data;
- (void)parseFrom:(NSString *)data;

- (int)type;
- (id)content;



/*
////////////////////////////////////////
// Compose OSC packet data
////////////////////////////////////////

- (void)composePacketFromMessage;
- (void)composePacketFromBundle;

- (void)composePacketWithAddressPattern:(NSString *)addressPattern
                          typeTagString:(NSString *)typeTagString
                              arguments:(NSMutableArray *)arguments;

- (void)composePacketWithBundleTimeTag:(NSNumber *)bundleTimeTag
                 bundleAddressPatterns:(NSArray *)bundleAddressPattern
                  bundleTypeTagStrings:(NSArray *)bundleTypeTagStrings
                       bundleArguments:(NSArray *)bundleArguments;

- (void)makeBundle:(BOOL)isBundle;
*/


@end

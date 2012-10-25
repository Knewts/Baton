//
//  OSCInt.m
//  Baton
//
//  Created by Matthew Knewtson on 9/17/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "OSCInt.h"

@implementation OSCInt

@synthesize num;

-(id)initWithInt:(int) value;
{
    self.num = [NSNumber numberWithInt:value];
    return self;
}
+(id)oscIntWithInt:(int)value
{
    return [[OSCInt alloc] initWithInt:value];
}

-(NSString *)getTypeString
{
    return @"i";
}

-(NSData *)finishAndReturnData
{
    int32_t value = [num intValue];
    NSData * data = [NSData dataWithBytes:&value length:sizeof(int32_t)];
    return data;
}


@end

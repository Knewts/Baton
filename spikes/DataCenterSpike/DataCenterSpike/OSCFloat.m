//
//  OSFloat.m
//  Baton
//
//  Created by Matthew Knewtson on 9/17/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "OSCFloat.h"

@implementation OSCFloat

@synthesize num;

-(id)initWithDecimalNumber:(NSDecimalNumber *)value
{
    self.num = value;
    return self;
}
+(id)oscFloatWithDecimalNumber:(NSDecimalNumber *)value
{
    return [[OSCFloat alloc] initWithDecimalNumber:value];
}
-(NSString *)getTypeString
{
    return @"f";
}

-(NSData *)finishAndReturnData
{
    Float32 value = [num floatValue];
    NSData * data = [NSData dataWithBytes:&value length:sizeof(Float32)];
    return data;
}

@end

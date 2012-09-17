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

-(id)initWithInt:(NSNumber *) value;
{
    self.num = value;
    return self;
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

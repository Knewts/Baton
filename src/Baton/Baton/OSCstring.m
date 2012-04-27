//
//  OSCstring.m
//  Baton
//
//  Created by Matthew Knewtson on 4/24/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//
//  According to http://opensoundcontrol.org/spec-1_0 an OSC String is 
//  A sequence of non-null ASCII characters followed by a null, followed by 0-3 additional null characters to make the total number of bits a multiple of 32.

#import "OSCstring.h"

@implementation OSCstring
@synthesize data;
@synthesize length;

-(id)initWithString:(NSString *)inString
{
    //need to calculate nulls and boundries...
    
    char * buff;
    length = [inString lengthOfBytesUsingEncoding:NSUTF8StringEncoding] + (4 - ([inString lengthOfBytesUsingEncoding:NSUTF8StringEncoding] % 4));
    
    buff = (char *)calloc(length,sizeof(char));
    
    strcpy(buff, [inString cStringUsingEncoding:NSUTF8StringEncoding]);
    
    self.data = [[NSData alloc] initWithBytes:buff length:length];
    return self;
}
+(id)oscStringfromString:(NSString *)inString
{
    return [[OSCstring alloc] initWithString:inString];
}
@end

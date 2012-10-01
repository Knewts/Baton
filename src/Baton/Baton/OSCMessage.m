//
//  OSCFormater.m
//  Baton
//
//  Created by Matthew Knewtson on 4/23/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "OSCMessage.h"

@implementation OSCMessage
@synthesize address;
@synthesize data;
@synthesize typeString;

-(id) initWithAddress:(NSString *)_address
 {
     
     self.data = [[NSMutableData alloc] init];
     
     self.address = [OSCstring oscStringfromString:_address];
     self.typeString = [NSMutableString stringWithString:@","];
     
     return self;
 }
/*
+(id) oscMessagetoAddress:(NSString *)address withFormat:(NSString *)format, ...
{
    va_list args;
    va_start(args,format);
    
    OSCMessage * obj = [[[OSCMessage alloc] initWithAddress:address] autorelease];
    
    return obj;
}
*/
-(BOOL) addObject:(NSObject<OSCObject> *) object
{
    [typeString appendString:[object getTypeString]];
    //here all appended data should have length divisable by 4.
    [data appendData:[object finishAndReturnData]];
    return YES;
}
-(NSData *) writeToData
{
    //according to the Open Sound Control specification, an OSC packet consists of it's contents and it's size.  Whether the size comes first or last is unkown. It's also not specified whether or not it's required.  This makes things rather complicated.
    NSMutableData * result = [[NSMutableData alloc] init];
    
    [result appendData:[address data]];
    [result appendData:[[OSCstring oscStringfromString:typeString] data]];
    [result appendData:data];
     
    return result;
}
@end

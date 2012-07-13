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
    [data appendData:[object finishAndReturnData]];
    return YES;
}

//should abstract this...
-(BOOL) addInt32:(int32_t)num
{
    [typeString appendString:@"i"];
    [data appendBytes:&num length:4];
    return YES;
}
/*
The addString function has been covered by the addObject function. Keeping it in here until we clear up the rest of these abstractions.
 */
-(BOOL) addString:(NSString *)inString
{
    [typeString appendString:@"s"];
    [data appendData:[[OSCstring oscStringfromString:inString] data]];
    return YES;
}
-(BOOL) addFloat32:(Float32)num
{
    [typeString appendString:@"f"];
    [data appendBytes:&num length:4];
    return YES;
}
-(BOOL) addBlob:(NSData *) blob
{
    [typeString appendString:@"b"];
    
    NSUInteger templength = [blob length];
    if(templength %4 == 0)
    {
        [data appendBytes:&templength length:4];
        [data appendData:blob];
    }
    else {
        //calculate the new length.  Going to increase the size to be a multiple of 4.
        templength = templength + (4-(templength % 4));
        
        char * newBytes = (char*)calloc(templength,sizeof(char));
        
        memcpy(newBytes, [blob bytes], [blob length]);
        
        [data appendBytes:&templength length:4];
        [data appendData:[NSData dataWithBytesNoCopy:newBytes length:templength]];
    }
        
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

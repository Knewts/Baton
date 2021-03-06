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
     
     self.address = [OSCString oscStringfromString:_address];
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
    [result appendData:[[OSCString oscStringfromString:typeString] data]];
    [result appendData:data];
     
    return result;
}
//this function will only handle the four default OSC types.  Any more will have to be handled the normal way.
+(OSCMessage *) sendMessagewithFormat:(NSString*) format toAddress:(NSString *)addr, ...
{
    //[OSCMessage sendMessagewithFormat:@"<formatstring>" toAddress:@"<OSC Address>" , 35.4]
    
    va_list args;
    va_start(args,addr);
    
    
    
    OSCMessage * message = [[OSCMessage alloc] initWithAddress:addr];
    
    //"X: %f Y: %f Z: %f
    //<address> sfsfsf "X: " float "Y: " float "Z: " float
    //"Acceldata: %f%f%f"
    
    NSArray * strings = [format componentsSeparatedByString:@"%"];
    NSUInteger index = 1;
    
    if([[strings objectAtIndex:0] length] != 0)
    {
        [message addObject:[OSCString oscStringfromString:[strings objectAtIndex:0]]];
    }
    
    for (NSString * string in [strings subarrayWithRange:NSMakeRange(1,[strings count])])
    {
        //if the string is empty, we need to skip it
        if ([string length] != 0) {
            NSString * postString = [string substringFromIndex:1];
            switch ([string characterAtIndex:0]) {
                case 's':
                    [message addObject:[OSCString oscStringfromString:va_arg(args, NSString *)]];
                    break;
                case 'i':
                    [message addObject:[OSCInt oscIntWithInt:va_arg(args, int)]];
                    break;
                case 'f':
                    [message addObject:[OSCFloat oscFloatWithDecimalNumber:va_arg(args, NSDecimalNumber *)]];
                    break;
                case 'b':
                    //add a blob object
                    //this might be able to simply be passed a set of data.
                    //currently not implemented.
                    [message addObject:[OSCString oscStringfromString:@"Blobs are not yet implemented"]];
                    va_arg(args, NSData *);
                default:
                    break;
            }
            if ([postString length] != 0)
            {
                [message addObject:[OSCString oscStringfromString:postString]];
            }
        }
        index++;
    }
    return message;
}
@end

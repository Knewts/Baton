//
//  IrcMessage.m
//  test
//
//  Created by Matthew Knewtson on 3/13/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "IrcMessage.h"

@implementation IrcMessage
@synthesize junk;

-(IrcMessage *)initWithData:(NSData *)data {
    

    [self parseMessage:data];
    return self;
    
}

-(BOOL)parseMessage:(NSData*)data {
    int i;
    error = nil;
    
    junk = [[[NSMutableArray alloc] initWithCapacity:4] autorelease];
    
    NSRegularExpression * expression = [NSRegularExpression regularExpressionWithPattern:@":?(?:(\\w+)!\\w+@[\\w\\.]+)?\\s?(\\w+|\\d\\d\\d)\\s?(#?\\w+)?\\s?:?(.*)" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSString * fullData = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, [data length] -2 )] encoding:NSUTF8StringEncoding];
    
    NSTextCheckingResult * result = [expression firstMatchInString:fullData options:0 range:NSMakeRange(0, [fullData length])];
    
    if([result range].location != NSNotFound) {
        for (i = 1; i < 5; i++) {
    
            if ([result rangeAtIndex:i].location != NSNotFound){
#ifdef DEBUG
                NSLog(@"Adding %d: %@\n",i,[fullData substringWithRange:[result rangeAtIndex:i]]);
#endif
                [junk addObject:[NSString stringWithString:[fullData substringWithRange:[result  rangeAtIndex:i]]]];
            
            } else {
            
                [junk addObject:@""];
        
            }
        
        } 
    } else {
        NSLog(@"Didn't get that one\n");
    }
#ifdef DEBUG
    [self printParsedData];
#endif
    return true;
}

-(void) printParsedData {
    int i;
    for (i = 0; i < [junk count]; i++) {
        NSLog(@"%d: %@\n",i,[junk objectAtIndex:i]);
    }
}

-(NSString *)getSenderNick {
    return [junk objectAtIndex:0];
}

-(NSString *)getChannel {
    return [junk objectAtIndex:2];
}

-(NSString *)getCommand {
    return [junk objectAtIndex:1];
}

-(NSString *)getMeat {
    return [junk objectAtIndex:3];
}
@end

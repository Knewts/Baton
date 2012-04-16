//
//  IrcBot.m
//  test
//
//  Created by Matthew Knewtson on 3/15/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "IrcBot.h"

@implementation IrcBot 

-(IrcBot *) init
{
    NSError * error;
    ex = [NSRegularExpression regularExpressionWithPattern:@"\\bex\\w+" options:NSRegularExpressionCaseInsensitive error:&error];
    return self;
}
-(NSData *) respondTo:(NSData *)ircData
{
    IrcMessage * message = [[[IrcMessage alloc] initWithData:ircData] autorelease];
    
    if ([[message getCommand] compare:@"PING"] == NSOrderedSame) {
        
        NSString * response = [[NSString stringWithFormat:@"PONG :%@\r\n", [message getMeat]] autorelease];
        
        NSLog(@"%@",response);
        
        return [response dataUsingEncoding:NSUTF8StringEncoding];
    }
    if ([[message getCommand] compare:@"PRIVMSG"] == NSOrderedSame) {
        NSString * replyTo;
        if ([[[message getChannel] substringWithRange:NSMakeRange(0, 1)] compare:@"#"] == NSOrderedSame){
            replyTo = [message getChannel];
        }
        else {
            replyTo = [message getSenderNick];
        }
        if([[message getMeat] caseInsensitiveCompare:@"bot roll call?"] == NSOrderedSame) {
            
            NSString * response = [NSString stringWithFormat:@"PRIVMSG %@ :Obby is here! :D>-<\r\n",[message getChannel]];
            NSLog(@"%@",response);
            
            return [response dataUsingEncoding:NSUTF8StringEncoding];
        } else if ( ) {
            
        }
        
}

}

@end

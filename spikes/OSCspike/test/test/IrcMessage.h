//
//  IrcMessage.h
//  test
//
//  Created by Matthew Knewtson on 3/13/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IrcMessage : NSObject {
    
    NSMutableArray * junk;
    NSError * error;
}

@property (nonatomic,retain) NSMutableArray * junk;

-(IrcMessage *)initWithData:(NSData*)data;

-(BOOL)parseMessage:(NSData*)data;
-(void) printParsedData;

-(NSString *) getSenderNick;
-(NSString *) getChannel;
-(NSString *) getCommand;
-(NSString *) getMeat;


@end

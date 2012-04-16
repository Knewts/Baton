//
//  IrcBot.h
//  test
//
//  Created by Matthew Knewtson on 3/15/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IrcMessage.h"

@interface IrcBot : NSObject {
    NSRegularExpression * ex;
}

-(IrcBot *)init;
-(NSString *)respondTo:(NSData *)ircData;

@end

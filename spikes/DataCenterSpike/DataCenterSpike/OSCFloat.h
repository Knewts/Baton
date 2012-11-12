//
//  OSFloat.h
//  Baton
//
//  Created by Matthew Knewtson on 9/17/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "OSCObject.h"

@interface OSCFloat : NSObject<OSCObject>
{
    NSDecimalNumber * num;
}

@property (retain) NSDecimalNumber * num;

-(id)initWithDecimalNumber:(NSDecimalNumber *)value;
+(id)oscFloatWithDecimalNumber:(NSDecimalNumber *)value;
@end

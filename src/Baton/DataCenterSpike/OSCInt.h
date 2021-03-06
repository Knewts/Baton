//
//  OSCInt.h
//  Baton
//
//  Created by Matthew Knewtson on 9/17/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "OSCObject.h"

@interface OSCInt : NSObject <OSCObject>
{
    NSNumber * num;
}

@property (retain) NSNumber * num;

-(id)initWithInt:(int) value;
+(id)oscIntWithInt:(int) value;

@end

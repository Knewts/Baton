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

@property (nonatomic, assign) NSNumber * num;

-(id)initWithInt:(NSNumber *) value;
+(id)oscIntWithInt:(NSNumber *) value;

@end

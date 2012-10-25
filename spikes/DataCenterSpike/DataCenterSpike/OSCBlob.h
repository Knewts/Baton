//
//  OSCBlob.h
//  Baton
//
//  Created by Matthew Knewtson on 5/8/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "OSCObject.h"

@interface OSCBlob : NSObject <OSCObject>

-(NSData *)finishAndReturnData;
-(NSString *)getTypeString;

@end

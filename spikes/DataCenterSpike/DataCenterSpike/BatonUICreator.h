//
//  BatonUICreator.h
//  DataCenterSpike
//
//  Created by Andy Stratton on 9/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Baton_UI_Element.h"

@interface BatonUICreator : NSObject

-(id)init;
-(Baton_UI_Element *)CreateObjectFrom:(NSArray *) array;

@end
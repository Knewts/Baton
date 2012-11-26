//
//  Conversions.h
//  Baton - Western Michigan University KLORK
//
//  Created by Andy Stratton on 11/25/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Conversions : NSObject

+(UIColor*) colorWithHexString:(NSString*)hex ;
+(NSCharacterSet*) getCharacterTrimSet;
@end

//
//  Baton_Plane_Region.h
//  Baton - Western Michigan University KLORK
//
//  Created by Andy Stratton on 11/15/12.
//  
//
// ********************************************
// ABSTRACT CLASS - INHERIT ONLY
// ********************************************

#import <UIKit/UIKit.h>

@protocol Baton_Plane_Region <NSObject>
@required
- (id)init;
- (id)initFromDictionary:(NSDictionary*) params;
- (void)drawContext:(CGContextRef)context ScaleX:(float) scaleX ScaleY:(float)scaleY Frame:(CGRect)rect;

// Change this to return array of (command, parameter) pairs. or NSString[][]
// A size of 0 means nothing connected. Anything else means loop and execute.
- (Boolean)checkPointX:(CGFloat)x Y:(CGFloat) y ScaleX:(float) scaleX ScaleY:(float)scaleY;
- (NSString*)getCommand;
- (NSString*)getParams;

@end

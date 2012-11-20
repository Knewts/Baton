//
//  Baton_Plane_Region.h
//  ARC enabled Build Center
//
//  Created by Andy Stratton on 11/15/12.
//  
//
// ********************************************
// ABSTRACT CLASS - INHERIT ONLY
// ********************************************

#import <UIKit/UIKit.h>

@interface Baton_Plane_Region:NSObject
- (id)init;
- (id)initFromDictionary:(NSDictionary*) params;
- (void)drawContext:(CGContextRef)context Color:(CGColorRef)color ScaleX:(float) scaleX ScaleY:(float)scaleY Frame:(CGRect)rect;
- (Boolean)checkPointX:(CGFloat)x Y:(CGFloat) y;
- (NSString*)getCommand;
- (NSString*)getParams;

@end

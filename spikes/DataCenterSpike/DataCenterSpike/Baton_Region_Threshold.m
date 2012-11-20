//
//  Baton_Region_Threshold.m
//  ARC enabled Build Center
//
//  Created by Andy Stratton on 11/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Baton_Region_Threshold.h"

@implementation Baton_Region_Threshold

@synthesize command;
@synthesize parameters;
@synthesize hAxis;
@synthesize value;

- (id)initFromDictionary:(NSDictionary*) params
{
    // Get the parameters we need.
    NSNumber *numb;
    NSString *word;
    
    numb = [params valueForKey:@"HAXIS"];
    hAxis = [numb intValue];
    
    numb = [params valueForKey:@"VALUE"];
    value = [numb floatValue];
    
    word = [params valueForKey:@"COMMAND"];
    command = word;
    
    word = [params valueForKey:@"PARAMETERS"];
    parameters = word;
    
    return self;
}

- (void)drawContext:(CGContextRef)context Color:(CGColorRef)color ScaleX:(float) scaleX ScaleY:(float)scaleY Frame:(CGRect)rect
{
    // Draw the region into the provided context.
    CGContextSetStrokeColorWithColor(context, color);
    CGContextSetLineWidth(context, 1.0);
    
    if (hAxis) {
        int onScreenValue = (value/scaleY)*(rect.size.height/2);
        //Horizontal Threshold
        CGContextMoveToPoint(context, 0, onScreenValue );	
        CGContextAddLineToPoint(context, rect.size.width, onScreenValue);
    } else {
        int onScreenValue = (value/scaleX)*(rect.size.width/2);
        //Vertical Threshold
        CGContextMoveToPoint(context, onScreenValue, 0);	
        CGContextAddLineToPoint(context, onScreenValue, rect.size.height);
    }
    
    CGContextStrokePath(context);
}

- (Boolean)checkPointX:(CGFloat)x Y:(CGFloat) y;
{
    // Returns true if an action
    
}

- (NSString*)getCommand;
{
    return command;   
}

- (NSString*)getParams;
{
    return parameters;
}


@end

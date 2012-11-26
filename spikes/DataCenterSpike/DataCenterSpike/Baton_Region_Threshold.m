//
//  Baton_Region_Threshold.m
//  Baton - Western Michigan University KLORK
//
//  Created by Andy Stratton on 11/15/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "Baton_Region_Threshold.h"
#import "Conversions.h"

@implementation Baton_Region_Threshold

- (id)initFromDictionary:(NSDictionary*) params
{
    // Get the parameters we need.
    NSNumber *numb;
    NSString *word;
    maximumGlowTime = 250; //in milliseconds
    glowOn = false;
    
    numb = [params valueForKey:@"HAXIS"];
    hAxis = [numb intValue];
    
    numb = [params valueForKey:@"VALUE"];
    value = [numb floatValue];
    if (value > 0)
        priorWasNegative = true;
    else 
        priorWasNegative = false;
    
    word = [params valueForKey:@"COMMAND"];
    command = word;
    
    word = [params valueForKey:@"PARAMETERS"];
    parameters = word;
    
    // Get the color
    if ((word = [params valueForKey:@"COLOR"]) != nil)
    {
        word = [word stringByTrimmingCharactersInSet:[Conversions getCharacterTrimSet]];
        drawColor = [Conversions colorWithHexString:word];
    }    
    else 
        drawColor = nil;
    
    
    
    // Get threshold Directions
    if ((numb = [params valueForKey:@"POS_TO_NEG"]) != nil)
        positiveToNegative = [numb intValue];
    else 
        positiveToNegative = true;
    
        //Must be true if the other is false.
    if (((numb = [params valueForKey:@"NEG_TO_POS"]) != nil) && positiveToNegative)
        negativeToPositive = [numb intValue];
    else 
        negativeToPositive = true;
    
    
    
    [self checkPointX:0 Y:0 ScaleX:0 ScaleY:0];
    
    return self;
}

- (void)drawContext:(CGContextRef)context ScaleX:(float) scaleX ScaleY:(float)scaleY Frame:(CGRect)rect
{
    CGContextSaveGState(context);
    
    // Set the Draw Color
    CGColorRef cgColor = nil;
    if (drawColor == nil)
    {
        if (negativeToPositive && positiveToNegative)
            cgColor = [UIColor orangeColor].CGColor;
        else if (negativeToPositive) 
            cgColor = [UIColor yellowColor].CGColor;
        else
            cgColor = [UIColor redColor].CGColor;
                
    } else {
        cgColor = drawColor.CGColor;
    }

    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);
    
    // Draw the region into the provided context.
    CGContextBeginPath(context);
    
    CGContextSetStrokeColorWithColor(context, cgColor);
    CGContextSetLineWidth(context, 2.0);
    
    // Glow
    if (glowOn)
    {
        double elapsedTime = [[NSDate date] timeIntervalSince1970]*1000;
        elapsedTime -= startTime;
        
        if (elapsedTime <= maximumGlowTime)
        {
            float glowWidth = 14.0 * (.5+((maximumGlowTime - elapsedTime) / maximumGlowTime));
            CGContextSetShadowWithColor(context, CGSizeMake( 0.0, 0.0 ), glowWidth, cgColor );
        } else {
            glowOn = false;
        }
    }
    
    if (hAxis) {
        //Horizontal Threshold
        int onScreenValue = center.y - ((value/scaleY)*((rect.size.height/2)));
        CGContextMoveToPoint(context, 0, onScreenValue );	
        CGContextAddLineToPoint(context, rect.size.width, onScreenValue);
    } else {
        //Vertical Threshold         
        int onScreenValue = center.x + ((value/scaleX)*((rect.size.width/2)));
        CGContextMoveToPoint(context, onScreenValue, 0);	
        CGContextAddLineToPoint(context, onScreenValue, rect.size.height);
    }
    
    
    CGContextStrokePath(context);
    CGContextBeginPath(context);
    
    CGContextRestoreGState(context);
}

- (Boolean)checkPointX:(CGFloat)x Y:(CGFloat) y ScaleX:(float) scaleX ScaleY:(float)scaleY
{
    Boolean retVal = false;
    Boolean localNegative = false;
    
    if (hAxis) {
        localNegative = ((value-(y*scaleY))>0)?true:false;
    } else {
        localNegative = ((value-(x*scaleX))>0)?true:false;
    }
    
    if (localNegative != priorWasNegative)
    {
        if ((priorWasNegative && negativeToPositive) || (!priorWasNegative && positiveToNegative))
            retVal = true;
    }
    priorWasNegative = localNegative;
    
    if (retVal)
    {
        startTime = [[NSDate date] timeIntervalSince1970]*1000;
        glowOn = true;
    }
    // Returns true if an action
    return retVal;
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

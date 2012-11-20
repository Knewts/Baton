//
//  Baton_UIButton.m
//  DataCenterSpike
//
//  Created by Andy Stratton on 10/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "Baton_UIButton.h"

@implementation Baton_UIButton

@synthesize bgColorOn;
@synthesize bgColorOff;
@synthesize bgColorActive;

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame])
    {
        toggleType = false;
        text = @"Button";
        //bgColorOn = UIColorFromRGB(createRGBIntFromHexString(@"FF9900")).CGColor;
    }
    return self;
}

-(id)initWithDictionary:(NSDictionary *)params
{
    
    NSMutableCharacterSet *workingSet = [[NSCharacterSet newlineCharacterSet] mutableCopy];
    [workingSet addCharactersInString:@"#;:,."];
    NSCharacterSet *finalCharacterSet = [workingSet copy];
    
    
    NSNumber *temp;
    temp = [params valueForKey:@"X"];
    int xposition = [temp intValue];
    
    temp = [params valueForKey:@"Y"];
    int yposition = [temp intValue];
    
    temp = [params valueForKey:@"WIDTH"];
    int width = [temp intValue];
    
    temp = [params valueForKey:@"HEIGHT"];
    int height = [temp intValue];
    
    CGRect newRect = CGRectMake(xposition, yposition, width, height);
    
    if (self = [super initWithFrame:newRect])
    {
        temp = [params valueForKey:@"TOGGLE"];
        toggleType = [temp intValue];
        
        text = [params  valueForKey:@"TEXT"];
        
        NSString *color = [params valueForKey:@"BGCOLOR_ON"];
        color = [color stringByTrimmingCharactersInSet:finalCharacterSet];
        bgColorOn = CGColorGetComponents(UIColorFromRGB(createRGBIntFromHexString(color)).CGColor);
        
        color = [params valueForKey:@"BGCOLOR_OFF"];
        color = [color stringByTrimmingCharactersInSet:finalCharacterSet];
        bgColorOff = CGColorGetComponents(UIColorFromRGB(createRGBIntFromHexString(color)).CGColor);
        
        //Set active to false and the active color to off
        Active = false;
        bgColorActive = bgColorOff;
        
        color = [params valueForKey:@"COMMAND"];
        primaryCommand = color;
        
        color = [params valueForKey:@"PARAMETERS"];
        primaryParameters = color;
    }
    
    return self;

}
-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    const CGFloat * test = bgColorOff;
    if (Active)
    test = bgColorOn;
    
  
    CGColorRef color = CGColorCreate(colorspace, test);
    CGContextSetFillColorWithColor(context, color);
        CGContextFillRect(context, rect);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    if (!toggleType)
    {
        //Only act on mouse down with non-toggle types
        [delegate executeCommand:primaryCommand withArguments:primaryParameters];
        Active = true;
        [self setNeedsDisplay];
    }
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
    if (toggleType)
    {
        [delegate executeCommand:primaryCommand withArguments:primaryParameters];
        Active = !Active;
    } 
    else
    {   
        // This is NOT a toggle button
        [delegate executeCommand:@"LOG" withArguments:@"THIS WORKS"];
        Active = false;
    }
    [self setNeedsDisplay];
}

-(void) swapState
{
    Active = !Active;
    
}

// Code from: http://www.raywenderlich.com/2134/core-graphics-101-glossy-buttons
CGMutablePathRef createRoundedRectForRect(CGRect rect, CGFloat radius) {
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect), 
                        CGRectGetMaxX(rect), CGRectGetMaxY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect), 
                        CGRectGetMinX(rect), CGRectGetMaxY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect), 
                        CGRectGetMinX(rect), CGRectGetMinY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect), 
                        CGRectGetMaxX(rect), CGRectGetMinY(rect), radius);
    CGPathCloseSubpath(path);
    
    return path;        
}

unsigned createRGBIntFromHexString(NSString * s)
{
    unsigned retVal = 0;
    NSScanner *scanner = [NSScanner scannerWithString:s];
    
    [scanner setScanLocation:0];
    [scanner scanHexInt:&retVal];
    
    return retVal;
}


@end

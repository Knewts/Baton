//
//  Baton_UIButton.m
//  DataCenterSpike
//
//  Created by Andy Stratton on 10/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "Baton_UIButton.h"

@implementation Baton_UIButton

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame])
    {
        toggleType = false;
        text = @"Button";
        bgColor = UIColorFromRGB(createRGBIntFromHexString(@"FF9900")).CGColor;
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
        
        NSString *color = [params valueForKey:@"BGCOLOR"];
        color = [color stringByTrimmingCharactersInSet:finalCharacterSet];
        bgColor = UIColorFromRGB(createRGBIntFromHexString(color)).CGColor;
    }
    
    return self;

}
-(void)drawRect:(CGRect)rect
{
    //Get the layer context.
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef blackColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0].CGColor;
    CGColorRef highlightStart = [UIColor colorWithRed:1.0 green:1.0  blue:1.0 alpha:0.4].CGColor;
    CGColorRef highlightStop = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1].CGColor;
    CGColorRef shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5].CGColor;
    
    //Recover Hue saturation and brightness from backgroundColor
    //UIColor *test = [UIColor colorWithCGColor:self->bgColor];
    
    CGFloat _hue, _sat, _alph, _bright;

    
    _hue = bgColor->h;
_sat = bgColor->s;
	
    CGColorRef outerTop =    [UIColor colorWithHue:_hue saturation:_sat brightness:1.00*_bright  alpha:1.0].CGColor;
    CGColorRef outerBottom = [UIColor colorWithHue:_hue saturation:_sat brightness:0.80*_bright alpha:1.0].CGColor;
    CGColorRef innerStroke = [UIColor colorWithHue:_hue saturation:_sat brightness:0.80*_bright alpha:1.0].CGColor;
    CGColorRef innerTop =    [UIColor colorWithHue:_hue saturation:_sat brightness:0.90*_bright alpha:1.0].CGColor;
    CGColorRef innerBottom = [UIColor colorWithHue:_hue saturation:_sat brightness:0.70*_bright alpha:1.0].CGColor;
    
    CGFloat outerMargin = 5.0f;
    CGRect outerRect = CGRectInset(self.bounds, outerMargin, outerMargin);
    CGMutablePathRef outerPath = createRoundedRectForRect(outerRect, 6.0);
    
    CGFloat innerMargin = 3.0f;
    CGRect innerRect = CGRectInset(outerRect, innerMargin, innerMargin);
    CGMutablePathRef innerPath = createRoundedRectForRect(innerRect, 6.0);
    
    if (state != UIControlStateHighlighted) {
        CGContextSaveGState(context);
        CGContextSetFillColorWithColor(context, bgColor);
        CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, shadowColor);
        CGContextAddPath(context, outerPath);
        CGContextFillPath(context);
        CGContextRestoreGState(context);
    }
    
    CGContextSaveGState(context);
    CGContextAddPath(context, outerPath);
    CGContextClip(context);
    //drawGlossAndGradient(context, outerRect, outerTop, outerBottom);
    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);
    CGContextAddPath(context, innerPath);
    CGContextClip(context);
    //drawGlossAndGradient(context, innerRect, innerTop, innerBottom);
    CGContextRestoreGState(context);
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {}


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
    
    [scanner setScanLocation:0]; // bypass '#' character
    [scanner scanHexInt:&retVal];
    
    return retVal;
}
@end

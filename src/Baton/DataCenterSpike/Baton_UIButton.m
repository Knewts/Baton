//
//  Baton_UIButton.m
//  Baton - Western Michigan University KLORK
//
//  Created by Andy Stratton on 10/3/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//


#import "Baton_UIButton.h"
#import "Conversions.h"


@implementation Baton_UIButton

@synthesize commandString;
@synthesize commandArguments;
@synthesize delegate;

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
    NSCharacterSet *finalCharacterSet = [Conversions getCharacterTrimSet];
    
    // Create the frame for the object.	
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
        BORDER = 3;
        
        if ((temp = [params valueForKey:@"TOGGLE"]) != nil)
            toggleType = [temp intValue];
        else
            toggleType = false;
        
        text = [params  valueForKey:@"TEXT"];
        
        // COLOR **********************
        NSString *color = nil;
        
        if ((color = [params valueForKey:@"BGCOLOR_ON"]) != nil)
            color = [color stringByTrimmingCharactersInSet:finalCharacterSet];
        else 
            color = @"FCC815";
        bgColorOn = [Conversions colorWithHexString:color];
        
        
        if ((color = [params valueForKey:@"BGCOLOR_OFF"]) != nil)
            color = [color stringByTrimmingCharactersInSet:finalCharacterSet];
        else 
            color = @"795B1A";
        
        bgColorOff = [Conversions colorWithHexString:color];
        radius = MIN(newRect.size.width, newRect.size.height)/2;
        
        // FONT ***********************************
        // Create a font that is just smaller than the rectangle
        if ([text length] > 1) {
     
            int size = 1;
            CGSize testSize = [text sizeWithFont:[UIFont fontWithName:@"Helvetica-Bold" size:size]];
            float maximumH = (newRect.size.height*(4.0/5.0));
            float maximumW = (newRect.size.width*(4.0/5.0));
        
            while ((testSize.height < maximumH) && (testSize.width < maximumW))
            {
                size = size + 3;
                testSize = [text sizeWithFont:[UIFont fontWithName:@"Helvetica-Bold" size:size]];
            }
            buttonFont = [UIFont fontWithName:@"Helvetica-Bold" size:size-3];
        }
        //Set active to false and the active color to off
        Active = false;
        //bgColorActive = bgColorOff;
        
        color = [params valueForKey:@"COMMAND"];
        primaryCommand = color;
        
        color = [params valueForKey:@"PARAMETERS"];
        primaryParameters = color;
        
        [self setBackgroundColor:[UIColor clearColor]];
    }
    
    return self;

}
-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    //********************* Set Colors **************************
    CGColorRef mainColor = bgColorOff.CGColor;
    if (Active)
      mainColor = bgColorOn.CGColor;
    
    
    CGFloat shadowPositions[3] = {0.0,0.5,1.0};
    CGFloat shadowComponents[12] = {
        0.0,0.0,0.0,0.6, //Black
        0.5,0.5,0.5,0.0, //Gray (transparent
        1.0,1.0,1.0,0.6 // White
    };
    CGGradientRef shadowFill = CGGradientCreateWithColorComponents(colorspace, shadowComponents, shadowPositions, 3);
    
    
    CGFloat highlightPositions[2] = {0.0,1.0};
    CGFloat highlightComponents[8] = {
        1.0,1.0,1.0,0.6, //White sixty
        1.0,1.0,1.0,0.1 // White ten
    };
    CGGradientRef highlightFill = CGGradientCreateWithColorComponents(colorspace, highlightComponents, highlightPositions, 2);
    
    
    // ******************* Fill the Shadow ****************************
    CGPathRef tempPath = createRoundedRectForRect(rect, radius);
    CGContextAddPath(context, tempPath);
    CGContextClip(context);
    CGPoint topCenter = CGPointMake(rect.size.width/2, 0);
    CGPoint bottomCenter = CGPointMake(topCenter.x, rect.size.height);
    CGContextDrawLinearGradient(context, shadowFill, topCenter, bottomCenter, 0);
    
    // ******************* Fill The main Color
    CGRect smallRect = CGRectMake(BORDER, BORDER, rect.size.width-(BORDER*2), rect.size.height-(BORDER*2));
    float smallRadius = MIN(smallRect.size.width, smallRect.size.height)/2;
    
    
    CGPathRef innerPath = createRoundedRectForRect(smallRect, smallRadius);
    CGContextAddPath(context, innerPath);
    
    CGContextSetFillColorWithColor(context, mainColor);
    CGContextFillPath(context);
    
    // ********************* HIGHLIGHT FILL ***********************
    float bottomPoint = 1.2*(smallRect.size.height/2);
    float xExtension = (smallRect.size.width*.2);
    CGPathRef highlightArea = CGPathCreateWithEllipseInRect(
        CGRectMake(-xExtension,-bottomPoint,rect.size.width+2*xExtension, bottomPoint+2)
                                                            , NULL);
    
    topCenter = CGPointMake(smallRect.size.width/2, 0);
    bottomCenter = CGPointMake(topCenter.x, 1.38*(smallRect.size.height/2));
    
    CGContextAddPath(context, innerPath);
    CGContextClip(context);
    CGContextAddPath(context, highlightArea);
    
    CGContextDrawLinearGradient(context, highlightFill, topCenter, bottomCenter, 0);
    // ********************* DRAW THE TEXT ************************
    if ([text length] >= 1) {
        
    
        int fontSize = 24;
        //float border = radius*1.15;
               
                     
        CGSize fontBox = [text sizeWithFont:buttonFont];
        
        CGPoint textPoint = CGPointMake((rect.size.width/2)-(fontBox.width/2), (rect.size.height/2)-(fontBox.height/2));        
                     
        CGContextSetTextDrawingMode(context, kCGTextStroke);
                     
        CGContextSetLineWidth(context, fontSize/10);
        CGContextSetStrokeColorWithColor(context, [[UIColor darkGrayColor] CGColor]);
        [text drawAtPoint:textPoint withFont:buttonFont];
                     
        CGContextSetTextDrawingMode(context, kCGTextFill);
        CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
        [text drawAtPoint:textPoint withFont:buttonFont];
    }
    // ********************* END DRAW TEXT ************************
    
    CGColorSpaceRelease(colorspace);
    CGPathRelease(innerPath);
    CGPathRelease(highlightArea);
    CGGradientRelease(highlightFill);
    CGGradientRelease(shadowFill);
    CGPathRelease(tempPath);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    if (!toggleType)
    {
        //Only act on mouse down with non-toggle types
        self.commandArguments = primaryParameters;
        self.commandString = primaryCommand;
        [delegate executeCommand:self];
        Active = true;
        [self setNeedsDisplay];
    }
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
    if (toggleType)
    {
        self.commandArguments = primaryParameters;
        self.commandString = primaryCommand;
        [delegate executeCommand:self];
        Active = !Active;
    } 
    else
    {   
        // This is NOT a toggle button        
        self.commandArguments = secondaryParameters;
        self.commandString = secondaryCommand;
        [delegate executeCommand:self];
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


-(UIColor*)colorWithHexString:(NSString*)hex  
{  
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];  
    
    // String should be 6 or 8 characters  
    if ([cString length] < 6) return [UIColor grayColor];  
    
    // strip 0X if it appears  
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];  
    
    if ([cString length] != 6) return  [UIColor grayColor];  
    
    // Separate into r, g, b substrings  
    NSRange range;  
    range.location = 0;  
    range.length = 2;  
    NSString *rString = [cString substringWithRange:range];  
    
    range.location = 2;  
    NSString *gString = [cString substringWithRange:range];  
    
    range.location = 4;  
    NSString *bString = [cString substringWithRange:range];  
    
    // Scan values  
    unsigned int r, g, b;  
    [[NSScanner scannerWithString:rString] scanHexInt:&r];  
    [[NSScanner scannerWithString:gString] scanHexInt:&g];  
    [[NSScanner scannerWithString:bString] scanHexInt:&b];  
    
    return [UIColor colorWithRed:((float) r / 255.0f)  
                           green:((float) g / 255.0f)  
                            blue:((float) b / 255.0f)  
                           alpha:1.0f];  
} 
@end

//
//  Conversions.m
//  Baton - Western Michigan University KLORK
//
//  Created by Andy Stratton on 11/25/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "Conversions.h"

@implementation Conversions

// Creates a UI Color from a hex string of six characters
//
// Taken From:
// http://stackoverflow.com/questions/6207329/how-to-set-hex-color-code-for-background
//
+(UIColor*)colorWithHexString:(NSString*)hex  
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

+(NSCharacterSet*)getCharacterTrimSet
{
    NSMutableCharacterSet *workingSet = [[NSCharacterSet newlineCharacterSet] mutableCopy];
    [workingSet addCharactersInString:@"#;:,."];
    NSCharacterSet *finalCharacterSet = [workingSet copy];
    return finalCharacterSet;
}

@end

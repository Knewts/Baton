//
//  Baton_UIButton.h
//  DataCenterSpike
//
//  Created by Andy Stratton on 10/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//
//  XML Parameters <optional>:
//      X
//      Y
//      WIDTH
//      HEIGHT
//      TOGGLE
//      COMMAND
//      PARAMETERS
//      TEXT
//      <TOGGLE_OFF_COMMAND>
//      <TOGGLE_OFF_PARAMETERS>
//      <BGCOLOR> (in hex, but no 0x or # (rrggbb) ff9900  reddish yellow)
//      <BGCOLOR_ACTIVE>
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import <UIKit/UIKit.h>
#import "Baton_UI_Element.h"

@interface Baton_UIButton : Baton_UI_Element
{
    Boolean Active; // True when pressed
    Boolean toggleType; // True turns a button on, False Turns a button off.
    
    NSString *primaryCommand; // Command for basic button and toggle turns on.
    NSString *primaryParameters; // Parameters for the primary command
    
    NSString *secondaryCommand; // Command for toggle turning off.
    NSString *secondaryParameters; // Parameters for the secondary command  
    
    //CGColorRef bgColorOn, bgColorOff, bgColorActive;
    UIControlState state;
    NSString *text;
    
}

-(id)initWithFrame:(CGRect)frame;
-(id)initWithDictionary:(NSDictionary *)params;
-(void)drawRect:(CGRect)rect;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;


-(void) swapState;
CGMutablePathRef createRoundedRectForRect(CGRect rect, CGFloat radius);

@property CGFloat * bgColorOn;
@property CGFloat * bgColorOff;
@property CGFloat * bgColorActive;
@end

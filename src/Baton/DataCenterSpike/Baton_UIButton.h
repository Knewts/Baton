//
//  Baton_UIButton.h
//  Baton - Western Michigan University KLORK
//
//  Created by Andy Stratton on 10/3/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//
//

/*
 *      DICTIONARY REQUIRED PARAMETERS:
 *  X       - X position on the screen (integer)
 *  Y       - Y position on the screen (integer)
 *  WIDTH   - width of the on-screen display
 *  HEIGHT  - height of the on-screen display
 *  COMMAND - The command to execute upon activation.
 *  PARAMETERS - The parameters for the command above.
 *
 *
 *      OPTIONAL PARAMETERS
 *  COLOR   - The color to draw the threshold. Overrides active direction color.
 *      ** No threshold will be colored:
 *          Yellow activates in a positive to negative direction.
 *          Red activates in a negative to positive direction.
 *          Orange activates in both directions.
 *  TOGGLE  - 0/1 : 1 Acvitates in positive to negative direction.
 *  BGCOLOR_ON  - Hex String representing a color when the button is active/pressed.
 *  BGCOLOR_OFF - Hex String representing a color when the button is NOT active/pressed.
 *  TEXT        - Text string that will be auto sized to fit the button.
 */

#import <UIKit/UIKit.h>
#import "Baton_UI_Element.h"

@interface Baton_UIButton : UIView <Baton_UI_Element>
{
    int BORDER;
    Boolean Active; // True when pressed
    Boolean toggleType; // True turns a button on, False Turns a button off.
    
    NSString *primaryCommand; // Command for basic button and toggle turns on.
    NSString *primaryParameters; // Parameters for the primary command
    
    NSString *secondaryCommand; // Command for toggle turning off.
    NSString *secondaryParameters; // Parameters for the secondary command  
    
    
    UIColor * bgColorOn;
    UIColor * bgColorOff;
    
    //CGColorRef bgColorOn, bgColorOff, bgColorActive;
    UIControlState state;
    NSString *text;
    
    UIFont *buttonFont;
    float radius;
}

-(id)initWithFrame:(CGRect)frame;
-(id)initWithDictionary:(NSDictionary *)params;
-(void)drawRect:(CGRect)rect;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;


-(void) swapState;
CGMutablePathRef createRoundedRectForRect(CGRect rect, CGFloat radius);

@end

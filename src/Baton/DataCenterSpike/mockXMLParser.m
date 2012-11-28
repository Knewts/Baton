//
//  mockXMLParser.m
//  Baton
//
//  Created by Matthew Knewtson on 11/28/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "mockXMLParser.h"

@implementation mockXMLParser

- (id) initWithScreenFrame:(CGRect)frame
{
    screenFrame = frame;
    buic = [[BatonUICreator alloc] init];
    return self;
}

/*
 *   This function will create a BatonEventHandler object. Then we will pass NSArrays through
 * the BatonUICreator object which should return Baton_UI_Element object pointers. These will then 
 * be passed on to the [BEH addUIElement] function. This function will apply itself as the delegate 
 * for handing command execution.
 *
 *   For this spike, each command returned by an object will be a DEBUGPRINT along with a statement to
 * be printed. This action should be handled by the [BEH executeCommand:withArguments] function.
 * 
 *  This had better work...
 */

- (UIView *) getView
{
    BatonEventHandler *BEH = [BatonEventHandler new];
    BatonUICreator *BUIC = [BatonUICreator new];
    /*
     *      DICTIONARY REQUIRED PARAMETERS:
     *  X       - X position on the screen (integer)
     *  Y       - Y position on the screen (integer)
     *  WIDTH   - width of the on-screen display
     *  HEIGHT  - height of the on-screen display
     *  ACCEL   - 1 or 0. 1 is ON, 0 is OFF.
     */
    
    NSMutableDictionary *testPlane = [NSMutableDictionary new];
    [testPlane setObject:@"10" forKey:@"X"];
    [testPlane setObject:@"150" forKey:@"Y"];
    [testPlane setObject:@"20" forKey:@"XSCALE"];
    [testPlane setObject:@"15" forKey:@"YSCALE"];
    [testPlane setObject:@"300" forKey:@"WIDTH"];
    [testPlane setObject:@"100" forKey:@"HEIGHT"];
    [testPlane setObject:@"0" forKey:@"ACCEL"];
    [testPlane setObject:@"LOG" forKey:@"COMMAND"];
    [testPlane setObject:@"Plane works" forKey:@"PARAMETERS"];
    
    NSMutableDictionary *testPlane2 = [NSMutableDictionary new];
    [testPlane2 setObject:@"10" forKey:@"X"];
    [testPlane2 setObject:@"300" forKey:@"Y"];
    [testPlane2 setObject:@"20" forKey:@"XSCALE"];
    [testPlane2 setObject:@"15" forKey:@"YSCALE"];
    [testPlane2 setObject:@"300" forKey:@"WIDTH"];
    [testPlane2 setObject:@"100" forKey:@"HEIGHT"];
    [testPlane2 setObject:@"1" forKey:@"ACCEL"];
    [testPlane2 setObject:@"LOG" forKey:@"COMMAND"];
    [testPlane2 setObject:@"Plane works" forKey:@"PARAMETERS"];
    
    NSMutableDictionary *testThreshold = [NSMutableDictionary new];
    [testThreshold setObject:@"1" forKey:@"HAXIS"];
    [testThreshold setObject:@"8" forKey:@"VALUE"];
    [testThreshold setObject:@"LOG" forKey:@"COMMAND"];
    [testThreshold setObject:@"Y Thresh Works" forKey:@"PARAMETERS"];
    [testThreshold setObject:@"THRESHOLD" forKey:@"TYPE"];
    
    
    NSMutableDictionary *testThreshold2 = [NSMutableDictionary new];
    [testThreshold2 setObject:@"THRESHOLD" forKey:@"TYPE"];
    [testThreshold2 setObject:@"0000FF" forKey:@"COLOR"];
    [testThreshold2 setObject:@"0" forKey:@"HAXIS"];
    [testThreshold2 setObject:@"10" forKey:@"VALUE"];
    [testThreshold2 setObject:@"LOG" forKey:@"COMMAND"];
    [testThreshold2 setObject:@"0" forKey:@"NEG_TO_POS"];
    [testThreshold2 setObject:@"X Thresh Works" forKey:@"PARAMETERS"];
    
    NSMutableDictionary *testThreshold3 = [NSMutableDictionary new];
    [testThreshold3 setObject:@"THRESHOLD" forKey:@"TYPE"];
    [testThreshold3 setObject:@"0" forKey:@"HAXIS"];
    [testThreshold3 setObject:@"-10" forKey:@"VALUE"];
    [testThreshold3 setObject:@"LOG" forKey:@"COMMAND"];
    [testThreshold3 setObject:@"0" forKey:@"POS_TO_NEG"];
    [testThreshold3 setObject:@"X Thresh Works" forKey:@"PARAMETERS"];
    
    NSMutableDictionary *testButton = [NSMutableDictionary new];
    [testButton setObject:@"10" forKey:@"X"];
    [testButton setObject:@"10" forKey:@"Y"];
    [testButton setObject:@"200" forKey:@"WIDTH"];
    [testButton setObject:@"100" forKey:@"HEIGHT"];
    [testButton setObject:@"0" forKey:@"TOGGLE"];
    [testButton setObject:@"LOG" forKey:@"COMMAND"];
    [testButton setObject:@"Button Down works" forKey:@"PARAMETERS"];
    [testButton setObject:@"Button" forKey:@"TEXT"];
    //[button setObject:@"FF0000" forKey:@"BGCOLOR_ON"];  
    //[button setObject:@"FFFF00" forKey:@"BGCOLOR_OFF"];
    
    NSMutableDictionary *testButton2 = [NSMutableDictionary new];
    [testButton2 setObject:@"215" forKey:@"X"];
    [testButton2 setObject:@"10" forKey:@"Y"];
    [testButton2 setObject:@"100" forKey:@"WIDTH"];
    [testButton2 setObject:@"30" forKey:@"HEIGHT"];
    [testButton2 setObject:@"1" forKey:@"TOGGLE"];
    [testButton2 setObject:@"LOG" forKey:@"COMMAND"];
    [testButton2 setObject:@"Button Down works" forKey:@"PARAMETERS"];
    [testButton2 setObject:@"BLUE" forKey:@"TEXT"];
    [testButton2 setObject:@"6495ED" forKey:@"BGCOLOR_ON"];  
    [testButton2 setObject:@"3670AA" forKey:@"BGCOLOR_OFF"];
    
    NSMutableDictionary *testButton3 = [NSMutableDictionary new];
    [testButton3 setObject:@"250" forKey:@"X"];
    [testButton3 setObject:@"50" forKey:@"Y"];
    [testButton3 setObject:@"30" forKey:@"WIDTH"];
    [testButton3 setObject:@"100" forKey:@"HEIGHT"];
    [testButton3 setObject:@"0" forKey:@"TOGGLE"];
    [testButton3 setObject:@"LOG" forKey:@"COMMAND"];
    [testButton3 setObject:@"Button Down works" forKey:@"PARAMETERS"];
    [testButton3 setObject:@"" forKey:@"TEXT"];
    [testButton3 setObject:@"FF0000" forKey:@"BGCOLOR_ON"];  
    [testButton3 setObject:@"FFFF00" forKey:@"BGCOLOR_OFF"];
    
    [BEH addUIElement:[BUIC CreateObjectFrom:[NSArray arrayWithObjects:@"BUTTON", testButton, nil]]];
    [BEH addUIElement:[BUIC CreateObjectFrom:[NSArray arrayWithObjects:@"BUTTON", testButton2, nil]]];
    [BEH addUIElement:[BUIC CreateObjectFrom:[NSArray arrayWithObjects:@"BUTTON", testButton3, nil]]];
    [BEH addUIElement:[BUIC CreateObjectFrom:[NSArray arrayWithObjects:@"PLANE", testPlane, testThreshold, testThreshold2, testThreshold3, nil]]];
    [BEH addUIElement:[BUIC CreateObjectFrom:[NSArray arrayWithObjects:@"PLANE", testPlane2, testThreshold, testThreshold2, testThreshold3, nil]]];    
    
    return BEH;
    
}//end getView
@end

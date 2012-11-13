//
//  XMLParser.m
//  DataCenterSpike
//
//  Created by Andy Stratton on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XMLParser.h"
#import "BatonEventHandler.h"
#import "BatonUICreator.h"

@implementation XMLParser

// Gets the XML Mock Object ready.
// The frame passed in should be the full size of the screen.
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
    // Create the BatonEventHandler. It will be returned to the base view to take over the screen.
    BatonEventHandler *beh = [[BatonEventHandler alloc] initWithFrame:screenFrame];
    
    // This is where we add the actual UIElements to the beh object.
        //Create an array of Keys and and array of parameters.
    
    NSMutableDictionary *planeParams = [[NSMutableDictionary alloc] init ];
    [planeParams setObject:@"10" forKey:@"X"];
    [planeParams setObject:@"10" forKey:@"Y"];
    [planeParams setObject:@"100" forKey:@"WIDTH"];
    [planeParams setObject:@"200" forKey:@"HEIGHT"];
    [planeParams setObject:@"0" forKey:@"ACCEL"];
    
    NSMutableDictionary *buttonParams = [[NSMutableDictionary alloc] init ];
    [buttonParams setObject:@"10" forKey:@"X"];
    [buttonParams setObject:@"250" forKey:@"Y"];
    [buttonParams setObject:@"130" forKey:@"WIDTH"];
    [buttonParams setObject:@"100" forKey:@"HEIGHT"];
    [buttonParams setObject:@"0" forKey:@"TOGGLE"];
    [buttonParams setObject:@"My Button" forKey:@"TEXT"];
    [buttonParams setObject:@"0035F7" forKey:@"BGCOLOR"];
    
    //    [planeParams setObject:@"0" forKey:@"XRANGE_MIN"];
    //    [planeParams setObject:@"30" forKey:@"XRANGE_MAX"];
    NSArray *planeArray = [NSArray arrayWithObjects:@"PLANE",planeParams, nil];
    NSArray *buttonArray = [NSArray arrayWithObjects:@"BUTTON",buttonParams, nil];
    
    
    NSArray *finalArray = [NSArray arrayWithObjects:planeArray,buttonArray, nil];
    //TODO:
    for (NSArray *array in finalArray)
    {
        Baton_UI_Element *temp = [buic CreateObjectFrom:array];
        [beh addUIElement:temp];
    }
    
    // Return the full beh object with subviews in place.
    return beh;
}
@end

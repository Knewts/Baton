//
//  BatonUICreator.m
//  DataCenterSpike
//
//  Created by Andy Stratton on 9/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//   The XML parser will send data to this class to get BatonUI items in return.
//   The data from the XML will be stored in an NSArray of NSObjects containing a string 
// representing the type of object to create in index [0]. The remaining indexes will
// contain NSArrays of NSDictionary objects. These Dictionaries will contain the key-value
// pairs required to construct an object. In some cases (Radio Buttons, Planes) a BatonUI
// item may have subojects with their own parameters: The following is an example of how 
// the NSObject[] should be structured to create a plane:

// NSObject[0]: "PLANE"
// NSObject[1]: NSDictionary:
//      "TYPE":"PLANE"
//      "INPUT":"ACCEL"
//      "POS_X":"10"
//      "POS_Y":"10"
//      "WIDTH":"45"
//      "HEIGHT":"45"
//      "DRAWREGIONS":"TRUE"
// NSObject[2]: NSDictionary:
//      "TYPE":"REGION"
//      "SHAPE":"SQUARE"
//      "XMIN":"-30"
//      "XMAX":"30"
//      "YMIN":"0"
//      "YMAX":"45"
// NSObject[3]: NSDictionary:
//      "TYPE":"REGION"
//      "SHAPE":"CIRCLE"
//      "POS_X":"-30"
//      "POS_Y":"30"
//      "RADIUS":"10"

//  Because the regions are subobjects of the plane, they must be created and placed within the 
// plane object before is becomes a subview of the BatonEventHandler. In this instance, the 
// createObjectFrom:NSArray function would pass the array to CreatePlane:NSObject. This function will
// pass the first Dictionary Object to the Baton_UIPlane class and hold the returned object. It will
// then pass the remaining dictionary objects to the Baton_UIPlane_Region class and add the returned 
// objects to the previously created plane.

//TODO:
// Could this be an abstract class that we execute functions from without creating an initial object?

#import "BatonUICreator.h"
#import "Baton_UI_Element.h"
#import "Baton_UIPlane.h"
#import "Baton_UIButton.h"
#import "Baton_Region_Threshold.h"

@implementation BatonUICreator

// Simply create the object.
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
    }
    
    return self;	
}

// This is our primary mode of creating objects
- (Baton_UI_Element *)CreateObjectFrom:(NSArray *) array
{
    // READ array[0] and send the remainder of the array's to the init.
    NSString *type = [array objectAtIndex:0];
    Baton_UI_Element *retVal = nil;
    
    if ([type isEqualToString:@"PLANE"]) {
        //TODO: Create Plane and return it.
        Baton_UIPlane * plane = [[Baton_UIPlane alloc] initWithDictionary:(NSDictionary*)[array objectAtIndex:1]];
        
        int elementCount = [array count];
        for (int i=2; i<elementCount; i++) {
            
            NSDictionary * region = (NSDictionary*)[array objectAtIndex:i];
            
            // Determine the type. Create it then add it.
            [plane  AddRegion:[[Baton_Region_Threshold alloc] initFromDictionary:region]];
        }
        // for remaining array elements
        //      add region to plane defined by array[i]
        
        retVal = plane;
        
    } else if ([type isEqualToString:@"BUTTON"]) 
    {
        Baton_UIButton * button = [[Baton_UIButton alloc] initWithDictionary:(NSDictionary*)[array objectAtIndex:1]];
        retVal = button;
    }
    
    return retVal;
}
	
@end




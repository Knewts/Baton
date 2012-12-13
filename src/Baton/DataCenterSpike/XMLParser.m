//
//  XMLParser.m
//  DataCenterSpike
//
//  Created by Tim Weidner on 7/15/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser


@synthesize layouts;

//INITIALIZATION OF THE PARSER
- (id) initXMLParser {
	
    self = [super init];
    
    //used to call function in LayoutList.m to save the parsed layout to the device
    layouts = [[AppDelegate sharedAppdelegate] layouts];
    
    //a private array to store the layout as the file is being parsed
    //at the end of the file, this will be sent to LayoutList.m
    layout = [[NSMutableArray alloc] init];
    
    //placeholder strings to keep track of the current uielement, subelement, and subelementvalue being parsed
    //they should be cleared after their respective end tag is reached
    currentUIElementBeingParsed = [[NSString alloc] init];
    currentSubElementBeingParsed = [[NSString alloc] init];
    currentSubElementValue = [[NSMutableString alloc] init];
    
    //boolean used to determine if the parser should be expecting a threshold
    //planes are not required to have thresholds after them, so this enables
    //the parser to check if one might be next.
    waitingForThreshold = NO;
    
	return self;
}//end init

//this method is entered when the opening tag of an xml element is reached
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    
    
    if ([self isStartUIElement:elementName] == YES) {
        //isStartUIElement checks if the current open xml tag's string (elementName) matches that of a known UIelement
        
        //store elementName in temp variable for the current UIelement being parsed
        currentUIElementBeingParsed = [[NSString alloc] initWithString:elementName];
    }
    else if ([self isStartSubElement:elementName] == YES) { //IF elementName is a Sub-element
        //isStartSubElement checks if the current open xml tag's string (elementName) matches that of a known SubElement of a UIelement
        
        //store elementName in temp variable for the current SubElement being parsed
        currentSubElementBeingParsed = [[NSString alloc] initWithString:elementName];
    }
    else if ([elementName isEqualToString:@"LAYOUT"]) {
        
        //this case should only happen once, at the very beginning of the file
        
    }
    else {
        //this case should never be entered
        //cancel the whole process and send an error if this code block is reached
        NSLog(@"How did i get here?");
    }
    
}//end didStartElement


//this method is entered when characters are found in between open and close tags for a given xml element
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (!currentElementValue) {
        // init the ad hoc string with the value     
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    }
    else {
        // append value to the ad hoc string    
		[currentElementValue appendString:string];
    }
    
    //trim whitespace found in the characters
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [string stringByTrimmingCharactersInSet:whitespace];
    if ([trimmed length] != 0) {
        
        //if there was in fact data between the tags, we store it in currentSubElementValue
        currentSubElementValue = [[NSMutableString alloc] initWithString:string];
        
    }//end if trimmed length not 0
    
}//end foundCharacters


//this method is entered when the closing tag of an xml element is reached
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName {
    
    if ([self isEndUIElement:elementName] == YES) {
        //isEndUIElement checks if elementName matches a known UIelement name
        //if yes, it returns yes, adds the element to layout
        //then sets the temporary dictionary back to nil
    }
    
    else if ([self isEndSubElement:elementName] == YES) {
        //isEndSubElement checks if elementName matches a known SubElement name
        //if yes, it returns yes and adds the subelement value to temp dictionary for the currentuielement being parsed
        
        //set placeholder strings back to nil
        currentSubElementValue = nil;
        currentSubElementBeingParsed = nil;
        
    }//end if end of sub element
    
    //this should only be entered at the very end of the xml file
    //this block contains the code that send the layout object to LayoutList.m to be stored on the device
    else if ([elementName isEqualToString:@"LAYOUT"]) {
        
        //check if we are potentially waiting for a threshold
        //if true a plane needs to be added to array 
        //and we will not encounter another threshold to add as this should be the end of the layout
        if (waitingForThreshold) 
            [self addPlaneToLayout];
        
        //adds the layout that was just parsed to the LayoutList
        //calls LayoutList.m's addLayoutsObject
        [layouts addLayoutsObject:[[Layout alloc]initWithTitle:@"title" layoutTree:layout]];
        
        return;
    }
    
    else {
        //this code block should not be reached
        //if it is, we have encountered an elementName that is not able to be handled
        //abort parsing and send error
    }
    
    //set this temp value back to nil
    currentElementValue = nil;
    
}//end didEndElement


//************************END BUILT IN METHODS***********************************************


//this method will check if the incoming elementName being parsed
//is a valid opening tag for a known UIelement
- (BOOL)isStartUIElement:(NSString *)elementName {
    
    //value to return initialized to NO
    BOOL ret = NO;
    
    
    //CHECKING IF INCOMING ELEMENT IS A BUTTON
    if ([elementName isEqualToString:@"BUTTON"]) {
        
        //first, check to see if we're potentially waiting for a threshold
        //if yes, a plane needs to be added to the array
        //and will not encounter another threshold to add as the current element being parsed is a button
        if (waitingForThreshold) { 
            [self addPlaneToLayout];
        }//end waiting for threshold
        
        //found a button. return yes and initialize button so it is able to accept the incoming sub elements
        ret = YES;
        button = [[NSMutableDictionary alloc] init];
        
    } //end if element==button
    
    //CHECKING IF INCOMING ELEMENT IS A PLANE
    else if ([elementName isEqualToString:@"PLANE"]) {
        
        //first, check to see if we're potentially waiting for a threshold
        //if yes, a plane needs to be added to the array
        //and will not encounter another threshold to add as the current element being parsed is another plane
        if (waitingForThreshold) { 
            [self addPlaneToLayout];
        }//end waiting for threshold
        
        //return yes, and initialize an array to hold the plan and potential subsequent thresholds. set waitingforthresholds to YES
        ret = YES;
        waitingForThreshold = YES;
        planesAndThresholds = [[NSMutableArray alloc] initWithObjects:@"PLANE", nil];
        
        //initialize the dictionary to hold the subelement values for the plane
        //and 
        plane = [[NSMutableDictionary alloc] init];
        
        
    }//end if element==plane
    
    //***********************************************************************
    
    //here check if elementName is a threshold AND waitingForThreshold is false
    //that means we are trying to start add a threshold without a plane first
    //in that case, abort parsing and send an error
    
    //***********************************************************************
    
    //CHECKING IF INCOMING ELEMENT IS A THRESHOLD
    else if ([elementName isEqualToString:@"THRESHOLD"]) {
        
        //return yes, and initialize the dictionary to hold the subelement values for the threshold
        ret = YES;
        threshold = [[NSMutableDictionary alloc] init];
        
    }//end if element==threshold
    
    else {
        //entering this code block is okay
        //the next step will be to check if elementName is the start of a known subelement
    }
    
    return ret;
}//end isStartUIElement


//this method will check if the incoming elementName being parsed
//is a valid closing tag for a known UIelement
- (BOOL)isEndUIElement:(NSString *)elementName {
    
    //initialize return value to NO
    BOOL ret = NO;
    
    //CHECKING IF INCOMING ELEMENT IS A BUTTON
    if ([elementName isEqualToString:@"BUTTON"]) {
        
        //return yes, and add the dictionary to the layout array, then set the dict back to nil
        ret = YES;
        [layout addObject:[NSArray arrayWithObjects:@"BUTTON", button, nil]];
        button = nil;
        
    } //end if element==button
    
    //CHECKING IF INCOMING ELEMENT IS A PLANE
    else if ([elementName isEqualToString:@"PLANE"]) {
        
        //return yes, add the plane dictionary to the temp array for planes and thresholds then set the temp plan dict back to nil
        ret = YES;
        [planesAndThresholds addObject:plane];
        plane = nil;
        
    }//end if element==plane
    
    else if ([elementName isEqualToString:@"THRESHOLD"]) {
        
        //return yes, add the threshold dictionary to the temp array for planes and thresholds then set the temp plan dict back to nil
        ret = YES;
        [planesAndThresholds addObject:threshold];
        threshold = nil;
        
    }//end if element==threshold
    
    else {
        //entering this code block is okay
        //the next step is to check if elementName is the end of a known subelement
    }
    
    return ret;
}//end is End of a UIElement


//this method will check if the incoming elementName being parsed
//is a valid opening tag for a known SubElement
- (BOOL)isStartSubElement:(NSString *)elementName {
    
    //initialize return value to NO
    BOOL ret = NO;
    
    //CHECK IF CURRENT UI ELEMENT BEING PARSED IS A BUTTON
    if ([currentUIElementBeingParsed isEqualToString:@"BUTTON"]) {
        
        //if yes, check if elementName is a known parameter of a BUTTON
        if ([elementName isEqualToString:@"X"] || 
            [elementName isEqualToString:@"Y"] || 
            [elementName isEqualToString:@"WIDTH"] || 
            [elementName isEqualToString:@"HEIGHT"] || 
            [elementName isEqualToString:@"TOGGLE"] || 
            [elementName isEqualToString:@"COMMAND"] || 
            [elementName isEqualToString:@"PARAMETERS"] || 
            [elementName isEqualToString:@"TOGGLE_OFF_COMMAND"] || 
            [elementName isEqualToString:@"TOGGLE_OFF_PARAMETERS"] || 
            [elementName isEqualToString:@"TEXT"] || 
            [elementName isEqualToString:@"BGCOLOR_ON"] || 
            [elementName isEqualToString:@"BGCOLOR_OFF"]) {  
            
            ret = YES;
            
        }//end if subelement being parsed is a valid button sub-element
        
        else{
            //sub elementName is not a valid parameter of this UIelement
            
            //abort parsing and send an error
        }
        
    } //end if currentuielement is a button
    
    //CHECK IF CURRENT UI ELEMENT BEING PARSED IS A PLANE
    else if ([currentUIElementBeingParsed isEqualToString:@"PLANE"]) { 
        
        //if yes, check if elementName is a known parameter of a PLANE
        if ([elementName isEqualToString:@"X"] || 
            [elementName isEqualToString:@"Y"] || 
            [elementName isEqualToString:@"XSCALE"] || 
            [elementName isEqualToString:@"YSCALE"] || 
            [elementName isEqualToString:@"XMAX"] || 
            [elementName isEqualToString:@"YMAX"] || 
            [elementName isEqualToString:@"WIDTH"] || 
            [elementName isEqualToString:@"HEIGHT"] || 
            [elementName isEqualToString:@"ACCEL"] || 
            [elementName isEqualToString:@"COMMAND"] || 
            [elementName isEqualToString:@"PARAMETERS"]) { 
            
            ret = YES;
            
        }//end if sub-element being parsed is a valid plane sub-element
        else{
            //sub element found is not a valid parameter of this UIelement
            
            //abort parsing and send an error
        }
        
    } //end if uielement is a plane
    
    //CHECK IF CURRENT UI ELEMENT BEING PARSED IS A THRESHOLD
    else if ([currentUIElementBeingParsed isEqualToString:@"THRESHOLD"]) { 
        
        //if yes, check if elementName is a known parameter of a THRESHOLD
        if ([elementName isEqualToString:@"TYPE"] ||
            [elementName isEqualToString:@"HAXIS"] || 
            [elementName isEqualToString:@"VALUE"] || 
            [elementName isEqualToString:@"COMMAND"] || 
            [elementName isEqualToString:@"PARAMETERS"] || 
            [elementName isEqualToString:@"COLOR"] || 
            [elementName isEqualToString:@"NEG_TO_POS"] || 
            [elementName isEqualToString:@"POS_TO_NEG"]) { 
            
            ret = YES;
            
        }//end if sub element being parsed is a valid threshold sub-element
        else{
            //sub element found is not a valid parameter of this UIelement

            //abort parsing and send an error

        }
        
    } //end if uielement is a threshold
    else if ([elementName isEqualToString:@"LAYOUT"]) {
        //this is okay
    }
    
    else {
        NSLog(@"UNHANDLED: %@", elementName);
        
        //current ui element being parsed is not equal to any known UIelements
        
        //abort parsing and send error
        
    }//end if 
    
    return ret;
}//end is Start of a SubElement


//this method will check if the incoming elementName being parsed
//is a valid closing tag for a known SubElement
- (BOOL)isEndSubElement:(NSString *)elementName {
    
    //initialize return value to NO
    BOOL ret = NO;
    
    //check if the current uielement being parsed is a BUTTON
    //also check if elementName matches what the currentSubElementBeingParsed is
    if ([currentUIElementBeingParsed isEqualToString:@"BUTTON"] && [elementName isEqualToString:currentSubElementBeingParsed]) {
        
        //the values for the current sub elements can be validated from within this block 
        //since we know now where they will be stored
        //also, make sure all necessary parameters are there
        
        //then
        
        //return yes, and add the subelement value to the temp BUTTON dictionary
        ret = YES;
        [button setObject:currentSubElementValue forKey:elementName];
        
    } //end if current ui element is a button
    
    
    //check if the current uielement being parsed is a PLANE
    //also check if elementName matches what the currentSubElementBeingParsed is
    else if ([currentUIElementBeingParsed isEqualToString:@"PLANE"] && [elementName isEqualToString:currentSubElementBeingParsed]) { 
        
        //the values for the current sub elements can be validated from within this block 
        //since we know now where they will be stored
        //also, make sure all necessary parameters are there
        
        
        //then
        
        //return yes, and add the subelement value to the temp PLANE dictionary
        ret = YES;
        [plane setObject:currentSubElementValue forKey:elementName];
        
    } //end if current ui element is a plane
    
    
    //check if the current uielement being parsed is a PLANE
    //also check if elementName matches what the currentSubElementBeingParsed is
    else if ([currentUIElementBeingParsed isEqualToString:@"THRESHOLD"] && [elementName isEqualToString:currentSubElementBeingParsed]) {
        
        //the values for the current sub elements can be validated from within this block 
        //since we know now where they will be stored
        //also, make sure all necessary parameters are there
        
        //then
        
        //return yes, and add the subelement value to the temp THRESHOLD dictionary
        ret = YES;
        [threshold setObject:currentSubElementValue forKey:elementName];
        
    } //end if current ui element is a threshold
    
    else {
        NSLog(@"UNHANDLED: %@", elementName);
        
        //current ui element being parsed is not equal to any known UIelements
        //or elementName differes from what currentSubElementBeingParsed is
        
        //abort parsing and send error
        
    }//end if 
    
    return ret;
    
}//end is End of a SubElement

//this pethod adds the objects in the temporary array for planes and thresholds
//to the layout. also resets waitingForThreshold and the temp array back to nil.
-(void)addPlaneToLayout {
    
    //self explanatory?
    waitingForThreshold = NO;
    [layout addObject:[NSArray arrayWithArray:planesAndThresholds]];
    planesAndThresholds = nil;
    
}//end add plane to layout

//********************************************************************************

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSLog(@"Parser error occured %@",parseError);
}//end parseErrorOccurred

// end of XMLParser.m file
@end
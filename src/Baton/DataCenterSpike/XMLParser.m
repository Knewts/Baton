//
//  XMLParser.m
//  DataCenterSpike
//
//  Created by Andy Stratton on 7/15/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "XMLParser.h"
#import "BatonEventHandler.h"
#import "BatonUICreator.h"

@interface XMLParser ()

@end

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

- (id) initXMLParser {
	
    self = [super init];
    if (self != nil) {
        addLayoutViewController = (AddLayoutViewController *)[[UIApplication sharedApplication] delegate];
    }
    
    layout = [[NSMutableArray alloc] init];
    
    currentUIElementBeingParsed = [[NSString alloc] init];
    currentSubElementBeingParsed = [[NSString alloc] init];
    currentSubElementValue = [[NSString alloc] init];
    
    waitingForThreshold = NO;
    
	return self;
}//end init

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    
    if ([self isStartUIElement:elementName] == YES) { //if elementName is a UIElement
        
        currentUIElementBeingParsed = [[NSString alloc] initWithString:elementName];
    }
    else if ([self isStartSubElement:elementName] == YES) { //IF elementName is a Sub-element
        
        currentSubElementBeingParsed = [[NSString alloc] initWithString:elementName];
    }
    else if ([elementName isEqualToString:@"LAYOUT"]) {
        
    }
    else {
        
        NSLog(@"How did i get here?");
    }
    
}//end didStartElement


//begin foundCharacters
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (!currentElementValue) {
        // init the ad hoc string with the value     
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    }
    else {
        // append value to the ad hoc string    
		[currentElementValue appendString:string];
    }
    
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [string stringByTrimmingCharactersInSet:whitespace];
    if ([trimmed length] != 0) {
        
        currentSubElementValue = [[NSString alloc] initWithString:string];
        
    }//end if trimmed length not 0
    
}//end foundCharacters


//begin didEndElement
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName {
    ///
    if ([elementName isEqualToString:@"LAYOUT"]) {
        
        if (waitingForThreshold) { //a plane needs to be added to array and will not encounter another threshold to add
            [self addPlaneToLayout];
        }//end waiting for threshold
        
        //array ready to be sent  
        BatonEventHandler *BEH = [BatonEventHandler new];
        BatonUICreator *BUIC = [BatonUICreator new];
        
        [BEH addUIElement:[BUIC CreateObjectFrom:[NSArray arrayWithArray:layout]]];
        
        //NSLog(@"EndElement - reached layout, end of document");
        // We reached the end of the XML document
        return;
    }
    
	if ([self isEndUIElement:elementName] == YES) {
        
        //correct UIElement dict added to array and released
        //NSLog(@"End UI Element: %@", currentUIElementBeingParsed);
    }
    
    else if ([self isEndSubElement:elementName] == YES) {
        //add current subelement && value to uie dict
        
        //release sub element & value
        currentSubElementValue = nil;
        //[currentSubElementValue release];
        currentSubElementBeingParsed = nil;
        //[currentSubElementBeingParsed release];
        
    }//end if end of sub element
    
    else {
        // The parser hit one of the element values. 
        NSLog(@"EndElement - found element value");
        // This syntax is possible because User object 
        // property names match the XML user element names  
        //[songToParse setValue:currentElementValue forKey:elementName];
    }
    //[currentElementValue release];
    currentElementValue = nil;
    NSLog(@"");
    
}//end didEndElement


//************************END BUILT IN METHODS***********************************************


//begin isStartUIElement
- (BOOL)isStartUIElement:(NSString *)elementName {
    
    BOOL ret = NO;
    
    //CHECKING IF INCOMING ELEMENT IS A UI ELEMENT
    if ([elementName isEqualToString:@"BUTTON"]) {
        
        if (waitingForThreshold) { //a plane needs to be added to array and will not encounter another threshold to add
            [self addPlaneToLayout];
        }//end waiting for threshold
        
        ret = YES;
        button = [[NSMutableDictionary alloc] init];
        
        
    } //end if element==button
    
    else if ([elementName isEqualToString:@"PLANE"]) {
        
        if (waitingForThreshold) { //a plane needs to be added to array and will not encounter another threshold to add
            [self addPlaneToLayout];
        }//end waiting for threshold
        
        ret = YES;
        planesAndThresholds = [[NSMutableArray alloc] initWithObjects:@"PLANE", nil];
        
        plane = [[NSMutableDictionary alloc] init];
        waitingForThreshold = YES;
        
    }//end if element==plane
    
    else if ([elementName isEqualToString:@"THRESHOLD"]) {
        
        ret = YES;
        threshold = [[NSMutableDictionary alloc] init];
        
    }//end if element==threshold
    
    return ret;
}//end isStartUIElement


//begin isEndUIElement
- (BOOL)isEndUIElement:(NSString *)elementName {
    
    BOOL ret = NO;
    
    //CHECKING IF INCOMING ELEMENT IS A UI ELEMENT
    if ([elementName isEqualToString:@"BUTTON"]) {
        
        ret = YES;
        [layout addObject:[NSArray arrayWithObjects:@"BUTTON", button, nil]];
        button = nil;
        //[button release];
        
    } //end if element==button
    
    else if ([elementName isEqualToString:@"PLANE"]) {
        
        ret = YES;
        [planesAndThresholds addObject:plane];
        plane = nil;
        //[plane release];
        
    }//end if element==plane
    
    else if ([elementName isEqualToString:@"THRESHOLD"]) {
        
        ret = YES;
        [planesAndThresholds addObject:threshold];
        threshold = nil;
        //[threshold release];
        
    }//end if element==threshold
    
    else {
        //not a UIElement
    }
    
    return ret;
}//end is End of a UIElement


//begin is Start of a SubElement
- (BOOL)isStartSubElement:(NSString *)elementName {
    
    BOOL ret = NO;
    
    if ([currentUIElementBeingParsed isEqualToString:@"BUTTON"]) { //only check for known button subelements
        
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
    } //end if currentuielement is a button
    
    else if ([currentUIElementBeingParsed isEqualToString:@"PLANE"]) { //only check for plane subelements
        
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
    } //end if uielement is a plane
    
    else if ([currentUIElementBeingParsed isEqualToString:@"THRESHOLD"]) { //only check for threshold subelements
        
        if ([elementName isEqualToString:@"HAXIS"] || 
            [elementName isEqualToString:@"VALUE"] || 
            [elementName isEqualToString:@"COMMAND"] || 
            [elementName isEqualToString:@"PARAMETERS"] || 
            [elementName isEqualToString:@"COLOR"] || 
            [elementName isEqualToString:@"NEG_TO_POS"] || 
            [elementName isEqualToString:@"POS_TO_NEG"]) { 
            
            ret = YES;
            
        }//end if sub element being parsed is a valid threshold sub-element
    } //end if uielement is a threshold
    
    else {
        NSLog(@"UNHANDLED: %@", elementName);
    }//end if 
    
    return ret;
}//end is Start of a SubElement


//begin is End of a SubElement
- (BOOL)isEndSubElement:(NSString *)elementName {
    
    BOOL ret = NO;
    
    //NSLog(@"end of sub element cUIEBP: %@ \teN: %@ \tcSEBP: %@ \tcSEV: %@", currentUIElementBeingParsed, elementName, currentSubElementBeingParsed, currentSubElementValue);
    
    if ([currentUIElementBeingParsed isEqualToString:@"BUTTON"] && [elementName isEqualToString:currentSubElementBeingParsed]) { //only check for known button subelements
        
        ret = YES;
        [button setObject:currentSubElementValue forKey:elementName];
        
    } //end if current ui element is a button
    
    else if ([currentUIElementBeingParsed isEqualToString:@"PLANE"] && [elementName isEqualToString:currentSubElementBeingParsed]) { //only check for plane subelements
        
        ret = YES;
        [plane setObject:currentSubElementValue forKey:elementName];
        
    } //end if current ui element is a plane
    
    else if ([currentUIElementBeingParsed isEqualToString:@"THRESHOLD"] && [elementName isEqualToString:currentSubElementBeingParsed]) { //only check for threshold subelements
        
        ret = YES;
        [threshold setObject:currentSubElementValue forKey:elementName];
        
    } //end if current ui element is a threshold
    
    else {
        NSLog(@"UNHANDLED: %@", elementName);
    }//end if 
    
    return ret;
    
}//end is End of a SubElement

//begin add plane to layout
-(void)addPlaneToLayout {
    
    waitingForThreshold = NO;
    [layout addObject:[NSArray arrayWithArray:planesAndThresholds]];
    planesAndThresholds = nil;
    //[planesAndThresholds release];
    
}//end add plane to layout

//********************************************************************************

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSLog(@"Parser error occured %@",parseError);
}//end parseErrorOccurred

- (NSData *)parser:(NSXMLParser *)parser resolveExternalEntityName:(NSString *)name systemID:(NSString *)systemID {
    
    NSLog(@"entered resolveExternalEntityName");
    
    //NSLog(name);
    NSString *string = [[NSString alloc] initWithString:@" "];
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return data;
    
}//end resolveExternalEntityName

- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError {
    
    NSLog(@"entered validationErrorOccurred");
    
} //end validation error occurred

// end of XMLParser.m file
@end
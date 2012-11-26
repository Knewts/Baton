//
//  Baton_UIPlane.h
//  Baton - Western Michigan University KLORK
//
//  Created by Andy Stratton on 4/9/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

/*
 *      DICTIONARY REQUIRED PARAMETERS:
 *  X       - X position on the screen (integer)
 *  Y       - Y position on the screen (integer)
 *  WIDTH   - width of the on-screen display
 *  HEIGHT  - height of the on-screen display
 *  ACCEL   - 1 or 0. 1 is ON, 0 is OFF.
 *
 *      OPTIONAL PARAMETERS
 *  XSCALE  - Full Gravity value on the X axis.
 *  YSCALE  - Full Gravity value on the Y axis.
 *  XMAX    - The maximum value to be displayed on the X axis.
 *  YMAX    - The maximum value to be displayed on the Y axis.
 */

#import <CoreMotion/CoreMotion.h>
#import <Foundation/Foundation.h>
#import "Baton_UI_Element.h"
#import "Baton_Plane_Region.h"

@interface Baton_UIPlane : Baton_UI_Element
{
    bool AccelOn;
    bool intOnly;
    double lastUpdate;
    CMMotionManager *MManager;
    NSTimer *myTimer;
    NSMutableArray *regions;
    
    float xSmoothTotal, ySmoothTotal, sampleNumber;
    float *xSamples, *ySamples;
    int samplePosition;
    
    // Data : This is the 0 basic accelerometer data. 1.0 is the max
    //  value under gravitational force only.
    // Scale : This value is equivalent to 1.0 in and easier to understand scale.
    // Max : The max value to be shown using the Scale Value.
    //
    // A plane defined with a Scale of 10 and a Max of 15 would actually display
    // accelerometer data from 0.0 to 1.5 mapped to a scale of 0 to 15. Thresholds
    // and regions should be defined on the user scale (0 - 15 in this case).
    float xData,yData,xScale,yScale,xMax,yMax;
    
    //CGLayerRef layer;
    //UIAccelerometer aMeter;
}

-(id)initWithFrame:(CGRect)frame;
-(id)initWithDictionary:(NSDictionary *)params;
-(void)drawRect:(CGRect)rect;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)activateAccelerometer;
-(void)UpdateAccel;	

-(void)AddRegion:(Baton_Plane_Region*)region;


@end



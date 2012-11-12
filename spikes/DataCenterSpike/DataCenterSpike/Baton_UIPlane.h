//
//  Baton_UIPlane.h
//  draw2D
//
//  Created by Andy Stratton on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import <Foundation/Foundation.h>
#import "Baton_UI_Element.h"

@interface Baton_UIPlane : Baton_UI_Element
{
    bool AccelOn;
    double lastUpdate;
    CMMotionManager *MManager;
    NSTimer *myTimer;
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

// Defines where the data point will be drawn.
@property float xData;
@property float yData;

@end


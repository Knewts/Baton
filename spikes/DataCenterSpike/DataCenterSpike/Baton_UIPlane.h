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
    
    int xData;
    int yData;
    bool AccelOn;
    double lastUpdate;
    CMMotionManager *MManager;
    NSTimer *myTimer;
    //CGLayerRef layer;
    //UIAccelerometer aMeter;
}

@property int xData;
@property int yData;

-(id)initWithFrame:(CGRect)frame;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)activateAccelerometer;
-(void)UpdateAccel;	

@end


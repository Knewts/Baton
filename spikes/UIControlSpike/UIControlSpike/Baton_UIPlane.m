//
//  Baton_UIPlane.m
//  draw2D
//
//  Created by Andy Stratton on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Baton_UIPlane.h"

@implementation Baton_UIPlane
@synthesize xData;
@synthesize yData;

/*
 *Init - This should be moved to a superclass
 */
-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        xData = 0;
        yData = 0;
        AccelOn = false;
        myTimer = nil;
        MManager = nil;
    }
    return self;
}

// This function draws the UI element to its own layer object. This should only be done
//when some status of the element has changed.
-(void)drawRect:(CGRect)rect
{
    //Update the Acceleration information
    if (AccelOn) {
        [self UpdateAccel];
    }
    
    //Get the layer context.
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Fill with the background color
    CGContextAddRect(context, rect);
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    
    //Set the stroke width and change the color to blue.	
    CGFloat components[] = {0.3, 0.4, 1.0, 1.0};
    CGColorRef color = CGColorCreate(CGColorSpaceCreateDeviceRGB(), components);
    CGContextSetStrokeColorWithColor(context, color);
    CGContextSetLineWidth(context, 2.0);
    CGContextFillRect(context, rect);
    
    int xCenter = (rect.size.width/2);
    int yCenter = (rect.size.height/2);
    
    //Vertical Origin
	CGContextMoveToPoint(context, xCenter, 0);	
    CGContextAddLineToPoint(context, xCenter, rect.size.height);
    //Horizontal Origin
    CGContextMoveToPoint(context, 0, yCenter);	
    CGContextAddLineToPoint(context, rect.size.width, yCenter);
    
    CGContextStrokePath(context);    
    
    //Draw Text
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSelectFont(context, "Helvetica", 10, kCGEncodingMacRoman);
    CGAffineTransform trans = CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0, 0);
    CGContextSetTextMatrix(context, trans);
    NSString *text = [NSString stringWithFormat: @"X:%d Y:%d",xData,yData];
    CGContextShowTextAtPoint(context, 10, 10, [text cStringUsingEncoding:NSASCIIStringEncoding], text.length);
    
    //Data Circle
    int dataRadius = 4;
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextStrokeEllipseInRect(context, CGRectMake(xCenter+xData-dataRadius, yCenter+yData-dataRadius, dataRadius*2, dataRadius*2));
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!AccelOn)
    {
        CGPoint location = [[touches anyObject] locationInView:self];
        xData = location.x-(self.frame.size.width/2);
        yData = location.y-(self.frame.size.height/2);
        [self setNeedsDisplay];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
    //Update touch location if Acceleration is turned Off
    if (!AccelOn)
    {
        CGPoint location = [[touches anyObject] locationInView:self];
        xData = location.x-(self.frame.size.width/2);
        yData = location.y-(self.frame.size.height/2);
    }
    [self setNeedsDisplay];
    
}

-(void)activateAccelerometer//:(float)frequency
{
    AccelOn = true;
    MManager = [CMMotionManager new];
    [MManager startAccelerometerUpdates];
    myTimer = [NSTimer scheduledTimerWithTimeInterval:(1.0/30.0) target:self
                                             selector:@selector(UpdateAccel) userInfo:nil repeats:YES];
}

- (void)UpdateAccel
{
    
	xData = MManager.accelerometerData.acceleration.x * self.frame.size.width/2;
	yData = -MManager.accelerometerData.acceleration.y * self.frame.size.height/2;
    [self setNeedsDisplay];
	//z.text = [NSString stringWithFormat:@"Z is: %f", acceleration.z];
}



-(void)dealloc
{
    //Shut the accelerometer off.
    if (MManager != nil)
    {
        [MManager stopAccelerometerUpdates];
    }
}
@end
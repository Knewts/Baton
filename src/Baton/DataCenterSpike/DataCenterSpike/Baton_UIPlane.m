//
//  Baton_UIPlane.m
//  Baton - Western Michigan University KLORK
//
//  Created by Andy Stratton on 4/9/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//


#import "Baton_UIPlane.h"

@implementation Baton_UIPlane


/*
 *Init
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

-(id)initWithDictionary:(NSDictionary *)params
{
    regions = [[NSMutableArray alloc] init];
    
    // Get the parameters we need.
    NSNumber *temp;
    temp = [params valueForKey:@"X"];
    int xposition = [temp intValue];
    
    temp = [params valueForKey:@"Y"];
    int yposition = [temp intValue];
    
    
    temp = [params valueForKey:@"WIDTH"];
    int width = [temp intValue];
    
    temp = [params valueForKey:@"HEIGHT"];
    int height = [temp intValue];
    
    temp = [params valueForKey:@"ACCEL"];
    Boolean accel = [temp intValue];
    
    CGRect newRect = CGRectMake(xposition, yposition, width, height);
    
    if (self = [super initWithFrame:newRect])
    {
        AccelOn = accel;
        myTimer = nil;
        MManager = nil;
        
        // Smoothing
        if  (AccelOn)
        {
            sampleNumber = 8;
            
            xSamples = malloc(sizeof(float)*sampleNumber);
            ySamples = malloc(sizeof(float)*sampleNumber);
            
            int i;
            for (i=0; i<sampleNumber; i++) {
                xSamples[i] = 0.0;
                ySamples[i] = 0.0;
            }
            samplePosition = 0;
            xSmoothTotal = 0;
            ySmoothTotal = 0;
        }
        
        temp = [params valueForKey:@"XSCALE"];
        xScale = ([temp intValue] == 0)? 1 :[temp intValue];
            
        temp = [params valueForKey:@"YSCALE"];
        yScale = ([temp intValue] == 0)? 1 :[temp intValue];
        
        temp = [params valueForKey:@"XMAX"];
        xMax = ([temp intValue] == 0)? xScale :[temp intValue];
        
        temp = [params valueForKey:@"YMAX"];
        yMax = ([temp intValue] == 0)? yScale :[temp intValue];
    }
    
    if (AccelOn) { [self activateAccelerometer]; }
    return self;
}

// This function draws the UI element to its own layer object. This should
//only be done when some status of the element has changed.
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
    CGContextFillRect(context, rect);
    
        
    //Set the stroke width and change the color to blue.	
    CGFloat components[] = {0.3, 0.4, 1.0, 1.0};
    CGColorRef color = CGColorCreate(CGColorSpaceCreateDeviceRGB(), components);
    CGContextSetStrokeColorWithColor(context, color);
    CGContextSetLineWidth(context, 2.0);
    
    
    int xCenter = (rect.size.width/2);
    int yCenter = (rect.size.height/2);
    
    //Vertical Origin
	CGContextMoveToPoint(context, xCenter, 0);	
    CGContextAddLineToPoint(context, xCenter, rect.size.height);
    //Horizontal Origin
    CGContextMoveToPoint(context, 0, yCenter);	
    CGContextAddLineToPoint(context, rect.size.width, yCenter);

    CGContextStrokePath(context); 
    
    
    //ToDo: Draw Sub-Regions here.
    int regionCount = [regions count];
    for (int i=0; i<regionCount; i++)
    {
        Baton_Plane_Region * element = [regions objectAtIndex:i];

        [element drawContext:context ScaleX:xScale ScaleY:yScale Frame:rect];
    }

    //Draw Text
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSelectFont(context, "Helvetica", 10, kCGEncodingMacRoman);
    CGAffineTransform trans = CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0, 0);
    CGContextSetTextMatrix(context, trans);
    NSString *text = [NSString stringWithFormat: @"X:%f Y:%f",xData,yData];
    CGContextShowTextAtPoint(context, 10, 10, [text cStringUsingEncoding:NSASCIIStringEncoding], text.length);
    
    //Data Circle
    int dataRadius = 4;
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    int xPos = xCenter + (xData*((self.frame.size.width/2))) - dataRadius;
    int yPos = yCenter - (yData*((self.frame.size.height/2))) - dataRadius;
    CGContextStrokeEllipseInRect(context, CGRectMake(xPos, yPos, dataRadius*2, dataRadius*2));
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[delegate executeCommand:@"LOG" withArguments:@"THIS WORKS"];
    
    if (!AccelOn)
    {
        CGPoint location = [[touches anyObject] locationInView:self];
        xData = 2*((location.x-(self.frame.size.width/2))/self.frame.size.width);
        yData = -2*((location.y-(self.frame.size.height/2))/self.frame.size.height);
        
        [self setNeedsDisplay];
        [self CheckRegions];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
    //Update touch location if Acceleration is turned Off
    if (!AccelOn)
    {
        CGPoint location = [[touches anyObject] locationInView:self];
        xData = 2*((location.x-(self.frame.size.width/2))/self.frame.size.width);
        yData = -2*((location.y-(self.frame.size.height/2))/self.frame.size.height);
        [self setNeedsDisplay];
        [self CheckRegions];
    }
    //[self setNeedsDisplay];
    
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
    // Remove the old data
    xSmoothTotal -= xSamples[samplePosition];
    ySmoothTotal -= ySamples[samplePosition];
    // Add the new Data
    xSamples[samplePosition] = MManager.accelerometerData.acceleration.x;
    ySamples[samplePosition] = MManager.accelerometerData.acceleration.y;
    xSmoothTotal += xSamples[samplePosition];
    ySmoothTotal += ySamples[samplePosition];
    
    // Increment the position until you hit the sampleNumber
    samplePosition++;
    if (samplePosition == sampleNumber)
        samplePosition =0;
    
    xData = xSmoothTotal/sampleNumber;
    yData = ySmoothTotal/sampleNumber;
    //xData = MManager.accelerometerData.acceleration.x;
	//yData = MManager.accelerometerData.acceleration.y;
    [self setNeedsDisplay];
}

-(void)CheckRegions
{
    int regionCount = [regions count];
    for (int i=0; i<regionCount; i++)
    {
        Baton_Plane_Region * element = [regions objectAtIndex:i];
        
        if ([element checkPointX:xData Y:yData ScaleX:xScale ScaleY:yScale])
            [delegate executeCommand:[element getCommand] withArguments:[element getParams]];
    }
    
}


// Add a region to the array
-(void)AddRegion:(Baton_Plane_Region*)region
{
    [regions addObject:(id)region];
    NSLog(@"Added Region %d", [regions count]);
}


-(void)dealloc
{
    //Shut the accelerometer off.
    if (MManager != nil)
    {
        [MManager stopAccelerometerUpdates];
    }
    if (AccelOn)
    {
        free(xSamples);
        free(ySamples);
    }
}


@end
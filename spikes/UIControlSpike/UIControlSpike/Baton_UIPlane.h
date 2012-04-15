//
//  Baton_UIPlane.h
//  draw2D
//
//  Created by Andy Stratton on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Baton_UIPlane : UIView
{

    int xData;
    int yData;
    
    //CGLayerRef layer;
    //UIAccelerometer aMeter;
}

@property int xData;
@property int yData;

-(id)initWithFrame:(CGRect)frame;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

@end

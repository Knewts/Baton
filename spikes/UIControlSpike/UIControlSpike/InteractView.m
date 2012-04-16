//
//  InteractView.m
//  UIControlSpike
//
//  Created by Andy Stratton on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InteractView.h"
#import "Baton_UIPlane.h"

@implementation InteractView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
    return self;	
}

-(void)awakeFromNib
{
    CGRect iframe = CGRectMake(4, 245, 175, 130);
    Baton_UIPlane *X = [[Baton_UIPlane alloc] initWithFrame:iframe]; 
    [self addSubview:X];
    
    
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    myButton.frame = CGRectMake(20, 20, 200, 44); // position in the parent view and set the size of the button
    [myButton setTitle:@"Click Me!" forState:UIControlStateNormal];
    // add targets and actions
    [myButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    // add to a view
    [self addSubview:myButton];  
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetShadow(context, CGSizeMake(13, 13), 4.0);
    
    
    
}
@end

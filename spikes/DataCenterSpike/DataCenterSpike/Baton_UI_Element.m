//
//  Baton_UI_Element.m
//  DataCenterSpike
//
//  Created by Andy Stratton on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Baton_UI_Element.h"

@implementation Baton_UI_Element

@synthesize delegate;
@synthesize commandArguments;
@synthesize commandString;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

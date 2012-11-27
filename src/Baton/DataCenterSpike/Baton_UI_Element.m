//
//  Baton_UI_Element.m
//  Baton - Western Michigan University KLORK
//
//  Created by Andy Stratton on 6/18/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
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

@end

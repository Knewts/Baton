//
//  Layout.m
//  Baton
//
//  Created by College of Fine Arts on 7/25/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "Layout.h"

@implementation Layout

@synthesize title;
@synthesize tree;

-(id)init
{
    title = @"Default";
    tree = nil;
    return self;
}

-(id)initWithTitle:(NSString *)inTitle layoutTree:(NSArray *)inTree
{
    //send nsarray to this
    //title is first param, last part of url
    title = inTitle;
    tree = inTree;
    return self;
}

@end

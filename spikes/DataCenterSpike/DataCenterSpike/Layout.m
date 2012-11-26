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
@synthesize path;

-(id)init
{
    title = @"Default";
    path = @"Default";
    return self;
}

-(id)initWithTitle:(NSString *)inTitle resourcePath:(NSString *)inPath
{
    title = inTitle;
    path = inPath;
    return self;
}

@end

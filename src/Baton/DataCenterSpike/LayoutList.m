//
//  LayoutList.m
//  DataCenterSpike
//
//  Created by Matthew Knewtson on 11/23/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "LayoutList.h"

@implementation LayoutList

@synthesize layouts;

-(id)initWithDefaultFile
{
    [self loadLayoutsFromDefaultFile];
    return self;
}
-(id)initWithContentsOfFile:(NSString *)filename
{
    [self loadLayoutsFromFile:filename];
    return self;
}


-(BOOL)saveLayoutsToFile:(NSString *)filename
{
    [NSKeyedArchiver archiveRootObject:layouts toFile:filename];
    return YES;
}
-(void)saveLayoutsToDefaultFile
{
    [self saveLayoutsToFile:@"layouts.plist"];
}
-(BOOL)loadLayoutsFromFile:(NSString *)filename
{
    
    layouts = [NSKeyedUnarchiver unarchiveObjectWithFile:filename];
    
    if (layouts == nil)
    {
        //error handler stuff here.
        return NO;
    }
    return YES;
}
-(void)loadLayoutsFromDefaultFile
{
    if(![self loadLayoutsFromFile:@"layouts.plist"])
        layouts = [[NSMutableArray alloc] initWithObjects:[[Layout alloc]init], nil];
}



-(NSUInteger)countOfLayouts
{
    return [layouts count];
}

-(id)objectInLayoutsAtIndex:(NSUInteger)index
{
    return [layouts objectAtIndex:index];
}
-(void)addLayoutsObject:(Layout *)object
{
    [layouts addObject:object];
}

@end

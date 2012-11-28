//
//  LayoutList.h
//  DataCenterSpike
//
//  Created by Matthew Knewtson on 11/23/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.

// This class encapsulates an NSMutableArray object to 
//

#import <Foundation/Foundation.h>
#import "Layout.h"

@interface LayoutList : NSObject
{
    NSMutableArray * layouts;
}

@property (nonatomic,readonly) NSMutableArray * layouts;

-(id)initWithDefaultFile;
-(id)initWithContentsOfFile:(NSString *)filename;


-(BOOL)saveLayoutsToFile:(NSString *)filename;
-(BOOL)loadLayoutsFromFile:(NSString *)filename;
-(void)loadLayoutsFromDefaultFile;
-(void)saveLayoutsToDefaultFile;


-(NSUInteger)countOfLayouts;
-(id)objectInLayoutsAtIndex:(NSUInteger)index;
-(void)addLayoutsObject:(Layout *)object;


@end

//
//  BatonConfiguration.m
//  DataCenterSpike
//
//  Created by Matthew Knewtson on 11/12/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "BatonConfiguration.h"

@implementation BatonConfiguration

@synthesize currentConf;

-(id)initDefaults
{
    [self loadDefaults];
    return self;
}

-(BOOL)loadWithFile:(NSString *)filename;
{
    //xml stuff in here
    NSFileManager * manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:filename])
    {
        currentConf = [NSMutableDictionary dictionaryWithContentsOfFile:filename];
        return true;
    }
    else {
        NSLog(@"Configuration file %@ not found",filename);
        return false;
    }
}
-(BOOL)loadDefaults
{
    NSFileManager * manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:@"config.plist"]) {
        [self loadWithFile:@"config.plist"];
    }
    else
    {
        [self loadWithFile:[[NSBundle mainBundle] pathForResource:@"defaultConfig" ofType:@"plist"]];
    }
    return true;
}
-(BOOL)writeToFile:(NSString *)filename
{
    [currentConf writeToFile:filename atomically:YES];
    return true;
}
-(BOOL)writeDefaults
{
    [self writeToFile:@"config.plist"];
    return true;
}


-(id)getObjectForKey:(id)key
{
    return [currentConf objectForKey:key];
}
-(BOOL)setObject:(id)object forKey:(id)key
{
    [currentConf setObject:object forKey:key];
    return true;
}


@end

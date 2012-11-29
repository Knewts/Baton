//
//  BatonConfiguration.h
//  DataCenterSpike
//
//  Created by Matthew Knewtson on 11/12/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface BatonConfiguration : NSObject
{
    NSMutableDictionary * currentConf;
}

@property (nonatomic, retain) NSDictionary * currentConf;

-(id)initDefaults;

-(BOOL)loadWithFile:(NSString *)filename;
-(BOOL)loadDefaults;
-(BOOL)writeToFile:(NSString *)filename;
-(BOOL)writeDefaults;


-(id)getObjectForKey:(id)key;
-(BOOL)setObject:(id)object forKey:(id)key;

@end

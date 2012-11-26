//
//  Layout.h
//  Baton
//
//  Created by College of Fine Arts on 7/25/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Layout : NSObject
{
    NSString * title;
    NSString * path;
}

@property (nonatomic,retain) NSString * title;
@property (nonatomic,retain) NSString * path;

-(id)initWithTitle:(NSString *) inTitle resourcePath:(NSString *) inPath;


@end

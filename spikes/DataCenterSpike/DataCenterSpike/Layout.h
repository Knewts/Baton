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
    NSArray * tree;
}

@property (nonatomic,retain) NSString * title;
@property (nonatomic,retain) NSArray * tree;

-(id)initWithTitle:(NSString *) inTitle layoutTree:(NSArray *) inTree;


@end

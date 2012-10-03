//
//  XMLParser.h
//  DataCenterSpike
//
//  Created by Andy Stratton on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BatonUICreator.h"

@interface XMLParser : NSObject
{
    CGRect screenFrame;
    BatonUICreator *buic;
}

-(id)initWithScreenFrame:(CGRect)frame;

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

-(UIView *) getView;

@end

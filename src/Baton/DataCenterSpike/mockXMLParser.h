//
//  mockXMLParser.h
//  Baton
//
//  Created by Matthew Knewtson on 11/28/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BatonEventHandler.h"
#import "BatonUICreator.h"

@interface mockXMLParser : NSObject
{
    CGRect screenFrame;
    BatonUICreator *buic;
}

#pragma mark mockXMLHeader
-(id)initWithScreenFrame:(CGRect)frame;
-(UIView *) getView;

@end

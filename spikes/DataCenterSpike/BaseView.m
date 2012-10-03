//
//  BaseView.m
//  DataCenterSpike
//
//  Created by Andy Stratton on 10/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

/*
 * THIS IS THE BASE VIEW FOR EVERYTHING ELSE
 *
 */

#import "BaseView.h"
#import "BatonEventHandler.h"

@implementation BaseView

-(void)awakeFromNib
{
    mockXML = [[XMLParser alloc]  initWithScreenFrame:self.frame];
    
    //BatonEventHandler *beh = [[BatonEventHandler alloc] initWithFrame:self.frame];
    
    [self addSubview:[mockXML getView]];
    
}

@end

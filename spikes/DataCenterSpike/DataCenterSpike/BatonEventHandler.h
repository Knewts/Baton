//
//  DataCenter.h
//  DataCenterSpike
//
//  Created by Andy Stratton on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Baton_UI_Element.h"
#import "Common.h"

@interface BatonEventHandler : UIView <BatonUIElementDelegate>

- (id)initWithFrame:(CGRect)frame;

-(bool)addVariable:(NSString*)key;
-(void)addUIElement:(Baton_UI_Element*) batonUI;
//-(void)executeCommand:(BatonCommand) command;

@end

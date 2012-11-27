//
//  DataCenter.h
//  Baton - Western Michigan University KLORK
//
//  Created by Andy Stratton on 6/12/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Baton_UI_Element.h"

@interface BatonEventHandler : UIView <BatonUIElementDelegate>

- (id)initWithFrame:(CGRect)frame;

-(bool)addVariable:(NSString*)key;
-(void)addUIElement:(Baton_UI_Element*) batonUI;
-(void)executeCommand:(NSString *) command withArguments: (NSString *) arguments;

//-(void)executeCommand:(BatonCommand) command;


@end

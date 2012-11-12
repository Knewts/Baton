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
<<<<<<< HEAD
-(void)executeCommand:(NSString *) command withArguments: (NSString *) arguments;
=======
//-(void)executeCommand:(BatonCommand) command;
>>>>>>> e18cac15ff421569dcca3a77848699914af5a22a

@end

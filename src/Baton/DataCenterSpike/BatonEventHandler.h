//
//  DataCenter.h
//  Baton - Western Michigan University KLORK
//
//  Created by Andy Stratton on 6/12/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Baton_UI_Element.h"
#import "BatonConfiguration.h"
#import "OSClib.h"

@interface BatonEventHandler : UIView <BatonUIElementDelegate>

@property (nonatomic, assign) GCDUDPSocketController * sock;
@property (nonatomic, assign) BatonConfiguration * config;

- (id)initWithFrame:(CGRect)frame;

-(void)addUIElement:(UIView <Baton_UI_Element> *) batonUI;
-(void)executeCommand:(UIView <Baton_UI_Element> *) sender;

//-(void)executeCommand:(BatonCommand) command;


@end

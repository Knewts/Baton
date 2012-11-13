//
//  AppDelegate.h
//  DataCenterSpike
//
//  Created by Andy Stratton on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "GCDUDPSocketController.h"
#import "OSClib.h"
#import "SettingsTableViewController.h"
#import "BatonConfiguration.h"
#import "ErrorHandler.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    GCDUDPSocketController * sock;
    BatonConfiguration * config;
    UIStoryboard * storyboard;
    ErrorHandler * error;
}

@property (nonatomic, retain) GCDUDPSocketController * sock;
@property (strong, nonatomic) BatonConfiguration * config;
@property (strong, nonatomic) ErrorHandler * error;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIStoryboard *storyboard;

+(AppDelegate*)sharedAppdelegate;
@end
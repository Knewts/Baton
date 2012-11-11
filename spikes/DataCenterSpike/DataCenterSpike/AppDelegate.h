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

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    GCDUDPSocketController * sock;
    NSDictionary * configuration;
    UIStoryboard * storyboard;
}

@property (nonatomic, retain) GCDUDPSocketController * sock;
@property (strong, nonatomic) NSDictionary * configuration;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIStoryboard *storyboard;

+(AppDelegate*)sharedAppdelegate;
@end
//
//  AppDelegate.h
//  DataCenterSpike
//
//  Created by Andy Stratton on 6/12/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "GCDUDPSocketController.h"
#import "OSClib.h"
#import "SettingsTableViewController.h"
#import "BatonConfiguration.h"
#import "ErrorHandler.h"
#import "LayoutList.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    GCDUDPSocketController * sock;
    BatonConfiguration * config;
    UIStoryboard * storyboard;
    ErrorHandler * error;
    LayoutList * layouts;
    
}

@property (nonatomic, retain) GCDUDPSocketController * sock;
@property (retain, nonatomic) BatonConfiguration * config;
@property (retain, nonatomic) ErrorHandler * error;
@property (retain, nonatomic) LayoutList * layouts;

@property (retain, nonatomic) UIWindow *window;
@property (retain, nonatomic) UIStoryboard *storyboard;

+(AppDelegate*)sharedAppdelegate;
@end
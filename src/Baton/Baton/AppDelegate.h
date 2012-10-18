//
//  AppDelegate.h
//  Baton
//
//  Created by Matthew Knewtson on 4/6/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "OSClib.h"
#import "GCDUDPSocketController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{

    GCDUDPSocketController * sock;
    NSDictionary * configuration;
}

@property (nonatomic, retain) GCDUDPSocketController * sock;
@property (strong, nonatomic) NSDictionary * configuration;
@property (strong, nonatomic) UIWindow *window;

@end

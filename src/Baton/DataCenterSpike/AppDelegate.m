//
//  AppDelegate.m
//  DataCenterSpike
//
//  Created by Andy Stratton on 6/12/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

@synthesize sock;
@synthesize config;
@synthesize error;
@synthesize layouts;

@synthesize window = _window;
@synthesize storyboard;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    //allocating and configuring the socket, the error handler, and the configuration
    
    
    
    
    config = [[BatonConfiguration alloc] initDefaults];

    
    error = [[ErrorHandler alloc] initWithConfiguration:config];
    
    
    
    sock = [[GCDUDPSocketController alloc] init];
    
    
    layouts = [[LayoutList alloc] initWithDefaultFile];
    
    
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.storyboard = [UIStoryboard storyboardWithName:@"MainStoryBoard_iPhone" bundle:nil];
    } else {
        self.storyboard = [UIStoryboard storyboardWithName:@"MainStoryBoard_iPad" bundle:nil];
    }
    
    self.window.rootViewController = [storyboard instantiateInitialViewController];
    [self.window makeKeyAndVisible];
     
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [config writeDefaults];

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    [config writeDefaults];
    
}

+(AppDelegate*)sharedAppdelegate
{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

@end

//
//  OSCspikeAppDelegate.m
//  OSCspike
//
//  Created by Matthew Knewtson on 2/22/12.
//  Copyright 2012 Western Michigan University. All rights reserved.
//

#import "OSCspikeAppDelegate.h"

@implementation OSCspikeAppDelegate

@synthesize window = _window;
@synthesize button = _button;
@synthesize view = _view;
@synthesize outport = _outport;
@synthesize field = _field;
@synthesize submit = _submit;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.

    osc = [[[OSCManager alloc] init] autorelease];
    [osc setDelegate:self];
    [osc createNewInputForPort:1338];
    outport = [osc createNewOutputToAddress:@"169.254.78.35" atPort:1338];

    return YES;
}
- (void) receivedOSCMessage:(OSCMessage *)m	{
	NSLog(@"%s ... %@",__func__,m);
	//[self displayPackets];
	
	/*
     OSCAddressSpace		*addressSpace = [manager addressSpace];
     [addressSpace dispatchMessage:m];
     */
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}
- (IBAction)SendOSC:(id)sender
{
    NSLog(@"Sending stuff!");
    OSCMessage * testMessage = [OSCMessage createWithAddress:@"/testmessage"];
    
    [testMessage addString:@"XYZZY"];
    
    [self.outport sendThisMessage:testMessage];
}
- (IBAction)changeAddress:(id)sender
{
    NSLog(@"creating port to address %@",[_field text]);
    //[outport dealloc];
    //outport = nil;
    [osc removeOutput:outport];
    outport = [osc createNewOutputToAddress:[_field text] atPort:1338];
    
    

}
@end

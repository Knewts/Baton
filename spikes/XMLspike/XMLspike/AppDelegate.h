//
//  AppDelegate.h
//  XMLspike
//
//  Created by Tim Weidner on 5/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

//added from irish guy
@property (strong, nonatomic) NSMutableArray *listArray;

@end

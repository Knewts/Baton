//
//  BatonAppDelegate.h
//  Baton
//
//  Created by Matthew Knewtson on 2/17/12.
//  Copyright 2012 Western Michigan University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BatonViewController;

@interface BatonAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet BatonViewController *viewController;

@end

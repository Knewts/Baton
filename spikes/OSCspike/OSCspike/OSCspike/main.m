//
//  main.m
//  OSCspike
//
//  Created by Matthew Knewtson on 2/22/12.
//  Copyright 2012 Western Michigan University. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retVal;
    retVal = UIApplicationMain(argc, argv, nil, @"OSCspikeAppDelegate");
    
    [pool release];
    return retVal;
}

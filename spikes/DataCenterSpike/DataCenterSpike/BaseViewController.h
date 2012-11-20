//
//  BaseViewController.h
//  DataCenterSpike
//
//  Created by Matthew Knewtson on 11/19/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "ViewController.h"
#import "Layout.h"
#import "AppDelegate.h"

@interface BaseViewController : ViewController
{
    IBOutlet UINavigationBar * navbar;
    
    Layout * layout;
}

@property (nonatomic, retain) IBOutlet UINavigationBar * navbar;
@property (nonatomic, retain) Layout * layout;



@end

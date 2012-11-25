//
//  LayoutTableViewController.h
//  Baton
//
//  Created by College of Fine Arts on 7/25/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Layout.h"
#import "AppDelegate.h"
#import "BaseViewController.h"
#import "LayoutList.h"

@interface LayoutTableViewController : UITableViewController

@property (nonatomic,assign) LayoutList * layouts;


@end

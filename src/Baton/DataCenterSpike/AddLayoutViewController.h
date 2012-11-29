//
//  AddLayoutViewController.h
//  DataCenterSpike
//
//  Created by Tim Weidner on 11/19/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"
#import "ErrorHandler.h"
#import "AppDelegate.h"

@interface AddLayoutViewController : UITableViewController
{
    IBOutlet UITextField* layoutURL;
}

@property (nonatomic, retain) IBOutlet UITextField* layoutURL;
@property (nonatomic, assign) ErrorHandler * errorHandler;

-(IBAction)userHitCancelButton:(id)sender;
-(IBAction)userHitDoneButton:(id)sender;


@end

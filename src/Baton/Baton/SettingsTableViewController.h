//
//  SettingsTableViewController.h
//  Baton
//
//  Created by Matthew Knewtson on 6/19/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SettingsTableViewController : UITableViewController
{
    UITextField IBOutlet * hostAddress;
    UITextField IBOutlet * port;
    AppDelegate * delegate;
    
}


@property (nonatomic,retain) IBOutlet UITextField * hostAddress;
@property (nonatomic,retain) IBOutlet UITextField * port;
@property (nonatomic,retain) AppDelegate * delegate;

-(IBAction)userCanceledOSCConfig:(id)sender;
-(IBAction)userDidFinishOSCConfig:(id)sender;
-(IBAction)userCanceledLayoutSelection:(id)sender;
-(IBAction)userDidFinishLayoutSelection:(id)sender;



@end

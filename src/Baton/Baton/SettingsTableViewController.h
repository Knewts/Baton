//
//  SettingsTableViewController.h
//  Baton
//
//  Created by Matthew Knewtson on 6/19/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsTableViewController : UITableViewController
{
    
}


-(IBAction)userCanceledOSCConfig:(id)sender;
-(IBAction)userDidFinishOSCConfig:(id)sender;
-(IBAction)userCanceledLayoutSelection:(id)sender;
-(IBAction)userDidFinishLayoutSelection:(id)sender;


@end

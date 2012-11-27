//
//  AddLayoutViewController.h
//  DataCenterSpike
//
//  Created by Tim Weidner on 11/19/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddLayoutViewController : UITableViewController

{
    IBOutlet UITextField* layoutURL;
}

@property (nonatomic, retain) IBOutlet UITextField* layoutURL;

-(IBAction)userHitCancelButton:(id)sender;
-(IBAction)userHitDoneButton:(id)sender;


@end

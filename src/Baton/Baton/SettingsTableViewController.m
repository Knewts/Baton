//
//  SettingsTableViewController.m
//  Baton
//
//  Created by Matthew Knewtson on 6/19/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "SettingsTableViewController.h"

@implementation SettingsTableViewController

-(IBAction)cancelOSCConfig:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
-(IBAction)finishOSCConfig:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
-(IBAction)cancelLayoutSelection:(id)sender
{
    
}
-(IBAction)finishLayoutSelection:(id)sender
{
    
}
-(IBAction)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.placeholder = nil;
}
@end

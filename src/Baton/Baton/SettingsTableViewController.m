//
//  SettingsTableViewController.m
//  Baton
//
//  Created by Matthew Knewtson on 6/19/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "SettingsTableViewController.h"


@implementation SettingsTableViewController

@synthesize hostAddress;
@synthesize port;
@synthesize delegate;
- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    hostAddress.placeholder = [[delegate configuration] objectForKey:@"hostIP"];
    port.placeholder = [[delegate configuration] objectForKey:@"hostport"];
    
    
}
-(IBAction)userCanceledOSCConfig:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
-(IBAction)userDidFinishOSCConfig:(id)sender
{
 
    [[delegate configuration] setValue:hostAddress.text forKey:@"hostIP"];
    [[delegate configuration] setValue:port.text forKey:@"hostport"];
    
    [self dismissModalViewControllerAnimated:YES];
}
-(IBAction)userCanceledLayoutSelection:(id)sender
{
    
}
-(IBAction)userDidFinishLayoutSelection:(id)sender
{
    
}
-(IBAction)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.placeholder = nil;
}
@end

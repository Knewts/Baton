//
//  SettingsTableViewController.h
//  Baton
//
//  Created by Matthew Knewtson on 6/19/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "BatonConfiguration.h"
#import "ErrorHandler.h"

//for getting the IP of the phone.
#include <ifaddrs.h>
#include <arpa/inet.h>

@interface SettingsTableViewController : UITableViewController
{
    UITextField IBOutlet * hostAddress;
    BOOL hostAddressChanged;
    UITextField IBOutlet * port;
    BOOL hostPortChanged;
    
    UISwitch IBOutlet * reportErrorToOSC;
    
    UILabel IBOutlet * reportToDifferentServerLabel;
    UISwitch IBOutlet * reportToDifferentServer;
    
    UILabel IBOutlet * errorAddressLabel;
    UILabel IBOutlet * errorPortLabel;
    
    UITextField IBOutlet * errorAddress;
    BOOL errorAddressChanged;
    UITextField IBOutlet * errorPort;
    BOOL errorPortChanged;
    
    UILabel IBOutlet * myIPAddress;
    
    
}

@property (nonatomic,assign) BatonConfiguration * config;
@property (nonatomic,assign) ErrorHandler * error;

//these are the text fields where the standard OSC Stuff goes
@property (nonatomic,retain) IBOutlet UITextField * hostAddress;
@property (nonatomic,retain) IBOutlet UITextField * port;



//A couple of Switches.
//if this one is on, the user wants errors to go through OSC
@property (nonatomic,retain) IBOutlet UISwitch * reportErrorToOSC;
//if this one is on, the user wants them to go somewhere other than the above IP address and port
@property (nonatomic,retain) IBOutlet UISwitch * reportToDifferentServer;


//if the first switch is toggled, the second switch needs to be disabled, and to help illustrate this, the label goes gray as well.
//that's what this IBOutlet is for.
@property (nonatomic,retain) IBOutlet UILabel * reportToDifferentServerLabel;


//these are for the second destination.
@property (nonatomic,retain) IBOutlet UILabel * errorAddressLabel;
@property (nonatomic,retain) IBOutlet UILabel * errorPortLabel;
@property (nonatomic,retain) IBOutlet UITextField * errorAddress;
@property (nonatomic,retain) IBOutlet UITextField * errorPort;


@property (nonatomic,retain) UILabel IBOutlet * myIPAddress;


//the navigation buttons.
-(IBAction)userCanceledOSCConfig:(id)sender;
-(IBAction)userDidFinishOSCConfig:(id)sender;


//removes the placeholder.
-(IBAction)textFieldDidBeginEditing:(id)sender;
-(BOOL)textFieldShouldReturn:(UITextField *)sender;

//for the switches.
-(IBAction)changedErrorReportingOption:(id)sender;
-(IBAction)changedDifferentServerOption:(id)sender;


//these are useful functions that will change whether other switches are enabled if they aren't necessary.
-(void)checkDifferentServer;
-(void)checkErrorToOSC;


//this function will retrieve the IP address of the phone.
-(NSString *)getIPAddress;

@end

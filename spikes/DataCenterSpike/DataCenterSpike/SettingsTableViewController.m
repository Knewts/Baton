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


@synthesize reportToDifferentServer;
@synthesize reportToDifferentServerLabel;
@synthesize reportErrorToOSC;

@synthesize errorAddressLabel;
@synthesize errorPortLabel;
@synthesize errorAddress;
@synthesize errorPort;

@synthesize myIPAddress;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //grab the delegate
    AppDelegate * delegate = [AppDelegate sharedAppdelegate];
    
    //set the placeholders for both of the textfields.  These should be what 
    hostAddress.placeholder = [[delegate configuration] objectForKey:@"hostIP"];
    port.placeholder = [[delegate configuration] objectForKey:@"hostport"];
    
    errorAddress.placeholder = [[delegate configuration] objectForKey:@"errorIP"];
    errorPort.placeholder = [[delegate configuration] objectForKey:@"errorPort"];
    
    reportErrorToOSC.on = [[[delegate configuration] objectForKey:@"reportErrorsOverOSC"] boolValue];
    
    reportToDifferentServer.on = [[[delegate configuration] objectForKey:@"differentServerForErrorReporting"] boolValue];
    
    myIPAddress.text = [self getIPAddress];
    
    [self checkDifferentServer];
    [self checkErrorToOSC];
    
    
    
}

-(IBAction)userCanceledOSCConfig:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)userDidFinishOSCConfig:(id)sender
{
    //need to do some input validation...
    
    
    AppDelegate * delegate = [AppDelegate sharedAppdelegate];
    
    [[delegate configuration] setValue:hostAddress.text forKey:@"hostIP"];
    [[delegate configuration] setValue:port.text forKey:@"hostport"];
    
    [[delegate configuration] setValue:[NSNumber numberWithBool:reportErrorToOSC.on] forKey:@"reportErrorsOverOSC"];
    [[delegate configuration] setValue:[NSNumber numberWithBool:reportToDifferentServer.on] forKey:@"differentServerForErrorReporting"];
    
    [[delegate configuration] setValue:errorAddress.text forKey:@"errorIP"];
    [[delegate configuration] setValue:errorPort.text forKey:@"errorIP"];
    
    [self dismissModalViewControllerAnimated:YES];
}

-(void)checkErrorToOSC
{
    if (self.reportErrorToOSC.on) {
        self.reportToDifferentServer.enabled = TRUE;
        self.reportToDifferentServerLabel.textColor = [UIColor blackColor];
        [self checkDifferentServer];
    }
    else {
        self.reportToDifferentServer.enabled = FALSE;
        self.reportToDifferentServerLabel.textColor = [UIColor lightGrayColor];
    }
}
-(void)checkDifferentServer
{
    if (self.reportToDifferentServer.on) {
        self.errorAddressLabel.textColor = [UIColor blackColor];
        self.errorPortLabel.textColor = [UIColor blackColor];
        self.errorPort.enabled = true;
        self.errorAddress.enabled = true;
    }
    else {
        self.errorAddressLabel.textColor = [UIColor lightGrayColor];
        self.errorPortLabel.textColor = [UIColor lightGrayColor];
        self.errorAddress.enabled = false;
        self.errorPort.enabled = false;
    }
}

-(IBAction)changedErrorReportingOption:(id)sender
{
    [self checkErrorToOSC];
}
-(IBAction)changedDifferentServerOption:(id)sender
{
    [self checkDifferentServer];
}

-(IBAction)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.placeholder = nil;
}

- (NSString *)getIPAddress {
    
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    
                }
                
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
    
} 


@end

//
//  SettingsTableViewController.m
//  Baton
//
//  Created by Matthew Knewtson on 6/19/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "SettingsTableViewController.h"


@implementation SettingsTableViewController

@synthesize config;
@synthesize error;

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
    config = [[AppDelegate sharedAppdelegate] config];
    error = [[AppDelegate sharedAppdelegate] error];
    
    
    //set placeholder and instatiate a boolean for making sure only to update a value if it's changed.
    hostAddress.text = [config getObjectForKey:@"hostIP"];
    hostAddressChanged = false;
    
    port.text = [NSString stringWithFormat:@"%d",[(NSNumber *)[config getObjectForKey:@"hostPort"] intValue]];
    hostPortChanged = false;
    
    errorAddress.text = [config getObjectForKey:@"errorIP"];
    errorAddressChanged = false;
    
    errorPort.text = [NSString stringWithFormat:@"%d",[(NSNumber *)[config getObjectForKey:@"errorPort"] intValue]];
    errorPortChanged = false;
    
    reportErrorToOSC.on = [[config getObjectForKey:@"reportErrorsOverOSC"] boolValue];
    
    reportToDifferentServer.on = [[config getObjectForKey:@"differentServerForErrorReporting"] boolValue];
    
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
    if (hostAddressChanged) {
        [config setObject:hostAddress.text forKey:@"hostIP"];
    }
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterBehaviorDefault];

    if (hostPortChanged) {
        NSLog(@"%d:%@",[[formatter numberFromString:port.text] intValue],port.text);
        [config setObject:[formatter numberFromString:port.text] forKey:@"hostport"];
    }

    
    [config setObject:[NSNumber numberWithBool:reportErrorToOSC.on] forKey:@"reportErrorsOverOSC"];
    [config setObject:[NSNumber numberWithBool:reportToDifferentServer.on] forKey:@"differentServerForErrorReporting"];
    
    
    if (reportToDifferentServer.on) {
        if (errorAddressChanged) {
            [config setObject:errorAddress.text forKey:@"errorIP"];
        }
        if (errorPortChanged) {
            [config setObject:[formatter numberFromString:errorPort.text] forKey:@"errorPort"];
        }
    }
    
    
    [self dismissModalViewControllerAnimated:YES];
}
-(BOOL)checkIP:(NSString *)ip
{
    NSError * err;
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:@"\b([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]\\.){3}[0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]\b" options:NSRegularExpressionCaseInsensitive error:&err];
    NSUInteger numMatches = [regex numberOfMatchesInString:ip options:0 range:NSMakeRange(0, [ip length])];
    if (numMatches == 0) {
        [error reportErrorString:@"ip Address specified invalid.  Must be in the range 0.0.0.0 to 255.255.255.255"];
        return false;
    }
    return true;
}
-(BOOL)checkPort:(NSString *)portText
{
    
    NSError * err;
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:@"^[0-9]*[0-9]$" options:NSRegularExpressionCaseInsensitive error:&err];
    
    NSUInteger numMatches = [regex numberOfMatchesInString:portText options:0 range:NSMakeRange(0, [portText length])];
    
    if (numMatches > 0) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterBehaviorDefault];
    
        NSNumber * portNum = [f numberFromString:portText];
    
        if ([portNum intValue] >=0 && [portNum intValue] <= 65535)
            return true;
        else {
            [error reportErrorString:@"Port number invalid.  Must be an integer between 0 and 65535"];
            return false;
        }
    } else {
        [error reportErrorString:@"Invalid characters in port number."];
        return false;
    }
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
-(BOOL)textFieldShouldReturn:(UITextField *)sender
{
    if (sender == hostAddress || sender == errorAddress) {
        if([self checkIP:[sender text]])
        {
            if (sender == hostAddress) {
                hostAddressChanged = true;
            }
            else {
                errorAddressChanged = true;
            }
        }
    }
    else {
        if([self checkPort:[sender text]])
        {
            if (sender == port) {
                hostPortChanged = true;
            }
            if (sender == errorPort) {
                errorPortChanged = true;
            }
        }
        
    }
    [sender resignFirstResponder];
    return YES;
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

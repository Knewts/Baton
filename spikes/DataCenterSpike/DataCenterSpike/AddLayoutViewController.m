//
//  AddLayoutViewController.m
//  DataCenterSpike
//
//  Created by Tim Weidner on 11/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddLayoutViewController.h"

@interface AddLayoutViewController ()

@end

@implementation AddLayoutViewController


-(IBAction)userHitCancelButton:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}//end user hit cancel


-(IBAction)userHitDoneButton:(id)sender {
    //make sure valid url (regex for http:// .com
    
    //handle for bad url
    
    //this function could just use [NSString stringWithContentsofURL:encoding:error:] to download the file, then write the string to a file using [string writeToFile:encoding:error:]
    
    //the oneliner to download a text file and save it to the device would be [[NSString stringWithContentsofURL:url encoding:<someencoding> error:&neterror] writeToFile:file encoding:<sameencoding> error:&ioerror]
    
    //the file should be the last section of the URL provided by the user.  This can be cut off pretty easily.
    
    [self dismissModalViewControllerAnimated:YES];
}//end user hit done


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end

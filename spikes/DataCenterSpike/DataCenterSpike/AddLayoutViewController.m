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
}//end user hit done


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end

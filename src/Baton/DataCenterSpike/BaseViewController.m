//
//  BaseViewController.m
//  DataCenterSpike
//
//  Created by Matthew Knewtson on 11/19/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController


@synthesize navbar;
@synthesize layout;

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    BatonUICreator * uiCreator = [[BatonUICreator alloc] init];
    
    navbar.topItem.title = layout.title;
    
    if([layout.title isEqualToString:@"Default"])
    {
        mockXMLParser * mockXML = [[mockXMLParser alloc]  initWithScreenFrame:self.view.frame];
        
        //BatonEventHandler *beh = [[BatonEventHandler alloc] initWithFrame:self.frame];
        
        [self.view addSubview:[mockXML getView]];
    }
    else 
    {
        [self.view addSubview:[uiCreator CreateObjectFrom:[layout tree]]];
    }
    
}

@end

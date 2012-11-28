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
    
    navbar.topItem.title = layout.title;
    
    if([layout.title isEqualToString:@"Default"])
    {
        mockXMLParser * mockXML = [[mockXMLParser alloc]  initWithScreenFrame:self.view.frame];
        
        [self.view addSubview:[mockXML getView]];
    }
    else 
    {
        BatonEventHandler * beh = [[BatonEventHandler alloc] initWithFrame:self.view.frame];
        BatonUICreator * creator = [[BatonUICreator alloc] init];
        
        for (id UIItem in layout.tree) {
            [beh addUIElement:[creator CreateObjectFrom:UIItem]];
        }
        [self.view addSubview:beh];
    }
    
}

@end

//
//  OSCspikeAppDelegate.h
//  OSCspike
//
//  Created by Matthew Knewtson on 2/22/12.
//  Copyright 2012 Western Michigan University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VVOSC.h"

@interface OSCspikeAppDelegate : NSObject <UIApplicationDelegate>
{
    OSCManager *osc;
    OSCOutPort *outport;
    UIView *view;
    UIButton * button;
    UITextField * field;
    UIButton * submit;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIButton * button;
@property (nonatomic, retain) IBOutlet UIView * view;
@property (nonatomic, retain) OSCOutPort * outport;
@property (nonatomic, retain) IBOutlet UITextField * field;
@property (nonatomic, retain) IBOutlet UIButton * submit;

-(IBAction)SendOSC:(id)sender;
-(IBAction)changeAddress:(id)sender;
-(void)receivedOSCMessage:(OSCMessage *)m;
@end

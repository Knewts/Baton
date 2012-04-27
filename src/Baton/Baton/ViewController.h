//
//  ViewController.h
//  Baton
//
//  Created by Matthew Knewtson on 4/6/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCDUDPSocketController.h"
#import "OSCMessage.h"

@interface ViewController : UIViewController
{
    UITextField * hostAddr;
    UITextField * portNum;
    UITextField * message;
    GCDUDPSocketController * sock;
}

@property (nonatomic, retain) IBOutlet UITextField * hostAddr;
@property (nonatomic, retain) IBOutlet UITextField * portNum;
@property (nonatomic, retain) IBOutlet UITextField * message;
@property (nonatomic, retain) GCDUDPSocketController * sock;
-(IBAction)SendMessage:(id)sender;

@end

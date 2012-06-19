//
//  Baton_UI_Element.h
//  DataCenterSpike
//
//  Created by Andy Stratton on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
/*
 * This class is the base class for all UI elements in the Baton application. The main function of this class is to establish the BatonUIElementDelegate which will allow each UI element to send command requests to a central handler. This central handler is a UIView subclass of which each UI Element will be a subview.
 
    Thus:
        BaseView (delegate object)
            subview:BatonButton (delegate = BaseView)
            subview:BatonPlane (delegate = BaseView)
            etc...
 
    The BaseView will cover the entire screen allowing UI objects to be placed anywhere.
 */

#import <UIKit/UIKit.h>
#import "Common.h"

//Define the protocol that must be used by the SuperView
@protocol BatonUIElementDelegate <NSObject>

@required
    /*
     * This function takes the arguments and passes them to an appropriate function for processing based on the command selected. Commands outside of the BatonCommand enum are not supported. Any new command should be listed there and handled in the BatonUIElementDelegate object.
 
        Functions for handling commands could/should be added to the @required/@optional sections here???
     */
    -(void)executeCommand:(BatonCommand) command withArguments: (NSString *) arguments;
//END @REQUIRED

@end



@interface Baton_UI_Element : UIView {
    // Holds the reference to the delegate 
    __weak id <BatonUIElementDelegate> delegate;
    BatonCommand command;
    NSString* commandArguments;
}

@property(nonatomic,weak)id delegate;
@property(nonatomic)BatonCommand command;
@property(nonatomic)NSString* commandArguments;

@end

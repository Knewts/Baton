//
//  Common.h
//  DataCenterSpike
//
//  Created by Andy Stratton on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef DataCenterSpike_Common_h
#define DataCenterSpike_Common_h

// This defines the various commands the 
// BatonUIDelegate.executeCommand can check for.



// I don't like this, but it's easier than how I would do it.
// Abstract "command" class.  objects for each type of command that define parameters and data.
//                          -David

typedef enum {
    SEND_OSC,
    SET_PLAYER_NUMBER,
    PLAY_SOUND
} BatonCommand;


#endif

//
//  song.m
//  XMLspike
//
//  Created by Tim Weidner on 5/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "song.h"

@implementation song
@synthesize trackNumber, artist, album, title, songID;

-(NSInteger)getTrackNumber {
    return self.trackNumber;
}

-(NSString*)getArtist {
	return self.artist;
}

-(NSString*)getAlbum {
	return self.album;
}

-(NSString*)getTitle {
	return self.title;
}

-(NSInteger)getSongID {
    return self.songID;
}

-(void) dealloc {
    [artist release];
    [album release];
    [title release];
    
    [super dealloc];
}
    
@end

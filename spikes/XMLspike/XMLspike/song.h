//
//  song.h
//  XMLspike
//
//  Created by Tim Weidner on 5/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface song : NSObject {
    
    NSInteger trackNumber;
    NSString *artist;
    NSString *album;
    NSString *title;
}

@property (nonatomic, readwrite) NSInteger trackNumber;
@property (nonatomic, retain) NSString *artist;
@property (nonatomic, retain) NSString *album;
@property (nonatomic, retain) NSString *title;

-(NSInteger)getTrackNumber;
-(NSString*)getArtist;
-(NSString*)getAlbum;
-(NSString*)getTitle;

@end

//
//  BatonTests.m
//  BatonTests
//
//  Created by Matthew Knewtson on 4/6/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "BatonTests.h"

@implementation BatonTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void)testOSCstring
{

    OSCstring * testString = [OSCstring oscStringfromString:@"Hello Nurse!"];

    if([testString length]%4 != 0)
    {
        STFail(@"String Length not a multiple of 4: %d",[testString length]);
    }
    if([[testString data] length] %4 != 0)
    {
        STFail(@"Data Length not a multiple of 4: %d",[testString length]);
    }

}
-(void)testOSCMessage
{
    OSCMessage * testMessage = [[[OSCMessage alloc] initWithAddress:@"/foo"] autorelease];
    if([[testMessage writeToData] length] % 4 != 0)
    {
        STFail(@"Message data length not a multiple of 4: default");
    }
}
-(void)testAddString
{
    OSCMessage * testMessage = [[[OSCMessage alloc] initWithAddress:@"/foo"] autorelease];
    [testMessage addString:@"This is a test"];

    if([[testMessage writeToData] length] % 4 != 0)
{
    STFail(@"Message data length not a multiple of 4");
}

}

-(void)testTypeString
{
    OSCMessage * testMessage = [[[OSCMessage alloc] initWithAddress:@"/foo"] autorelease];
    [testMessage addString:@"This is a test"];

    if([[testMessage typeString] compare:@",s"] != NSOrderedSame)
    {
        STFail(@"TypeString incorrect. is: %@",[testMessage typeString]);
    }
}

@end

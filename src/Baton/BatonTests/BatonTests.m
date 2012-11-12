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
    [testString release];

}
-(void)testOSCMessage
{
    OSCMessage * testMessage = [[OSCMessage alloc] initWithAddress:@"/foo"];
    if([[testMessage writeToData] length] % 4 != 0)
    {
        STFail(@"Message data length not a multiple of 4: default");
    }
    [testMessage release];
}
-(void)testAddString
{
    OSCMessage * testMessage = [[OSCMessage alloc] initWithAddress:@"/foo"];
    [testMessage addObject:[[OSCstring alloc] initWithString:@"This is a test"]];

    if([[testMessage writeToData] length] % 4 != 0)
    {
        STFail(@"Message data length not a multiple of 4");
    }
    if([[testMessage writeToData] length] == 0)
    {
        STFail(@"Nothing in the message");
    }
    [testMessage release];
}
-(void)testAddStringStatic
{
    OSCMessage * testMessage = [[OSCMessage alloc] initWithAddress:@"/foo"];
    [testMessage addObject:[OSCstring oscStringfromString:@"This is a Test"]];
    
    if([[testMessage writeToData] length] % 4 != 0)
    {
        STFail(@"Message data length not a multiple of 4");
    }
    if([[testMessage writeToData] length] == 0)
    {
        STFail(@"Nothing in the message");
    }
    [testMessage release];
}
-(void)testTypeString
{
    OSCMessage * testMessage = [[OSCMessage alloc] initWithAddress:@"/foo"];
    [testMessage addObject:[[OSCstring alloc] initWithString:@"This is a test"]];
    
    if([[testMessage writeToData] length] % 4 != 0)
    {
        STFail(@"Message data length not a multiple of 4");
    }
    if([[testMessage typeString] compare:@",s"] != NSOrderedSame)
    {
        STFail(@"TypeString incorrect. is: %@",[testMessage typeString]);
    }
    if([[testMessage writeToData] length] == 0)
    {
        STFail(@"Nothing in the message");
    }
    [testMessage release];
}
-(void)testAddInt
{
    OSCMessage * testMessage = [[OSCMessage alloc] initWithAddress:@"/foo"];
    [testMessage addObject:[OSCInt oscIntWithInt:451]];
    
    if([[testMessage writeToData] length] % 4 != 0)
    {
        STFail(@"Message data length not a multiple of 4");
    }
    if([[testMessage typeString] compare:@",i"] != NSOrderedSame)
    {
        STFail(@"TypeString incorrect. is: %@, should be ,i",[testMessage typeString]);
    }
    if([[testMessage writeToData] length] == 0)
    {
        STFail(@"Nothing in the message");
    }
    [testMessage release];
    
}
@end

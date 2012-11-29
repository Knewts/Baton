//
//  DataCenterSpikeTests.m
//  DataCenterSpikeTests
//
//  Created by Andy Stratton on 6/12/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

#import "BatonTests.h"

@implementation BatonTests

- (void)setUp
{
    [super setUp];
    testConfig = [[BatonConfiguration alloc] initDefaults];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testConfig
{
    if ([testConfig getObjectForKey:@"hostIP"] == nil) {
    }
}

@end

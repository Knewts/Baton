//
//  Baton_Region_Threshold.h
//  ARC enabled Build Center
//
//  Created by Andy Stratton on 11/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Baton_Plane_Region.h"

@interface Baton_Region_Threshold : Baton_Plane_Region




@property(nonatomic) NSString * command;
@property(nonatomic) NSString * parameters;
@property(nonatomic) Boolean hAxis; // 1 = use horizontal axis.
@property(nonatomic) CGFloat value;
@end

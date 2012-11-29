//
//  Baton_Region_Threshold.h
//  Baton - Western Michigan University KLORK
//
//  Created by Andy Stratton on 11/15/12.
//  Copyright (c) 2012 Western Michigan University. All rights reserved.
//

/*
 *  TYPE    - Must be "THRESHOLD" for this object
 *
 *      REQUIRED PARAMETERS:
 *  HAXIS   - 0 or 1: Set to Horizontal axis if 1.
 *  VALUE   - The position of the threshold.
 *  COMMAND - The command to execute upon activation.
 *  PARAMETERS - The parameters for the command above.
 *
 *      OPTIONAL PARAMETERS
 *  COLOR   - The color to draw the threshold. Overrides active direction color.
 *      ** No threshold will be colored:
 *          Yellow activates in a positive to negative direction.
 *          Red activates in a negative to positive direction.
 *          Orange activates in both directions.
 *  POS_TO_NEG  - 0/1 : 1 Acvitates in positive to negative direction.
 *  NEG_TO_POS  - 0/1 : 1 Acvitates in negative to positive direction.
 *      ** At least 1 must be true. Default is true.
 *      ** If both are false, NEG_TO_POS will default to true.
 *
 */

#import "Baton_Plane_Region.h"

@interface Baton_Region_Threshold : NSObject <Baton_Plane_Region>
{
    NSString * command;
    NSString * parameters;
    Boolean hAxis; // 1 = use horizontal axis.
    CGFloat value;
    Boolean priorWasNegative;
    Boolean negativeToPositive, positiveToNegative;
    UIColor * drawColor;
    double  startTime, maximumGlowTime;
    Boolean glowOn;
}

@end

//
//  BaseView.h
//  DataCenterSpike
//
//  Created by Andy Stratton on 10/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"

@interface BaseView : UIView
{
    XMLParser *mockXML;
    
}
-(void)awakeFromNib;

@end

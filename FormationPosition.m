//
//  FormationPosition.m
//  MicroSoccer5
//
//  Created by Trevor Delves on 16/12/2016.
//  Copyright © 2016 Apportable. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "FormationPosition.h"


@implementation FormationPosition

@synthesize startPositionPercentage;

@synthesize verticalPercAhead;
@synthesize verticalPercBehind;

@synthesize horizontalPercAhead;
@synthesize horizontalPercBehind;

-(id) init
{
    if( (self=[super init] )) {
    }
    
    return self;
}


-(id) initWithDetails:(float)xPos :(float)yPos :(float)vAhead :(float)vBehind :(float)hAhead :(float)hBehind {
    
    if( (self=[super init] )) {
        self.startPositionPercentage = CGPointMake(xPos, yPos);
        self.verticalPercAhead=vAhead;
        self.verticalPercBehind=vBehind;
        self.horizontalPercAhead=hAhead;
        self.horizontalPercBehind=hBehind;
    }
    
    return self;
}




@end


//
//  ReplayItem.m
//  MatchDay
//
//  Created by Trevor Delves on 17/03/2013.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ReplayItem.h"


@implementation ReplayItem

@synthesize frame;
@synthesize frameName;
@synthesize spriteRotation;
@synthesize position;
@synthesize height;
@synthesize scale;
@synthesize zOrder;

-(id) init
{
	if( (self=[super init] ))
    {
        frame=0;
        //position=ccp(0,0);
        height=0;
        scale=1.0;
    }
    return self;
}

-(void) toString
{
    //CCLOG(@">> %f", self.position.y);
    //CCLOG(@"Frame : %d Pos(%f,%f)", self.frame, self.position.x, self.position.y);
    //return [NSString stringWithFormat:@"Frame : %d Pos(%f,%f)", self.frame, self.position.x, self.position.y];
}

@end

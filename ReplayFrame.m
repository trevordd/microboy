//
//  ReplayFrame.m
//  MatchDay
//
//  Created by Trevor Delves on 17/03/2013.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ReplayFrame.h"


@implementation ReplayFrame

-(id) init
{
	if( (self=[super init] ))
    {
        replayItems=[[NSMutableArray alloc] init];
    }
    return self;
}

//
-(void) addReplayItem:(ReplayItem *) item
{
    [replayItems addObject:item];
}

//
-(ReplayItem *) getReplayItemAtIndex:(int)index
{
    return [replayItems objectAtIndex:index];
}

-(long) getNumberReplayItems
{
    return [replayItems count];
}


//
-(void) toString
{
    CCLOG(@"Frame Item>>>");
    for (ReplayItem * item in replayItems)
    {
        [item toString];
    }
}
@end

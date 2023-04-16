//
//  MatchData.m
//  MatchDay
//
//  Created by Trevor Delves on 17/03/2013.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "MatchData.h"


@implementation MatchData

@synthesize goalHighlightsMode;
@synthesize generalHighlightsMode;

-(id) init
{
	if( (self=[super init] )) 
    {
        //TODO - deal with memory
        replayFrames=[[NSMutableArray alloc] init];
        goalReplayFrames=[[NSMutableArray alloc] init];
        goalIndexes=[[NSMutableArray alloc] init];
        highlightReplayFrames=[[NSMutableArray alloc] init];
        highlightIndexes=[[NSMutableArray alloc] init];
    }
    return self;
}

-(void) clearReplay
{
    [replayFrames removeAllObjects];
    [goalReplayFrames removeAllObjects];
    [goalIndexes removeAllObjects];
    [highlightReplayFrames removeAllObjects];
    [highlightIndexes removeAllObjects];
    currentFrame=0;
}

//
-(void) addReplayFrame:(ReplayFrame *) frame
{
    [replayFrames addObject:frame];
}

//
-(void) toString
{
    CCLOG(@"Frame>>>");
    for (ReplayFrame * item in replayFrames)
    {
        [item toString];
    }
}

//
-(void) setCurrentFrame:(int)frame
{
    currentFrame=frame;
}

//
-(void) updateCurrentFrame
{
    currentFrame++;
}

-(ReplayFrame *) getPausedFrame
{
    ReplayFrame *rFrame;
    if (goalHighlightsMode)
    {
        if ([goalReplayFrames count] == 0) {
            return rFrame;
        }
        
        rFrame = [goalReplayFrames objectAtIndex:currentFrame];
    }
    else if (generalHighlightsMode)
    {
        if ([highlightReplayFrames count] == 0) {
            return rFrame;
        }
        
        rFrame = [highlightReplayFrames objectAtIndex:currentFrame];
    }
    else
    {
        if ([replayFrames count] == 0) {
            return rFrame;
        }
        
        rFrame = [replayFrames objectAtIndex:currentFrame];

    }
    return rFrame;
}

-(long) getCurrentFrameId
{
    return currentFrame;
}



-(bool) isMatchingReplayItem :(ReplayItem *)frame1 :(ReplayItem *)frame2 {
    if (/*[frame1 frame] == [frame2 frame] &&
        [frame1 frameName] == [frame2 frameName] &&
        [frame1 spriteRotation] == [frame2 spriteRotation] &&*/
        [frame1 position].x == [frame2 position].x &&
        [frame1 position].y == [frame2 position].y /*&&
        [frame1 height] == [frame2 height] &&
        [frame1 scale] == [frame2 scale] &&
        [frame1 height] == [frame2 height] &&
        [frame1 zOrder] == [frame2 zOrder]*/)
        
        return true;
    
    return false;
}


//
-(bool) isMatchingFrame :(ReplayFrame *)frame1 :(ReplayFrame *)frame2 {
    CCLOG(@">>> isMatchingFrame");
    ReplayItem *replayItem1a = [frame1 getReplayItemAtIndex:5];
    ReplayItem *replayItem2a = [frame2 getReplayItemAtIndex:5];
    
    if ([self isMatchingReplayItem:replayItem1a: replayItem2a] /*&&
        [self isMatchingReplayItem:replayItem1b: replayItem2b]*/) {
        CCLOG(@">>> Matching replay items found!!");
        return true;
    }
    
    return false;;
}


//
-(ReplayFrame *) getCurrentFrame
{
    ReplayFrame *rFrame;

    if (goalHighlightsMode)
    {
        if ([goalReplayFrames count] == 0) {
            return rFrame;
        }

        if (currentFrame >= [goalReplayFrames count])
        {
            currentFrame=0;
        }
        rFrame = [goalReplayFrames objectAtIndex:currentFrame++];
    }
    else if (generalHighlightsMode)
    {
        if ([highlightReplayFrames count] == 0) {
            return rFrame;
        }
        
        if (currentFrame >= [highlightReplayFrames count])
        {
            currentFrame=0;
        }
        rFrame = [highlightReplayFrames objectAtIndex:currentFrame++];
    }
    else
    {
        if ([replayFrames count] == 0) {
            return rFrame;
        }
        
        if (currentFrame >= [replayFrames count])
        {
            currentFrame=0;
        }
        rFrame = [replayFrames objectAtIndex:currentFrame++];

    }
    return rFrame;
}

//
//
-(ReplayFrame *) getFrameNoModification :(int) frameAdvanceNo
{
    ReplayFrame *rFrame;
    long nextFrame = currentFrame+frameAdvanceNo;
    
    
    if (goalHighlightsMode)
    {
        if (nextFrame >= [goalReplayFrames count])
        {
            nextFrame=0;
        }
        rFrame = [goalReplayFrames objectAtIndex:nextFrame];
    }
    else if (generalHighlightsMode)
    {
        if (nextFrame >= [highlightReplayFrames count])
        {
            nextFrame=0;
        }
        rFrame = [highlightReplayFrames objectAtIndex:nextFrame];
    }
    else
    {
        if (nextFrame >= [replayFrames count])
        {
            nextFrame=0;
        }
        rFrame = [replayFrames objectAtIndex:nextFrame];
        
    }
    return rFrame;
}


//
-(ReplayFrame *) getNextFrame
{
    ReplayFrame *rFrame;
    long nextFrame = currentFrame+2;
    
    
    if (goalHighlightsMode)
    {
        if ([goalReplayFrames count] == 0) {
            return rFrame;
        }
        
        if (nextFrame >= [goalReplayFrames count])
        {
            nextFrame=0;
        }
        rFrame = [goalReplayFrames objectAtIndex:nextFrame];
    }
    else if (generalHighlightsMode)
    {
        if ([highlightReplayFrames count] == 0) {
            return rFrame;
        }
        
        if (nextFrame >= [highlightReplayFrames count])
        {
            nextFrame=0;
        }
        rFrame = [highlightReplayFrames objectAtIndex:nextFrame];
    }
    else
    {
        if ([replayFrames count] == 0) {
            return rFrame;
        }
        
        if (nextFrame >= [replayFrames count])
        {
            nextFrame=0;
        }
        rFrame = [replayFrames objectAtIndex:nextFrame];
        
    }
    return rFrame;
}



//
-(ReplayFrame *) getFrameAtIndex:(int)frameIndex
{
    if (frameIndex >= [replayFrames count]) {
        return nil;
    }
    return [replayFrames objectAtIndex:frameIndex];
}


//
-(ReplayFrame *) getPrevFrame
{
    ReplayFrame *rFrame;
    
    if (goalHighlightsMode)
    {
        if ([goalReplayFrames count] == 0) {
            return rFrame;
        }
        
        if (currentFrame == 0)
        {
            currentFrame=[goalReplayFrames count]-1;
        }
        rFrame = [goalReplayFrames objectAtIndex:currentFrame--];

    }
    else if (generalHighlightsMode)
    {
        if ([highlightReplayFrames count] == 0) {
            return rFrame;
        }
        
        if (currentFrame == 0)
        {
            currentFrame=[highlightReplayFrames count]-1;
        }
        rFrame = [highlightReplayFrames objectAtIndex:currentFrame--];
    }
    else
    {
        if ([replayFrames count] == 0) {
            return rFrame;
        }
        
        if (currentFrame == 0)
        {
            currentFrame=[replayFrames count]-1;
        }
        rFrame = [replayFrames objectAtIndex:currentFrame--];

    }
//    if (currentFrame == 0)
//    {
//        currentFrame=[replayFrames count]-1;
//    }
    return rFrame;
}

//
-(void) addGoalMarker
{
    //CCLOG(@">> Goal CurrentFrame = %d", [replayFrames count]);

    [goalIndexes addObject: [NSNumber numberWithLong:[replayFrames count]]];
}

//
-(void) addHighlightMarker
{
    //CCLOG(@">> Goal CurrentFrame = %d", [replayFrames count]);
    [highlightIndexes addObject: [NSNumber numberWithLong:[replayFrames count]]];
}


//
-(void) setupGoalsHighlights
{
    int startFrame=1;
    int endFrame=1;
    for (NSNumber *val in goalIndexes)
    {
        int goalIndex = [val intValue];
        CCLOG(@">> Goal Index = %d", goalIndex);
        
        startFrame = goalIndex-(60*5);
        endFrame = goalIndex+(60*1);
        
        CCLOG(@">> Start Frame, End Frame = %d,%d", startFrame,endFrame);
        
        if (startFrame < 1)
            startFrame=1;
        
        if (endFrame < 1)
            endFrame=1;
                
        CCLOG(@">> Start Frame, End Frame = %d,%d", startFrame,endFrame);
        
        for (int i=startFrame; i < endFrame; i++)
        {
            
            ReplayFrame *frame = [self getFrameAtIndex:i];
            
            if (frame != nil ) {
                [goalReplayFrames addObject: [self getFrameAtIndex:i]];
            }  else {
                CCLOG(@">> Highlight frame out of bounds.. exiting loop.");
                break;
            }
        }
    }
}

//
//
-(void) setupGeneralHighlights
{
    int startFrame=1;
    int endFrame=1;
    
    for (NSNumber *val in highlightIndexes)
    {
        int highlightIndex = [val intValue]-1;
        
        CCLOG(@">> Highlight Index = %d", highlightIndex);
        
        startFrame = highlightIndex-(60*5);
        endFrame = highlightIndex+(60*2);
        
        CCLOG(@">> Start Frame, End Frame = %d,%d", startFrame,endFrame);
        
        if (startFrame < 1) {
            startFrame=1;
        }
        
        if (endFrame < 1) {
            endFrame=1;
        }
        
        CCLOG(@">> Start Frame, End Frame = %d,%d", startFrame,endFrame);
        
        for (int i=startFrame; i < endFrame; i++)
        {
            ReplayFrame *frame = [self getFrameAtIndex:i];
            
            if (frame != nil ) {
                [highlightReplayFrames addObject: frame];
            
            } else {
                CCLOG(@">> Highlight frame out of bounds.. exiting loop.");
                break;
            }
        }
    }
}



@end

//
//  MatchData.h
//  MatchDay
//
//  Created by Trevor Delves on 17/03/2013.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReplayFrame.h"

@interface MatchData : NSObject {
    long currentFrame;
    bool goalHighlightsMode;
    bool generalHighlightsMode;
    
    NSMutableArray * replayFrames;
    NSMutableArray * goalReplayFrames;
    NSMutableArray * goalIndexes;
    NSMutableArray * highlightReplayFrames;
    NSMutableArray * highlightIndexes;
}

@property (nonatomic) bool goalHighlightsMode;
@property (nonatomic) bool generalHighlightsMode;


-(id) init;
-(void) clearReplay;
-(void) addReplayFrame:(ReplayFrame *) frame;
-(void) toString;
-(void) setCurrentFrame:(int)frame;
-(ReplayFrame *) getCurrentFrame;
-(ReplayFrame *) getPrevFrame;
-(ReplayFrame *) getNextFrame;
-(ReplayFrame *) getPausedFrame;
-(ReplayFrame *) getFrameNoModification :(int) frameAdvanceNo;
-(void) addGoalMarker;
-(void) addHighlightMarker;
-(ReplayFrame *) getFrameAtIndex:(int)frameIndex;
-(void) setupGoalsHighlights;
-(void) setupGeneralHighlights;
-(long) getCurrentFrameId;
-(bool) isMatchingFrame :(ReplayFrame *)frame1 :(ReplayFrame *)frame2;
@end

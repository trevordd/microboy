//
//  ReplayFrame.h
//  MatchDay
//
//  Created by Trevor Delves on 17/03/2013.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReplayItem.h"
    
@interface ReplayFrame : NSObject {
    NSMutableArray * replayItems;
}
    
-(id) init;
-(void) addReplayItem:(ReplayItem *) item;
-(ReplayItem *) getReplayItemAtIndex:(int)index;
-(long) getNumberReplayItems;
-(void) toString;

    

@end

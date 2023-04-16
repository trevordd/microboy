//
//  HUDLayer.h
//  mySoccer
//
//  Created by Trevor Delves on 20/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// When you import this file, you import all the cocos2d classes

#import "HudModel.h"
//#import "GameModel.h"

@class SceneManager;


@interface HUDLayer : CCNode
{
    bool centerTouchBegan;
    bool outsideDeadzone;
    CGPoint swipeVector;
    CGPoint swipeStart;
    CGPoint swipeEnd;
    int direction;
    
    //TODO - where to put this
    int passButtonHeldDownTime;
    bool passButtonTouchBegan;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(id) init;
-(void) attachModel;
-(void) turnHudControlsOn;
-(void) turnHudControlsOff;

-(void) doHighPassControls;
-(void) doLowPassControls;
-(void) doShotControls;

-(void) doSwipeControls:(CGPoint) shotVector :(long) swipeTimer;
//-(void) doShotControlsSwipe:(CGPoint) shotVector;



@end

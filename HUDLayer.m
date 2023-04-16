//
//  HUDLayer.m
//  mySoccer
//
//  Created by Trevor Delves on 20/10/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HUDLayer.h"
#import "GameModel.h"

HUDLayer *hudLayer;


@implementation HUDLayer

-(id)init
{
    
    if ((self = [super init]))
    {
        NSLog(@"** HudLayer init...");
        [self setUserInteractionEnabled:YES];
    }
    return self;
}


//
+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
	// return the scene
	return scene;
}

- (void)onDemoGame:(id)sender{
    CCLOG(@">> PLAY BUTTON");
    [[GameModel sharedGameModel] setReplayState: replayForward];
    //[[[SceneManager sharedSceneManager] gameLayer] ];
    // [[[SceneManager sharedSceneManager] gameModel] setMatchInProgressInfo];
   
}

//
-(void) attachModel
{
    CCLOG(@" >> Hud Layer - attach model...");
    HudModel *hm = [HudModel sharedHudModel];
    GameModel *model = [GameModel sharedGameModel];
    
    
    CCLOG(@" >> Hud Layer - 0...");
    
    //
    [self addChild:[hm joyPassButton] z:20];
    [self addChild:[hm joyShootButton] z:20];
    
    [self addChild:[hm joyPassButtonLabel] z:20];
    [self addChild:[hm joyShootButtonLabel] z:20];
   
    //
    [self addChild:[hm joypad]  z:20];
    [self addChild:[hm joyStick] z: 20];
    [self addChild:[hm goalSpr]];
    [self addChild:[hm halftimeSpr]];
    [self addChild:[hm fulltimeSpr]];
    [self addChild:[hm kickOffSpr]];
    [self addChild:[hm passSpr]];
    [self addChild:[hm shootSpr]];
    [self addChild:[hm switchSpr]];
    [self addChild:[hm slideSpr]];
    [self addChild:[hm p1NamelabelBg]];
    [self addChild:[hm p2NamelabelBg]];
    [self addChild:[hm scorelabelBg]];
    [self addChild:[hm timelabelBg]];
//    [self addChild:[hm timeBackground]];
//    [self addChild:[hm scoreBackground]];
    [self addChild:[hm p1Namelabel]];
    [self addChild:[hm p2Namelabel]];
    [self addChild:[hm scorelabel]];
    [self addChild:[hm timelabel]];
    
    [self addChild:[hm replayPanel]];
    [self addChild:[hm playButton]];
    [self addChild:[hm stopButton]];
    [self addChild:[hm rewindButton]];
    [self addChild:[hm pauseButton]];
    [self addChild:[hm forwardButton]];
    [self addChild:[hm zoomInButton]];
    [self addChild:[hm zoomOutButton]];
    [self addChild:[hm zoomText]];
//    [self addChild:[hm ingamePauseButton]];
//    [self addChild:[hm ingamePlayButton]];
    [self addChild:[hm exitButton]];
    
    // tutorial
    [self addChild: [hm tutorialBackground1] z:10];
    //[self addChild: [hm tutorialBackground2] z:10];
    [self addChild: [hm tutorialOverlay] z:200];
    
    
    // Scanner
    [self addChild: [[model scannerObjects] objectAtIndex:0]];
    [self addChild: [[model scannerObjects] objectAtIndex:1]];
    [self addChild: [[model scannerObjects] objectAtIndex:2]];
    [self addChild: [[model scannerObjects] objectAtIndex:3]];
    [self addChild: [[model scannerObjects] objectAtIndex:4]];
    [self addChild: [[model scannerObjects] objectAtIndex:5]];
    [self addChild: [[model scannerObjects] objectAtIndex:6]];
    [self addChild: [[model scannerObjects] objectAtIndex:7]];
    [self addChild: [[model scannerObjects] objectAtIndex:8]];
    [self addChild: [[model scannerObjects] objectAtIndex:9]];
    
    [self addChild: [[model scannerObjects] objectAtIndex:10]];
    [self addChild: [[model scannerObjects] objectAtIndex:11]];
    [self addChild: [[model scannerObjects] objectAtIndex:12]];
    [self addChild: [[model scannerObjects] objectAtIndex:13]];
    [self addChild: [[model scannerObjects] objectAtIndex:14]];
    [self addChild: [[model scannerObjects] objectAtIndex:15]];
    [self addChild: [[model scannerObjects] objectAtIndex:16]];
    [self addChild: [[model scannerObjects] objectAtIndex:17]];
    [self addChild: [[model scannerObjects] objectAtIndex:18]];
    [self addChild: [[model scannerObjects] objectAtIndex:19]];
    
    [self addChild: [[model scannerObjects] objectAtIndex:20]];
    [self addChild: [[model scannerObjects] objectAtIndex:21]];
    
    [self addChild: [[model scannerObjects] objectAtIndex:22]];
    [self addChild: [[model scannerObjects] objectAtIndex:23]];
    
    [self addChild: [[model scannerObjects] objectAtIndex:24]];
    [self addChild: [[model scannerObjects] objectAtIndex:25]];
    
}


//
-(void) onEnter
{
    [super onEnter];

    CCLOG(@">>Hud Layer Scene Entering:");
    [self setUserInteractionEnabled:TRUE];
    [self setMultipleTouchEnabled:YES];
}

-(void) onExit
{
    CCLOG(@">> Hud Layer Exiting. Unscheduling tick");
    //[[CCTouchDispatcher sharedDispatcher] removeDelegate: self];
    //[[[CCDirector sharedDirector] touchDispatcher­] removeDelegate: self];
   //COMMENTED
    // [[[CCDirector sharedDirector] touchDispatcher] removeDelegate: self];
    
    [super onExit];
}


-(void) turnHudControlsOn {
  [[[SceneManager sharedSceneManager] hudLayer] setContentSize:[[CCDirector sharedDirector] viewSize]];
}


-(void) turnHudControlsOff {
    [[[SceneManager sharedSceneManager] hudLayer] setContentSize:CGSizeZero];
}


//
- (BOOL) isWithinArea:(CGPoint)touchPos :(CGPoint)spritePos :(float)fullWidth {
    //NSLog(@"TouchPos% f,%f",touchPos.x,touchPos.y);
    //NSLog(@"SpritePos% f,%f",spritePos.x,spritePos.y);
    float width = fullWidth/2;
    
    
    if (touchPos.x > spritePos.x - width &&
        touchPos.x < spritePos.x + width &&
        touchPos.y > spritePos.y - width &&
        touchPos.y < spritePos.y + width  )
        return true;
    else
        return false;
}

- (BOOL) isWithinAreaNotDeadzone:(CGPoint)touchPos :(CGPoint)spritePos :(float)width :(int)deadZoneWidth
{
    //NSLog(@"TouchPos% f,%f",touchPos.x,touchPos.y);
    //NSLog(@"SpritePos% f,%f",spritePos.x,spritePos.y);
    
    
    if (touchPos.x > spritePos.x - width &&
        touchPos.x < spritePos.x + width &&
        touchPos.y > spritePos.y - width &&
        touchPos.y < spritePos.y + width  )
    {
        //        // is outside deadzone
        //        if (touchPos.x > spritePos.x + deadZoneWidth &&
        //            touchPos.x < spritePos.x - deadZoneWidth )
        ////            touchPos.y > spritePos.y + deadZoneWidth &&
        ////            touchPos.y < spritePos.y - deadZoneWidth)
        //        {
        //            CCLOG(@"** Outside Deadzone **");
        //            return true;
        //        }
        //        else
        //        {
        //            CCLOG(@"** Inside Deadzone **");
        //            return false;
        //        }
        //
        return true;
    }
    else
        return false;
}

//
-(void) doHighPassControls
{
    Team *t = [[GameModel sharedGameModel] getTeam1];
    [[t getMainPlayer] doPassSound];

    [self doPassControls:true];
}
                                                                    

 //
-(void) doLowPassControls
{
    Team *t = [[GameModel sharedGameModel] getTeam1];
    [[t getMainPlayer] doPassSound];
    
    [self doPassControls:false];
}

-(Boolean) doesHumanKeeperHaveBall {
    
    return  [[GameModel sharedGameModel] getMatchState] == keeperHasBall && [[GameModel sharedGameModel] isKeeperWithBallHumanPlayer];
}


//
-(void) doSwipeControls:(CGPoint) shotVector :(long) swipeTimer {
    if (![GameData isSwipeControlsOn]) {
        return;
    }
    
    [self doShotControlsSwipe:shotVector :swipeTimer];
}



//
-(void) doShotControlsSwipe:(CGPoint) shotVector :(long) swipeTimer {
    if (![GameData isSwipeControlsOn]) {
        return;
    }
    
    Ball *myBall = [[GameModel sharedGameModel] getBall];
    Team *t = [[GameModel sharedGameModel] getTeam1];
    
    if([t doesTeamHaveBall:myBall])
    {
        if ([myBall attached] )
        {
            [[t getMainPlayer] shootBallSimpleVector :myBall :shotVector :swipeTimer];
            [[t getMainPlayer] doShotSound];
            
            if ([self doesHumanKeeperHaveBall]) {
                [[GameModel sharedGameModel] changeStatetoGamePlayingFromGoalKickHuman];
            }
            
        }
        else
        {
#ifdef DO_PRE_SHOT
            CCLOG(@">>> DO PRE SHOT");
            [[t getMainPlayer] setWaitingToShoot:true];
#else
            [[t getMainPlayer] doHumanSwipeSlide : shotVector]; // shotVEctor = swipeVector
            
#endif
            
        }
    }
}


//
-(void)doSwitchPlayerControls :(Ball *) ball {
    
    Team *t = [[GameModel sharedGameModel] getTeam1];
    [t activateSecondClosestPlayer:ball];
    [t resetActivePlayerverrideTimer];
    [t setOverrideActivePlayer:true];
    //activePlayersIds
}


//
-(void) doShotControls {
    if (![GameData isButtonControlsOn]) {
        return;
    }

    Ball *myBall = [[GameModel sharedGameModel] getBall];
    Team *t = [[GameModel sharedGameModel] getTeam1];
    
    if([t doesTeamHaveBall:myBall])
    {
        if ([myBall attached] )
        {
//            [[t getMainPlayer] doShotSound];
//            [[t getMainPlayer] shootBallHuman:myBall] ;
            
            NSLog(@"***Pre Shoot Sound");
            [[t getMainPlayer] doShotSound];
            NSLog(@"***Pre Shoot");
            [[t getMainPlayer] shootBallHuman:myBall] ;
            NSLog(@"***Post Shoot");

        }
        else
        {
#ifdef DO_PRE_SHOT
            CCLOG(@">>> DO PRE SHOT");
            [[t getMainPlayer] setWaitingToShoot:true];
#else
            //
#endif
            
        }
    }
}

-(void) doSHotControlsNew {
    if (![GameData isButtonControlsOn]) {
        return;
    }
    
    NSLog(@"***Shoot");
    Ball *myBall = [[GameModel sharedGameModel] getBall];
    Team *t = [[GameModel sharedGameModel] getTeam1];
    
    if([t doesTeamHaveBall:myBall])
    {
        if ([myBall attached] )
        {
            NSLog(@"***Pre Shoot Sound");
            [[t getMainPlayer] doShotSound];
            NSLog(@"***Pre Shoot");
            [[t getMainPlayer] shootBallHuman:myBall] ;
            NSLog(@"***Post Shoot");

        }
        else
        {
#ifdef DO_PRE_SHOT
            CCLOG(@">>> DO PRE SHOT");
            [[t getMainPlayer] setWaitingToShoot:true];
#else
            //
#endif
        }
    }

}


//
-(void) doPassControls:(bool) highPass
{
    if (![GameData isButtonControlsOn]) {
        return;
    }
    
    Team *t = [[GameModel sharedGameModel] getTeam1];
    Ball *myBall = [[GameModel sharedGameModel] getBall];
    
    if([t doesTeamHaveBall:myBall])
    {
        if ([myBall attached] )
        {
            if (!highPass)
            {
                [[t getMainPlayer] doPassSound];
                [[t getMainPlayer] passToClosestPlayerHuman:myBall];
                
#ifdef DO_AFTER_PASS_STAND_STILL
                [[t getMainPlayer] startStayStillAfterPassCounter];
#endif
                
#ifdef DO_CONTROLS_AFTER_PASS_STAND_STILL
                [[GameModel sharedGameModel] setControlsPassJustMade:true];
#endif
            }
            else
            {
                [[t getMainPlayer] doPassSound];
                [[t getMainPlayer] passToClosestPlayerHumanHigh:myBall];
#ifdef DO_AFTER_PASS_STAND_STILL
                [[t getMainPlayer] startStayStillAfterPassCounter];
#endif
                
#ifdef DO_CONTROLS_AFTER_PASS_STAND_STILL
                [[GameModel sharedGameModel] setControlsPassJustMade:true];
#endif
            }
            [Team setControlsActive:false];
        }
        else
        {
#ifdef DO_PRE_PASS
            CCLOG(@">>> DO PRE PASS 1...");
            [[t getMainPlayer] setWaitingToPass:true];
            
#else
            
            [[t getMainPlayer] doHumanSlide];
#endif
            
        }
    }
    else
    {
#ifdef DO_PRE_PASS
        CCLOG(@">>> DO PRE PASS 2...");
        [[t getMainPlayer] setWaitingToPass:true];
#else
        
        [[t getMainPlayer] doHumanSlide];
#endif
        
    }
}



-(void) doJoystickControls:(CGPoint)convertedLocation
{
    
    if (convertedLocation.x < SCREEN_X_CENTER)
    {
        // check touch position is within circle radius
        if (centerTouchBegan)
        {
            CGPoint controlVector = ccpSub(convertedLocation, [[HudModel sharedHudModel] joypad].position);
            CGPoint controlVecNorm = ccpNormalize(controlVector);
            float joystickDistance = ccpDistance(CGPointMake(JOYSTICK_CENTER_X,JOYSTICK_CENTER_Y),convertedLocation);
            float finalStickDistance=joystickDistance;
            if (joystickDistance>=JOYSTICK_DISTANCE_FROM_CENTER) {
                finalStickDistance=JOYSTICK_DISTANCE_FROM_CENTER;
            }
            
            
            CGPoint joyStickVec = ccpMult(controlVecNorm, finalStickDistance);
            CGPoint joyStickPos = ccpAdd(ccp(JOYSTICK_CENTER_X,JOYSTICK_CENTER_Y), joyStickVec);
            
            [[HudModel sharedHudModel] setJoyStickPosition:&joyStickPos];
            
            if (! [self isWithinArea: [[HudModel sharedHudModel] joypad].position: [[HudModel sharedHudModel] joyStick].position: JOYSTICK_DEADZONE_SIZE]) {
                //if (outsideDeadzone)
                //{
                //CCLOG(@"** Outside Deadzone 2aa **");
                CGFloat rotationRadians = ccpToAngle(controlVector);
                CGFloat rotationDegrees = -CC_RADIANS_TO_DEGREES(rotationRadians);
                
                rotationDegrees += 90.0f;
                //CCLOG(@">>> * Control vector = %f,%f, angle = %f", controlVector.x, controlVector.y, rotationDegrees);
                
                //[[[[GameModel sharedGameModel] getTeam1] getMainPlayer] setSpriteRotation:rotationDegrees];
                
                Ball *myBall = [[GameModel sharedGameModel] getBall];
                
                if([[GameModel sharedGameModel] getMatchState] == keeperHasBall)
                {
                    
                    [[[[GameModel sharedGameModel] getTeam1] getKeeper] setSpriteRotationHumanControls:rotationDegrees: myBall];
                    [Team setControlsActive:true];
                }
                else
                {
                    //TODO changed
                    //[[[[GameModel sharedGameModel] getTeam1] getPlayer:PLAYER8_ID] setSpriteRotationHumanControls:rotationDegrees: myBall];
                    [[[[GameModel sharedGameModel] getTeam1] getMainPlayer] setSpriteRotationHumanControls:rotationDegrees: myBall];
                    [Team setControlsActive:true];
                }
            }
        }
    }
}


-(float) getSwipeScreenWidth {
    float width;
    width = [GameData getScreenWidth]/2;
    
    // we want half screen plus an eigth of the screen (half +1/4 of a half)
    width -= width/3;
    return width;
}

-(float) getShotPassButtonWidth {
    float width = [[HudModel sharedHudModel] joyPassButton].contentSizeInPoints.width;
    width += width*0.4;
    return width;
}



- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CGPoint location = [touch locationInView: [touch view]];
    CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
//    CCLOG(@">> Game State : %d" , [[GameModel sharedGameModel] getGameState]);
//    CCLOG(@">> Match state : %d" , [[GameModel sharedGameModel] getMatchState]);
//    CCLOG(@">> Match mode : %d" , [[GameModel sharedGameModel] matchMode]);
    
    if ([[GameModel sharedGameModel] getMatchState] == showTutorial) {
        NSLog(@">>>>> Tutorial shown");
        
        //[[[SceneManager sharedSceneManager] swipeInfoLayer] turnSwipeInfoOff];
        [[HudModel sharedHudModel] showTutorial : false];

        [[GameModel sharedGameModel] setMatchState:kickOff];
        
        if ([GameData isPracticeMatch]) {
            [[GameData sharedGameDataManager] setTutorialShownPractice:true];
        } else {
            [[GameData sharedGameDataManager] setTutorialShown:true];
        }
        return;
    }
    

    // allow human player to continue
    if ([[[GameModel sharedGameModel] getTeam1] isHumanTeam]) {
        if ([[GameModel sharedGameModel] getMatchState] == goal) {
            [[GameModel sharedGameModel] changeStatetoKickOffAfterGoal];
            return;
        }
    }
    
    
    //float width = BUTTON_WIDTH;
    //float width = [[HudModel sharedHudModel] joyPassButton].contentSizeInPoints .width;
    float width = [self getShotPassButtonWidth];
    
#ifdef DO_DOUBLE_TAP_PASS
    if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyPassButton].position : width])
    {
        passButtonHeldDownTime=0;
        //bool passButtonTouchBegan;
    }
    else if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyShootButton].position : width ])
    {
        NSLog(@"Shoot");
        [self doShotControls];
    }
    
    
#else
    if ([self isWithinArea : convertedLocation: [[HudModel sharedHudModel] joyPassButton].position : width] ||
        [self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyPassButtonLabel].position : width]) //temp
    {
        #ifdef DO_HOLD_DOWN_PASS
            passButtonHeldDownTime=0;
        #else
            NSLog(@"***Pass");
            [self doPassControls:false];
        #endif
    }
//    else if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyLongPassButton].position : width ] ||
//             [self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyLongPassButtonLabel].position : 60 ]) //temp
//    {
//        #ifdef DO_HOLD_DOWN_PASS
//        // do nothing
//        #else
//            [self doPassControls:true];
//        #endif
//    }
    else if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyShootButton].position : width ] ||
             [self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyShootButtonLabel].position : width ]) //temp
    {
        
        //
        Ball *myBall = [[GameModel sharedGameModel] getBall];

        if ([myBall doesTeamActuallyHaveBallTeamId:TEAM1] ) {
            NSLog(@"Shoot");
            [self doShotControls];
        } else {
            [self doSwitchPlayerControls : myBall];
        }
    }
    else
    {
#ifdef DO_SWIPE_SHOT
        
        if (convertedLocation.x > [self getSwipeScreenWidth]) { //-(PITCH_X_CENTER/2)
            swipeStart = convertedLocation;
            swipeVector=ccp(0,0);
            [[GameModel sharedGameModel] resetSwipeTime];
            CCLOG(@"**>> Swipe Start : %f,%f", swipeStart.x, swipeStart.y);
        }
#endif
        
    }
    
#endif
    
    
#ifdef DO_SWIPE_CONTROLS
    
#else
    if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joypad].position: width])
    {
        NSLog(@"Center");
        direction=0;
        
        if ([self isWithinArea: [[HudModel sharedHudModel]joypad].position: [[HudModel sharedHudModel] joyStick].position: JOYSTICK_DEADZONE_SIZE])
        {
            CCLOG(@"<<** Inside Deadzone **");
            centerTouchBegan=true;
            outsideDeadzone=false;
        }
        else
        {
            CCLOG(@"** Outside Deadzone **");
            //centerTouchBegan=true;
            outsideDeadzone=true;
            centerTouchBegan=true;
            //CGPoint targetVec = ccp(0,10);
            
            //[[[[GameModel sharedGameModel] getTeam1] getMainPlayer] setVector:targetVec];
        }
    }
#endif
    
    
#ifdef IGNORE_USER_CONTROLS
    // only move player if either team has the ball directly under control
    // otherwise let the AI moe the player
    Ball *myBall = [[GameModel sharedGameModel] getBall];
    if (![myBall doesTeamActuallyHaveBall:[[GameModel sharedGameModel] getTeam1]] && ![myBall doesTeamActuallyHaveBall:[[GameModel sharedGameModel] getTeam2]]) {
        CCLOG(@"** Team 1 has ball");
        [self doJoystickControls:convertedLocation];
    }
#else
    
    [self doJoystickControls:convertedLocation];
#endif
    
    
    //return YES;
}

//
- (void)touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event {

    if ([[GameModel sharedGameModel] getMatchState] == showTutorial) {
        return;
    }

    
    float width = [self getShotPassButtonWidth];
    
    
    CGPoint location = [touch locationInView: [touch view]];
    CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    //float width = 40.0; //TODO - temporary
    
    
//    if ([[GameModel sharedGameModel] getGameState] != matchStarted)
//    {
//        CCLOG(@">>GAME LAYER OFF");
//        return;
//    }
//    else
//    {
//        CCLOG(@">>GAME LAYER ON");
//        
//    }
    
#ifdef DO_DOUBLE_TAP_PASS
    if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyPassButton].position : width])
    {
        //passButtonHeldDownTime=true;
        //bool passButtonTouchBegan;
        passButtonHeldDownTime++;
    }
#endif
    
#ifdef DO_HOLD_DOWN_PASS
    if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyPassButton].position : width])
    {
        ++passButtonHeldDownTime;
    }
#endif
    

    
    //NSLog(@"Touch Moved Pos = %f %f", convertedLocation.x, convertedLocation.y);
    //#ifdef DO_SWIPE_CONTROLS
    // nothing for now
    //#else
    
    // restricts joystick movement controls to left side of screen ( so to not affect pass and shoot buttons)
    // also - offer option to have left or right handed controls
#ifdef IGNORE_USER_CONTROLS
    // only move player if either team has the ball directly under control
    // otherwise let the AI moe the player
    Ball *myBall = [[GameModel sharedGameModel] getBall];
    if (![myBall doesTeamActuallyHaveBall:[[GameModel sharedGameModel] getTeam1]] && ![myBall doesTeamActuallyHaveBall:[[GameModel sharedGameModel] getTeam2]] ) {
        CCLOG(@"** Team 1 has ball");
        [self doJoystickControls:convertedLocation];
    }
#else
    
    [self doJoystickControls:convertedLocation];
#endif
}




//
//- (void)ccTouchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
- (void)touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
  
    if ([[GameModel sharedGameModel] getMatchState] == showTutorial) {
        return;
    }

    
    CGPoint location = [touch locationInView: [touch view]];
    CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    //float width = BUTTON_WIDTH;
    
    //float width = [[HudModel sharedHudModel] joyPassButton].contentSizeInPoints.width;
    float width = [self getShotPassButtonWidth];
    
  //  NSLog(@">>>Button Content Size - Width : %f | Height : %f," ,[[HudModel sharedHudModel] joyPassButton].contentSizeInPoints.width,
  //        [[HudModel sharedHudModel] joyPassButton].contentSizeInPoints.height);
    
    if (!self.visible)
    {
        return;
    }
    
    
#ifdef IGNORE_USER_CONTROLS
    // only move player if either team has the ball directly under control
    // otherwise let the AI move the player
    Ball *myBall = [[GameModel sharedGameModel] getBall];
    if (![myBall doesTeamActuallyHaveBall:[[GameModel sharedGameModel] getTeam1]] && ![myBall doesTeamActuallyHaveBall:[[GameModel sharedGameModel] getTeam2]]) {
        CCLOG(@"** Team 1 has ball");
        [Team setControlsActive:false];
        Player *p = [[[GameModel sharedGameModel] getTeam1] getMainPlayer];
        CGPoint existingVec = ccpNormalize([p vector]);
        [[[[GameModel sharedGameModel] getTeam1] getMainPlayer] setVector:existingVec];
    }
    
#else
    [Team setControlsActive:false];
    Player *p = [[[GameModel sharedGameModel] getTeam1] getMainPlayer];
    CGPoint existingVec = ccpNormalize([p vector]);
    [[[[GameModel sharedGameModel] getTeam1] getMainPlayer] setVector:existingVec];
    
#endif
    
    
#ifdef STOP_BALL_WHEN_PLAYER_STOPS
    //CCLOG(@">>Stop ball if player has stopped");
    
          if ([[[GameModel sharedGameModel] getTeam1] isHumanTeam] && ![self doesHumanKeeperHaveBall]) {
              Ball *myBall = [[GameModel sharedGameModel] getBall];
              Player *p = [[[GameModel sharedGameModel] getTeam1] getMainPlayer];
              
              if (![p isKeeper]) {
                  if ([p playerHasBall:myBall]) {
                      [p doPlayerStoppedMovingCheck:myBall];
                  }
              }
          }
#endif
    
    //    swipeEnd = convertedLocation;
    //    CCLOG(@">> Swipe End : %f,%f", swipeStart.x, swipeStart.y);
    //    swipeVector = ccpSub(swipeEnd, swipeStart);
    //[[team1 getMainPlayer] setVector:swipeVector];
    
  /*  CGFloat rotationRadians = ccpToAngle(swipeVector);
    CGFloat rotationDegrees = -CC_RADIANS_TO_DEGREES(rotationRadians);
    rotationDegrees += 90.0f;
    
    
    CCLOG(@">>Swipe Vector: %f,%f", swipeVector.x, swipeVector.y);
    CCLOG(@">>Rotation Radians :  %f", rotationRadians);
   */
    
    // set joypad position back to center pos
    CGPoint joyCenter = [[[HudModel sharedHudModel] joypad] position];
    [[HudModel sharedHudModel] setJoyStickPosition : &joyCenter];
    
    

    
    //
    if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyPassButton]. position : width] ||
        [self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyShootButton].position : width ])
    {
        //CCLOG(@">>KEEPER : pass or shot pressed");
        if (([[GameModel sharedGameModel] getMatchState] == keeperHasBall) && [[GameModel sharedGameModel] isKeeperWithBallHumanPlayer])
        {
            //CCLOG(@">>KEEPER : pass or shot pressed - do goal kick");
            Player *keeper = [[GameModel sharedGameModel] getKeeperWithBall];
            //Player *keeper = [self getKeeperWithBall];
            
            Ball *b = [[GameModel sharedGameModel] getBall];
            
            if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyPassButton].position : width] )
            {
                 [keeper passToClosestPlayerHuman:b];
            }
            else
            {
                 [keeper kickBasicGoalKick:b];
            }
            //TODO should this be done here or where kick takes place
            // [[GameModel sharedGameModel] changeStatetoGamePlayingFromGoalKickHuman];
            
            return;
        }
    }
    

    if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyPassButton].position : width])
    {
        
    #ifdef DO_HOLD_DOWN_PASS
        ++passButtonHeldDownTime;
        
       // CCLOG(@">>> Pass Button held down time : %d", passButtonHeldDownTime);
        if (passButtonHeldDownTime >= HIGH_PASS_BUTTOM_TIME_THRESHOLD)
        {
           // CCLOG(@">>High pass");
            [self doPassControls:true];
        }
        else
        {
            //CCLOG(@">>Low pass");
            [self doPassControls:false];
        }
        passButtonHeldDownTime=0;
        
    #endif
    }
    else if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyShootButton].position : width ])
    {
        //
    }
    else
    {
#ifdef DO_SWIPE_SHOT
        
        
        if (convertedLocation.x > [self getSwipeScreenWidth]) { //-(PITCH_X_CENTER/2)
            
            // 
            if (swipeStart.x !=0 && swipeStart.y !=0)
            {

                swipeEnd = convertedLocation;
                CCLOG(@">> Swipe End : %f,%f", swipeStart.x, swipeStart.y);
                swipeVector = ccpSub(swipeEnd, swipeStart);
                
                CCLOG(@">>Do Swipe Shot - Swipe Vec : %f,%f", swipeVector.x, swipeVector.y);
                CCLOG(@">>Swipe Time - Swipe Vec : %ld,", [[GameModel sharedGameModel] swipeTimer]);
                
        
                if (ccpLength(swipeVector) > 0) {
                    [self doSwipeControls : swipeVector : [[GameModel sharedGameModel] swipeTimer]];
                }
            
                
                swipeVector=ccp(0,0);
                [[GameModel sharedGameModel] resetSwipeTime];
                swipeStart.x=0;
                swipeStart.y=0;
                
            }
        }
    
#endif
  }
    
}

@end

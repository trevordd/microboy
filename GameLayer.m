
//
//  HelloWorldLayer.m
//  mySoccer
//
//  Created by Trevor Delves on 07/10/2011.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// Import the interfaces
#import "GameLayer.h"
#import "HUDLayer.h"

#import "Player.h"
#import "Team.h"
#import "Ball.h"
#import "GameData.h"
#import "LineNode.h"


CCSprite *seeker1;
CCSprite *cocosGuy;


@implementation GameLayer


//
+(id) sceneNew
{
    NSLog(@"*** GAME LAYER- SCENE INIT NEW");
   CCScene *scene = [CCScene node];
    
    //
    GameLayer *gameLayer = [[GameLayer alloc] initSimple];
    GameInfoLayer *gameInfoLayer = [GameInfoLayer node];
    HUDLayer *hudLayer = [[HUDLayer alloc] init];
    
    //
    [[SceneManager sharedSceneManager] setGameLayer:gameLayer];
    [[SceneManager sharedSceneManager] setGameInfoLayer:gameInfoLayer];
    [[SceneManager sharedSceneManager] setHudLayer:hudLayer];
    
    //
    [scene addChild: hudLayer z:3];
    [scene addChild: gameInfoLayer z:4];
    [scene addChild: gameLayer];
    
    return scene;
}


//
-(id) initSimple
{
    if( (self=[super init]))
    {
        CCLOG(@">> GAME LAYER - initialise");
        
        // activate touches on this scene
        //self.userInteractionEnabled = TRUE;
        // [self setUserInteractionEnabled:YES];

        
        //COMMENTED

        /*[[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self
                                                                  priority:0
                                                           swallowsTouches:NO];
        
        */
    }
    return self;
}

//
-(void) attachModel
{
    CCLOG(@">> Attach Game Model***");
    GameModel *model = [GameModel sharedGameModel];
    
    // pitch
    [self addChild: [model stadium] z:100];
//    [self addChild: [model stadiumLevels] z:52];
    
    
    [self addChild: [model pitch] z:0];
    //[self addChild: [model teamBadge] z:0];
    
    
    [self addChild: [model pitchPattern] z:0];
    
    [self addChild: [model goalTop] z:13];
    [self addChild: [model goalBottom] z:13];
    
    [self addChild: [model goalTopMask] z:GOAL_HEIGHT];
    [self addChild: [model goalBottomMask] z:GOAL_HEIGHT];
    
    [self addChild: [model micropitchlogo1] z:0];
    [self addChild: [model micropitchlogo2] z:0];
    
    [self addChild: [model microboypitchlogo1] z:0];
    [self addChild: [model microboypitchlogo2] z:0];
    
    [self addChild: [model microboysolopitchlogo1] z:0];
    [self addChild: [model microboysolopitchlogo2] z:0];
    
    // crowd
    [self addChild: [model bottomCrowd] z:1];

    
    // adverts
    [self addChild: [model leftAdvert] z:0];
    [self addChild: [model rightAdvert] z:0];
    [self addChild: [model leftAdvertBlank] z:0];
    [self addChild: [model rightAdvertBlank] z:0];
    
    [self addChild: [model leftAdvertLogo] z:1];
    [self addChild: [model rightAdvertLogo] z:1];
    [self addChild: [model topAdvertLogo] z:1];
    [self addChild: [model bottomAdvertLogo] z:1];
    
    [self addChild: [model leftAdvertMicroLogo] z:1];
    [self addChild: [model rightAdvertMicroLogo] z:1];
    [self addChild: [model topAdvertMicroLogo] z:1];
    [self addChild: [model bottomAdvertMicroLogo] z:1];
    
    [self addChild: [model leftAdvertEmail] z:1];
    [self addChild: [model rightAdvertEmail] z:1];
    [self addChild: [model leftAdvertTwitter] z:1];
    [self addChild: [model rightAdvertTwitter] z:1];
    
//    [self addChild: [model leftHoardingBorderTop] z:0];
//    [self addChild: [model leftHoardingBorderBottom] z:0];
//    [self addChild: [model rightHoardingBorderTop] z:0];
//    [self addChild: [model rightHoardingBorderBottom] z:0];
    
    
    [self addChild: [model topHoarding] z:50];
    [self addChild: [model bottomHoarding] z:50];
    
    [self addChild: [model topHoardingBlank] z:0];
    [self addChild: [model bottomHoardingBlank] z:0];

    
    
    [self addChild: [model topHoardingBorder] z:0];
    [self addChild: [model bottomHoardingBorder] z:0];
    
    
    [self addChild: [model topAdvert1] z:50];
    [self addChild: [model topAdvert1b] z:50];
    [self addChild: [model topAdvert2b] z:51];
    [self addChild: [model topAdvert2] z:51];
    
    
    // banner logo
    [self addChild: [model microboybanner] z:0];
    [self addChild: [model stairs] z:1];
    
    
    
    
    // ball
    [self addChild: [[model getBall] shadow] z:0 ];
    [self addChild: [[model getBall] sprite] z:1 ];

    
    // team 1
    int i= 1;
    for (Player *p in [[model getTeam1] getPlayers])
    {
        //[[[p sprite] parent] removeChild:[p sprite] cleanup:YES];
        if ([p playerId] ==1) {
            [self addChild: [p sprite] z:KEEPER_Z_ORDER_LEVEL ]; // 100
        } else {
            [self addChild: [p sprite] z:1 ]; // 100
        }
        
        [self addChild: [p shadow] z:0 ];
        //[self addChild: [p nameLabel] z:0 ];
        i++;
    }
    
    // team 2
    i=1;
    for (Player *p in [[model getTeam2] getPlayers])
    {
        //[[[p sprite] parent] removeChild:[p sprite] cleanup:YES];
        if ([p playerId] ==1) {
            [self addChild: [p sprite] z:KEEPER_Z_ORDER_LEVEL ];
        } else {
            [self addChild: [p sprite] z:1 ];
        }
        [self addChild: [p shadow] z:0 ];
        //[self addChild: [p nameLabel] z:0 ];
        i++;
    }
    
    //
    [self addChild: [model activePlayerSprite]];
    [self addChild: [model activeTargetSprite]];
    [self addChild: [model playerArrowSprite]];
    
    //
//    [self addChild: [[model scannerObjects] objectAtIndex:0]];
//    [self addChild: [[model scannerObjects] objectAtIndex:1]];
//    [self addChild: [[model scannerObjects] objectAtIndex:2]];
//    [self addChild: [[model scannerObjects] objectAtIndex:3]];
//    [self addChild: [[model scannerObjects] objectAtIndex:4]];
//    [self addChild: [[model scannerObjects] objectAtIndex:5]];
//    [self addChild: [[model scannerObjects] objectAtIndex:6]];
//    [self addChild: [[model scannerObjects] objectAtIndex:7]];
//    [self addChild: [[model scannerObjects] objectAtIndex:8]];
//    [self addChild: [[model scannerObjects] objectAtIndex:9]];
    
      
    
    //
    [self addChild: [model testActivePlayer1]];
    [self addChild: [model testActivePlayer2]];
    [self addChild: [model testKeeperTeam1]];
    [self addChild: [model testKeeperTeam2]];
    [self addChild: [model testBall]];
    [self addChild: [model testLeftGoal]];
    [self addChild: [model testRightGoal]];
    
    for (CCSprite *fovSprite in [model fovSprites])
    {
        [self addChild: fovSprite];
    }
    
    // initialise hud selectors for replay buttons
    [[[HudModel sharedHudModel] playButton ] setTarget:self selector:@selector(doPlayButton:)];
    [[[HudModel sharedHudModel] pauseButton ] setTarget:self selector:@selector(doPauseButton:)];
    [[[HudModel sharedHudModel] rewindButton ] setTarget:self selector:@selector(doRewindButton:)];
    [[[HudModel sharedHudModel] forwardButton ] setTarget:self selector:@selector(doForwardButton:)];
    [[[HudModel sharedHudModel] stopButton ] setTarget:self selector:@selector(doStopButton:)];
    [[[HudModel sharedHudModel] zoomOutButton ] setTarget:self selector:@selector(doZoomOutButton:)];
    [[[HudModel sharedHudModel] zoomInButton ] setTarget:self selector:@selector(doZoomInButton:)];
//    [[[HudModel sharedHudModel] ingamePauseButton ] setTarget:self selector:@selector(doInGamePauseButton:)];
//    [[[HudModel sharedHudModel] ingamePlayButton ] setTarget:self selector:@selector(doInGamePlayButton:)];
    [[[HudModel sharedHudModel] exitButton ] setTarget:self selector:@selector(doExitButton:)];
   
}


//
-(void) attachModelNoTagsss
{
    CCLOG(@">> Attach Game Model");
    GameModel *model = [GameModel sharedGameModel];
    
    // pitch
    [self addChild: [model pitch] z:0];
    [self addChild: [model goalTop] z:13];
    [self addChild: [model goalBottom] z:13];
    
    // ball
    [self addChild: [[model getBall] sprite]];
    [self addChild: [[model getBall] shadow]];

    
    // team 1
    for (Player *p in [[model getTeam1] getPlayers])
    {
        //[[[p sprite] parent] removeChild:[p sprite] cleanup:YES];
        [self addChild: [p shadow] z:0];
        [self addChild: [p sprite] z:1];
        //[self addChild: [p nameLabel]];
        
    }
    
    // team 2
    for (Player *p in [[model getTeam2] getPlayers])
    {
        //[[[p sprite] parent] removeChild:[p sprite] cleanup:YES];
        [self addChild: [p shadow] z:0];
        [self addChild: [p sprite] z:1];
        //[self addChild: [p nameLabel]];
    }
    
    //
    [self addChild: [model testActivePlayer1]];
    [self addChild: [model testActivePlayer2]];
    [self addChild: [model testKeeperTeam1]];
    [self addChild: [model testKeeperTeam2]];
    [self addChild: [model testBall]];
    [self addChild: [model testLeftGoal]];
    [self addChild: [model testRightGoal]];
    
    
    for (CCSprite *fovSprite in [model fovSprites])
    {
        [self addChild: fovSprite];
    }
}

//
-(void) addMyChild:(CCNode *)node z:(int)z tag:(int)tag
{
    //CCLOG(@">> Add My Child");
    //COMMENTED

   /* if ([self getChildByTag:tag] == nil)
    {
        [self addChild: node z:z tag:tag];
    }*/
}

//
-(void) removeMyChild:(int)tag
{
    //COMMENTED

    /*if ([self getChildByTag:tag] != nil)
    {
        [self removeChildByTag:tag cleanup:true];
    }*/
}

//
-(void) attachPlayersAndBall
{
    CCLOG(@">> Attach Players and Ball");
    GameModel *model = [GameModel sharedGameModel];
    
    // ball
    [self addMyChild:[[model getBall] sprite] z:0 tag:50];
    [self addMyChild:[[model getBall] shadow] z:0 tag:51];
    
    //    [self addChild: [[model getBall] shadow]];
    //    [self addChild: [[model getBall] sprite]];
    
    // team 1
    int i=1;
    for (Player *p in [[model getTeam1] getPlayers])
    {
        //[[[p sprite] parent] removeChild:[p sprite] cleanup:YES];
        [self addMyChild: [p shadow] z:0 tag:i+100];
        [self addMyChild: [p sprite] z:1 tag:i+1000];
        //[self addMyChild: [p nameLabel]z:1 tag:i+10000];
        i++;
    }
    
    // team 2
    
    i=1;
    for (Player *p in [[model getTeam2] getPlayers])
    {
        //[[[p sprite] parent] removeChild:[p sprite] cleanup:YES];
        [self addMyChild: [p shadow] z:0 tag:i+200];
        [self addMyChild: [p sprite] z:1 tag:i+2000];
        //[self addMyChild: [p nameLabel] z:1 tag:i+20000];
        i++;
    }
}

//
-(void) detachPlayersAndBall
{
    CCLOG(@">> Detach Player and Ball");
    GameModel *model = [GameModel sharedGameModel];
    
    // ball
    [self removeMyChild: 50];
    [self removeMyChild: 51];
    
    // team 1
    int i=1;
    for (Player *p in [[model getTeam1] getPlayers])
    {
        //[[[p sprite] parent] removeChild:[p sprite] cleanup:YES];
        [self removeMyChild: i+100];
        [self removeMyChild: i+1000];
        [self removeMyChild: i+10001];
        i++;
    }
    
    // team 2
    i=1;
    for (Player *p in [[model getTeam2] getPlayers])
    {
        [self removeMyChild: i+200];
        [self removeMyChild: i+2000];
        [self removeMyChild: i+20001];
        i++;
    }
    
}


-(void) onExit
{
    CCLOG(@">> Game Scene Exiting. Unscheduling tick");
   
    //COMMENTED
    //[[[CCDirector sharedDirector] touchDispatcher] removeDelegate: self];
    
    
    [self unschedule:@selector(tick:)];
    [self removeAllChildrenWithCleanup:YES];
    
    [[[GameModel sharedGameModel] matchData] clearReplay];
    [super onExit];
}



-(void) onEnter
{
    CCLOG(@">>Game Scene Entering:");
    
    //
    CGSize winSize = [[CCDirector sharedDirector] viewSizeInPixels];
    CCColor *pitchGreen = [CCColor colorWithRed:(59.0/255.0) green:(106.0/255.0) blue:(17.0/255.0) alpha:(1.0f)];
    CCNodeColor *nodeColor = [CCNodeColor nodeWithColor:pitchGreen width:winSize.width height:winSize.height];
    nodeColor.anchorPoint=CGPointMake(0.5, 0.5);
    [self addChild:nodeColor];
    
    self.anchorPoint=ccp(0.0f,0.0f);
    
    // Only zoom sometimes
    if ([Util random5050]) {
        self.scale=0.30;
    } else {
       self.scale= [GameData getLastGameScale];
    }
    
    //
    [self attachModel];
    
    //
    
    if (![[GameData sharedGameDataManager] matchInProgress])
    {
        CCLOG(@">> NEW MATCH");
        [[GameModel sharedGameModel] resetGame];
        [[GameModel sharedGameModel] initMatchTeamData];
        [[GameModel sharedGameModel] initMatch];
        [[GameModel sharedGameModel] setGameState:matchInfo];
    }
    else
    {
        CCLOG(@">> RESUME MATCH");
        
        self.scale= [GameData getLastGameScale];
        
        
        [[GameModel sharedGameModel] setGameState:matchStarted];
        [[GameModel sharedGameModel] startMatchClock];
        
        //
        if ([[[GameModel sharedGameModel] getTeam1] isHumanTeam]) {
            [[[SceneManager sharedSceneManager] hudLayer] turnHudControlsOn];
            [[HudModel sharedHudModel] showControls];
            //[[HudModel sharedHudModel] setControlsColour : [CCColor yellowColor]];
        }
        
         [[[SceneManager sharedSceneManager] gameInfoLayer ] setVisible:false];         //gameInfoLayer.visible=false;
    }
    
    [[HudModel sharedHudModel] showTutorial : false];
    
    //
    [[[SceneManager sharedSceneManager] hudLayer] attachModel];
  //  [self centerPitch];
    
//    CGPoint pitchCenter = CGPointMake(PITCH_X_CENTER-50,PITCH_Y_CENTER-275);
//    self.position=pitchCenter;//
  
    
    //
    #ifdef DRAW_PITCH
        [self drawPitch];
    #endif
    
    //COMMENTED
    //[self schedule:@selector(tick:)];
    
    [super onEnter];
}

- (void)update:(CCTime)delta {
    //CCLOG(@">>>*Update...");
    [self tick:delta];
}


-(void) initTeamSprites
{
//    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"bothteams2_default.plist"];
//    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"bothteams2Keeper_default.plist"];
//    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"ballsNew_default.plist"];
//   // [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"keeperSprites.plist"];
//    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"players.plist"];
//    
// 
//    // TODO pass in gameLayer or access singleton and add ball sprite in there
//    ball = [[Ball alloc] initWithSprite:@"ball1.png" :self];
//    [ball setPositionX:PITCH_X_CENTER Y:PITCH_Y_CENTER];
//    
//    //
//    team1 = [[Team alloc] initWithId: @"blueN1.png" myTeamId:1];
//    team2 = [[Team alloc] initWithId: @"blueN2.png" myTeamId:2];
//    
//    [team1 setLineupPositions];
//    [team2 setLineupPositions];
//    
//    [team1 setActivePlayerSprite:activePlayerSprite];
//    [team1 setActiveTargetSprite:activeTargetSprite];
//    [team1 setActiveTargetSprite:activeTargetSprite];
//
//    
//    [team1 setOppTeam:team2];
//    [team2 setOppTeam:team1];
//    
//    [Team setSpriteSheet:spriteSheet team1: [team1 getPlayers] team2: [team2 getPlayers]];
    
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    CCLOG(@">>Dealloc game layer");
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
    
	// don't forget to call "super dealloc"
    [self removeAllChildrenWithCleanup:YES];
}

//
//-(void) setGameInfoLayer:(GameInfoLayer *)layer
//{
//    gameInfoLayer=layer;
//}

//
-(CGPoint) normalise:(CGPoint)origVec
{
    CGPoint normVector = ccp(0,0);
    float length = sqrtf(origVec.x*origVec.x + origVec.y*origVec.y);
    
    normVector.x = origVec.x / length;
    normVector.y = origVec.y / length;
    return normVector;
    
}

// TODO: move to team
-(Team *) getTeamWhoScored
{
    CGPoint ballPos = [ball position];
    if (ballPos.y > PITCH_Y_CENTER) {
        if ([team1 getPlayingDirection] == 0)
            return team1;
        else
            return team2;
    }
    else {
        if ([team1 getPlayingDirection] == 1)
            return team1;
        else
            return team2;
    }
}

// TODO: move to team
-(Team *) getNonScoringTeam
{
    if ([[self getTeamWhoScored] getTeamId] == 1)
        return team2;
    else
        return team1;
}




//
-(void)setViewpointCenterOriginal:(CGPoint) pos
{
    //CCLOG(@">>> SET VIEWPOINT CENTER : Pos(%f,%f)", pos.x, pos.y);
    CGSize winSize = [[CCDirector sharedDirector] viewSize];
    
    int x = MAX(pos.x, winSize.width / 2);
    int y = MAX(pos.y, winSize.height / 2);
    
    
    // only scroll if within boundries - TODO - adapt for differetn screen sizes?
    if (pos.y< 530 && pos.y >160)
    {
        x=PITCH_X_CENTER;
        y=pos.y;
        
        CGPoint actualPosition = ccp(x, y);
        
        CGPoint centerOfView = ccp(winSize.width/2, winSize.height/2);
        CGPoint viewPoint = ccpSub(centerOfView, actualPosition);
        
        // //printf("\n* Viewpoint y = %f",position.y);
        
        self.position = viewPoint;
        
    }
}


//
-(void) centerPitch
{
    CGSize winSize = [[CCDirector sharedDirector] viewSize];
    self.position=ccp(((winSize.width-PITCH_IMAGE_WIDTH)/2),(winSize.height-PITCH_IMAGE_HEIGHT)/2);
   
}


-(bool) isBallInBottomLeftCorner {
    CGPoint ballPos =[[[GameModel sharedGameModel] getBall] position];
    
    if (ballPos.x < PITCH_X_CENTER && ballPos.y < 100) {
        return true;
    } else {
        return false;
    }
}

-(int) getBottomScrollLimit {
    if ([[[GameModel sharedGameModel] getTeam1] isHumanTeam]) {
        
        return -100;  //50//60
    } else {
        return-100; //60 //160
    }
}

-(int) getTopScrollLimit {
    if ([[[GameModel sharedGameModel] getTeam1] isHumanTeam]) {
        return 900; //850 //620 //530
    } else {
        return 900;
    }
}

- (void) doScale:(CGFloat) newScale scaleCenter:(CGPoint) scaleCenter {
    // scaleCenter is the point to zoom to..
    // If you are doing a pinch zoom, this should be the center of your pinch.
    
    // Get the original center point.
    CGPoint oldCenterPoint = ccp(scaleCenter.x * self.scale, scaleCenter.y * self.scale);
    
    // Set the scale.
    self.scale = newScale;
    
    // Get the new center point.
    CGPoint newCenterPoint = ccp(scaleCenter.x * self.scale, scaleCenter.y * self.scale);
    
    // Then calculate the delta.
    CGPoint centerPointDelta  = ccpSub(oldCenterPoint, newCenterPoint);
    
    // Now adjust your layer by the delta.
    self.position = ccpAdd(self.position, centerPointDelta);
}


-(void)setViewpointPitchCenter
{
    self.position = ccp(PITCH_X_CENTER-PITCH_CAMERA_X_OFFSET, PITCH_Y_CENTER);
}

//
-(void)setViewpointCenter:(CGPoint) pos
{
    CGSize winSize = [[CCDirector sharedDirector] viewSize];
  
//    if ([[GameModel sharedGameModel] getMatchState] == halfTimePreKickoff) {
//        self.position=ccp(pos.x,pos.y-(335*self.scale));
//        return;
//    }
    
    
    if ([[GameModel sharedGameModel] getMatchState] == preKickOffRunout
        ||[[GameModel sharedGameModel] getMatchState] == preKickOff
        ||[[GameModel sharedGameModel] getMatchState] == fullTime
        ||[[GameModel sharedGameModel] getMatchState] == managerModeStarted
        ||[[GameModel sharedGameModel] getMatchState] == managerModeResumed
        ||[[GameModel sharedGameModel] getMatchState] == managerModePaused) {
     //   NSLog(@">>>>> SET VIEW POINT CENTER...");
       
        //self.position=ccp(self.position.x-0.5,self.position.y-0.5);
        self.position=ccp(pos.x-(PITCH_CAMERA_X_OFFSET*self.scale),pos.y-(335*self.scale));
        return;
    }
    
    if ([[GameModel sharedGameModel] getMatchState] == postGame
        || [[GameModel sharedGameModel] getMatchState] == postGameReplay) {
       // NSLog(@">>>>> SET VIEW POINT CENTER... Pos : %f,%f",pos.x,pos.y);
        //CGPoint centerPos = ccp(PITCH_X_CENTER, PITCH_Y_CENTER);
        //self.position=ccp(self.position.x-0.5,self.position.y-0.5);
        //self.position=ccp(centerPos.x-(1*self.scale),centerPos.y-(1*self.scale));
        self.position=ccp(pos.x-(PITCH_CAMERA_X_OFFSET*self.scale),pos.y-(335*self.scale));

        return;
    }
    
//    if ([[GameModel sharedGameModel] getMatchState] == gamePlaying
//             && [[GameModel sharedGameModel] matchType] == matchDemo) {
//        self.position=ccp(pos.x-(210*self.scale),pos.y);
//
//        return;
//    }
    
    
    

//    self.position = ccp(winSize.width/4-(100*self.scale), -10-(150*self.scale));
  //  [self doScale: self.scale scaleCenter:ccp(PITCH_X_CENTER,PITCH_Y_CENTER)];
    
   // return;
    bool doXMove=false;
    bool doYMove=false;
    
    
    int x = MAX(pos.x, winSize.width / 2);
    int y = MAX(pos.y, winSize.height / 2);
    
    //CCLOG(@">> WIN SIZE width, height : %f,%f", winSize.width, winSize.height);
    
    // only scroll if screen is too small
    if (PITCH_IMAGE_HEIGHT > winSize.height)
    {
        int bottomScrollLimit = [self getBottomScrollLimit];
        int topScrollLimit = [self getTopScrollLimit];
        //CCLOG(@">>DO X CAM MOVE");
        if (pos.y< topScrollLimit && pos.y > bottomScrollLimit) //160
        {
            y=pos.y;
            doYMove=true;
        }
    }
    
    
//    if (PITCH_IMAGE_WIDTH > winSize.width || ([GameData isPracticeMatch] || [[GameModel sharedGameModel] matchType] == matchExhibition))
//    {
//        //TODO TDD
//        if (pos.x > PITCH_X_CENTER-85 && pos.x < PITCH_X_CENTER )
//        {
//            x=pos.x;
//            doXMove=true;
//        }
//    }
    
            //TODO TDD
    if (pos.x > PITCH_X_CENTER-100 && pos.x < PITCH_X_CENTER+100 )
    {
        x=pos.x;
        doXMove=true;
    }
    
    
    if (doXMove || doYMove)
    {
        CGPoint actualPosition = ccp(x, y);
        
        CGPoint centerOfView = ccp(winSize.width/2, winSize.height/2);
        CGPoint viewPoint = ccpSub(centerOfView, actualPosition);
        
        if (doXMove && doYMove)
        {
            self.position = viewPoint;
            //NSLog(@">>(both)SELF.POSITION X= %f", self.position.x);

        }
        
        else if (doXMove)
        {
            self.position = ccp(viewPoint.x, self.position.y);
            //NSLog(@">>(x)SELF.POSITION X= %f", self.position.x);
//
            //TODO TDD
//            if (self.position.x > 260) {
//                self.position=ccp(260,self.position.y);
//            }
        }
        
        else if (doYMove)
        {
          //  NSLog(@">>>SELF.POSITION X ,Y= %f", self.position.y);

            self.position = ccp(self.position.x, viewPoint.y);
        }
        
       
    }
    
    // when in replay mode allow x position to be set, y is ok
    if ([[GameModel sharedGameModel] getMatchState] == replay) {
        if (self.scale<1.0) {
            self.position=ccp(pos.x-(PITCH_CAMERA_X_OFFSET*self.scale),self.position.y);

        }
    }
    
 
   
#ifdef ALLOW_INGAME_ZOOM

    // if demo game / manager mode- keep centered - no need to scroll lft and right
    if ((/* //TODO TDD [[GameModel sharedGameModel] matchType] == matchDemo ||*/ [[GameModel sharedGameModel] matchType] == matchManager)
        && ([[GameModel sharedGameModel] getMatchState] == gamePlaying
         || [[GameModel sharedGameModel] getMatchState] == keeperHasBall
         || [[GameModel sharedGameModel] getMatchState] == goal
         || [[GameModel sharedGameModel] getMatchState] == ballOutOfBounds
         || [[GameModel sharedGameModel] getMatchState] == halfTime
         || [[GameModel sharedGameModel] getMatchState] == fullTime ))
    {
        //self.position=ccp(PITCH_X_CENTER-(210*self.scale),self.position.y);
        
        if (self.scale <=0.5) { //0.5
            self.position=ccp(PITCH_X_CENTER-(PITCH_CAMERA_X_OFFSET*self.scale),155-(335*self.scale));
        }
        else {
            //NSLog(@">>Allow ingame zoom", self.position.x);

            self.position=ccp(PITCH_X_CENTER-(PITCH_CAMERA_X_OFFSET*self.scale),self.position.y*self.scale);
            
            //if (pos.y > ([self getTopScrollLimit]-100)) {
            if (pos.y > ([self getTopScrollLimit])) {
                self.position=ccp(PITCH_X_CENTER-(PITCH_CAMERA_X_OFFSET*self.scale),-360*self.scale); //-383
                return;
            } else if(pos.y < [self getBottomScrollLimit]) {
                self.position=ccp(PITCH_X_CENTER-(PITCH_CAMERA_X_OFFSET*self.scale),-360*self.scale); //-383
                return;
            }
        }
        
        return;
    }

    // if normal gae we have to handle scrolling left and right when scale is 1.0
    if ([[GameModel sharedGameModel] getMatchState] == gamePlaying
        || [[GameModel sharedGameModel] getMatchState] == keeperHasBall
        || [[GameModel sharedGameModel] getMatchState] == goal
        || [[GameModel sharedGameModel] getMatchState] == ballOutOfBounds
        || [[GameModel sharedGameModel] getMatchState] == halfTime
        || [[GameModel sharedGameModel] getMatchState] == fullTime) {
        
        if (self.scale<1.0) {
            
            // ensure y scroll isnt too far especially when scaled down
            if (pos.y > ([self getTopScrollLimit]-100)) {
                self.position=ccp(300-(PITCH_CAMERA_X_OFFSET*self.scale),-360*self.scale); //-383
                return;
            } else if(pos.y < [self getBottomScrollLimit]) {
                self.position=ccp(300-(PITCH_CAMERA_X_OFFSET*self.scale),-360*self.scale); //-383
                NSLog(@">> Reset position after bottom scroll limit..");
                return;
            }
            
            self.position=ccp(300-(PITCH_CAMERA_X_OFFSET*self.scale),self.position.y*self.scale);
        }
    }
#endif

    
}



-(void) setGameState:(enum gameState)newGameState;
{
    //    prevGameState = gameState;
    //    gameState = newGameState;
}

-(void) setMatchState:(enum matchState)newMatchState
{
    //    prevMatchState = matchState;
    //    matchState = newMatchState;
}

-(void) drawLineYellow :(CGPoint) p1 : (CGPoint) p2 :(int) colour
{
    return;
//    CCDrawNode *myLine = [CCDrawNode node];
//    [myLine drawSegmentFrom:p1 to:p2 radius:1.f color: [CCColor orangeColor]];
//    [self addChild:myLine z:198];
}


-(void) drawLine :(CGPoint) p1 : (CGPoint) p2 :(int) colour
{
    return;
//    CCDrawNode *myLine = [CCDrawNode node];
//    [myLine drawSegmentFrom:p1 to:p2 radius:1.f color: [CCColor purpleColor]];
//    [self addChild:myLine z:899];
}

-(void) drawLineWithTag :(CGPoint) p1 : (CGPoint) p2 :(int) colour
{
    return;
    
//    [self removeChildByName:@"keeper"];
//    CCDrawNode *myLine = [CCDrawNode node];
//    [myLine drawSegmentFrom:p1 to:p2 radius:1.f color: [CCColor purpleColor]];
//    myLine.name=@"keeper";
//    [self addChild:myLine z:899];
}


-(void) drawLineWithCustomTag :(CGPoint) p1 : (CGPoint) p2 :(id) tagName : (CCColor *) lineColor
{
    return;
//    [self removeChildByName:tagName];
//    CCDrawNode *myLine = [CCDrawNode node];
//    [myLine drawSegmentFrom:p1 to:p2 radius:1.f color: lineColor];
//    myLine.name=tagName;
//    [self addChild:myLine z:199];
}


-(void) drawLineOld :(CGPoint) p1 : (CGPoint) p2 :(int) colour
{
    return;
//    LineNode * newLine = [[LineNode alloc] init:p1 :p2 :colour];
//    [self addChild:newLine z:199];
}


-(void) drawLineWithTagOld :(CGPoint) p1 : (CGPoint) p2 :(int) colour :(int) tagId
{
    return;
//    LineNode * newLine = [[LineNode alloc] init:p1 :p2 :colour];
//    [self addChild:newLine z:199];
}


//
-(void) drawPitch
{
    return;
    int top = PITCH_TOP;
    int bottom = PITCH_BOTTOM;
    int left = PITCH_LEFT;
    int right = PITCH_RIGHT;
    
    int yMiddle = PITCH_Y_CENTER;
    int xMiddle = PITCH_X_CENTER;
    
    int pitchCenter = PITCH_X_CENTER; //SCREEN_X_CENTER;
    int goalWidth = GOAL_WIDTH;
    int goalDepth = GOAL_DEPTH;
    
    CCLOG(@">>> sDraw Pitch - GameLayer...");
    
    //Pitch
    [self drawLine:ccp(left,top) : ccp(right,top) :0 ];
    [self drawLine:ccp(left,bottom) : ccp(left,top) :0];
    [self drawLine:ccp(right,bottom) : ccp(right,top) :0];
    [self drawLine:ccp(left,bottom) : ccp(right,bottom) :0];
    
    // Pitch Center Line
    [self drawLine:ccp(left,yMiddle) : ccp(right,yMiddle) :0];
    [self drawLine:ccp(xMiddle,top) : ccp(xMiddle,bottom) :0];
    
    
    
    //Top Goal
    [self drawLine: ccp(pitchCenter-goalWidth/2 , top+goalDepth) :ccp(pitchCenter+goalWidth/2 , top+goalDepth) :0] ;
    [self drawLine: ccp(pitchCenter-goalWidth/2 , top) :ccp(pitchCenter-goalWidth/2 , top+goalDepth) :0] ;
    [self drawLine: ccp(pitchCenter+goalWidth/2 , top) :ccp(pitchCenter+goalWidth/2 , top+goalDepth) :0] ;
    [self drawLine: ccp(pitchCenter-goalWidth/2 , top) :ccp(pitchCenter+goalWidth/2 , top) :1] ;
    //Crossbar
    [self drawLine: ccp(pitchCenter-goalWidth/2 , top+GOAL_PERSPECTIVE_Y_OFFSET) :ccp(pitchCenter+goalWidth/2 , top+GOAL_PERSPECTIVE_Y_OFFSET) :0] ;
    
    
    
    //Bottom Goal
    [self drawLine: ccp(pitchCenter-goalWidth/2 , bottom-goalDepth) :ccp(pitchCenter+goalWidth/2 , bottom-goalDepth ) :0] ;
    [self drawLine: ccp(pitchCenter-goalWidth/2 , bottom) :ccp(pitchCenter-goalWidth/2 , bottom-goalDepth) :0] ;
    [self drawLine: ccp(pitchCenter+goalWidth/2 , bottom) :ccp(pitchCenter+goalWidth/2 , bottom-goalDepth) :0] ;
    [self drawLine: ccp(pitchCenter-goalWidth/2 , bottom) :ccp(pitchCenter+goalWidth/2 , bottom) :1] ;
    //Crossbar
    [self drawLine: ccp(pitchCenter-goalWidth/2 , bottom-GOAL_PERSPECTIVE_Y_OFFSET) :ccp(pitchCenter+goalWidth/2 , bottom-GOAL_PERSPECTIVE_Y_OFFSET) :0] ;
    
}

//
-(void) doKickOff {
    CCLOG(@">>>> TEST");
    if (!kickOffDone) {
        kickOffDone=true;
        
        //COMMENTED

       /* [self runAction:[CCSequence actions:
                         [CCDelayTime actionWithDuration:5],
                         [CCCallFunc actionWithTarget:self selector:@selector(changeStateToGamePlaying)],
                         nil]];*/
        
        [[HudModel sharedHudModel] kickOffSpr].visible =true;
        
        
        [team1 setPlayersFaceBall:ball];
        [team2 setPlayersFaceBall:ball];
        // [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"Large_Stadium-stephan_schutze-2122836113.wav"];
        
    }
}



//
-(void) startMainMenuTimer
{
    if (!goToMainMenuDone)
    {
        goToMainMenuDone=true;
        
        //COMMENTED
        /*
        [self runAction:[CCSequence actions:
                         [CCDelayTime actionWithDuration:5],
                         [CCCallFunc actionWithTarget:self selector:@selector(goToMainMenu)], nil]];
        */
    }
}

//
-(void) startFullTimeInfoTimer
{
    if (!goToFullTimeInfoDone)
    {
        goToFullTimeInfoDone=true;
        
        //COMMENTED
        /*
        [self runAction:[CCSequence actions:
                         [CCDelayTime actionWithDuration:5],
                         [CCCallFunc actionWithTarget:self selector:@selector(goToFullTime)], nil]];
         */
    }
}

//
-(void) startHalfTimeInfoTimer
{
    if (!goToHalfTimeInfoDone)
    {
        goToHalfTimeInfoDone=true;
        
        //COMMENTED
        /*
        [self runAction:[CCSequence actions:
                         [CCDelayTime actionWithDuration:5],
                         [CCCallFunc actionWithTarget:self selector:@selector(goToHalfTime)], nil]];
         */
    }
}


//
-(void) showPreMatchInfo
{
    CCLOG(@">>SHOW PRE MATCH INFO");
    if (!showPremMatchInfoDone)
    {
        [[[SceneManager sharedSceneManager] gameInfoLayer] setPreMatchInfo];
        showPremMatchInfoDone=true;
    }
}

-(void) goToMainMenu
{
    [SceneManager goMenu];
    goToMainMenuDone=false;
}

-(void) goToFullTime
{
    CCLOG(@">>GO TO FULL TIME");
    [self setMatchState:postGame];
    [[HudModel sharedHudModel] fulltimeSpr].visible=false;
    [[SceneManager sharedSceneManager] hudLayer].visible=false;
    [[SceneManager sharedSceneManager] gameInfoLayer].visible=true;
    [[[SceneManager sharedSceneManager] gameInfoLayer]setFullTimeInfo];
}

-(void) goToHalfTime
{
    [self setMatchState:halfTimeInfo];
    [[HudModel sharedHudModel] halftimeSpr].visible=false;
    [[SceneManager sharedSceneManager] hudLayer].visible=false;
    [[SceneManager sharedSceneManager] gameInfoLayer].visible=true;
    [[[SceneManager sharedSceneManager]gameInfoLayer]setHalfTimeInfo];
   }




//
-(Player *) getKeeperWithBall
{
    
    if ([ball teamWithBallId] == TEAM1) {
        return [[[GameModel sharedGameModel] getTeam1] getKeeper];
    }
    else
    {
        return [[[GameModel sharedGameModel] getTeam2] getKeeper];
    }
}

//
//-(void) changeStatetoGamePlayingFromGoalKick
//{
//    NSLog(@">> changeStatetoGamePlayingFromGoalKick");
//    [[[GameModel sharedGameModel] matchData] addHighlightMarker];
//
//    [self setMatchState:gamePlaying];
//    keeperHasBallDone=false;
//    
//    Player *keeper = [self getKeeperWithBall];
//    Ball *b = [[GameModel sharedGameModel] getBall];
//    [keeper doGoalKick:b];
//    [b moveBall:deltaTime];
//}



-(void) tick:(CCTime)dt
{
    //CCLOG(@" >>> GAME LAYER : tick");
    timeAccumulator += dt;
    if (timeAccumulator > (MAX_CYCLES_PER_FRAME * UPDATE_INTERVAL))
    {
        timeAccumulator = UPDATE_INTERVAL;
    }
    
    while (timeAccumulator >= UPDATE_INTERVAL)
    {
        timeAccumulator -= UPDATE_INTERVAL;
        [self nextFrame: UPDATE_INTERVAL];
    }
}



-(void) moveScanner {
    
    GameModel *model = [GameModel sharedGameModel];
    Team *t = [[GameModel sharedGameModel] getTeam1];
    Team *t2 = [[GameModel sharedGameModel] getTeam2];
    Ball *gameBall = [[GameModel sharedGameModel] getBall];
    
    
    CCColor *t1Colour =  [Team getColour: t.teamData.stripMainColour];
    CCColor *t2Colour =  [Team getColour: t2.teamData.stripMainColour];
    
    // TODO init colors
    
    /// Border
    
    CCSprite * border = [[model scannerObjects] objectAtIndex:24];
    border.scaleX=0.17;
    border.scaleY=0.175;
    [border setPosition: ccp(40,223)];
    [border setZOrder:-1];
    
    
    /// Players
    CCSprite * p0 = [[model scannerObjects] objectAtIndex:0];
    p0.scale=0.2;
    [p0 setPosition: ccp(10 +[[t getPlayer:KEEPER_ID-1] position].x/12,
                         175+[[t getPlayer:KEEPER_ID-1] position].y/7)];
    [p0 setColor:t1Colour];
    
    CCSprite * p1 = [[model scannerObjects] objectAtIndex:1];
    p1.scale=0.2;
    [p1 setPosition: ccp(10 +[[t getPlayer:PLAYER1_ID-1] position].x/12,
                         175+[[t getPlayer:PLAYER1_ID-1] position].y/7)];
    [p1 setColor:t1Colour];
    
    CCSprite * p2 = [[model scannerObjects] objectAtIndex:2];
    p2.scale=0.2;
    [p2 setPosition: ccp(10 + [[t getPlayer:PLAYER2_ID-1] position].x/12,
                         175+[[t getPlayer:PLAYER2_ID-1] position].y/7)];
    [p2 setColor:t1Colour];
    
    CCSprite * p3 = [[model scannerObjects] objectAtIndex:3];
    p3.scale=0.2;
    [p3 setPosition: ccp(10 +[[t getPlayer:PLAYER3_ID-1] position].x/12,
                         175+[[t getPlayer:PLAYER3_ID-1] position].y/7)];
    [p3 setColor:t1Colour];
    
    CCSprite * p4 = [[model scannerObjects] objectAtIndex:4];
    p4.scale=0.2;
    [p4 setPosition: ccp(10 +[[t getPlayer:PLAYER4_ID-1] position].x/12,
                         175+[[t getPlayer:PLAYER4_ID-1] position].y/7)];
    [p4 setColor:t1Colour];
    
    CCSprite * p5 = [[model scannerObjects] objectAtIndex:5];
    p5.scale=0.2;
    [p5 setPosition: ccp(10 + [[t getPlayer:PLAYER5_ID-1] position].x/12,
                         175+[[t getPlayer:PLAYER5_ID-1] position].y/7)];
    [p5 setColor:t1Colour];
    
    CCSprite * p6 = [[model scannerObjects] objectAtIndex:6];
    p6.scale=0.2;
    [p6 setPosition: ccp(10 + [[t getPlayer:PLAYER6_ID-1] position].x/12,
                         175+[[t getPlayer:PLAYER6_ID-1] position].y/7)];
    [p6 setColor:t1Colour];
    
    CCSprite * p7 = [[model scannerObjects] objectAtIndex:7];
    p7.scale=0.2;
    [p7 setPosition: ccp(10 + [[t getPlayer:PLAYER7_ID-1] position].x/12,
                         175+[[t getPlayer:PLAYER7_ID-1] position].y/7)];
    [p7 setColor:t1Colour];

    CCSprite * p8 = [[model scannerObjects] objectAtIndex:8];
    p8.scale=0.2;
    [p8 setPosition: ccp(10 + [[t getPlayer:PLAYER8_ID-1] position].x/12,
                         175+[[t getPlayer:PLAYER8_ID-1] position].y/7)];
    [p8 setColor:t1Colour];
    
    CCSprite * p9 = [[model scannerObjects] objectAtIndex:9];
    p9.scale=0.2;
    [p9 setPosition: ccp(10 + [[t getPlayer:PLAYER9_ID-1] position].x/12,
                         175+[[t getPlayer:PLAYER9_ID-1] position].y/7)];
    [p9 setColor:t1Colour];
    
    CCSprite * p10 = [[model scannerObjects] objectAtIndex:10];
    p10.scale=0.2;
    [p10 setPosition: ccp(10 + [[t getPlayer:PLAYER10_ID-1] position].x/12,
                         175+[[t getPlayer:PLAYER10_ID-1] position].y/7)];
    [p10 setColor:t1Colour];
    
    ///////////////////////////////////////////////////////////////////////
   
    CCSprite * pp0 = [[model scannerObjects] objectAtIndex:11];
    pp0.scale=0.2;
    [pp0 setPosition: ccp(10 +[[t2 getPlayer:KEEPER_ID-1] position].x/12,
                          175+[[t2 getPlayer:KEEPER_ID-1] position].y/7)];
    [pp0 setColor:t2Colour];

    
    CCSprite * pp1 = [[model scannerObjects] objectAtIndex:12];
    pp1.scale=0.2;
    [pp1 setPosition: ccp(10 +[[t2 getPlayer:PLAYER1_ID-1] position].x/12,
                         175+[[t2 getPlayer:PLAYER1_ID-1] position].y/7)];
    [pp1 setColor:t2Colour];
    
    CCSprite * pp2 = [[model scannerObjects] objectAtIndex:13];
    pp2.scale=0.2;
    [pp2 setPosition: ccp(10 + [[t2 getPlayer:PLAYER2_ID-1] position].x/12,
                         175+[[t2 getPlayer:PLAYER2_ID-1] position].y/7)];
    [pp2 setColor:t2Colour];

    
    CCSprite * pp3 = [[model scannerObjects] objectAtIndex:14];
    pp3.scale=0.2;
    [pp3 setPosition: ccp(10 +[[t2 getPlayer:PLAYER3_ID-1] position].x/12,
                         175+[[t2 getPlayer:PLAYER3_ID-1] position].y/7)];
    [pp3 setColor:t2Colour];

    
    CCSprite * pp4 = [[model scannerObjects] objectAtIndex:15];
    pp4.scale=0.2;
    [pp4 setPosition: ccp(10 +[[t2 getPlayer:PLAYER4_ID-1] position].x/12,
                         175+[[t2 getPlayer:PLAYER4_ID-1] position].y/7)];
    [pp4 setColor:t2Colour];

    
    CCSprite * pp5 = [[model scannerObjects] objectAtIndex:16];
    pp5.scale=0.2;
    [pp5 setPosition: ccp(10 + [[t2 getPlayer:PLAYER5_ID-1] position].x/12,
                         175+[[t2 getPlayer:PLAYER5_ID-1] position].y/7)];
    [pp5 setColor:t2Colour];

    
    CCSprite * pp6 = [[model scannerObjects] objectAtIndex:17];
    pp6.scale=0.2;
    [pp6 setPosition: ccp(10 + [[t2 getPlayer:PLAYER6_ID-1] position].x/12,
                         175+[[t2 getPlayer:PLAYER6_ID-1] position].y/7)];
    [pp6 setColor:t2Colour];

    
    CCSprite * pp7 = [[model scannerObjects] objectAtIndex:18];
    pp7.scale=0.2;
    [pp7 setPosition: ccp(10 + [[t2 getPlayer:PLAYER7_ID-1] position].x/12,
                         175+[[t2 getPlayer:PLAYER7_ID-1] position].y/7)];
    [pp7 setColor:t2Colour];

    
    CCSprite * pp8 = [[model scannerObjects] objectAtIndex:19];
    pp8.scale=0.2;
    [pp8 setPosition: ccp(10 + [[t2 getPlayer:PLAYER8_ID-1] position].x/12,
                         175+[[t2 getPlayer:PLAYER8_ID-1] position].y/7)];
    [pp8 setColor:t2Colour];

    
    CCSprite * pp9 = [[model scannerObjects] objectAtIndex:20];
    pp9.scale=0.2;
    [pp9 setPosition: ccp(10 + [[t2 getPlayer:PLAYER9_ID-1] position].x/12,
                         175+[[t2 getPlayer:PLAYER9_ID-1] position].y/7)];
    [pp9 setColor:t2Colour];

    
    CCSprite * pp10 = [[model scannerObjects] objectAtIndex:21];
    pp10.scale=0.2;
    [pp10 setPosition: ccp(10 + [[t2 getPlayer:PLAYER10_ID-1] position].x/12,
                          175+[[t2 getPlayer:PLAYER10_ID-1] position].y/7)];
    [pp10 setColor:t2Colour];

    
    ////////////////////////////////////////////////////////////////////////

    CCSprite * scannerBall = [[model scannerObjects] objectAtIndex:25];
    scannerBall.scale=0.125;
    [scannerBall setPosition: ccp(10 + [gameBall position].x/12, 175+[gameBall position].y/7)];
    [scannerBall setColor:[[gameBall sprite] color]];

    
    CCSprite * activeCircle = [[model scannerObjects] objectAtIndex:22];
    activeCircle.scale=0.1;
    
    CCSprite * targetCircle = [[model scannerObjects] objectAtIndex:23];
    targetCircle.scale=0.1;
    

    if ([t isHumanTeamPlaying]) {
        //NSLog(@"******* update scanner sprite");
        int activePlayer = [t activePlayerId];
        int targetPlayer = [t activeTargetPlayerId];

        if (activePlayer > 0) {
            CCSprite *active = [[model scannerObjects] objectAtIndex:activePlayer-1];
            [activeCircle setColor:[CCColor blueColor]];
            [activeCircle setPosition:[active position]];
        }
        
        if (targetPlayer > 0) {
            CCSprite *target = [[model scannerObjects] objectAtIndex:targetPlayer-1];
            [targetCircle setColor:[CCColor magentaColor]];
            [targetCircle setPosition:[target position]];
        }
    }
    
   // NSLog(@">>>MAtch type : %d", [[GameModel sharedGameModel] matchType]);
    if ([[GameModel sharedGameModel] matchType] == matchDemo || [[GameModel sharedGameModel] matchType] == matchManager) {
        [activeCircle setVisible:false];
        [targetCircle setVisible:false];
        //NSLog(@"Active circle false");
    } else {
        [activeCircle setVisible:true];
        [targetCircle setVisible:true];
        //NSLog(@"Active circle true");
    }

    if ([GameData isPracticeMatch]) {
        [pp0 setVisible:true];
        [pp1 setVisible:false];
        [pp2 setVisible:false];
        [pp3 setVisible:false];
        [pp4 setVisible:false];
        [pp5 setVisible:false];
        [pp6 setVisible:false];
        [pp7 setVisible:false];
        [pp8 setVisible:false];
        [pp9 setVisible:false];
        [pp10 setVisible:false];
        //[border setVisible:false];
        //[gameBall setVisible:false];
    }
    else {
        [pp0 setVisible:true];
        [pp1 setVisible:true];
        [pp2 setVisible:true];
        [pp3 setVisible:true];
        [pp4 setVisible:true];
        [pp5 setVisible:true];
        [pp6 setVisible:true];
        [pp7 setVisible:true];
        [pp8 setVisible:true];
        [pp9 setVisible:true];
        [pp10 setVisible:true];
        
        [p0 setVisible:true];
        [p1 setVisible:true];
        [p2 setVisible:true];
        [p3 setVisible:true];
        [p4 setVisible:true];
        [p5 setVisible:true];
        [p6 setVisible:true];
        [p7 setVisible:true];
        [p8 setVisible:true];
        [p9 setVisible:true];
        [p10 setVisible:true];

        [border setVisible:true];
        [gameBall setVisible:true];
    }
    
}

-(void) nextFrame:(CCTime)dt
{
    //CCLOG(@" >>> GAME LAYER : next frame");
    [[GameModel sharedGameModel] nextFrame:dt];
    
    [self moveScanner];
    
    if (![[GameModel sharedGameModel] isManagerMode])
    {
       //[self setViewpointCenter: [[GameModel sharedGameModel] getCameraPos]];
       
        
        if ([[GameModel sharedGameModel] getMatchState] == preKickOff
            || [[GameModel sharedGameModel] getMatchState] == preKickOffRunout
            ||[[GameModel sharedGameModel] getMatchState] == managerModeStarted
            ||[[GameModel sharedGameModel] getMatchState] == managerModeResumed
            ||[[GameModel sharedGameModel] getMatchState] == managerModePaused) {
            [self setViewpointCenter: ccp(PITCH_X_CENTER,155)];
            

        } else if ([[GameModel sharedGameModel] getMatchState] == fullTime
                   || [[GameModel sharedGameModel] getMatchState] == postGame
                   || [[GameModel sharedGameModel] getMatchState] == postGameReplay) {
            [self setViewpointCenter: ccp(PITCH_X_CENTER,155)];
        
        } else if ([[GameModel sharedGameModel] getMatchState] == halfTimePreKickoff
                   || [[GameModel sharedGameModel] getMatchState] == kickOff) {
            
            if (self.scale >= 1.0) {
                [self setViewpointCenter: ccp(PITCH_X_CENTER*self.scale,PITCH_Y_CENTER*self.scale)];
            } else {
                [self setViewpointCenter: ccp(300-(PITCH_CAMERA_X_OFFSET*self.scale),PITCH_Y_CENTER*self.scale)];
            }
            
            
            
        } else if ([[GameModel sharedGameModel] getMatchState] == gamePlaying
                   && [[GameModel sharedGameModel] matchType] == matchDemo) {
            
            //[self setViewpointCenter: ccp(PITCH_X_CENTER,[[GameModel sharedGameModel] getCameraPos].y)];
            
            //TODO TDD
            [self setViewpointCenter: [[GameModel sharedGameModel] getCameraPos]];
        }
        else if ([[GameModel sharedGameModel] getMatchState] == goal
                   || [[GameModel sharedGameModel] getMatchState] == keeperHasBall
                   || [[GameModel sharedGameModel] getMatchState] == ballOutOfBounds) {
            //[self setViewpointCenter: ccp(PITCH_X_CENTER*self.scale, [[GameModel sharedGameModel] getCameraPos].y)];
            [self setViewpointCenter: [[GameModel sharedGameModel] getCameraPos]];
                   
        } else {
            [self setViewpointCenter: [[GameModel sharedGameModel] getCameraPos]];

        }
        
    }
    //[self update:dt];
}


//
- (BOOL) isWithinArea:(CGPoint)touchPos :(CGPoint)spritePos :(float)width {
    //NSLog(@"TouchPos% f,%f",touchPos.x,touchPos.y);
    //NSLog(@"SpritePos% f,%f",spritePos.x,spritePos.y);
    
    
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
        return true;
    }
    else {
        return false;
    }
}

//
-(void) doPassControls:(bool) highPass
{
    Team *t = [[GameModel sharedGameModel] getTeam1];
    Ball *myBall = [[GameModel sharedGameModel] getBall];
    
    
    if([t doesTeamHaveBall:myBall])
    {
        if ([myBall attached] )
        {
            if (!highPass)
            {
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
        //[[[GameModel sharedGameModel] getTeam1] setActivePlayerSpritePosition:convertedLocation];
        
        
        // check touch position is within circle radius
        if (centerTouchBegan)
        {
            CGPoint controlVector = ccpSub(convertedLocation, [[HudModel sharedHudModel] joypad].position);
            CGPoint controlVecNorm = ccpNormalize(controlVector);
            CGPoint joyStickVec = ccpMult(controlVecNorm, 20.0);
            CGPoint joyStickPos = ccpAdd(ccp(70,70), joyStickVec);
            
           // [[[GameModel sharedGameModel] getTeam1] setActiveTargetSpritePosition:[[HudModel sharedHudModel] joypad].position];
            
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
                    //[[[[GameModel sharedGameModel] getTeam1] getMainPlayer] setSpriteRotationHumanControls:rotationDegrees: myBall];
                    [[[[GameModel sharedGameModel] getTeam1] getMainPlayer] setSpriteRotationHumanControlsVector:controlVecNorm: myBall];
                    
                    [Team setControlsActive:true];
                }
            }
        }
    }
}


-(void) resetReplayButtonsOpacity {
    float level=0.75;
    [[[HudModel sharedHudModel] playButton ] setOpacity:level];
    [[[HudModel sharedHudModel] pauseButton ] setOpacity:level];
    [[[HudModel sharedHudModel] rewindButton ] setOpacity:level];
    [[[HudModel sharedHudModel] forwardButton ] setOpacity:level];
    [[[HudModel sharedHudModel] stopButton ] setOpacity:level];
    [[[HudModel sharedHudModel] zoomInButton ] setOpacity:level];
    [[[HudModel sharedHudModel] zoomOutButton ] setOpacity:level];
    [[[HudModel sharedHudModel] exitButton ] setOpacity:level];
}

-(void) doPlayButton:(id)sender {
    CCLOG(@">> PLAY BUTTON");
    [self resetReplayButtonsOpacity];
    [MenuLayer playMenuButtonSound2];
    [[GameModel sharedGameModel] setReplayState: replayPlay];
}


-(void) doPauseButton:(id)sender {
    CCLOG(@">> PAUSE BUTTON");
    [self resetReplayButtonsOpacity];
    [MenuLayer playMenuButtonSound2];
    [[GameModel sharedGameModel] setReplayState: replayPause];
}

-(void) doStopButton:(id)sender {
    CCLOG(@">> STOP BUTTON");
    [self resetReplayButtonsOpacity];
    [MenuLayer playMenuButtonSound2];
    [[GameModel sharedGameModel] setReplayState: replayStop];
}

-(void) doForwardButton:(id)sender {
    CCLOG(@">> FORWARD BUTTON");
    [self resetReplayButtonsOpacity];
    [MenuLayer playMenuButtonSound2];
    [[GameModel sharedGameModel] setReplayState: replayForward];
}

-(void) doRewindButton:(id)sender {
    CCLOG(@">> REWIND BUTTON");
    [self resetReplayButtonsOpacity];
    [MenuLayer playMenuButtonSound2];
    [[GameModel sharedGameModel] setReplayState: replayRewind];
    //NSLog(@" >>> BEfore - SCale : %f",self.scale);
    
   // [self  setScale:0.6]; //1.00160]
   // NSLog(@" >>> AFter - SCale : %f",self.scale);
}

//-(void) doInGamePauseButton:(id)sender {
//    [[HudModel sharedHudModel] showInGamePlayButton:true];
//    [[GameModel sharedGameModel] setMatchState: gamePlaying];
//}
//
//
//-(void) doInGamePlayButton:(id)sender {
//    [[HudModel sharedHudModel] showInGamePlayButton:false];
//    [[GameModel sharedGameModel] setMatchState: inGamePaused];
//}


-(void) doZoomInButton:(id)sender {
    CCLOG(@">> ZOOM IN BUTTON");
    //[[GameModel sharedGameModel] setMatchState: gamePlaying];
    
    self.scale+=0.1;
    if (self.scale >= 1.0) { //1.05
        self.scale=1.0;
    }
    
    if ([[GameModel sharedGameModel] getMatchState] == replay) {
        [GameData setLastReplayScale: self.scale];
    } else {
        [GameData setLastGameScale: self.scale];

    }
}



-(void) doZoomOutButton:(id)sender {
    CCLOG(@">> ZOOM OUT BUTTON");
   // [[GameModel sharedGameModel] setMatchState: inGamePaused];
    
    self.scale-=0.1;
    float limit;
    
    if ([[GameModel sharedGameModel] getMatchState] == replay) {
        limit=0.3; //0.4
    } else{
        
        if ([[GameModel sharedGameModel] matchType] == matchDemo) {
            limit=0.5;
        } else {
            limit=0.7;
        }
    }
    
    if (self.scale <= limit) {
        self.scale=limit;
    }
    
    if ([[GameModel sharedGameModel] getMatchState] == replay) {
        [GameData setLastReplayScale: self.scale];
    } else {
        [GameData setLastGameScale: self.scale];
    }


}

-(void) doExitButton:(id)sender  {
    CCLOG(@">>>EXIT BUTTON");
    [MenuLayer playMenuButtonSound5];
    enum matchState state = [[GameModel sharedGameModel] getMatchState];
    
    if (state == preKickOffRunout || state == preKickOff || state == kickOff || state == fullTime || state == goal) {
        return;
    }
    
    if ([[GameModel sharedGameModel] getMatchState] != replay)
    {
       if ([GameData isPracticeMatch] || [[GameModel sharedGameModel] matchType] == matchDemo) {
            CCLOG(@">>>Practice|Demo EXIT BUTTON***");
            [[GameModel sharedGameModel] stopMatchClock];
            [[GameModel sharedGameModel] setMatchState:fullTime];
            [[[HudModel sharedHudModel] exitButton] setVisible:false];
        }
        else if ([[GameModel sharedGameModel] matchType] == matchExhibition || [[GameModel sharedGameModel] matchType] == matchManager) {
            CCLOG(@">>>SUBSTITUTIONS | GO TO TEAM MENU");
            //[[GameModel sharedGameModel] setMatchState: paused];
            [[GameModel sharedGameModel] stopMatchClock];
            [SceneManager goTeamMenu];
        }

    }
    else
    {
        [[GameModel sharedGameModel] stopMatchClock];
        
        CCLOG(@">>Set Replay Labels");
        [[GameModel sharedGameModel] setMatchState:postGameReplay];
        [[GameModel sharedGameModel] setGameState:matchInfoFullTime];
        [[SceneManager sharedSceneManager] hudLayer].visible=false;
        [[SceneManager sharedSceneManager] gameInfoLayer].visible=true;
    }
 
}

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
//- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    NSLog(@">>>touchBegan");
}

//COMMENTED-REMOVE

- (void)touchBeganOLD:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
//- (void)touchBeganOld:(UITouch *)touch withEvent:(UIEvent *)event {
    
//- (void)touchBegan:(CCTouch*) touch withEvent:(CCTouchEvent*) event {
//- (BOOL)ccTouchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
    CCLOG(@">>GAME LAYER TOUCHED");
    
    if (!self.visible)
    {
        //return false;
    }
    
    
    if ([[GameModel sharedGameModel] getGameState] != matchStarted)
    {
        //CCLOG(@">>GAME LAYER OFF");
        //return false;
    }
    else
    {
        //CCLOG(@">>GAME LAYER ON");
        
    }
    CCLOG(@"** TOUCH BEGAN ** - Game Layer : matchState = %d", [[GameModel sharedGameModel] getMatchState ]);
    
    
    if ([[GameModel sharedGameModel] getMatchState] != replay)
    {
        if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] exitButton].position: 60])
        {
            CCLOG(@">>>EXIT BUTTON");
            //[[GameModel sharedGameModel] setMatchState: paused];
            [[GameModel sharedGameModel] stopMatchClock];
            [SceneManager goTeamMenu];
        }
    }
    
    if ([[GameModel sharedGameModel] getMatchState] == replay)
    {
        if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] playButton].position: 60])
        {
            CCLOG(@">> PLAY BUTTON");
            [[GameModel sharedGameModel] setReplayState: replayPlay];
        }
        
        if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] pauseButton].position: 60])
        {
            CCLOG(@">> PLAY PAUSE");
            [[GameModel sharedGameModel] setReplayState: replayPause];
        }
        
        if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] stopButton].position: 60])
        {
            [[GameModel sharedGameModel] setReplayState: replayStop];
        }
        
        if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] forwardButton].position: 60])
        {
            [[GameModel sharedGameModel] setReplayState: replayForward];
        }
        
        if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] rewindButton].position: 60])
        {
            [[GameModel sharedGameModel] setReplayState: replayRewind];
        }
    }
    
    
    float width = 40.0;
    
#ifdef DO_DOUBLE_TAP_PASS
    if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyPassButton].position : width])
    {
        passButtonHeldDownTime=0;
        passButtonHeldDownTime=true;
        //bool passButtonTouchBegan;
    }
    else if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyShootButton].position : width ])
    {
        NSLog(@"Shoot");
        Ball *myBall = [[GameModel sharedGameModel] getBall];
        Team *t = [[GameModel sharedGameModel] getTeam1];
        
        if([t doesTeamHaveBall:myBall])
        {
            if ([myBall attached] )
            {
                [[t getMainPlayer] shootBallHuman:myBall] ;
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
    
    
#else
    if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyPassButton].position : width])
    {
        NSLog(@"Pass");
        [self doPassControls:false];
    }
//    else if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyLongPassButton].position : width ])
//    {
//        [self doPassControls:true];
//    }
    else if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyShootButton].position : width ])
    {
        NSLog(@"Shoot");
        Ball *myBall = [[GameModel sharedGameModel] getBall];
        Team *t = [[GameModel sharedGameModel] getTeam1];
        
        if([t doesTeamHaveBall:myBall])
        {
            if ([myBall attached] )
            {
                [[t getMainPlayer] shootBallHuman:myBall] ;
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
    else
    {
#ifdef DO_SWIPE_CONTROLS
        swipeStart = convertedLocation;
        swipeVector=ccp(0,0);
        CCLOG(@"**>> Swipe Start : %f,%f", swipeStart.x, swipeStart.y);
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
- (void)touchMOVED:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
//- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event {

//- (void)ccTouchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event

    CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    //float width = 40.0; //TODO - temporary
    
    
    if ([[GameModel sharedGameModel] getGameState] != matchStarted)
    {
        //CCLOG(@">>GAME LAYER OFF");
        return;
    }
    else
    {
        //CCLOG(@">>GAME LAYER ON");
        
    }
#ifdef DO_DOUBLE_TAP_PASS
    if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyPassButton].position : width])
    {
        //passButtonHeldDownTime=true;
        //bool passButtonTouchBegan;
        passButtonHeldDownTime++;
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
//- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {

	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    float width = 26.5;
    
    if (!self.visible)
    {
        return;
    }
    
    if ([[GameModel sharedGameModel] getGameState] != matchStarted)
    {
       // CCLOG(@">>GAME LAYER OFF");
        return;
    }
    else
    {
     //   CCLOG(@">>GAME LAYER ON");
        
    }
    
    
#ifdef IGNORE_USER_CONTROLS
    // only move player if either team has the ball directly under control
    // otherwise let the AI moe the player
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
    
    //    swipeEnd = convertedLocation;
    //    CCLOG(@">> Swipe End : %f,%f", swipeStart.x, swipeStart.y);
    //    swipeVector = ccpSub(swipeEnd, swipeStart);
    //[[team1 getMainPlayer] setVector:swipeVector];
    CGFloat rotationRadians = ccpToAngle(swipeVector);
    CGFloat rotationDegrees = -CC_RADIANS_TO_DEGREES(rotationRadians);
    rotationDegrees += 90.0f;
    
    
    // set joypad position back to center pos
    CGPoint joyCenter = [[[HudModel sharedHudModel] joypad] position];
    [[HudModel sharedHudModel] setJoyStickPosition : &joyCenter];
    
    
    //
    if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyPassButton].position : width] ||
        [self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyShootButton].position : width ])
    {
        //CCLOG(@">>KEEPER : pass or shot pressed");
        if (([[GameModel sharedGameModel] getMatchState] == keeperHasBall) && [[GameModel sharedGameModel] isKeeperWithBallHumanPlayer])
        {
            //CCLOG(@">>KEEPER : pass or shot pressed - do goal kick");
            Player *keeper = [self getKeeperWithBall];
            //CCLOG(@">>KEEPER : pass or shot pressed - do goal kick %@", [keeper playerName]);
            Ball *b = [[GameModel sharedGameModel] getBall];
            
            if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyPassButton].position : width] )
            {
                //[keeper doGoalKick:b];
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
        CCLOG(@">>Low pass");
        
        [self doPassControls:false];
        
        //CHANGED
//        CCLOG(@">>> Pass Button held down time : %d", passButtonHeldDownTime);
//        if (passButtonHeldDownTime > 3)
//        {
//            CCLOG(@">>High pass");
//            [self doPassControls:true];
//        }
//        else
//        {
//            CCLOG(@">>Low pass");
//            [self doPassControls:false];
//        }
//        passButtonHeldDownTime=0;
        //
    }
    else if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyShootButton].position : width ])
    {
        //
    }
    else
    {
#ifdef DO_SWIPE_CONTROLS
        if (ccpLength(swipeVector) > 0 && ccpLength(swipeVector) > 10)
        {
            //[[[[GameModel sharedGameModel] getTeam1] getMainPlayer] setSpriteRotation:rotationDegrees];
            Ball *myBall = [[GameModel sharedGameModel] getBall];
            [[[[GameModel sharedGameModel] getTeam1] getMainPlayer] setSpriteRotationHumanControls:rotationDegrees: myBall];
            CCLOG(@">> Swipe Vector : %f,%f", swipeVector.x, swipeVector.y);
            [Team setControlsActive:true];
        }
        else
        {
            [Team setControlsActive:false];
        }
#endif
    }
}
 

- (void) doSomethingOne: (CCButton  *) menuItem
{
	NSLog(@"The first menu was called");
}
- (void) doSomethingTwo: (CCButton  *) menuItem
{
	NSLog(@"The second menu was called");
}
- (void) doSomethingThree: (CCButton  *) menuItem
{
	NSLog(@"The third menu was called");
}


@end
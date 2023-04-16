//
//  Player.m
//  mySoccer
//
//  Created by Trevor Delves on 08/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Player.h"
#import "Team.h"
#import "HudLayer.h"
#import "GameLayer.h"

@implementation Player

@synthesize formationPosition;

@synthesize playerData;
@synthesize kitSprite;
@synthesize kitArmsSprite;
@synthesize kitCentreStripSprite;
@synthesize skinSprite;
@synthesize hairSprite;
@synthesize kitSprite2;
@synthesize kitArmsSprite2;
@synthesize kitCentreStripSprite2;
@synthesize skinSprite2;
@synthesize hairSprite2;
@synthesize kitSlideSprite;
@synthesize kitSleeveSlideSprite;
@synthesize kitCentreStripSlideSprite;
@synthesize skinSlideSprite;
@synthesize hairSlideSprite;
@synthesize playerSlideSprite;

@synthesize canJump;
@synthesize isJumping;
@synthesize cantJumpTimer;


@synthesize playerId;
@synthesize teamId;
@synthesize playerName;
@synthesize frameName;
@synthesize team;
@synthesize hadFirstTouch;
@synthesize speed;
@synthesize nameLabel;
@synthesize strength;
@synthesize collisionVector;
@synthesize prevSpriteRotation;
@synthesize ballJustKicked;
@synthesize waitingToPass;
@synthesize waitingToShoot;
@synthesize runoutState;
@synthesize readyForKickOff;
@synthesize passJustMade;
@synthesize stayStillAfterPassCounter;
@synthesize possessionId;
@synthesize runDownWingPossessionId;
@synthesize doWingPlay;
@synthesize standingOff;
@synthesize currentOppActivePlayerId;
@synthesize previousOppActivePlayerId;
@synthesize standOffPossessionId;
@synthesize standoffTime;
@synthesize standoffClock;

//
//CCSpriteFrame *frame;
//GameLayer *gameLayer;

bool testDone=false;


//
// on "init" you need to initialize your instance
-(id) initWithSprite:(NSString *)spriteName
{
    
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] ))
    {
        self.sprite = [CCSprite spriteWithImageNamed:spriteName];
        self.shadow = [CCSprite spriteWithImageNamed: @"playerShadow.png"];
        
        // temporary
        //self.playerSlideSprite = [CCSprite spriteWithImageNamed: @"maskCenter.png"];
        
        // player frame 1
        self.kitSprite=[CCSprite spriteWithImageNamed: @"maskCenter.png"];
        self.kitCentreStripSprite=[CCSprite spriteWithImageNamed: @"maskCenterStrip.png"];
        self.kitArmsSprite=[CCSprite spriteWithImageNamed: @"maskArms.png"];
        self.skinSprite=[CCSprite spriteWithImageNamed: @"faceMask.png"];
        self.hairSprite=[CCSprite spriteWithImageNamed: @"hairMask.png"];
        
        // player frame 2
        self.kitSprite2=[CCSprite spriteWithImageNamed: @"maskCenter2.png"];
        self.kitCentreStripSprite2=[CCSprite spriteWithImageNamed: @"maskCenterStrip2.png"];
        self.kitArmsSprite2=[CCSprite spriteWithImageNamed: @"maskArms2.png"];
        self.skinSprite2=[CCSprite spriteWithImageNamed: @"faceMask2.png"];
        self.hairSprite2=[CCSprite spriteWithImageNamed: @"hairMask2.png"];
        
        // slide frame
        self.kitSlideSprite=[CCSprite spriteWithImageNamed: @"playerSlideKitCentre.png"];
        self.kitSleeveSlideSprite=[CCSprite spriteWithImageNamed: @"playerSlideKitArms.png"];
        self.kitCentreStripSlideSprite =[CCSprite spriteWithImageNamed: @"playerSlideKitCentreStrip.png"];
        self.skinSlideSprite=[CCSprite spriteWithImageNamed: @"playerSlideSkin.png"];
        self.hairSlideSprite=[CCSprite  spriteWithImageNamed: @"playerSlideHair.png"];
        
        
        //
        [sprite addChild:kitSprite];
        [sprite addChild:kitArmsSprite];
        [sprite addChild:kitCentreStripSprite];
        [sprite addChild:skinSprite];
        [sprite addChild:hairSprite];
        
        kitSprite.anchorPoint=ccp(0,0);
        kitArmsSprite.anchorPoint=ccp(0,0);
        kitCentreStripSprite.anchorPoint=ccp(0,0);
        skinSprite.anchorPoint=ccp(0,0);
        hairSprite.anchorPoint=ccp(0,0);
        
        //
        [sprite addChild:kitSprite2];
        [sprite addChild:kitArmsSprite2];
        [sprite addChild:kitCentreStripSprite2];
        [sprite addChild:skinSprite2];
        [sprite addChild:hairSprite2];
        
        kitSprite2.anchorPoint=ccp(0,0);
        kitArmsSprite2.anchorPoint=ccp(0,0);
        kitCentreStripSprite2.anchorPoint=ccp(0,0);
        skinSprite2.anchorPoint=ccp(0,0);
        hairSprite2.anchorPoint=ccp(0,0);
        
        //
        [sprite addChild:kitSlideSprite];
        [sprite addChild:kitSleeveSlideSprite];
        [sprite addChild:kitCentreStripSlideSprite];
        [sprite addChild:skinSlideSprite];
        [sprite addChild:hairSlideSprite];
        
        kitSlideSprite.anchorPoint=ccp(0,0);
        kitSleeveSlideSprite.anchorPoint=ccp(0,0);
        kitCentreStripSlideSprite.anchorPoint=ccp(0,0);
        skinSlideSprite.anchorPoint=ccp(0,0);
        hairSlideSprite.anchorPoint=ccp(0,0);

        //
        self.shadow.opacity=0.6;
        self.shadow.scale=0.95;
        self.vector = ccp(0,0);
        self.position=ccp(0,0);
        self.speed = 40+[Util random:15];
        //self.speed = 45;
        self.sprite.scale=PLAYER_SPRITE_SCALE;
        //self.kitSprite.scale=0.96;
        self.shadow.scale=0.5;
        

        //
        previousPositions = [[NSMutableArray alloc] init];
        [self initPreviousPositions];
        
        canSlide=true;
        playerDirection=0;
        animRate=10;
    }
    return self;
}




-(void) setGameLayer :(GameLayer *)layer
{
    _gameLayer = layer;
}

-(GameLayer *) getGameLayer
{
    return _gameLayer;
}


-(void) doPassSound {
    
    int randKick = [Util random:4];
    
    NSString *sound;
    
    switch(randKick) {
        
        case 0:
            sound=PASS1;
            break;
        
        case 1:
            sound=PASS2;
            break;
       
        case 2:
            sound=PASS3;
            break;
            
        case 3:
            sound=KICK2;
            break;
            
        
        default:
            sound=PASS1;
            break;
    }
    
    [self playSoundEffect:sound];
}

-(void) doShotSound {
    
    int randKick = [Util random:3];
    
    NSString *sound;
    
    switch(randKick) {
            
        case 0:
            sound=KICK1;
            break;
            
        case 1:
            sound=KICK2;
            break;
            
        case 2:
            sound=KICK3;
            break;
            
            
        default:
            sound=KICK1;
            break;
    }
   // NSLog(@"**Sound Id : %@",sound);
    [self playSoundEffect:sound];
}


-(CGPoint) getAdvancedSpritePosition
{
  
    return ccpAdd( self.position, ccpMult(self.vector, 0.85)); // 0.5
    
}

//-(void) setPosition:(float)x :(float)y
-(void) setPositionX:(float)x Y:(float)y;
{
    if (isnan(x) || isnan(y)) {
        NSLog(@"setPositionX is Nan");
        
    }
    self.sprite.position = ccp( x, y );
    self.position = ccp( x, y );
    //self.shadow.position = ccp( x, y );
    // CCLOG(@"Shadow pos = %f,%f", self.shadow.position.x, self.shadow.position.y);
    
}

//-(CCSprite *) getShadow
//{
//    return shadow;
//}

-(void) setPlayerDirection:(int)direction
{
    playerDirection=direction;
}

-(int) getPlayerDirection
{
    return playerDirection;
}

-(int) getAnimFrame
{
    return animFrame;
}

-(void) setAnimFrame:(int)newFrame
{
    animFrame=newFrame;
}


-(void) hideMaskSprites {
    //frame 1
    self.kitSprite.visible=false;
    self.kitArmsSprite.visible=false;
    self.skinSprite.visible=false;
    self.hairSprite.visible=false;
    self.kitCentreStripSprite.visible=false;
    
    // frame 2
    self.kitSprite2.visible=false;
    self.kitArmsSprite2.visible=false;
    self.skinSprite2.visible=false;
    self.hairSprite2.visible=false;
    self.kitCentreStripSprite2.visible=false;
}

-(void) showMaskSprites {
    //frame 1
    self.kitSprite.visible=true;
    self.kitArmsSprite.visible=true;
    self.skinSprite.visible=true;
    self.hairSprite.visible=true;
    self.kitCentreStripSprite.visible=true;
    
    // frame 2
    self.kitSprite2.visible=true;
    self.kitArmsSprite2.visible=true;
    self.skinSprite2.visible=true;
    self.hairSprite2.visible=true;
    self.kitCentreStripSprite2.visible=true;
}

-(void) hideSlideMaskSprites {
    
    // slide
    self.kitSlideSprite.visible=false;
    self.kitCentreStripSlideSprite.visible=false;
    self.kitSleeveSlideSprite.visible=false;
    self.hairSlideSprite.visible=false;
    self.skinSlideSprite.visible=false;
    
}

-(void) showSlideMaskSprites {

    // slide
    self.kitSlideSprite.visible=true;
    self.kitCentreStripSlideSprite.visible=true;
    self.kitSleeveSlideSprite.visible=true;
    self.hairSlideSprite.visible=true;
    self.skinSlideSprite.visible=true;
}

-(void) setNameLabelPosition:(CGPoint) pos
{
    //self.nameLabel.position = pos;
}


-(void) doPlayerTouchBallSound {
#if __CC_PLATFORM_ANDROID
    return;
#endif
    
    [self playSoundEffect:PASS1];
}


- (void) updatePlayer2:(CCTime)dt
{
    // sprite.position = ccp( sprite.position.x + xVel*dt, sprite.position.y + yVel*dt);
    ////printf("updatePlayer...");
    
}

//-(void)setVector:(CGPoint *)vec
//{
//    vector.x = vec->x;
//    vector.y = vec->y;
//
//}

-(CGPoint) getStartPosition
{
    return ccp(150,250);
}

//
-(bool) isOutfieldPlayer
{
    if (playerId > 1)
        return true;
    
    return false;
}

//-(CGPoint *)getVector
//{
//    return &vector;
//}

//-(void) setTeam:(Team *)_team
//{
//    team=_team;
//}
//
//-(Team*)getTeam
//{
//    return team;
//}

-(bool) isKeeper
{
    return (self.playerId == KEEPER_ID);
}

-(bool)isActivePlayer
{
    if ([team isActivePlayer:self])
        return true;
    return false;
}

//
-(void) setPlayerHasBall:(Ball *)ball
{
    [ball setAttached:true];
//    [ball setTeamWithBallId:[self getTeamId]];
//    [ball setPlayerWithBallId:[self playerId]];
    
    [ball setTeamAndPlayerWithBallId:[self getTeamId] :[self playerId]];
}

//
-(bool) playerHasBall:(Ball *)ball
{
    if ([ball attached] &&
        [ball teamWithBallId] == teamId &&
        [ball playerWithBallId] == playerId)
        return true;
    
    return false;
}

-(CGPoint) getFacingVector
{
    return facingVector;
}

/*
-(CGPoint) getSpriteRotationAsVector
{
    
}*/

//
-(void) startStayStillAfterPassCounter
{
    passJustMade=true;
    stayStillAfterPassCounter=0;
}

//
//-(void) updateStayStillCounter
//{
//    stayStillAfterPassCounter++;
//}

-(bool) canMove
{
    if (!passJustMade)
    {
        return true;
    }
    
    return false;
}

-(void) updatePossessionId {
    self.possessionId++;
}


//
-(void)updatePassCompletedTime
{
    passCompletedTime++;
    if (passCompletedTime >= MAXFLOAT)
        passCompletedTime=0;
}

//
-(void)setPlayerFormationPositions:(NSMutableArray *)positions
{
    playerPositions=positions;
}

//
-(void)setPlayerLineupPositions:(NSMutableArray *)positions
{
    lineupPositions=positions;
}

//-(void) setSpeed:(int)value
//{
//    speed=value;
//}


//
-(NSMutableArray *)getPlayerFormationPositions
{
    return playerPositions;
}

//
-(bool) isPlayerInCenterAreaOfPitch
{
    int leftLimit = PITCH_X_CENTER-(PITCH_WIDTH/4);
    int rightLimit = PITCH_X_CENTER+(PITCH_WIDTH/4);
    
    if (self.position.x >= leftLimit && self.position.x <= rightLimit)
    {
        return true;
    }
    
    //CCLOG(@">>On Wing..");
    return false;
}

//
-(bool) isPlayerOnWings
{
    return (![self isPlayerInCenterAreaOfPitch]);
}

//
-(bool) isPlayerInAttackingHalf
{
    if ([self isTeamShootingUp])
    {
        return (self.position.y > PITCH_Y_CENTER ? true : false);
        
        //        if (self.position.y > PITCH_Y_CENTER)
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            return false;
        //        }
    }
    else
    {
        return (self.position.y < PITCH_Y_CENTER ? true : false);
        //        if (self.position.y < PITCH_Y_CENTER)
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            return false;
        //        }
    }
}

//
-(bool) isPlayerInDefensiveHalf
{
    return (![self isPlayerInAttackingHalf]);
}



//
//-(void) updateActiveCompPlayerSimple:(CCTime)dt theBall:(Ball *)ball
//{
//
//    //[self doAiBasic];
//    if (teamId ==1)
//        [self doAiNew];
//
//    [self doCompAnim];
//
//    sprite.position = ccp( sprite.position.x + vector.x*dt, sprite.position.y + vector.y*dt);
//
//}

//-(void) updateActiveCompPlayerSimple:(CCTime)dt theBall:(Ball *)ball
//{
//
//    //[self doAiBasic];
//    if (teamId ==1)
//        [self doAiNew];
//
//    [self doCompAnim];
//
//   // sprite.position = ccp( sprite.position.x + vector.x*dt, sprite.position.y + vector.y*dt);
//    [self updateSpritePos:dt];
//
//}

//
-(void) startAllowSlideTimer
{
    //    [self runAction:[CCSequence actions:
    //                     [CCDelayTime actionWithDuration:3],
    //                     [CCCallFunc actionWithTarget:self selector:@selector(resetAllowSlideStatus:)],
    //                     nil]];
    
    [self schedule: @selector(resetAllowSlideStatus:) interval:1.5];
    // [[CCScheduler sharedScheduler] scheduleSelector:@selector(resetAllowSlideStatus:) forTarget:self interval:3.0f paused:NO];
    
    canSlide=false;
    //isSliding=true;
    //printf("\n ** startAllowSlideStatus - Team id = %d, Player id = %d/n", [self teamId, [self getPlayerId]);
    
}

//
-(void) resetAllowSlideStatus: (CCTime) dt
{
    canSlide=true;
    //printf("\n ** restAllowSlideStatus - Team id = %d, Player id = %d/n", [self teamId, [self getPlayerId]);
    //[[CCScheduler sharedScheduler] unscheduleSelector:@selector(resetAllowSlideStatus:) forTarget:self];
}



-(void) resetDoSlideStatus:(CCTime)dt
{
    //CCLOG(@"***TREVOR FUCKING D***");
    isSliding=false;
    //printf("\n ** restDoSlideStatus - Team id = %d, Player id = %d/n", [self teamId, [self getPlayerId]);
    //  [[CCScheduler sharedScheduler] unscheduleSelector:@selector(resetDoSlideStatus:) forTarget:self];
}

//
-(void) startDoSlideTimer
{
    //    [self runAction:[CCSequence actions:
    //                     [CCDelayTime actionWithDuration:2],
    //                     [CCCallFunc actionWithTarget:self selector:@selector(resetDoSlideStatus:)],
    //                     nil]];
    
    // [self schedule: @selector(resetDoSlideStatus:) interval:1.5];
    
    //COMMENTED
    //[self schedule:@selector(resetDoSlideStatus:)];
    
    // [[CCScheduler sharedScheduler] scheduleSelector:@selector(resetDoSlideStatus:) forTarget:self interval:2.0f paused:NO];
    //[[CCScheduler sharedScheduler] scheduleSelector:@selector(updateShipMove:) forTarget:self interval:0.0 paused:NO];
    
    //canSlide=false;
    isSliding=true;
    //printf("\n ** starDoSlideStatus - Team id = %d, Player id = %d/n", [self teamId, [self getPlayerId]);
}

//



-(bool) canSlide
{
    
    // if a player has slide, only allow to slide again after a time has elapsed
    
    /*
     
     
     
     */
    return canSlide;
    
    
    // if a player has been tackled, only allow to slide again after a time has elapsed
    
    // HOW - use a timer, counters are messy
}

//
-(void) canTouchBall
{
    // if a player has passed the ball, only allow to ouch again after a time has passed
    // OR allow to touch again onceout of ball collision range
    
}

//
-(void) setCantSlide
{
    isCantSlideActivated=true;
    cantSlideTimer=0;
}

//
-(void) playSoundEffect:(NSString *)sndName
{
    if (![[GameModel sharedGameModel] isManagerMode])
    {
        [Util playSoundEffect:sndName];
    }
}

//TODO - do check in Util - create shared singleton instances
-(void) playSoundMusic:(NSString *)sndName loop:(bool)loop
{
    if (![[GameModel sharedGameModel] isManagerMode])
    {
        [Util playSoundMusic:sndName loop:loop];
    }
}

//
-(void) passToNoNObstructedPlayerForwardOnly:(Ball *)ball
{
    //TMP TEST
    [self passToPlayerInMostSpace:ball];
    return;
/*
    [self passToNoNObstructedPlayer:ball];
    return;
    
    NSMutableArray *playersList = [[self team] getPlayersClosestFirstMinimumDistance: self: 100];
    
    for (Player *player in playersList)
    {
        if (![self isPassInPathOfAPlayer:player]
            && (![self isBackwardPass:ccpSub([player position],self.position)] ))
        {
            // do Pass
#ifdef DO_PLAY_PASS_AHEAD
            if ([Util random5050])
            {
                [self passToPlayerAhead:ball: player :50];
            }
            else
            {
                [self passToPlayer :ball: player];
            }
#else
            [self passToPlayer :ball :player];
#endif
            return;
        }
        else
        {
            //CCLOG(@"--> player id %d has pass obstructed", [player playerId]);
            //            int distance = ccpDistance([self position], [player position]);
            //            if (distance > 200 & [Util random:2] == 0)
            //            {
            //                [self passToPlayerInAir:ball :player];
            //            }
            
            
        }
    }
    //CCLOG(@"/n------");
 */
}

//
-(void) passToNoNObstructedPlayer:(Ball *)ball
{
    NSMutableArray *playersList = [[self team] getPlayersClosestFirstMinimumDistance: self: 100];
    
    for (Player *player in playersList)
    {
        #ifdef TURN_OFF_BACKWARD_PASS
        if ( (![self isPassInPathOfAPlayer:player] && ![self isBackwardPass:ccpSub([player position],self.position)])
                || ([self isBackwardPass:ccpSub([player position],self.position)] && [self isWithinBackwardPassDistance:[player position]]))
        #else
            if (![self isPassInPathOfAPlayer:player])

            
        #endif
            
        {
            // do Pass
#ifdef DO_PLAY_PASS_AHEAD
            [self passToPlayerAhead:ball: player :50];
#else
            [self passToPlayer:ball: player];
#endif
            
            return;
        }
        else
        {
            //CCLOG(@"--> player id %d has pass obstructed", [player playerId]);
            //            int distance = ccpDistance([self position], [player position]);
            //            if (distance > 200 & [Util random:2] == 0)
            //            {
            //                [self passToPlayerInAir:ball :player];
            //            }
            
            
        }
    }
    //CCLOG(@"/n------");
}

-(void) crossToNoNObstructedPlayer:(Ball *)ball
{
    //CCLOG(@">> CRoss to player");
    NSMutableArray *playersList = [[self team] getPlayersClosestFirstMinimumDistance: self: 100];
    
    for (Player *player in playersList)
    {
        //        if (![self isPassInPathOfAPlayer:player]
        //            && (![self isBackwardPass:ccpSub([player position],self.position)]
        //                || ([self isBackwardPass:ccpSub([player position],self.position)]
        //                    && [self isWithinBackwardCrossDistance:[player position]])))
        if (![self isBackwardPass:ccpSub([player position],self.position)]
            || ([self isBackwardPass:ccpSub([player position],self.position)]
                && [self isWithinBackwardCrossDistance:[player position]]))
        {
            // do Pass
#ifdef DO_PLAY_PASS_AHEAD
            [self passToPlayerAhead:ball: player :50];
#else
            //CCLOG(@">> DO CRoss to player");
            
            [self passToPlayer:ball: player];
#endif
            
            return;
        }
    }
}


//
-(void) doPassAi:(Ball *)ball
{
//    int tempoMax = 200; //50; // 100; // 50 // 5-15
//    int tempo =10;
    //float tempoNow = tempoMax/tempo;
    
    int tempoNow = [[self team] passRate];
    if (tempoNow < LOWEST_VALID_PASS_RATE) {
        tempoNow = LOWEST_VALID_PASS_RATE;
    }

//    if (tempoNow < LOWEST_PASS_RATE_BASE) {
//        tempoNow = MEDIUM_PASS_RATE_BASE;
//    }
    
    //todo
    // 0. add intelligence to passing
    // ensure player moves forward initially, doesn't over turn or turn when he doesnt need to.
    // 1. isPlayerInWayOfPass
    // 2. does target player having too many opposing players around him
    
    // 3. get allPlayers in list of closest first
    // -> find one who isnt in obstructed
    
    //todo :add - if there is a person in space, non obstucted, ahead of the player - then do this asap
    
    if ([self isOppPlayerAhead:100])
    {
        //TEMP TEST
       // [self passToPlayerInMostSpace:ball];
        
        //[self passToClosestPlayer:ball];
        if ([Util random:2] == 0)
        {
            //[self passToClosestPlayer:ball];
            if ([self getTeamId] == TEAM2)
            {
                //[self passToNoNObstructedPlayer:ball];
                [self passToNoNObstructedPlayerForwardOnly:ball];
                
            }
            else
            {
                [self passToNoNObstructedPlayerForwardOnly:ball];
            }
            //[self passToFurthestPlayer:ball];
        }
        else
        {
            if ([self getTeamId] == TEAM2)
            {
                //[self passToNoNObstructedPlayer:ball];
                [self passToNoNObstructedPlayerForwardOnly:ball];
                
            }
            else
            {
                [self passToNoNObstructedPlayerForwardOnly:ball];
            }
            //[self passToSecondClosestPlayer:ball];
            //[self passToFurthestPlayer:ball];
            
        }
        
    } else {
        
        
        if (actionCount >= tempoNow)
        {
            actionCount=0;
            //[self passToFurthestPlayer:ball];
            if ([Util random:2] == 0)
            {
                //[self passToClosestPlayer:ball];
                if ([self getTeamId] == TEAM2)
                {
                    //[self passToNoNObstructedPlayer:ball];
                    [self passToNoNObstructedPlayerForwardOnly:ball];
                    
                }
                else
                {
                    [self passToNoNObstructedPlayerForwardOnly:ball];
                }
            }
            else
            {
                if ([self getTeamId] == TEAM2)
                {
                    //[self passToNoNObstructedPlayer:ball];
                    [self passToNoNObstructedPlayerForwardOnly:ball];
                    
                }
                else
                {
                    [self passToNoNObstructedPlayerForwardOnly:ball];
                }
                //[self passToSecondClosestPlayer:ball];
            }
            
        }
    }
}


// to do - create get my Goal Pos method
-(CGPoint) getDefensiveStandOffTargetPostition:(Player *)oppPlayer
{
    CGPoint myGoalPos;
    CGPoint defenseTargetPos;
    
    if ([self isTeamShootingUp])
    {
        myGoalPos = BOTTOM_GOAL_CENTER_POS;
    }
    else
    {
        myGoalPos = TOP_GOAL_CENTER_POS;
    }
    
    CGPoint oppVectorToMyGoal;
#ifdef DO_GET_TARGET_POSITION_OFFSET
    oppVectorToMyGoal = ccpSub(myGoalPos, [oppPlayer getPreviousPosition:PREVIOUS_POSITION_OFFSET]);
#else
    oppVectorToMyGoal = ccpSub(myGoalPos, [oppPlayer position]);
#endif
    
    //CGPoint oppVectorToMyGoal = ccpSub(myGoalPos, [oppPlayer position]);
    oppVectorToMyGoal = ccpNormalize(oppVectorToMyGoal);
    //oppVectorToMyGoal = ccpMult(oppVectorToMyGoal, STANDOFF_DISTANCE);
    
    oppVectorToMyGoal = ccpMult(oppVectorToMyGoal, STANDOFF_DISTANCE+[Util random:STANDOFF_DISTANCE_MAX]);
    
    
    
#ifdef DO_GET_TARGET_POSITION_OFFSET
    defenseTargetPos = ccpAdd([oppPlayer getPreviousPosition:PREVIOUS_POSITION_OFFSET], oppVectorToMyGoal);
    #else
        defenseTargetPos = ccpAdd([oppPlayer position], oppVectorToMyGoal);

    #endif
    //defenseTargetPos = ccpAdd([oppPlayer position], oppVectorToMyGoal);
    return defenseTargetPos;
}


- (void)updateActiveCompPlayerWithBall:(Ball *)ball dt:(CCTime)dt
{
    //standingOff=false;
    [self setStandingOffFalse:8];

    
    if (actionCount % 4 == 0)
    {
        [self doAiNew:ball];
    }
    
    if (actionCount % 5 == 0)
    {
        if (ccpDistance([self position], [ball position]) < 100) // 50 //100 //150
        {
            [self resetTargetPos:ball];
        }
    }
    
    if ([self isPassCompletedTimeElapsed])
        //if ([self isBallCollision:ball])
    {
        //[self doCompStickyBall:ball];
#ifdef DO_NON_STICKY_BALL
        [self doCompNonStickyBall:ball];
#else
        [self doCompStickyBall:ball];
#endif
        
    }
    
    if (self.waitingToPass)
    {
        //CCLOG(@">>> Was waiting to pass.. now can do pass");
        if ([self getTeamId] == TEAM2)
        {
            [self passToNoNObstructedPlayerForwardOnly:ball];
            //[self passToNoNObstructedPlayerForwardOnly:ball];
            
        }
        else
        {
            [self passToNoNObstructedPlayerForwardOnly:ball];
        }
        //[self playSoundEffect:@"kick3_rs.wav"];
        self.waitingToPass=false;
    }
    
    if (self.waitingToShoot)
    {
        //CCLOG(@">>> Was waiting to shoot.. now can do shoot");
        [self shootBall:ball];
        self.waitingToShoot=false;
        //[self playSoundEffect:@"kick1_rs.wav"];
    }
    
    if ([self isInTnPositionToCross:ball] && [self isThereAPlayersInTheBoxForCross])
    {
        if ([Util random5050])
        {
            
            if ([Util random1inX:10])
            {
                [self crossBall:ball];
            }
        }
        else
        {
            if ([Util random1inX:3])
            {
                [self crossToNoNObstructedPlayer:ball];
            }
        }
    }
    else if ([self canShoot])
    {
        [self shootBall:ball];
    }
    else
    {
        [self doPassAi:ball];
    }
    
    //
    if (isDoingSlide)
    {
        [self doCompSlideAnim];
    }
    else
    {
        [self doCompAnim];
    }
    
    [self updateSpritePos:dt];
    firstTouch=false;
}

-(void) setStandingOffFalse :(int) id {
    //NSLog(@">>> Set Standing OFF FALSE : %d",id);
    self.standingOff=false;
}

-(long) getRandomStandOffTimeByDifficulty {
    // more difficult = less time standing off
    
    switch([GameData getDifficulty]) {
            
        case EASY:
            return (long)([Util random:EASY_STANDOFF_TIME_RANGE])+STANDOFF_TIME_BASE;
            break;
            
        case MEDIUM:
            return (long)([Util random:MEDIUM_STANDOFF_TIME_RANGE])+STANDOFF_TIME_BASE;

            break;
            
        case HARD:
            return (long)([Util random:HARD_STANDOFF_TIME_RANGE])+STANDOFF_TIME_BASE;
            break;
            
        default:
            return (long)([Util random:MEDIUM_STANDOFF_TIME_RANGE])+STANDOFF_TIME_BASE;
            break;
    }
}


-(bool) doRandomStandOffByDifficulty {
    switch([GameData getDifficulty]) {
             
         case EASY:
            return [Util random1inX:EASY_STANDOFF_CHANCE];
            break;
             
         case MEDIUM:
             return [Util random1inX:MEDIUM_STANDOFF_CHANCE];
             break;
             
         case HARD:
            return [Util random1inX:HARD_STANDOFF_CHANCE];
             break;
             
         default:
            NSLog(@">>>> STand Off DEFAULT...");
            return false;
             break;
     }
}


-(long) getRandomStandOffTime {
    return (long)([Util random:300])+100;
}

-(bool) doStandOff {
    
    //return true;
    // if opp team active player possession id and current player id is different
    // then choose to do standoff or not
    Boolean doStandOff;
 
    self.previousOppActivePlayerId=self.currentOppActivePlayerId;
    self.currentOppActivePlayerId=[[[self team] getOppTeamActivePlayer] playerId];
    
    if (self.previousOppActivePlayerId != self.currentOppActivePlayerId) {
        //
        //if ([Util random5050]) {
        
        if ([self doRandomStandOffByDifficulty]) {
            doStandOff=true;
            self.standoffClock=0;
            self.standoffTime=[self getRandomStandOffTimeByDifficulty];
 //           self.standoffTime=[self getRandomStandOffTime];

        } else {
            doStandOff=false;
        }
  
        //NSString *prevOppPlayerName = [[[[self team] getOppTeam] getPlayer:self.previousOppActivePlayerId+1] playerName];
        //NSLog(@" TEAM %d : >> New opponent player : %@ - decide if to standoff or not - decision %d", [[self team] getTeamId] ,
        //      [[[self team] getOppTeamActivePlayer] playerName], doStandOff);
        return doStandOff;
    } else {
        // carry on as normal
        //self.standingOff=true;
        //NSLog(@" TEAM %d : >>  Same Opponent - Standing Off : %d, Opp Player : %@", [[self team] getTeamId] , self.standingOff,[[[self team] //getOppTeamActivePlayer] playerName]);
        
        // if standoff time has elapsed - reset
        if (self.standingOff) {
            if (self.standoffClock > self.standoffTime) {
                //NSLog(@">>> STand OFf time elapsed...");
                self.standingOff=false;
                self.standoffTime=0;
                self.standoffClock=0;
            }
        }
        
        return self.standingOff;
    }
}


- (void)updateActiveCompPlayerWithoutBall:(CCTime)dt ball:(Ball *)ball
{
    if (self.standingOff) {
        self.standoffClock++;
        //NSLog(@">>> Stand Off timer : %ld",self.standoffClock);

    } else {
        self.standoffClock=0;
    }
    
    if ([ball attached] && [self isPlayerGoalSide: [[[self team] getOppTeamActivePlayer] position]])
    {
        if ([self getTeamId] == TEAM1 || [self getTeamId] == TEAM2)
        {
            //CCLOG(@">> DO Defensive Active Player Target Pos");
#ifdef DO_NO_STANDOFF_IN_DEFENSE_ZONE
            if ([self isInDefenseZone:self.position.y : [self getTeamFacingDir]]
                || [self isInMidfieldDefenseZone:self.position.y : [self getTeamFacingDir]]
                || [self isInMidfieldAttackZone:self.position.y : [self getTeamFacingDir]]
                || [self isInAttackZone:self.position.y : [self getTeamFacingDir]])
            {
                //CCLOG(@">>In Defensive Zone : setting target pos to ball");
#ifdef DO_GET_TARGET_POSITION_OFFSET
                targetPos = [[[self team] getOppTeamActivePlayer] getPreviousPosition:PREVIOUS_POSITION_OFFSET];
#else
                targetPos = [ball position];
                [self setStandingOffFalse:1];
                //self.standingOff=false;
#endif
                
            }
            else
            {
                // CCLOG(@">>NOT In Defensive Zone : setting target pos to standoff");
                targetPos = [self getDefensiveStandOffTargetPostition:[[self team] getOppTeamActivePlayer]];
                
                if (ccpDistance(targetPos,self.position ) < 10) {
                    self.standingOff=[self doStandOff];
                } else {
                    //self.standingOff=false;
                    [self setStandingOffFalse:2];
                }
            }
            
#else
            self.standingOff=[self doStandOff];
            if (self.standingOff) {
                if ([self getTeamId] == TEAM1) {
          //          NSLog(@" TEAM %d : >>DO Standoff position...Status : %d : %@",[[self team] getTeamId], self.standingOff,
          //                [[[self team] getOppTeamActivePlayer] playerName]);
                }
                targetPos = [self getDefensiveStandOffTargetPostition:[[self team] getOppTeamActivePlayer]];
//                NSLog(@">>> STanding oFF - Vec  - %f,%f :", self.vector.x, self.vector.y);
//                NSLog(@">>>>Distance : %f", ccpDistance(targetPos,self.position));
                if (ccpDistance(targetPos,self.position ) < 5) {
                    //[self setPlayerStanding];
                    [self setVector:CGPointMake(0.0,0.0)];
                   // self.vector.x=0.0;
                    
                }
                
            } else {
           //     NSLog(@" TEAM %d : >>>>> DO NON Standoff position... : %@", [[self team] getTeamId] ,[[[self team] getOppTeamActivePlayer] playerName]);

                targetPos = [ball position];
                
            }
            
//            targetPos = [self getDefensiveStandOffTargetPostition:[[self team] getOppTeamActivePlayer]];
//            if (ccpDistance(targetPos,self.position ) < 10) {
//                self.standingOff=[self doStandOff];
//            } else {
//                self.standingOff=[self doStandOff];
//            }
#endif
        }
        else
        {
            targetPos = [ball position];
            //self.standingOff=false;
            [self setStandingOffFalse : 3];
            
        }
        //[[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag :[self position] : targetPos :0 :[self playerId]];
    }
    // not goal side
    else if ([ball attached])
    {
#ifdef DO_GET_TARGET_POSITION_OFFSET
        targetPos = [[[self team] getOppTeamActivePlayer] getPreviousPosition:PREVIOUS_POSITION_OFFSET];
#else
        targetPos = [ball position];
        //self.standingOff=false;
        //[self setStandingOffFalse:4];

#endif
        
        //
#ifdef MOVE_TO_BALLS_ADVANCED_POSITION
        targetPos = CGPointMake(ball.position.x + (ball.vector.x*dt)*2, ball.position.y + (ball.vector.y*dt)*2);
#else
        targetPos = [ball position];
        //self.standingOff=false;
        [self setStandingOffFalse:5];

#endif
        
    }
    else
    {
#ifdef MOVE_TO_BALLS_ADVANCED_POSITION
        targetPos = CGPointMake(ball.position.x + (ball.vector.x*dt)*2, ball.position.y + (ball.vector.y*dt)*2);
#else
        targetPos = [ball position];
        //self.standingOff=false;
        [self setStandingOffFalse:6];
#endif
        
        //[[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag :[self position] : targetPos :0 :[self playerId]];
    }
    
    // Check if can slide
    if (!isDoingSlide
        && !self.standingOff
        && !isCantSlideActivated
        && [ball doesOppTeamHaveBall:[self team]]
        && [ball z] < PLAYER_FOOT_HEIGHT
        && ccpLengthSQ(ccpSub([self getSpritePosition], [ball position])) < SLIDE_DISTANCE*SLIDE_DISTANCE)
        
    {
        isDoingSlide=true;
        doSlideTimer=0;
        
        [self doSlideSound];
        //standingOff=false;
        //[self setStandingOffFalse:7];
    }
    
    
    [self moveActivePlayerToTarget:dt];
    
    // if the ball is in the air and the ball is heading towards teh player then jump
    //if (([ball z] > 1) && ccpDistance (self.position, [ball position]) < 50.0)
    if ([self isBallComingTowardsMe:ball])
    {
        if ([self isBallChestHeightOrHeigher:ball])
        {
            //self.vector=ccp(0,0);
            [self setPlayerFaceBall:ball];
            //if (!self.isJumping) {
            [self jump:[ball z]];
            //}
        }
        else
        {
            //CCLOG(@">> PLAYEr already JUMPING >>");
            
        }
    }
    
    if ([self isBallCollision:ball])
    {
        firstTouch=true;
        // check if opp team has ball - if so, ensure they cant touch it for a period of time
        Player *oppTeamActivePlayer = [[self team] getOppTeamActivePlayer];
        if ([oppTeamActivePlayer playerHasBall:ball])
        {
            [oppTeamActivePlayer resetNoBallCollisionTime];
            [oppTeamActivePlayer setCantSlide];
        }
        
#ifdef DO_FIRST_TOUCH
        if ([self hadFirstTouch])
        {
            //CCLOG(@">>>>HAD FIRST TOUCH - Do control");
            [self doCompStickyBall:ball];
        }
        else
        {
            [self doFirstTouchNonStickyBall:ball];
        }
#else
        [self doCompStickyBall:ball];
#endif
        
        //[self doCompStickyBall:ball];
    }
}

//
-(void) updateActiveCompPlayer:(CCTime)dt theBall:(Ball *)ball
{
    actionCount++;
   
    [self checkBallJustKickedStatus:ball];
    
    //
    if (self.zVector !=0) {
        //CCLOG(@"*** zVector = %f", zVector);
        self.zVector+=-8.5*dt;
        
    }
    
    self.z+=self.zVector;
    if (self.z<0.5)
    {
        self.z=0;
        self.zVector=0;
        //self.isJumping=false;
        //zVector = ccpMult(-zVector, 0.90);
    }
    
    
    if ([self playerHasBall:ball])
    {
        [self updateActiveCompPlayerWithBall:ball dt:dt];
    }
    else // Player doesnt have the ball
    {
        [self updateActiveCompPlayerWithoutBall:dt ball:ball];
    }
}

//
//-(void) updateActiveCompPlayer:(CCTime)dt theBall:(Ball *)ball
//{
//    // if active player
//    // if ball not attached
//
//    if ([self isActivePlayer])
//    {
//        if (![ball attached])
//        {
//            // target pos equals ball position
//            targetPos.x=[ball getSprite].position.x;
//            targetPos.y=[ball getSprite].position.y;
//        }
//        else
//        {
//            [self updateCompPlayer:dt];
//        }
//    }
//
//
//}
//

-(void) movePlayersOntoPitch:(CCTime)dt :(Ball *)ball
{
    //NSLog(@"Team Id :%d, Player Id : %d, RunOut State : %d",self.getTeamId, self.playerId, self.runoutState);
    //CGPoint runoutTargetPos;
    if (self.runoutState == runoutStairs) {
        if ([[self team] isPlayingUpPitch])
        {
            targetPos = ccp(RUNOUT_STAIRS_DIVERGE_X, RUNOUT_START_Y-RUNOUT_Y_GAP);
        }
        else
        {
            targetPos = ccp(RUNOUT_STAIRS_DIVERGE_X, RUNOUT_START_Y+RUNOUT_Y_GAP);
        }
    }
    else if (self.runoutState == runoutStart)
    {
        if ([[self team] isPlayingUpPitch])
        {
            targetPos = ccp(RUNOUT_DIVERGE_X, RUNOUT_START_Y-RUNOUT_Y_GAP);
        }
        else
        {
            targetPos = ccp(RUNOUT_DIVERGE_X, RUNOUT_START_Y+RUNOUT_Y_GAP);
        }
    }
    else if (self.runoutState == runoutGoToPosition)
    {
        NSValue *val;
        CGPoint p;
        if ([[self team] isPlayingUpPitch])
        {
            if ([self playerId] == KEEPER_ID)
            {
                [self setTargetPos:ccp(PITCH_X_CENTER ,KEEPER_BOTTOM_LINE)];
            }
            else
            {
                if ([[self team] kickingOff] && (playerId == PLAYER9_ID || playerId == PLAYER10_ID)) {
                    if (playerId == PLAYER9_ID ) {
                        [self setTargetPos: KICKOFF_LINEUP_STRIKER_POS1];
                    } else if (playerId == PLAYER10_ID) {
                        [self setTargetPos: KICKOFF_LINEUP_STRIKER_POS2];
                    }
                }
                else
                {
                    val = [[[self team] getLineupPositionsFaceUp]objectAtIndex:playerId-2];
                    p = [val CGPointValue];
                    [self setTargetPos:p];
                }
            }
        }
        else
        {
            if ([self playerId] == KEEPER_ID)
            {
                [self setTargetPos:ccp(PITCH_X_CENTER ,KEEPER_TOP_LINE)];
            }
            else
            {
                if ([[self team] kickingOff] && (playerId == PLAYER9_ID || playerId == PLAYER10_ID)) {
                    if (playerId == PLAYER9_ID ) {
                        [self setTargetPos: KICKOFF_LINEUP_STRIKER_POS1];
                    } else if (playerId == PLAYER10_ID) {
                        [self setTargetPos: KICKOFF_LINEUP_STRIKER_POS2];
                    }
                } else {
                    val = [[[self team] getLineupPositionsFaceDown]objectAtIndex:playerId-2];
                    p = [val CGPointValue];
                    [self setTargetPos:p];
                }
            }
        }
    }
    
    if ([self isAtTargetPos] )
    {
        if (self.runoutState == runoutStairs)
        {
            self.runoutState = runoutStart;
        }
        else if (self.runoutState == runoutStart)
        {
            self.runoutState = runoutGoToPosition;
        }
        else if (self.runoutState == runoutGoToPosition)
        {
            [ball setPosition:CGPointMake(PITCH_X_CENTER, PITCH_Y_CENTER)];
            [self setPlayerFaceBall:ball];
            [self setReadyForKickOff:true];
            self.vector = (ccpNormalize(facingVector));
        }
        
       // NSLog(@">>(TargetPos) RunOutState : %d | Player Id %d",self.runoutState,self.playerId);
    }
    else
    {
        float runoutSpeed;
        if (self.runoutState == runoutStairs) {
            runoutSpeed=RUNOUT_SPEED/2;
        } else {
            runoutSpeed=RUNOUT_SPEED;
        }
        //[self setMoveVectorRunout];
        [self setMoveVectorRunoutWithSpeed:runoutSpeed];
    }
    
    [self doCompAnim];
    [self updateSpritePos:dt];
}

//
//
-(void) setPlayerStanding {
    //[self doCompAnim];
    [self updateSpritePos];
}


//
-(void) movePlayerOffField:(CCTime)dt
{
    [self setMoveVector];
    [self doCompAnim];
    [self updateSpritePos:dt];
}


//
-(void) movePlayerOffFieldHalfSpeed:(CCTime)dt
{
    [self setMoveVectorHalfSpeed];
    [self doCompAnim];
    [self updateSpritePos:dt];
}

//
-(void) movePlayerGoalScoredAgainst:(CCTime)dt
{
    [self setMoveVectorHalfSpeed];
    [self doCompAnim];
    [self updateSpritePos:dt];
    
    if ([self isAtTargetPos] ) {
        [self setPlayerFacePos:CGPointMake(PITCH_X_CENTER, PITCH_Y_CENTER)];
    }
}


//
-(void) moveActivePlayerToTarget:(CCTime)dt
{
    [self setMoveVector];
    
    if ([self isAtTargetPos] )
    {
        //vector.x=0;
        //vector.y=0;
        //HACK - vector
        self.vector=ccp(0,0);
    }
    
    if (isDoingSlide)
        [self doCompSlideAnim];
    else
        [self doCompAnim];
    
    //[self checkBoundary];
    
    //if (isSliding == true /*&& [self canSlide]*/)
    if (isDoingSlide && !isCantSlideActivated)
    {
        self.vector = ccpMult(self.vector, SLIDE_SPEED);
    }
    //sprite.position = ccp( sprite.position.x + vector.x*dt, sprite.position.y + vector.y*dt);
    [self updateSpritePos:dt];
}


-(void) updateSwipeTimer {
    
    if ([self getTeamId] == TEAM1 && [[self team] isHumanTeam] ) {
    
        //TODO check if swip activated?
        [[GameModel sharedGameModel] updateSwipeTime];
        if ([[GameModel sharedGameModel] swipeTimer] > 1000000) {
            [[GameModel sharedGameModel] resetSwipeTime];
        }
    }
}


//
-(void) updateTimers
{
    // doSlideTimer++;
    // doSlideStopDelay++;
    [self checkTimers];
    [self updateSwipeTimer];
}


-(void) checkTimers
{
    
    /*
     if (doSlideTimer >= 60)
     {
     doSlideTimer = 0;
     sliding - false;
     
     }
     */
    
    int slideTimer = DO_SLIDE_TIMER;
    
    // NSLog(@">> Slide Time Before %d", slideTimer);
    
    #ifdef DO_SLIDE_DIFFICULTY_ON
    
    switch([GameData getDifficulty]) {
            
        case EASY:
            // lengthen team 1 slide time
            // decrease team 2 slide time
            if ([[self team] getTeamId] == TEAM1) {
                slideTimer+=slideTimer*(SLIDE_DIFFICULTY_PERC/PERCENT_100);
            } else {
                slideTimer-=slideTimer*(SLIDE_DIFFICULTY_PERC/PERCENT_100);
            }
            break;

        case MEDIUM:
            break;

        case HARD:
            if ([[self team] getTeamId] == TEAM1) {
                slideTimer-=slideTimer*(SLIDE_DIFFICULTY_PERC/PERCENT_100);
            } else {
                slideTimer+=slideTimer*(SLIDE_DIFFICULTY_PERC/PERCENT_100);
            }
            break;

        default:
            break;
    }
   // NSLog(@">> Slide Time After %d", slideTimer);

    
    #else
        // leave slideTimer as default
    #endif
    
    
    if (isDoingSlide)
    {
        doSlideTimer++;
        if (doSlideTimer >= slideTimer )
        {
            isDoingSlide=false;
            doSlideTimer=0;
            //TREV CHANGE
            //slideVec=ccp(0,0);
            
            // now slide complete -
            isCantSlideActivated = true;
            cantSlideTimer=0;
        }
    }
    
    if (isCantSlideActivated)
    {
        cantSlideTimer++;
        
        
        int slideCounter = 0;
        if ([[self team] isHumanTeam]) {
            slideCounter=HUMAN_CANT_SLIDE_TIMER;
        } else {
            slideCounter=CANT_SLIDE_TIMER;

        }
        
        if (cantSlideTimer >= slideCounter )
        {
            isCantSlideActivated=false;
            cantSlideTimer=0;
        }
    }
}

//
-(void) setTargetPosToCurrentPos
{
    //targetPos = sprite.position;
    targetPos = self.position;
    
}

//
-(void) updatePlayerGoalKick:(CCTime)dt :(CGPoint)zonePos :(Ball *)ball
{
    actionCount++;
    [self checkBallJustKickedStatus:ball];
    
    
    self.standingOff=false;
    
    if (!targetPosSet) {
        // targetPosSet=true;
        //CCLOG(@"\n *** Target pos not set \n");
        [self setMoveVector];
    }
    
    // is at destination
    if ([self isAtTargetPos] )
    {
        // stay still at destination for a random period of time
        int randomShouldMove = arc4random() % 35;
        if (randomShouldMove==1)
        {
            //targetPos = [self calculateTargetPosZone:zonePos];
            
            targetPos = [self calculateTargetPosition:CGPointMake(PITCH_X_CENTER, PITCH_Y_CENTER)];
        }
        else {
            // stay still
            self.vector=ccp(0,0);
            // vector.y=0;
            [self setPlayerFaceBall:ball];
        }
    }
    else
    {
        [self doCompAnim];
    }
    
    if (actionCount % 4 == 0)
    {
        [self avoidAllPlayers];
        
        //TODO: players jerk when at target position?
        //TODO: active player- avoid? or is it alreay done - already doing opp - just needs to do teammates
    }
    
    
    //sprite.position = ccp( sprite.position.x + vector.x*dt, sprite.position.y + vector.y*dt);
    [self updateSpritePos:dt];
    
}

// CHECK THIS - do we need to update to new percentage positioning
-(void) resetTargetPos:(Ball *)ball
{
    if ([[self team] doesTeamHaveBall:ball]) {
        targetPos = [self calculateTargetPos:ball];
    }
    else {
        targetPos = [self calculateDefensiveTargetPos:ball];
    }
}

//
-(void) updateNonActiveCompPlayer:(CCTime)dt theBall:ball
{
    actionCount++;
    slidingCounter++;
    
    [self checkBallJustKickedStatus:ball];
    
    if (slidingCounter > 20)
    {
        isSliding=false;
        slidingCounter = 0;
    }
    
    if (self.zVector !=0) {
        //CCLOG(@"*** zVector = %f", zVector);
        self.zVector+=-8.5*dt;
        
    }
    
    self.z+=self.zVector;
    if (self.z<0.5)
    {
        self.z=0;
        self.zVector=0;
        //self.isJumping=false;
        //zVector = ccpMult(-zVector, 0.90);
    }
    
    //    [self setPositionX:targetPos.x Y:targetPos.y];
    
    if (!targetPosSet) {
        // targetPosSet=true;
        // //printf("\n *** Target pos not set \n");
        [self setMoveVector];
    }
    
    // is at destination
    if ([self isAtTargetPos] || ![ball isBallInSameZone])
    {
        if ([Util random1inX:30])
        {
            
            // what is attacking - u have the ball, or last team to have the ball
            
            // what is defending - they have the ball, or las team to have the ball
            
            targetPos = [self calculateTargetPos:ball];
  
          /*  if ([[self team] doesTeamHaveBall:ball]) {
                targetPos = [self calculateTargetPos:ball];
            }
            else {
                
                targetPos = [self calculateDefensiveTargetPos:ball];
            }*/
        }
        else {
            //self.vector=ccp(0,0);
            [self setPlayerFaceBall:ball];
            self.vector=ccpNormalize(facingVector);
        }
    }
    
    
    // only do avoid movements if player is actually moving
    // otherwise player will jitter when standing still
    if (actionCount % 4 == 0)
    {
        if (![self isPlayerStill]) {
            [self avoidAllPlayers];
        }
    }
    
    
    if (isDoingSlide)
        [self doCompSlideAnim];
    else
        [self doCompAnim];
    
    [self updateSpritePos:dt];
    
}


//
-(void) updateNonActiveCompPlayerOriginal:(CCTime)dt theBall:ball
{
    actionCount++;
    slidingCounter++;
    
    [self checkBallJustKickedStatus:ball];
    
    if (slidingCounter > 20)
    {
        isSliding=false;
        slidingCounter = 0;
    }
    
    if (self.zVector !=0) {
        //CCLOG(@"*** zVector = %f", zVector);
        self.zVector+=-8.5*dt;
        
    }
    
    self.z+=self.zVector;
    if (self.z<0.5)
    {
        self.z=0;
        self.zVector=0;
        //self.isJumping=false;
        //zVector = ccpMult(-zVector, 0.90);
    }
    
    //    [self setPositionX:targetPos.x Y:targetPos.y];
    
    if (!targetPosSet) {
        // targetPosSet=true;
        // //printf("\n *** Target pos not set \n");
        [self setMoveVector];
    }
    
    // is at destination
    if ([self isAtTargetPos] || ![ball isBallInSameZone])
    {
        if ([Util random1inX:30])
        {
        
            // what is attacking - u have the ball, or last team to have the ball
            
            // what is defending - they have the ball, or las team to have the ball
            
            
            if ([[self team] doesTeamHaveBall:ball]) {
                targetPos = [self calculateTargetPos:ball];
            }
            else {
                
                targetPos = [self calculateDefensiveTargetPos:ball];
            }
        }
        else {
            //self.vector=ccp(0,0);
            [self setPlayerFaceBall:ball];
            self.vector=ccpNormalize(facingVector);
        }
    }
    
    
    // only do avoid movements if player is actually moving
    // otherwise player will jitter when standing still
    if (actionCount % 4 == 0)
    {
        if (![self isPlayerStill]) {
            [self avoidAllPlayers];
        }
    }
    
    
    if (isDoingSlide)
        [self doCompSlideAnim];
    else
        [self doCompAnim];  
    
    [self updateSpritePos:dt];

}


-(bool) isAttachedBallOutsideOfControlRange : (Ball *)ball {
    return [ball attached] && (ccpDistance(ball.position, self.position) > BALL_OUT_OF_CONTROL_RANGE_DISTANCE);
}


-(bool) isOutsidePartialAssistDistance:(Ball *)ball
{
    return (ccpDistance(self.position, ball.position) >= PARTIAL_ASSIST_DISTANCE);
}


-(void) updatePlayer:(CCTime)dt Ball:(Ball *)ball
{
    //NSLog(@">>>>> Player Vec : %f,%f", self.vector.x, self.vector.y);
    animCount++;
    [self checkBallJustKickedStatus:ball];
    
    //
    if (self.zVector !=0) {
        CCLOG(@"*** zVector = %f", zVector);
        self.zVector+=-9*dt;
        
    }
    
    self.z+=self.zVector;
    if (self.z<0.5)
    {
        self.z=0;
        self.zVector=0;
        //self.isJumping=false;
        //zVector = ccpMult(-zVector, 0.90);
    }
    
    long controlsTimer = [[self team] humanControlTimer]+1;
    //CCLOG(@"*** Controls Timer = %ld", controlsTimer);
    [[self team] setHumanControlTimer: controlsTimer];
    
    
    if ([Team getControlsActive])
    {
        // reset human controls /auto move timer
        [[self team] setHumanControlTimer: 0];
        
        if (!isDoingSlide) {
            //TODO work out why rotation is off by 25
            self.vector = ccpForAngle(-CC_DEGREES_TO_RADIANS(self.sprite.rotation+25)+90);
            self.vector = ccpMult(self.vector, self.speed);
        } else {
            self.vector=slideVec;
        }
    }
    else
    {
        //CCLOG(@">> COntrols NOT ACTIVE>");
        if (![ball attached]) {
    
        //#ifdef DO_PLAYER_AUTO_ASSIST_MOVEMENT
            
            if ([[self team] humanControlTimer] > 60) {
                //NSLog(@">>Control timer > 120..ok to auto move player ...");
                if ([GameData isMoveAssistOn] ||  ([GameData isPartialMoveAssistOn]  && [self isOutsidePartialAssistDistance:ball])) {
                    if (isDoingSlide) {
                        // keep current vector
                        self.vector =slideVec;
                    } else {
                    
                        #ifdef MOVE_TO_BALLS_ADVANCED_POSITION
                            targetPos = CGPointMake(ball.position.x + (ball.vector.x*dt)*2, ball.position.y + (ball.vector.y*dt)*2);
                        #else
                            targetPos = [ball position];
                        #endif
                        [self setMoveVector];
                    }
                //#else
                }
                else {
                    if (isDoingSlide) {
                        // keep current vector
                        self.vector =slideVec;
                    } else {
                        self.vector=self.getFacingVector;
                        
                    }
                //#endif
                }
            }
        }
        else
        {
            
            if (isDoingSlide) {
                // keep current vector
                self.vector =slideVec;
                NSLog(@">> Slide (ball attached)");
            } else {
                self.vector=self.getFacingVector;

            }
            
            // check if ball has gone out of control range
    #ifdef DO_ATTACHED_BALL_RANGE_CHECK
            // ensure team 1 'had ball' otherwise we set attached false for comp team
            if ([ball teamWithBallId] == TEAM1 && [self isAttachedBallOutsideOfControlRange:ball]) {
                [ball setAttached:false];
                NSLog(@">> Ball attached check range - team id %d", [self getTeamId]);
            }
    #endif
        }
        // vector = ccpForAngle(-CC_DEGREES_TO_RADIANS(spriteRotation)+90);
    }
    
    if (isDoingSlide)
    {
        //TODO - better defense players have better slide vectors
        if ([self isPlayerStill]) {
            // if player is still we still want the slide to move forward
            //self.vector = ccpMult(ccpMult(facingVector, self.speed), HUMAN_SLIDE_SPEED);
            //NSLog(@">> Player Still - slideVec %f,%f", slideVec.x, slideVec.y);
            self.vector = ccpMult(ccpMult(slideVec, self.speed), HUMAN_SLIDE_SPEED);
            
        } else {
            self.vector = ccpMult(ccpMult(slideVec, self.speed), HUMAN_SLIDE_SPEED);

            //self.vector = ccpMult(self.vector, HUMAN_SLIDE_SPEED);
            
        }
       
        [self doCompSlideAnim];
    }
    else
    {
        [self doPlayerAnim];
    }
    
    if (self.waitingToPass)
    {
        //CCLOG(@">>> Was waiting to pass.. now can do pass");
        self.waitingToPass=false;
        
        [self passToClosestPlayerHuman:ball];
   }
    
    if (self.waitingToShoot)
    {
        self.waitingToShoot=false;
        [self shootBall:ball];
    }
    
    
    [self updateSpritePos:dt];
    
    if ([self isBallCollision:ball])
    {
        [self doCompStickyBall:ball];
        
        //            #ifdef DO_FIRST_TOUCH
        //                [ball setVector : ccpMult([ball vector], -0.3)];
        //            #else
        //                [self doCompStickyBall:ball];
        //            #endif
        
        
    }
}

//
-(void)doKeeperReplayAnim
{
    //handle keeper replay sizes
    
    if ([[self getFrameName] hasPrefix:@"keeperGloves"])
    {
        if ([[self getFrameName] hasPrefix:@"keeperGlovesN1"]) {
            [self showPlayerFrame1Masks : TRUE];
            [self showPlayerFrame2Masks : FALSE];
        }
        else
        {
            [self showPlayerFrame1Masks : FALSE];
            [self showPlayerFrame2Masks : TRUE];
        }
        
        self.sprite.scale=PLAYER_SPRITE_SCALE;
    }

    else if ([[self getFrameName] hasPrefix:@"keeper"]) {
        // when keeper is diving, hide standing/running mask sprites
        
        [self hideMaskSprites];
        [self hideSlideMaskSprites];
        
        if ( [[self getFrameName] hasSuffix:@"keeperTopUp-hd.png"] || [[self getFrameName] hasSuffix:@"keeperBottomUp-hd.png"]) {
            self.sprite.scale=PLAYER_SPRITE_SCALE;
            self.sprite.scaleY=0.6;
        } else {
            self.sprite.scale=0.65;
        }
        
    }
    [self.sprite setRotation: self.sprite.rotation];
    //[self.sprite setSpriteFrame:frame];
    [self.sprite setSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[self getFrameName]]];
}


//
-(void)doKeeperReplayAnimOriginal
{
     //handle keeper replay sizes
    
    // when keeper is diving, hide standing/running mask sprites
    if ([[self getFrameName] hasPrefix:@"keeper"]) {
        [self hideMaskSprites];
        [self hideSlideMaskSprites];
        
        if ( [[self getFrameName] hasSuffix:@"keeperTopUp-hd.png"] || [[self getFrameName] hasSuffix:@"keeperBottomUp-hd.png"]) {
            self.sprite.scale=PLAYER_SPRITE_SCALE;
            self.sprite.scaleY=0.6;
        } else {
            self.sprite.scale=0.65;
        }
    } else {
//        [self showMaskSprites];
//        [self hideSlideMaskSprites];
        
        if ([[self getFrameName] hasPrefix:@"keeperGlovesN1"]) {
            [self showPlayerFrame1Masks : TRUE];
            [self showPlayerFrame2Masks : FALSE];
        }
        else
        {
            [self showPlayerFrame1Masks : FALSE];
            [self showPlayerFrame2Masks : TRUE];
        }
        
        
        self.sprite.scale=PLAYER_SPRITE_SCALE;
    }
    
    [self.sprite setRotation: self.sprite.rotation];
    //[self.sprite setSpriteFrame:frame];
    [self.sprite setSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[self getFrameName]]];
}


//
-(void)doPlayerReplayAnim
{
   
    animRate = speed / 5;
    
[self.sprite  setSpriteFrame:frame];
    
    //CCLOG(@">>>> Frame Name : %@", [self getFrameName]);
    
    if ([[self getFrameName] hasPrefix:@"playerSlide"]) {
        [self hideMaskSprites];
        [self showSlideMaskSprites];
    } else {
        //[self showMaskSprites];
        [self hideSlideMaskSprites];

        
        if ([[self getFrameName] hasPrefix:@"blueN1"] || [[self getFrameName] hasPrefix:@"p1_a"]) {
            [self showPlayerFrame1Masks : TRUE];
            [self showPlayerFrame2Masks : FALSE];
        }
        else
        {
            [self showPlayerFrame1Masks : FALSE];
            [self showPlayerFrame2Masks : TRUE];
        }

        self.sprite.scale=PLAYER_SPRITE_SCALE;
    }

    
    
    [self.sprite setSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[self getFrameName]]];
}


-(void) showPlayerFrame1Masks : (Boolean) status {
    kitSprite.visible=status;
    kitArmsSprite.visible=status;
    kitCentreStripSprite.visible=status;
    skinSprite.visible=status;
    hairSprite.visible=status;
}

-(void) showPlayerFrame2Masks : (Boolean) status {
    kitSprite2.visible=status;
    kitArmsSprite2.visible=status;
    kitCentreStripSprite2.visible=status;
    skinSprite2.visible=status;
    hairSprite2.visible=status;
}


//
-(void)doPlayerAnim
{
    if ([self isPlayerStill]) {
        
        if (![[self getFrameName] hasPrefix:@"playerSlide"]) {
            return;
        }
    }
    
    NSString *frame1;
    NSString *frame2;
  
    animRate = speed / 5;
    
    
    frame1 = @"blueN1.png";
    frame2 = @"blueN2.png";
    
    if (animCount > animRate) {
        if (animFrame==0) {
            frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frame1];
            [self setFrameName:frame1];
            [self showPlayerFrame1Masks : TRUE];
            [self showPlayerFrame2Masks : FALSE];
            [self hideSlideMaskSprites];
        }
        else
        {
            frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frame2];
            [self setFrameName:frame2];
            [self showPlayerFrame1Masks : FALSE];
            [self showPlayerFrame2Masks : TRUE];
            [self hideSlideMaskSprites];

        }
        
        if (animFrame == 0)
            animFrame=1;
        else
            animFrame=0;
        
        animCount=0;
        
        long rotation = [[GameModel sharedGameModel] activePlayerSprite].rotation;
        rotation+=ACTIVE_PLAYER_SPRITE_ROTATION;
        
        if (rotation > 180) {
            rotation=0;
        }
        [[GameModel sharedGameModel] activePlayerSprite].rotation=rotation;
        
        
    }
    
    [self.sprite setSpriteFrame:frame];
}



//
-(void) doCompSlideAnim
{
    animCount++;
    
    NSString *frame1;
    NSString *frame2;
    
    // hide regular masks
    [self hideMaskSprites];
    //[self showPlayerFrame1Masks : FALSE];
    //[self showPlayerFrame2Masks : FALSE];
    
    // show slide mask
    [self showSlideMaskSprites];
    
    //TODO: change some new objects arent being created every time
    if (teamId == 1) {
        //frame1 = @"p1_slide.png";
        //frame2 = @"p1_slide.png";
        
        frame1 = @"playerSlideFullTemplate.png";
        frame2 = @"playerSlideFullTemplate.png";

    }
    else
    {
        //frame1 = @"blue_slide_n.png";
        //frame2 = @"blue_slide_n.png";
        frame1 = @"playerSlideFullTemplate.png";
        frame2 = @"playerSlideFullTemplate.png";

    }
    //[self setFrameName:frame1];

    
    //handle first time - TODO: clean this up
    if (frame == nil)
    {
        //printf("/n *** -> Frame null intially - setting to first anim frame/n");
        frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frame1];
        [self setFrameName:frame1];
        [self hideMaskSprites];

    }
    
    
    if (animCount > animRate) {
        if (animFrame==0) {
            frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frame1];
            [self setFrameName:frame1];
            //[self hideMaskSprites];

        }
        else {
            frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frame2];
            [self setFrameName:frame2];
            //[self hideMaskSprites];

        }
        
        if (![self isPlayerStill])
        {
            if (animFrame == 0)
                animFrame=1;
            else
                animFrame=0;
        }
        
        animCount=0;
    }
    
    CGFloat rotationRadians = ccpToAngle(self.vector);
    
    CGFloat rotationDegrees = -CC_RADIANS_TO_DEGREES(rotationRadians);
    
    rotationDegrees += 90.0f;
    ////printf("*\n ***---> Rotation degrees : %f", rotationDegrees);
    
    [self showSlideMaskSprites];
    
    
    self.sprite.rotation = rotationDegrees;
    
    if (self.standingOff) {
        [self setPlayerFaceBall:[[GameModel sharedGameModel] getBall] ];
    }
    
    
    [self.sprite setSpriteFrame:frame];
    
}


//
-(bool)isPlayerStill
{
    return ((self.vector.x < 1 && self.vector.x > -1) && (self.vector.y < 1 && self.vector.y > -1));
}


//
-(void) doCompAnim
{
    animCount++;

    NSString *frame1;
    NSString *frame2;
    
    frame1 = @"blueN1.png";
    frame2 = @"blueN2.png";
    
    
    //[self setFrameName:frame1];
    
    //handle first time - TODO: clean this up
    if (frame == nil)
    {
        //printf("/n *** -> Frame null intially - setting to first anim frame/n");
        frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frame1];
        [self setFrameName:frame1];
        [self hideSlideMaskSprites];
        [self showPlayerFrame1Masks : TRUE];
        [self showPlayerFrame2Masks : FALSE];
    }
    
    
    if (animCount > animRate) {
        if (animFrame==0) {
            frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frame1];
            [self setFrameName:frame1];
            [self hideSlideMaskSprites];
            [self showPlayerFrame1Masks : TRUE];
            [self showPlayerFrame2Masks : FALSE];
        } else {
            frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frame2];
            [self setFrameName:frame2];
            [self hideSlideMaskSprites];
            [self showPlayerFrame1Masks : FALSE];
            [self showPlayerFrame2Masks : TRUE];
        }
        
        if (![self isPlayerStill])
        {
            if (animFrame == 0)
                animFrame=1;
            else
                animFrame=0;
        }
        
        animCount=0;
        
        if(![self isPlayerStill]) {
            long rotation = [[GameModel sharedGameModel] activeTargetSprite].rotation;
            rotation+=ACTIVE_TARGET_SPRITE_ROTATION;
            
            if (rotation > 180) {
                rotation=0;
            }
            [[GameModel sharedGameModel] activeTargetSprite].rotation=rotation;
        }

    }
    
    CGFloat rotationRadians = ccpToAngle(self.vector);
    
    CGFloat rotationDegrees = -CC_RADIANS_TO_DEGREES(rotationRadians);
    
    rotationDegrees += 90.0f;
    ////printf("*\n ***---> Rotation degrees : %f", rotationDegrees);
    
    // store previous to use to check if player is turning
    // self.prevSpriteRotation=spriteRotation;
    
    self.sprite.rotation  = rotationDegrees;
    
    if (self.standingOff) {
        [self setPlayerFaceBall:[[GameModel sharedGameModel] getBall] ];
    }
    
    [self.sprite setSpriteFrame:frame];
    
}


-(void) updateReplayKeeperSpritePosition:(CGPoint) pos
{
    self.sprite.position = pos;
    self.shadow.position = CGPointMake(pos.x + 3 + (self.z * 0.5), pos.y - 3);
}


-(void) updateReplaySpritePosition:(CGPoint) pos
{
    self.sprite.position = pos;
    self.shadow.position=CGPointMake(pos.x+3, pos.y-3);
}


//
-(void) updateReplaySpritePosition:(CGPoint) pos :(int)animFrame
{
    self.sprite.position = pos;
    self.shadow.position=CGPointMake(pos.x+3, pos.y-3);
   // self.nameLabel.position = ccp(self.sprite.position.x, self.sprite.position.y-10);
    if(self.playerId > 1) //ignore keeper
    {
       // [[self nameLabel] setString : self.playerName];
    }
}


-(void) initPreviousPositions
{
    //int maxPositions = 60;

    for (int i=0; i< MAX_NUM_PREVIOUS_POSITIONS; i++)
    {
        NSValue *pos1 = [NSValue valueWithCGPoint:self.position];
        [previousPositions addObject:pos1];
    }
}

//-(void) showPreviousPositions
//{
//    int maxPositions = 30;
//    
//    for (int i=0; i< maxPositions; i++)
//    {
//        [previousPositions addObject:ccp(0,0)]
//    }
//}

-(CGPoint) getPreviousPosition:(int)index
{
    int posIndex = index;
    //CCLOG(@">> Get Previous Pos");
    if (posIndex >= MAX_NUM_PREVIOUS_POSITIONS)
    {
        posIndex = MAX_NUM_PREVIOUS_POSITIONS-1;
    }
    
//    if ([Util random1inX:100])
//    {
//        [self displayAllPreviousPositions];
//    }
    
    NSValue *val = [previousPositions objectAtIndex:posIndex];
 
    if (val != nil)
    {
        CGPoint previousPos = [val CGPointValue];
//        CCLOG(@">> Previous Pos : %f,%f",previousPos.x,previousPos.y);
//        CCLOG(@">> Current Pos : %f,%f",self.position.x,self.position.y);

        return previousPos;
    }
    else
    {
        return self.position;
    }
}

-(void) displayAllPreviousPositions
{
    int i = 0;
    for (NSValue *val in previousPositions)
    {
       
        CGPoint previousPos = [val CGPointValue];
        CCLOG(@">> %d : Previous Pos : %f,%f",i, previousPos.x,previousPos.y);
        i++;
    }

}


-(void) updatePreviousPositions
{
    //CCLOG(@">> Get Previous Pos 1");

    //int maxPositions = MAX_NUM_PREVIOUS_POSITIONS;
    
       
    for (int i = MAX_NUM_PREVIOUS_POSITIONS-1; i > 0; i--)
    {
        [previousPositions replaceObjectAtIndex:i  withObject:[ previousPositions objectAtIndex:i-1]];
    }
//    
//    for (int i=0; i < MAX_NUM_PREVIOUS_POSITIONS-1; i++)
//    {
//        [previousPositions replaceObjectAtIndex:i+1  withObject:[ previousPositions objectAtIndex:i]];
//    }
    
    NSValue *currentPos = [NSValue valueWithCGPoint:self.position];
    
    [previousPositions replaceObjectAtIndex:0 withObject: currentPos];
    
    //CCLOG(@">> Get Previous Pos 2");

}


-(void) updateSpritePos
{
    [self updatePreviousPositions];
    //sprite.position = ccp( sprite.position.x + vector.x*dt, sprite.position.y + vector.y*dt);
    //position = ccp( sprite.position.x + vector.x, sprite.position.y + vector.y);
    //self.position = ccp( self.position.x + self.vector.x, self.position.y + self.vector.y);
    // [self checkPlayerCollision];
    
    //CGPoint finalMoveVector = ccpAdd(self.vector, self.collisionVector);
    
    self.position = CGPointMake(self.position.x + self.vector.x, self.position.y + self.vector.y);
    //self.position = CGPointMake(self.position.x + finalMoveVector.x, self.position.y + finalMoveVector.y);
    
    if (isnan(self.vector.x)) {
        NSLog(@"updateSpritePos 1 NaN");
        
    }
    if (isnan(self.vector.y)) {
        NSLog(@"updateSpritePos 2 NaN");
        
    }
    if (isnan(self.position.x)) {
        NSLog(@"updateSpritePos 3 NaN");
        
    }
    if (isnan(self.position.y)) {
        NSLog(@"updateSpritePos 4 NaN");
        
    }
    //self.shadow.position=ccp(self.sprite.position.x+3, self.sprite.position.y-3);
    self.shadow.position=CGPointMake(self.sprite.position.x+3, self.sprite.position.y-3);
    
    
    //self.shadow.scale = 1 - (z * 5.9);
    //sprite.position = ccp( position.x, position.y+(z*2.5));
    //self.sprite.position = ccp( self.position.x, self.position.y+(self.z*0.5));
    
    self.sprite.position = CGPointMake(self.position.x, self.position.y+(self.z*0.5));
   // self.nameLabel.position = ccp(self.sprite.position.x, self.sprite.position.y-10);
    
    
    // [_gameLayer reorderChild:sprite z:1];
    // [_gameLayer reorderChild:shadow z:0];
    collisionVector = ccp(0,0);
    
}

//
-(void) updateSpritePos:(CCTime)dt
{
    [self updatePreviousPositions];
    
    //sprite.position = ccp( sprite.position.x + vector.x*dt, sprite.position.y + vector.y*dt);
    //self.position = ccp( self.position.x + self.vector.x*dt, self.position.y + self.vector.y*dt);
    
    //[self checkPlayerCollision];
    
    //CGPoint finalMoveVector = ccpAdd(self.vector, self.collisionVector);
    
    //self.position = CGPointMake(self.position.x + self.vector.x*dt, self.position.y + self.vector.y*dt);
    //self.position = CGPointMake(self.position.x + finalMoveVector.x, self.position.y + finalMoveVector.y);
    
    if ([self z] > 0)
    {
        self.vector=ccp(0,0);
    }
    if (isnan(self.vector.x)) {
        NSLog(@"updateSpritePos 0. NaN");
        NSLog(@" self.position : %f",self.position.x);
        
        [self setVector:(CGPointMake(0,0))];
        NSLog(@" due to Nan, setting Vector to 0");
        //return;
    }
    
    if (isnan(self.position.x)) {
        NSLog(@"updateSpritePos 0b. NaN");
        NSLog(@" vector : %f",self.vector.x);
    }
    
    self.position = CGPointMake(self.position.x + (self.vector.x*dt)+(self.collisionVector.x*dt),
                                self.position.y + (self.vector.y*dt)+(self.collisionVector.y*dt));
    
    //self.shadow.position=ccp(self.position.x+3, self.position.y-3);
    //self.shadow.position=CGPointMake(self.position.x+3, self.position.y-3);
    self.shadow.position=CGPointMake(self.position.x + 3 + (self.z * 0.5), self.position.y-3);
    
    
    //self.shadow.scale = 1 + -(self.z * 0.05);
    
    //sprite.position = ccp( position.x, position.y+(z*2.5));
    //sprite.position = ccp( position.x, position.y+(z*0.5));
    //self.sprite.position = ccp( self.position.x, self.position.y);
    self.sprite.position = CGPointMake(self.position.x, self.position.y);
   // self.nameLabel.position = ccp(self.sprite.position.x, self.sprite.position.y-10);
    
    if (isnan(self.vector.x)) {
        NSLog(@"updateSpritePos 1. NaN");
        
    }
    if (isnan(self.vector.y)) {
        NSLog(@"updateSpritePos 2. NaN");
        
    }
    if (isnan(self.position.x)) {
        NSLog(@"updateSpritePos 3. NaN");
        
    }
    if (isnan(self.position.y)) {
        NSLog(@"updateSpritePos 4. NaN");
        
    }

    
    
    // [_gameLayer reorderChild:sprite z:1];
    // [_gameLayer reorderChild:shadow z:0];
    collisionVector = ccp(0,0);
}

-(void) jump
{
    //CCLOG(@"\n** JUMP **\n");
    self.zVector = 0.5; // 1.5;
}

-(void) jump:(int) ballHeight
{
    // only jump if player is on the ground
    if (self.z < 0.5 ) {
    //CCLOG(@"\n** JUMP ** ballZ = %d\n", ballHeight);
        //    self.zVector = ballHeight/40;
        self.zVector = 2.0; // 1.15 //1.3
        //self.isJumping=true;
    }
}

-(void) keeperJump:(int) ballHeight
{
    //CCLOG(@"\n** JUMP ** ballZ = %d\n", ballHeight);
    //    self.zVector = ballHeight/40;
    //TODO set max jump height
    //self.zVector = ballHeight*0.025;
    if (ballHeight < 1) {
        ballHeight=1;
    }
    
    self.zVector = ballHeight*0.12; //0.125
    if (self.zVector > 1.9) // 2.0
    {
        //CCLOG(@">> Keeper dive jump vector = %f, setting to max 2.5", self.zVector);
        self.zVector=1.9; // 2.0
    }
    
}



//
-(bool) isBallChestHeightOrHeigher :(Ball *)ball
{
    return ([ball z] > (PLAYER_HEIGHT/2));
}


//
-(bool) isPassInPathOfSpecificPlayer:(Player *)myPassPlayer :(Player *)oppPlayer
{
    bool intersects = false;
    bool intersects2 = false;
    
    CGPoint oppPlayerPosition = [oppPlayer position];
    intersects = ccpSegmentIntersect(ccp(oppPlayerPosition.x-PLAYER_WIDTH*2/2 , oppPlayerPosition.y-PLAYER_WIDTH*2/2),
                                     ccp(oppPlayerPosition.x+PLAYER_WIDTH*2/2 , oppPlayerPosition.y+PLAYER_WIDTH*2/2),
                                     [self position], [myPassPlayer position]);
    
    intersects2 = ccpSegmentIntersect(ccp(oppPlayerPosition.x-PLAYER_WIDTH*2/2 , oppPlayerPosition.y+PLAYER_WIDTH*2/2),
                                      ccp(oppPlayerPosition.x+PLAYER_WIDTH*2/2 , oppPlayerPosition.y-PLAYER_WIDTH*2/2),
                                      [self position], [myPassPlayer position]);
    
    if (intersects || intersects2)
    {
        //        [[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag
        //                    :ccp(oppPlayerPosition.x-PLAYER_WIDTH*2/2 , oppPlayerPosition.y-PLAYER_WIDTH*2/2)
        //                    :ccp(oppPlayerPosition.x+PLAYER_WIDTH*2/2 , oppPlayerPosition.y+PLAYER_WIDTH*2/2) :0 :302];
        //
        //        [[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag
        //         :ccp(oppPlayerPosition.x-PLAYER_WIDTH*2/2 , oppPlayerPosition.y+PLAYER_WIDTH*2/2)
        //         :ccp(oppPlayerPosition.x+PLAYER_WIDTH*2/2 , oppPlayerPosition.y-PLAYER_WIDTH*2/2) :0 :305];
        
    }
    
    return (intersects || intersects2);
}


////
//-(CGPoint) getVectorRotatedByRandomAngle:(CGPoint)originalVec :(int)range
//{
//    CGPoint randomVec;
//    int randomAngle = [Util random:range];
//    int length = ccpLength(originalVec);
//
//    if([Util random:2] == 0)
//    {
//        randomVec = [self rotateVector:originalVec Angle:-randomAngle];
//    }
//    else
//    {
//        randomVec = [self rotateVector:originalVec Angle:randomAngle];
//    }
//
//    CCLOG(@">> Angle Range = %d, random angle (divided by 2) = %d, original Vec : %f, %f, final Vector : %f,%f",
//          range, randomAngle, originalVec.x, originalVec.y, randomVec.x, randomVec.y);
//    CCLOG(@">>>> Angle Range = %d, random angle (divided by 2) = %d, original Vec : %f, %f, final Vector : %f,%f",
//          range, randomAngle, originalVec.x, originalVec.y, randomVec.x*length, randomVec.y*length);
//
//    //rotate functionnormalise the vector - return the new vector based on original vector length
//    return ccpMult(randomVec,length);
//}

//
-(int) getNumberOfOpponentPlayersInVicinity:(Player *)player :(int)distance
{
    int total=0;
    for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
    {
        if (ccpDistance([player position], [oppPlayer position]) < distance)
        {
            total++;
        }
    }
    
    return total;
    
}

//
-(int) getDistanceOfClosestOpponentPlayer:(Player *)player
{
    int shortestDistance = 5000; // temp large number for initial comparison
    
    for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
    {
        CGFloat distance = ccpDistance([player position], [oppPlayer position]);
        if (distance < shortestDistance)
        {
            shortestDistance = distance;
        }
    }
    
    return shortestDistance;
}


//
-(bool) isPlayerGoalSide:(CGPoint)pos
{
    // is current player goal side to opponentPlayer
    
    if ([self isTeamShootingUp])
    {
        if ([self position].y < pos.y)
        {
            return true;
        }
    }
    else
    {
        if ([self position].y > pos.y)
        {
            return true;
        }
        
    }
    return false;
}



//doPass
-(bool) isPassInPathOfAPlayer:(Player *)myPassPlayer
{
    // assume player and pass is in fov
    
    for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
    {
        if ([self isInFOV:ccpSub([oppPlayer getSpritePosition], [self getSpritePosition])])
        {
            if ([self isPassInPathOfSpecificPlayer:myPassPlayer :oppPlayer] )
            {
                //[[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag:position :[myPassPlayer position] :0 :301];
                
                
                return true;
            }
        }
    }
    
    return false;
}

//
-(bool) isBallComingTowardsMe:(Ball *)ball
{
    //return false;
    bool comingTowards = false;
    
    if ([ball attached])
        return false;
    
    // if distance is within range
    if (ccpDistance(position, [ball position]) > IS_BALL_COMING_TOWARDS_PLAYER_DISTANCE)
        return false;
    
    
    // make player 'line'
    comingTowards = ccpSegmentIntersect(ccp(position.x-PLAYER_WIDTH/2 , position.y-PLAYER_WIDTH/2),
                                        ccp(position.x+PLAYER_WIDTH/2 , position.y+PLAYER_WIDTH/2),
                                        [ball getFuturePosition:0.95:0.166], [ball position]);
    
    if (comingTowards)
    {
        //FOV[[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag: [ball getFuturePosition:0.90:0.166]: [ball position] :0 :101];
        
        //[[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag: ccp(position.x-PLAYER_WIDTH/2 , position.y-PLAYER_WIDTH/2) :
        // ccp(position.x+PLAYER_WIDTH/2 , position.y+PLAYER_WIDTH/2) :1 :100];
        
        //        if ([self teamId] == TEAM1)
        //        {
        //            [[[GameModel sharedGameModel] testActivePlayer1] setPosition: position];
        //        }
        //        else
        //        {
        //            [[[GameModel sharedGameModel] testActivePlayer2] setPosition: position];
        //        }
    }
    
    return comingTowards;
    
}





//
-(void) updateKeeperSaveSpritePos:(CCTime)dt
{
    //sprite.position = ccp( sprite.position.x + saveVector.x*dt, sprite.position.y + saveVector.y*dt);
    //position = ccp( sprite.position.x + saveVector.x*dt, sprite.position.y + saveVector.y*dt);
    //self.position = ccp( self.position.x + saveVector.x*dt, self.position.y + saveVector.y*dt);
    self.position = CGPointMake(self.position.x + saveVector.x*dt, self.position.y + saveVector.y*dt);
    //sprite.position=position;
    
    // position = ccp( position.x + vector.x*dt, position.y + vector.y*dt);
    
    //self.shadow.position=ccp(self.position.x + 3 + (self.z * 0.5), self.position.y-3);
    
    
    //shadow.scale = 1 + -(z * 0.05);
    
    //sprite.position = ccp( position.x, position.y+(z*2.5));
    // sprite.position = ccp( position.x, position.y+(z*2.5));
    
    // ensure keep dive appears to be up and backwards depending on height of the ball/keeper
    if ([self isTeamShootingUp])
        //self.sprite.position = ccp( self.position.x, self.position.y- (self.z * 0.125));
        self.sprite.position = CGPointMake(self.position.x, self.position.y- (self.z * 0.35/*0.125*/));
    else
        //self.sprite.position = ccp( self.position.x, self.position.y+ (self.z * 0.125));
        self.sprite.position = CGPointMake( self.position.x, self.position.y+ (self.z * 0.35));
    

    //self.sprite.position = CGPointMake( self.position.x, self.position.y+ (self.z * 0.45));
    
    // shadow doesnt move according to player z position
    //self.shadow.position=CGPointMake(self.sprite.position.x + 3, self.position.y-3);
    self.shadow.position = CGPointMake(self.position.x + 2 + (z * 0.5), self.position.y - 2);
    
    
    
}

//
-(bool) isKeeperUnderHumanControl:(Ball *)ball
{
    return ( ([[GameModel sharedGameModel] getMatchState] == keeperHasBall) &&
            [self playerHasBall:ball] &&
            !saveInProgress);
}

//
-(bool) isKeeperWithinBoundary
{
    if (self.position.x < PITCH_X_CENTER - GOAL_AREA_WIDTH/2 ||
        self.position.x > PITCH_X_CENTER + GOAL_AREA_WIDTH/2)
    {
        return false;
    }
    
    //
    if ([self isTeamShootingUp])
    {
        if (self.position.y < PITCH_BOTTOM || self.position.y > PITCH_BOTTOM + GOAL_AREA_DEPTH)
        {
            return false;
        }
    }
    else
    {
        if (self.position.y > PITCH_TOP || self.position.y < PITCH_TOP - GOAL_AREA_DEPTH)
        {
            return false;
        }
    }
    
    return true;
}

//
-(void) setKeeperGoalAreaBoundary
{
    if (self.position.x < PITCH_X_CENTER - GOAL_AREA_WIDTH/2)
    {
        [self setPositionX:(PITCH_X_CENTER - GOAL_AREA_WIDTH/2) Y:self.position.y];
    }
    
    if (self.position.x > PITCH_X_CENTER + GOAL_AREA_WIDTH/2)
    {
        [self setPositionX:(PITCH_X_CENTER + GOAL_AREA_WIDTH/2) Y:self.position.y];
    }
    
    
    if ([self isTeamShootingUp])
    {
        if (self.position.y < PITCH_BOTTOM)
        {
            [self setPositionX:self.position.x Y:PITCH_BOTTOM];
        }
        
        if (self.position.y > PITCH_BOTTOM + GOAL_AREA_DEPTH)
        {
            [self setPositionX:self.position.x Y:(PITCH_BOTTOM + GOAL_AREA_DEPTH)];
        }
    }
    else
    {
        if (self.position.y > PITCH_TOP)
        {
            [self setPositionX:self.position.x Y:PITCH_TOP];
        }
        
        if (self.position.y < PITCH_TOP - GOAL_AREA_DEPTH)
        {
            [self setPositionX:self.position.x Y:(PITCH_TOP - GOAL_AREA_DEPTH)];
        }
    }
    
}

-(void) playAlmostGoalSound {
    
    if ([Util random5050]) {
        [self playSoundEffect:KEEPER_SAVE1];
    }
    else
    {
        [self playSoundEffect:KEEPER_SAVE2];
    }
}

//
- (void)doKeeperSaveInProgress:(CCTime)dt ball:(Ball *)ball
{
    //CCLOG(@">>> KEEPER SAVE IN PROGRESS : %@",self.playerName);
    CCSpriteFrame *testFrame;
    // CCSprite *testSprite = [CCSprite spriteWithImageNamed:@"ball1.png"];
    //[_gameLayer addChild:testSprite];
    NSString *frame1 = @"ball1.png";
    testFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frame1];
    

    //[self doKeeperAnim:ball];
    if (ccpLength(saveVector) < 1)
    {
        saveInProgress=false;
        saveVector.x=0;
        saveVector.y=0;
        //TMP HACK?TEST
        //[self setPositionX:[self getSpritePosition].x Y:[self getSpritePosition].y+50];
    }
    
    if (self.zVector !=0) {
        //CCLOG(@"*** zVector = %f", zVector);
        self.zVector+=-5.5*dt; // was 9
        //CCLOG(@">> Keeper Z Vector : %f",self.zVector);
    }
    
    self.z+=self.zVector;
    if (self.z<0.5)
    {
        self.z=0;
        self.zVector=0;
        //self.isJumping=false;
        //zVector = ccpMult(-zVector, 0.90);
    }

    [self doKeeperDivingAnim:ball];

    // sprite.position = ccp( sprite.position.x + saveVector.x, sprite.position.y + saveVector.y);
    [self updateKeeperSaveSpritePos:dt];
 
    saveVector = ccpMult(saveVector, 0.95f);
    
    if ([self isKeeperBallCollision:ball])
    {
        //CCLOG(@">>>> Keeper has ball 1a");
        
        if (![self isPassCompletedTimeElapsed])
        {
            //CCLOG(@">>>> Keeper has ball 1aa");
            return;
        }
        
    #ifdef DO_KEEPER_SAVE_REBOUND_ONLY
        
        if (saveJustStarted)
        {
            CGPoint rebound = ccpMult([ball vector], -0.4);
            rebound = [self getVectorRotatedByRandomAngle:rebound :30];
            [ball setVector: rebound];
            passCompletedTime=0;
            saveJustStarted=false;
            [[[GameModel sharedGameModel] matchData ] addHighlightMarker];
            
        }
        else
        {
            [self doKeeperStickyBall:ball];                
        }
        
    #else
        int holdBallRatio = 0;
        if ([self isKeeperUnderHumanControl:ball]) {
            holdBallRatio=KEEPER_HOLD_BALL_RATIO_MAX_10;
        } else {
            holdBallRatio=HUMAN_KEEPER_HOLD_BALL_RATIO_MAX_10;
        }

        if ([Util random:10] < holdBallRatio) // 5
        {
            [self doKeeperStickyBall:ball];
            [self playSoundEffect:KICK2]; // use this sound for keeper catching/saving
            [self playAlmostGoalSound];
            
        }
        else
        {
            if (saveJustStarted)
            {
                CGPoint rebound = ccpMult([ball vector], -0.4);
                rebound = [self getVectorRotatedByRandomAngle:rebound :30];
                [ball setVector: rebound];
                passCompletedTime=0;
                saveJustStarted=false;
                [[[GameModel sharedGameModel] matchData ] addHighlightMarker];
                [self playSoundEffect:KICK2]; // use this sound for keeper catching/saving
                [self playAlmostGoalSound];
            }
            else
            {
                [self doKeeperStickyBall:ball];
            }
        }
    #endif
    }
}


-(int) getDistanceFromPitchCenterX:(Ball *)ball {
    
    if ([ball getX] > PITCH_X_CENTER) {
        return [ball getX] - PITCH_X_CENTER;
    } else {
        return PITCH_X_CENTER - [ball getX];
    }
}

-(int) getDistanceFromHalfWayLine:(Ball *)ball  {
    
    if ([ball getY] > PITCH_Y_CENTER) {
        return [ball getY] - PITCH_Y_CENTER;
    } else {
        return PITCH_Y_CENTER - [ball getY];
    }
}


//
-(int) getKeeperGoalLineXPosition:(Ball *)ball {
    
    int xDistanceFromGoalCentre = [self getDistanceFromPitchCenterX:ball];
    //int yDistanceFromGoalLine = [self getDistanceFromHalfWayLine];
    float widthRatio = (float)(PITCH_WIDTH/GOAL_WIDTH);
    float xPos = (float)xDistanceFromGoalCentre/widthRatio;
    float targetXPos;
    
    if ([ball getX] < PITCH_X_CENTER) {
        targetXPos=PITCH_X_CENTER-xPos;
        
        // limit to goal width
        if (targetXPos<=PITCH_X_CENTER-(GOAL_WIDTH/2)) {
            targetXPos=PITCH_X_CENTER-(GOAL_WIDTH/2);
        }
    } else {
        targetXPos=PITCH_X_CENTER+xPos;
        
        // limit to goal width
        if (targetXPos>=PITCH_X_CENTER+(GOAL_WIDTH/2)) {
            targetXPos=PITCH_X_CENTER+(GOAL_WIDTH/2);
        }
    }
    
    //CCLOG(@">> WidthRatio =%f, BallPosX =%d, xDistanceFromGoalCentre= %d, xPos = %f, targetxPos %f" ,
         // widthRatio, [ball getX], xDistanceFromGoalCentre, xPos, targetXPos );

    return targetXPos;
}

//
-(int) getKeeperGoallineYPos {
    if ([[self team] isPlayingUpPitch]) {
        return PITCH_BOTTOM;
    } else {
        return PITCH_TOP;
    }
}

-(bool) isBallInTopHalfPitch : (Ball *)ball {
    if ([ball position].y < PITCH_Y_CENTER) {
        return false;
    } else {
        return true;
    }
}


//
- (void)doKeeperSaveNotInProgress:(Ball *)ball ballX:(int)ballX dt:(CCTime)dt
{
    //int targetX;
    [self showMaskSprites];
    self.sprite.scale=PLAYER_SPRITE_SCALE;
   // [self setPlayerFaceBall:ball];
    
    //CCLOG(@">> SAVE NOT INPRGRESS 2..");
    if ([self isKeeperBallCollision:ball])
    {
        //CCLOG(@">> SAVE NOT INPRGRESS 2..");
        //[self doCompStickyBall:ball];
        if ([self isKeeperUnderHumanControl:ball])
        {
            //CCLOG(@">>>> Keeper has ball 2a");
            //player will want the ball to face any direction he moves it
            //CCLOG(@">>>> Keeper has ball 1");
            [self doCompStickyBall:ball];
        }
        else
        {
            // ensure keeper can pass out
            if ([self isPassCompletedTimeElapsed])
            {
                //CCLOG(@">>>> Keeper has ball 2b");
                //CCLOG(@">> SAVE NOT INPRGRESS 2a.. : %d", passCompletedTime);
                [self doKeeperStickyBall:ball];
                
            }
        }
    }
    
    //
    if (![self isKeeperUnderHumanControl:ball])
    {
        // if oppPlayerHas the ball and within certain distance, go to the ball
        // also check if the keeper isnt too far from the goal or the opp player isnt too far from the ball
        
        
        CGPoint goalPosition;
        
        if ([self isBallInTopHalfPitch:ball]) {
            goalPosition = TOP_GOAL_CENTER_POS;
        } else {
            goalPosition = BOTTOM_GOAL_CENTER_POS;
        }
        
        
        //if ([[self oppTeam do])
        if ( (ccpDistance([ball position], self.position) < KEEPER_MOVE_TO_BALL_DISTANCE) &&
             (ccpDistance([ball position], goalPosition) < MAX_KEEPER_FROM_GOAL_DISTANCE) &&
             ([ball isBallStill] || [ball doesOppTeamHaveBall:[self team]] )) {
            
            targetPos.x= [ball position].x;
            targetPos.y= [ball position].y;
        } else {
            targetPos.x = [self getKeeperGoalLineXPosition:ball];
            //targetPos.x = targetX;
            targetPos.y= [self getKeeperGoallineYPos];
            //targetPos.y = [self position].y;
        }
        
        [self setMoveVector];
        [self setPlayerFaceBall:ball];
        [self doKeeperAnim:ball];
        //[self doKeeperDivingAnim:ball];
        //[self setPositionX:[self getSpritePosition].x Y:[self getSpritePosition].y+10];

    }
    else
    {
        [self doKeeperAnimHumanControl:ball];
    }
    
    [self updateSpritePos:dt];
}


- (void)doCheckForKeeperBallCollision:(Ball *)ball
{
   // [self setPlayerFaceBall:ball];
    
    if ([self isKeeperBallCollision:ball])
    {
        //[self setPlayerFaceBall:ball];
        
        //CCLOG(@">> SAVE NOT INPRGRESS 1.. %d " , passCompletedTime);
        if (![self isPassCompletedTimeElapsed])
        {
            //CCLOG(@">>>> Keeper has ball 3a");
            return;
        }
        
        //CCLOG(@">>>> Keeper has ball 3b");
        //CCLOG(@">> SAVE NOT INPRGRESS 1b..");
        // handle case where whistle for half time/full time is blown
        // let the ball bounce of the keeper if contact
        if (![[GameModel sharedGameModel] isHalfOrFullTime])
        {
            //CCLOG(@">>Ball vec %f,%f",[ball vector].x, [ballVector].y);
            CGPoint rebound = ccpMult([ball vector], -0.7);
            rebound = [self getVectorRotatedByRandomAngle:rebound :30];
            [ball setVector: rebound];
        }
        
        // do actual check if ball collides with the keeper
        if ([Util random:10] < 10)
        {
            //CCLOG(@">>Do keeper save sticky ball 2");
            [self doKeeperSaveStickyBall:ball];
            //[ball setZ: self.z+PLAYER_HEIGHT/2];
//            [ball setZ: self.z];
//            [ball setZVector:0.f];
            [ball setAttached:true];
            [[GameModel sharedGameModel] setStateKeeperHasBall];
            //[self setPlayerFaceBall:ball];
            
        }
    }
}

//
-(void) moveKeeper:(CCTime)dt :(Ball *)ball
{
    //self.sprite.color=[CCColor blackColor];

    
    [self updatePassCompletedTime];
    int ballX = [ball position].x;
    
    
    if ([Team getControlsActive]  && [self getTeamId] == TEAM1)
    {
        self.vector = ccpForAngle(-CC_DEGREES_TO_RADIANS(self.sprite.rotation)+90);
        
        //CHANGED
        self.vector = ccpMult(self.vector, self.speed);
        
        if(![self isKeeperWithinBoundary])
        {
            [self setKeeperGoalAreaBoundary];
            self.vector=ccp(0,0);
        }
    }
    else
    {
        
        if(![self isKeeperWithinBoundary])
        {
            [self setKeeperGoalAreaBoundary];
            self.vector=ccp(0,0);
        }

        self.vector=ccp(0,0);
    }
    
    //
    if([self isKeeperUnderHumanControl:ball])
    {
        [team setActivePlayerSpritePosition:[self position]];
        [ball setZ:0];
    }
    
    //
    if (saveInProgress)
    {
        [self doKeeperSaveInProgress:dt ball:ball];
    }
    else
    {
        [self doKeeperSaveNotInProgress:ball ballX:ballX dt:dt];
    }
    
    //TODO refactor - cleanup and move this to its own method only called in game playing section
    if ([[GameModel sharedGameModel]  getMatchState] != keeperHasBall)
    {
        [self doCheckForKeeperBallCollision:ball];
    }
}


//
-(void) setFacePositionVector:(CGPoint)facePos
{
    //CLOG(@">> Face ball - ball pos : %f,%f", [ball position].x,[ball position].y);
    CGPoint facePosVec = ccpSub(facePos, [self position]);
    facingVector = ccpNormalize(facePosVec);
}


//
-(void) setPlayerFacePos:(CGPoint)facePos
{
    [self setFacePositionVector:facePos];
    
    
    CGFloat rotationRadians;
    
    rotationRadians = ccpToAngle(facingVector);
    
    CGFloat rotationDegrees = -CC_RADIANS_TO_DEGREES(rotationRadians);
    
    rotationDegrees += 90.0f;
    
    self.spriteRotation = rotationDegrees;
}


//
-(void) setFaceBallVector:(Ball *)ball
{
    //CLOG(@">> Face ball - ball pos : %f,%f", [ball position].x,[ball position].y);
    CGPoint faceBallVec = ccpSub([ball position], [self position]);
    facingVector = ccpNormalize(faceBallVec);
}


//
-(void) setPlayerFaceBall:(Ball *)ball
{
    // dont turn player if sliding
    if (isDoingSlide) {
        return;
    }
    
    [self setFaceBallVector:ball];
    
    //  CGPoint faceBallVec = ccpSub([ball getSprite].position, [self getSpritePosition]);
    //  facingVector = ccpNormalize(faceBallVec);
    
    CGFloat rotationRadians;
    
    rotationRadians = ccpToAngle(facingVector);
    
    CGFloat rotationDegrees = -CC_RADIANS_TO_DEGREES(rotationRadians);
    
    rotationDegrees += 90.0f;
    
    self.spriteRotation = rotationDegrees;
    
    //self.vector=ccpNormalize(facingVector);
    //vector=ccpNormalize(facingVector);
    
    //self.sprite.rotation = spriteRotation;
    
    // //printf("\n player face ball :rotation = %f", sprite.rotation);
    
    //[sprite  setSpriteFrame:frame];
}

//
-(bool) isPlayerMoving
{
    if (self.vector.x==0 && self.vector.y==0)
        return false;
    
    return true;
}

//
-(CGPoint) checkLinesIntersect :(float)x0 :(float)y0 :(float)x1 :(float)y1
                               :(float)x2 :(float)y2 :(float)x3 :(float)y3
{
	/*
     // this function computes the intersection of the sent lines
     // and returns the intersection point, note that the function assumes
     // the lines intersect. the function can handle vertical as well
     // as horizontal lines. note the function isn't very clever, it simply
     // applies the math, but we don't need speed since this is a
     // pre-processing step
     */
	float a1,b1,c1, /* constants of linear equations*/
    a2,b2,c2,
    det_inv,  /* the inverse of the determinant of the coefficient
               matrix*/
    m1,m2;    /* the slopes of each line*/
    CGPoint xPoint = ccp(0,0);
    
	/* compute slopes, note the cludge for infinity, however, this will
	 be close enough*/
    
    
	//printf("\n Line 1 (ball) = %f,%f - %f,%f\n", x0,y0, x1,y1);
	//printf("\n Line 2 (goal) = %f,%f - %f,%f\n", x2,y2, x3,y3);
    
    
    
	if ((x1-x0)!=0)
        m1 = (y1-y0)/(x1-x0);
	else
        m1 = (float)1e+10;   /* close enough to infinity*/
    
	if ((x3-x2)!=0)
        m2 = (y3-y2)/(x3-x2);
	else
        m2 = (float)1e+10;   /* close enough to infinity*/
    
	/* compute constants */
    
	a1 = m1;
	a2 = m2;
    
	b1 = -1;
	b2 = -1;
	//printf("\n **GOT HERE aa1...\n");
	c1 = (y0-m1*x0);
	c2 = (y2-m2*x2);
    
	/* compute the inverse of the determinate */
	//printf("\n **GOT HERE a1...\n");
    
	if((a1*b2 - a2*b1)) {
		det_inv = 1/(a1*b2 - a2*b1);
	}
	else {
		//*xi=0;
		//*yi=0;
		return xPoint;
	}
    
	/* use Kramers rule to compute xi and yi */
	//printf("\n **GOT HERE 1...\n");
    
	////printf("\n ** Before COLLISION X= %f Y=%f...\n", *xi, *yi);
    
    
	xPoint.x=((b1*c2 - b2*c1)*det_inv);
	xPoint.y=((a2*c1 - a1*c2)*det_inv);
	
    // xPoint.x = xi;
    
	//printf("\n ** AFter COLLISION X= %f Y=%f...\n", xPoint.x, xPoint.y);
    
    return xPoint;
    
} /* end Intersect_Lines */

//
-(void) checkLinesIntersect :(float) x0 :(float) y0 :(float)x1 :(float) y1
                            :(float) x2 :(float) y2 :(float)x3 :(float) y3
                            :(float *)xi :(float*) yi
{
	/*
     // this function computes the intersection of the sent lines
     // and returns the intersection point, note that the function assumes
     // the lines intersect. the function can handle vertical as well
     // as horizontal lines. note the function isn't very clever, it simply
     // applies the math, but we don't need speed since this is a
     // pre-processing step
     */
	float a1,b1,c1, /* constants of linear equations*/
    a2,b2,c2,
    det_inv,  /* the inverse of the determinant of the coefficient
               matrix*/
    m1,m2;    /* the slopes of each line*/
    
	/* compute slopes, note the cludge for infinity, however, this will
	 be close enough*/
    
    
	//printf("\n Line 1 (ball) = %f,%f - %f,%f\n", x0,y0, x1,y1);
	//printf("\n Line 2 (goal) = %f,%f - %f,%f\n", x2,y2, x3,y3);
    
    
    
	if ((x1-x0)!=0)
        m1 = (y1-y0)/(x1-x0);
	else
        m1 = (float)1e+10;   /* close enough to infinity*/
    
	if ((x3-x2)!=0)
        m2 = (y3-y2)/(x3-x2);
	else
        m2 = (float)1e+10;   /* close enough to infinity*/
    
	/* compute constants */
    
	a1 = m1;
	a2 = m2;
    
	b1 = -1;
	b2 = -1;
	//printf("\n **GOT HERE aa1...\n");
	c1 = (y0-m1*x0);
	c2 = (y2-m2*x2);
    
	/* compute the inverse of the determinate */
	//printf("\n **GOT HERE a1...\n");
    
	if((a1*b2 - a2*b1)) {
		det_inv = 1/(a1*b2 - a2*b1);
	}
	else {
		*xi=0;
		*yi=0;
		return;
	}
    
	/* use Kramers rule to compute xi and yi */
	//printf("\n **GOT HERE 1...\n");
    
	//printf("\n ** Before COLLISION X= %f Y=%f...\n", *xi, *yi);
    
    
	*xi=((b1*c2 - b2*c1)*det_inv);
	*yi=((a2*c1 - a1*c2)*det_inv);
	
	//printf("\n ** AFter COLLISION X= %f Y=%f...\n", *xi, *yi);
    
    
    
} /* end Intersect_Lines */

-(int) getSaveDistanceRatio
{
    
    return 0;
}

//
-(bool) isFutureBallXPositionNearGoal:(CGPoint)pos
{
    //CCLOG(@"Future Ball Pos = %f,%f",pos.x, pos.y);
    return (pos.x < PITCH_X_CENTER+GOAL_WIDTH) && (pos.x > PITCH_X_CENTER-GOAL_WIDTH);
}


//
-(void) performKeeperSaveIfRequired:(Ball *)ball :(CCTime)dt
{
    /*
     
     Does the ball at its current vector cross the line
     
     */
    //CGPoint ballFinalPos;
    bool saveRequired = false;
    //    CGPoint ballCrossGoalLinePos;
    //
    //    CGPoint topGoalCenter = ccp(240,660);
    //    CGPoint bottomGoalCenter = ccp(240,30);
    //    int goalSaveRatio;
    
    //    if (saveInProgress)
    //        //printf("\n ** save in progress \n");
    //    else
    //        //printf("\n ** save not in progress \n");
    
    
    if (!saveInProgress)
    {
        
        if ([self isPotentialSaveRequired:ball])
        {
            //ballFinalPos = [ball getFinalPosition];
            //CCLOG(@"**** POTENTIAL SAVE REQUIRED ***** Team Id :%d , Facing :%d, Goal Name : %@" ,[self teamId], [self getTeamFacingDir] ,self.playerName);
            // [self getSprite].scale=2.5;
            CGPoint ballFuturePos = [ball getFuturePosition:0.97 :dt];
            // float xi, yi=0;
            CGPoint xPoint;
            
            //        xPoint = [self checkLinesIntersect:(float) 200 :(float) 30   :(float)280 :(float) 30
            //                                          :(float) [ball getX]       :(float) [ball getY]
            //                                          :(float) ballFuturePos.x   :(float) ballFuturePos.y];
            
            //CCLOG(@">> Ball pos x,y = %f,%f", ball.position.x, ball.position.y);
            int goalLine =0;
            
            if ([self isTeamShootingUp])
            {
                //CCLOG(@">> Chk SaveUp x,y = %f,%f", ballFuturePos.x, ballFuturePos.y);
                
                //if (ballFinalPos.y < 30) // just outside goal area
                //if (ballFuturePos.y < 75)
                //if (ballFuturePos.y < (340-200) && [self isFutureBallXPositionNearGoal:ballFuturePos])
//                if (ballFuturePos.y < KEEPER_BOTTOM_LINE)
//                {
//                    //CCLOG(@">> Shooting up : 'ballFuturePos.y < KEEPER_BOTTOM_LINE'");
//                }
                
//                if ([self isFutureBallXPositionNearGoal:ballFuturePos])
//                {
//                    // CCLOG(@">> Shooting up : 'isFutureBallXPositionNearGoal'");
//                }
                
                if (/*ballFuturePos.y < (PITCH_Y_CENTER-200) &&*/ ballFuturePos.y < KEEPER_BOTTOM_LINE
                        && [self isFutureBallXPositionNearGoal:ballFuturePos])
                {
                    // dont dive if ball is already behind the line / only dive if ball is in front of the line
                    if (ball.position.y > KEEPER_BOTTOM_LINE ) {/*KEEPER_CHANGED*/
                        saveRequired=true;
                        goalLine=KEEPER_BOTTOM_LINE;
                        // zVector=[ball z]/10;
                        [self keeperJump:[ball z]];
                    }
                    
                }
            }
            else
            {
                //CCLOG(@">> Check save required - shooting down");
                // CCLOG(@">> Chk SaveDown x,y = %f,%f", ballFuturePos.x, ballFuturePos.y);
                //if (ballFinalPos.y > 630) // just outside goal area
                //if (ballFuturePos.y > 640)
                //if (ballFuturePos.y > (340+200) && [self isFutureBallXPositionNearGoal:ballFuturePos])
                if (/*ballFuturePos.y > (PITCH_Y_CENTER+200) &&*/ ballFuturePos.y > KEEPER_TOP_LINE
                    && [self isFutureBallXPositionNearGoal:ballFuturePos])
                {
                    // dont dive if ball is already behind the line / only dive if ball is in front of the line
                    if (ball.position.y < KEEPER_TOP_LINE ) {/*KEEPER_CHANGED*/
                        saveRequired=true;
                        goalLine = KEEPER_TOP_LINE;
                        //zVector=[ball z]/10;
                    
                        [self keeperJump:[ball z]];
                    }
                }
                
            }
            
            //[[[SceneManager sharedSceneManager] gameLayer] drawLine: [ball position]: ballFuturePos :0];
            
            
            // change it so save is required 1) if future Y pos is past goal line
            // then in this method, only save if the cross position is within range
            if (saveRequired)
            {
                xPoint = [self checkLinesIntersect:(float) PITCH_X_CENTER-GOAL_WIDTH    :(float) goalLine
                                                  :(float) PITCH_X_CENTER+GOAL_WIDTH    :(float) goalLine
                                                  :(float) [ball getX]                  :(float) [ball getY]
                                                  :(float) ballFuturePos.x              :(float) ballFuturePos.y];
                
                ////printf("\n*** BALL crossed line at =%f,%f", ballCrossGoalLinePos.x, ballCrossGoalLinePos.y);
                //[[[SceneManager sharedSceneManager] gameLayer] drawLine: [ball position]: ballFuturePos :0];
                
                //if (xPoint.x !=0 && xPoint.y !=0)
                if (ccpLength(xPoint)>0)
                    
                    //if (doSaveTemp)
                {
                    //ballCrossGoalLinePos = [ball getGoalCrossPosition];
                    //CCLOG(@"\n*** BALL will cross line at =%f,%f",xPoint.x, xPoint.y);
                    //CCLOG(@"\n*** BALL future pos at =%f,%f",ballFuturePos.x, ballFuturePos.y);
                    
                    tempSavePos=xPoint;
                    saveInProgress=true;
                    saveJustStarted=true;
                    
                    //printf("\n *** Ball Position = %f,%f ***\n", [ball getPosition].x, [ball getPosition].y);
                    
                    float shotDistance = ccpDistance([ball position], xPoint);
                    //float shotDistance = ccpLengthSQ(ccpSub([ball position], xPoint));
                    
                    
                    
                    float numShotFramesToKeeper = shotDistance/[ball getVectorLength];
                    if (numShotFramesToKeeper < 1.0)
                        numShotFramesToKeeper=1.0;
                    
                    //printf("\n *** --ShotDistance & No. Of Frames to keeper = %f,%f\n", shotDistance, numShotFramesToKeeper);
                    //CGPoint fullSaveVector = ccpSub(ccp(xPoint.x,xPoint.y), position);
                    
                    CGPoint fullSaveVector = ccpSub(xPoint, self.position);
                    
                    //printf("/n full save vector = %f,%f\n",fullSaveVector.x, fullSaveVector.y);
                    saveVector = ccp(fullSaveVector.x/numShotFramesToKeeper, fullSaveVector.y);
                    // saveVector = ccp(fullSaveVector.x, fullSaveVector.y);
                    
                    //TODO - SAVE vector as property and flexible depending on skill level
                    saveVector = ccpMult(saveVector, 3.0); //3.0
                    //saveVector=fullSaveVector;
                    //printf("/n final save vector = %f,%f\n",saveVector.x, saveVector.y);
                    
                }
                
            }
            
        }
    }
    
}

//
-(void) setSaveVector:(CGPoint)saveTargetPos :(int)saveDistanceRatio
{
    saveVector = ccp(0,0);
    saveVector = ccpSub(saveTargetPos, self.sprite.position);
    saveVector.y=0;
  }


//
-(bool) doesCurrentBallTrajectoryCrossGoalLine
{
    return false;
}


//
-(CGPoint) getKeeperIntersectionLineVerticalStandingStart {
    CGPoint point = CGPointMake(position.x-PLAYER_WIDTH, (position.y));
    return point;
}


-(CGPoint) getKeeperIntersectionLineVerticalStandingEnd {
    CGPoint point = CGPointMake(position.x+PLAYER_WIDTH, (position.y));
    return point;
}


//
-(CGPoint) getKeeperIntersectionLineVerticalStartTop {
    CGPoint point = CGPointMake(position.x, (position.y+self.z * 0.35)-(PLAYER_HEIGHT/3));
    return point;
}


-(CGPoint) getKeeperIntersectionLineVerticalEndTop {
    CGPoint point = CGPointMake(position.x, (position.y+self.z * 0.35)+(PLAYER_HEIGHT/3));
    return point;
}

//
-(CGPoint) getKeeperIntersectionLineVerticalStartBottom {
    CGPoint point = CGPointMake(position.x, (position.y-self.z * 0.35)-(PLAYER_HEIGHT/3));
    return point;
}


-(CGPoint) getKeeperIntersectionLineVerticalEndBottom {
    CGPoint point = CGPointMake(position.x, (position.y-self.z * 0.35)+(PLAYER_HEIGHT/3));
    return point;
}


//
-(CGPoint) getKeeperIntersectionLineStartTop {
    CGPoint point = CGPointMake(position.x-(PLAYER_HEIGHT), position.y+self.z * 0.35);
    return point;
}


-(CGPoint) getKeeperIntersectionLineEndTop {
    CGPoint point = CGPointMake(position.x+(PLAYER_HEIGHT), position.y+self.z * 0.35);
    return point;
}


-(CGPoint) getKeeperIntersectionLineStartBottom {
    CGPoint point = CGPointMake(position.x-(PLAYER_HEIGHT), position.y-self.z * 0.35);
    return point;
}


-(CGPoint) getKeeperIntersectionLineEndBottom {
    CGPoint point = CGPointMake(position.x+(PLAYER_HEIGHT), position.y-self.z * 0.35);
    return point;
}

-(CGPoint) getKeeperIntersectionLineDiagonalStartBottom {
    CGPoint point = CGPointMake(position.x-(PLAYER_HEIGHT/2), (position.y-self.z * 0.35)-(PLAYER_HEIGHT/2));
    return point;
}

-(CGPoint) getKeeperIntersectionLineDiagonalEndBottom {
    CGPoint point = CGPointMake(position.x+(PLAYER_HEIGHT/2), (position.y-self.z * 0.35)+(PLAYER_HEIGHT/2));
    return point;
}

// Bottom Keeper - Diag Right to Left

-(CGPoint) getBottomKeeperIntersectionLineDiagonalBottomRight {
    CGPoint point = CGPointMake(position.x+(PLAYER_HEIGHT/3), (position.y-self.z * 0.35)+(PLAYER_HEIGHT/3));
    return point;
}

-(CGPoint) getBottomKeeperIntersectionLineDiagonalTopLeft {
    CGPoint point = CGPointMake(position.x-(PLAYER_HEIGHT/3), (position.y-self.z * 0.35)-(PLAYER_HEIGHT/3));
    return point;
}

// Bottom Keeper - Diag Left to Right

-(CGPoint) getBottomKeeperIntersectionLineDiagonalBottomLeft {
    CGPoint point = CGPointMake(position.x-(PLAYER_HEIGHT/3), (position.y-self.z * 0.35)+(PLAYER_HEIGHT/3));
    return point;
}

-(CGPoint) getBottomKeeperIntersectionLineDiagonalTopRight {
    CGPoint point = CGPointMake(position.x+(PLAYER_HEIGHT/3), (position.y-self.z * 0.35)-(PLAYER_HEIGHT/3));
    return point;
}


// Top Keeper - Diag Right to Left

-(CGPoint) getTopKeeperIntersectionLineDiagonalBottomRight {
    CGPoint point = CGPointMake(position.x+(PLAYER_HEIGHT/3), (position.y+self.z * 0.35)-(PLAYER_HEIGHT/3));
    return point;
}

-(CGPoint) getTopKeeperIntersectionLineDiagonalTopLeft {
    CGPoint point = CGPointMake(position.x-(PLAYER_HEIGHT/3), (position.y+self.z * 0.35)+(PLAYER_HEIGHT/3));
    return point;
}

// Top Keeper - Diag Right to Left

-(CGPoint) getTopKeeperIntersectionLineDiagonalBottomLeft {
    CGPoint point = CGPointMake(position.x-(PLAYER_HEIGHT/3), (position.y+self.z * 0.35)-(PLAYER_HEIGHT/3));
    return point;
}

-(CGPoint) getTopKeeperIntersectionLineDiagonalTopRight {
    CGPoint point = CGPointMake(position.x+(PLAYER_HEIGHT/3), (position.y+self.z * 0.35)+(PLAYER_HEIGHT/3));
    return point;
}


-(bool) isWithinGoalPosts:(int)ballXPos;
{
    return (ballXPos > (240-90) && ballXPos < (SCREEN_X_CENTER+90));
}

//
// Check if ball is coming in range of keeper
//
-(bool) isPotentialSaveRequired:(Ball *) ball
{
    //
    // Calculate balls future position taking into account current vector
    //
    //
    if ([ball attached])
        return false;
    
    if (![self isBallHeadingTowardsKeeper:ball])
        return false;
    
    // return true;
    
    //CGPoint ballFuturePos = [ball getFuturePosition:0.9];
    if ([self isTeamShootingUp])
    {
        return ([ball position].y < (PITCH_Y_CENTER-200)) ? true : false;// just outside goal area
        
        //if (ballFuturePos.y < 100 && [self isWithinGoalPosts: ballFuturePos.x])
        //            return true;
        //        else
        //            return false;
    }
    else
    {
        return ([ball position].y > (PITCH_Y_CENTER+200)) ? true : false; // just outside goal area
        //if (ballFuturePos.y > 450 && [self isWithinGoalPosts: ballFuturePos.x])
        //            return true;
        //        else
        //            return false;
    }
    
    return false;
}


// Is Ball heading towards keeper

-(bool) isBallHeadingTowardsKeeper:(Ball *) ball
{
    if ([self isTeamShootingUp])
    {
        if ([ball vector].y < 0)
            return true;
        else
            return false;
    }
    else
    {
        if ([ball vector].y > 0)
            return true;
        else
            return false;
    }
    
    return false;
}


-(void) setKeeperDivingShadowScale {
    self.shadow.scaleX=1.0;
    self.shadow.scaleY=0.4;
}


//
-(LineNode *) getKeeperDivingIntersectionLine
{

    NSString *frame1 = @"keeperGlovesN1.png";
    
    //
    NSString *topKeeperUp = @"keeperTopUp-hd.png";
    NSString *topKeeperUpRight = @"keeperTopRight-hd.png";
    NSString *topKeeperUpLeft = @"keeperTopLeft-hd.png";
    
    // bottom
    NSString *bottomKeeperUp = @"keeperBottomUp-hd.png";
    NSString *bottomKeeperUpRight = @"keeperBottomRight-hd.png";
    NSString *bottomKeeperUpLeft = @"keeperBottomLeft-hd.png";

    LineNode *intersectionLine = [[LineNode alloc] init];
    
    NSString *currentFrameName = [self getFrameName];

    // only perform check if within certain proximity to save cpu resource
    
    

    if ([self isTeamShootingUp])
    {
        // default line - keeper diving horizontally
        intersectionLine.startPoint = [self getKeeperIntersectionLineStartBottom];
        intersectionLine.endPoint = [self getKeeperIntersectionLineEndBottom];

    
        if ([currentFrameName hasPrefix:bottomKeeperUpLeft]) {
            intersectionLine.startPoint = [self getBottomKeeperIntersectionLineDiagonalBottomRight];
            intersectionLine.endPoint = [self getBottomKeeperIntersectionLineDiagonalTopLeft];

        } else if ([currentFrameName hasPrefix:bottomKeeperUpRight ]) {
            intersectionLine.startPoint = [self getBottomKeeperIntersectionLineDiagonalBottomLeft];
            intersectionLine.endPoint = [self getBottomKeeperIntersectionLineDiagonalTopRight];

        } else if ([currentFrameName hasPrefix:bottomKeeperUp]) {
            intersectionLine.startPoint = [self getKeeperIntersectionLineVerticalStartBottom];
            intersectionLine.endPoint = [self getKeeperIntersectionLineVerticalEndBottom];
        
        } else if ([currentFrameName hasPrefix:frame1]) {
            intersectionLine.startPoint = [self getKeeperIntersectionLineVerticalStandingStart];
            intersectionLine.endPoint = [self getKeeperIntersectionLineVerticalStandingEnd];
        }
        
    } else {
        // default line - keeper diving horizontally
        intersectionLine.startPoint = [self getKeeperIntersectionLineStartTop];
        intersectionLine.endPoint = [self getKeeperIntersectionLineEndTop];
        
        
        if ([currentFrameName hasPrefix:topKeeperUpLeft]) {
            intersectionLine.startPoint = [self getTopKeeperIntersectionLineDiagonalBottomRight];
            intersectionLine.endPoint = [self getTopKeeperIntersectionLineDiagonalTopLeft];
            
        } else if ([currentFrameName hasPrefix:topKeeperUpRight]) {
            intersectionLine.startPoint = [self getTopKeeperIntersectionLineDiagonalBottomLeft];
            intersectionLine.endPoint = [self getTopKeeperIntersectionLineDiagonalTopRight];
        
        } else if ([currentFrameName hasPrefix:topKeeperUp]) {
            intersectionLine.startPoint = [self getKeeperIntersectionLineVerticalStartTop];
            intersectionLine.endPoint = [self getKeeperIntersectionLineVerticalEndTop];
        
        } else if ([currentFrameName hasPrefix:frame1]) {
            intersectionLine.startPoint = [self getKeeperIntersectionLineVerticalStandingStart];
            intersectionLine.endPoint = [self getKeeperIntersectionLineVerticalStandingEnd];
        }
    }
    
    return intersectionLine;
  }


-(bool) isColourSame :(CCColor *) col1 :(CCColor *) col2 {
    return (col1.red == col2.red && col1.green == col2.green && col1.blue == col2.blue);
}

-(void) doKeeperDivingAnim:(Ball *)ball
{
    NSString *frame1 = @"keeperGlovesN1.png";
    // NSString *frame2 = @"blueN2.png";
    //TODO get this from Util class
    
    //CCColor *skinWhiteColor = [CCColor colorWithRed:(229.0/255.0) green:(194.0/255.0) blue:(152.0/255.0) alpha:(1.0f)];
    CCColor *skinWhiteColor = [CCColor colorWithRed:(215.0/255.0) green:(172.0/255.0) blue:(115.0/255.0) alpha:(1.0f)];
    
    CCColor *skinColour =  [[self skinSprite] color];
    
    NSString *topKeeperLeft;
    NSString *topKeeperRight;
    NSString *topKeeperUp;
    NSString *topKeeperUpRight;
    NSString *topKeeperUpLeft;
    
    // bottom
    NSString *bottomKeeperLeft;
    NSString *bottomKeeperRight;
    NSString *bottomKeeperUp;
    NSString *bottomKeeperUpRight;
    NSString *bottomKeeperUpLeft;

    //if ([self isColourSame: skinWhiteColor : skinColour]) {
    //if ([skinColour isEqualToColor:lightBrownColor] || [skinColour isEqualToColor:skinWhiteColor] ) {
    if ([skinColour isEqualToColor:skinWhiteColor] ) {
            
        topKeeperLeft = @"keeperTopLeft-hd.png";
        topKeeperRight = @"keeperTopRight-hd.png";
        topKeeperUp = @"keeperTopUp-hd.png";
        topKeeperUpRight = @"keeperTopRight-hd.png";
        topKeeperUpLeft = @"keeperTopLeft-hd.png";
        
        // bottom
        bottomKeeperLeft = @"keeperBottomLeft-hd.png";
        bottomKeeperRight = @"keeperBottomRight-hd.png";
        bottomKeeperUp = @"keeperBottomUp-hd.png";
        bottomKeeperUpRight = @"keeperBottomRight-hd.png";
        bottomKeeperUpLeft = @"keeperBottomLeft-hd.png";
    } else {
        topKeeperLeft = @"keeperTopLeftBlk-hd.png";
        topKeeperRight = @"keeperTopRightBlk-hd.png";
        topKeeperUp = @"keeperTopUpBlk-hd.png";
        topKeeperUpRight = @"keeperTopRightBlk-hd.png";
        topKeeperUpLeft = @"keeperTopLeftBlk-hd.png";
        
        // bottom
        bottomKeeperLeft = @"keeperBottomLeftBlk-hd.png";
        bottomKeeperRight = @"keeperBottomRightBlk-hd.png";
        bottomKeeperUp = @"keeperBottomUpBlk-hd.png";
        bottomKeeperUpRight = @"keeperBottomRightBlk-hd.png";
        bottomKeeperUpLeft = @"keeperBottomLeftBlk-hd.png";

    }
    
    NSString *currentFrameName =@"";
    
    //
    self.shadow.scaleX=1.0;
    
    //
    if (saveInProgress) {
        self.sprite.scale=0.65f;
        
        [self hideMaskSprites];
        [self hideSlideMaskSprites];
    
        // //printf("\n**** --- do keeper diving anim : save in progress---\n");
        // Check why sprite gets rotated to 180 degress sometimes
        // self.sprite.rotation=0;

        //CCLOG(@">>> SAve X Vector = %f",saveVector.x);
        
        if ([self isTeamShootingUp])
        {
//            [[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag:
//             [self getKeeperIntersectionLineStartBottom] : [self getKeeperIntersectionLineEndBottom] :1];
            
            //self.sprite.rotation=0;

            if (saveVector.x < -5)
            {
                if (self.z > KEEPER_HIGH_DIVE_HEIGHT)
                {
                    currentFrameName = bottomKeeperUpLeft;
                    //self.sprite.scaleY=0.45;
                    
                    [self setKeeperDivingShadowScale];
                    
                    self.sprite.rotation=-35;
                    
//                    [[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag:
//                     [self getBottomKeeperIntersectionLineDiagonalBottomRight] : [self getBottomKeeperIntersectionLineDiagonalTopLeft] :1];
//                    

                    //getKeeperIntersectionLineDiagonalEndBottom
                }
                else
                {
                    currentFrameName = bottomKeeperLeft;
                    self.sprite.rotation=0;
                    
                    [self setKeeperDivingShadowScale];
                }
            }
            else if (saveVector.x > 5)
            {
                if (self.z > KEEPER_HIGH_DIVE_HEIGHT)
                {
                    currentFrameName=bottomKeeperUpRight;
                    
                    [self setKeeperDivingShadowScale];
                    
                    self.sprite.rotation=35;
                    
//                    [[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag:
//                     [self getBottomKeeperIntersectionLineDiagonalBottomLeft] : [self getBottomKeeperIntersectionLineDiagonalTopRight] :1];
                    

                }
                else
                {
                    currentFrameName=bottomKeeperRight;
                    self.sprite.rotation=0;
                    
                    [self setKeeperDivingShadowScale];
                }
            }
            else
            {
                self.sprite.rotation=0;
                
                
                //
//                [[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag:
//                 [self getKeeperIntersectionLineVerticalStandingStart] : [self getKeeperIntersectionLineVerticalStandingEnd] :1];
                
                
                if (self.z > KEEPER_HIGH_DIVE_HEIGHT)
                {
                    currentFrameName=bottomKeeperUp;
                    self.sprite.scale=PLAYER_SPRITE_SCALE;
                    self.sprite.scaleY=0.7; // 0.6

                    self.shadow.scale=0.5;
                }
                else if (self.z < PLAYER_FOOT_HEIGHT)
                {
                    currentFrameName=frame1;
                    [self showMaskSprites];
                    
                    self.sprite.scale=PLAYER_SPRITE_SCALE;
                    self.shadow.scale=0.5;
                }
                else
                {
                    currentFrameName=frame1;
                    [self showMaskSprites];
                    
                    self.sprite.scale=PLAYER_SPRITE_SCALE;
                    self.shadow.scale=0.5;
                }
            }
        }
        else
        {
//            [[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag:
//             [self getKeeperIntersectionLineStartTop] : [self getKeeperIntersectionLineEndTop] :1];

            //self.sprite.rotation=0;

            if (saveVector.x < -5)
            {
                if (self.z > KEEPER_HIGH_DIVE_HEIGHT)
                {
                    currentFrameName=topKeeperUpLeft;
                    
                    [self setKeeperDivingShadowScale];
                    
                    self.sprite.rotation=35;
                    
//                    [[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag:
//                     [self getTopKeeperIntersectionLineDiagonalBottomRight] : [self getTopKeeperIntersectionLineDiagonalTopLeft] :1];

                }
                else
                {
                    currentFrameName=topKeeperLeft;
                    self.sprite.rotation=0;
                    
                    [self setKeeperDivingShadowScale];
                }
                
            }
            else if (saveVector.x > 5)
            {
                if (self.z > KEEPER_HIGH_DIVE_HEIGHT)
                {
                    currentFrameName=topKeeperUpRight;
                    [self setKeeperDivingShadowScale];

                    self.sprite.rotation=-35;
//                    [[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag:
//                     [self getTopKeeperIntersectionLineDiagonalBottomLeft] : [self getTopKeeperIntersectionLineDiagonalTopRight] :1];
                    
                }
                else
                {
                    currentFrameName=topKeeperRight;
                    self.sprite.rotation=0;
                    
                    [self setKeeperDivingShadowScale];
                }
            }
            else
            {
                //self.sprite.rotation=180;
                //
                //
//                [[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag:
//                 [self getKeeperIntersectionLineVerticalStandingStart] : [self getKeeperIntersectionLineVerticalStandingEnd] :1];
                
                
                if (self.z > KEEPER_HIGH_DIVE_HEIGHT)
                {
                    self.sprite.rotation=0;
                    currentFrameName=topKeeperUp;
                    self.sprite.scale=PLAYER_SPRITE_SCALE;
                    self.sprite.scaleY=0.7; //0.6
                    
                    self.shadow.scale=0.5;
                }
                else if (self.z < PLAYER_FOOT_HEIGHT)
                {
                    self.sprite.rotation=180;
                    currentFrameName=frame1;
                    [self showMaskSprites];
                    
                    self.sprite.scale=PLAYER_SPRITE_SCALE;
                    self.shadow.scale=0.5;
                }
                else
                {
                    self.sprite.rotation=180;
                    currentFrameName=frame1;
                    [self showMaskSprites];
                    
                    self.sprite.scale=PLAYER_SPRITE_SCALE;
                    self.shadow.scale=0.5;
                }
            }
        }
    }
    
    frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:currentFrameName];
    [self setFrameName:currentFrameName];
    [self.sprite setSpriteFrame:frame];
}


-(void) doBallKeeperReorderIfRequired:(Ball *)ball {
    
    if (self.z <= ball.z) {
        // ensure ball looks as it is front of keeper
        // i.e has a higher zorder
        
        // hack - calling via ball - issues with reorder from this class
        [ball doZReorder: ball :BALL_ABOVE_PLAYER_Z_ORDER_LEVEL];
    }
}


-(void) doKeeperDivingAnimOriginal:(Ball *)ball
{
    NSString *frame1 = @"blackN1.png";
    // NSString *frame2 = @"blueN2.png";
    /*NSString *keeperLeft = @"keeper_left.png";
    NSString *keeperRight = @"keeper_right.png";
    NSString *bottomKeeperUp = @"bottomKeeper_up.png";
    NSString *bottomKeeperDown = @"bottomKeeper_down.png";
    NSString *bottomKeeperUpRight = @"bottomKeeper_upRight.png";
    NSString *bottomKeeperUpLeft = @"bottomKeeper_upLeft.png";
    NSString *topKeeperUp = @"topKeeper_up.png";
    NSString *topKeeperDown = @"topKeeper_down.png";
    NSString *topKeeperUpRight = @"topKeeper_upRight.png";
    NSString *topKeeperUpLeft = @"topKeeper_upLeft.png";*/
    
    NSString *keeperLeft = @"GOALIE_LEFT_DIVE-hd.png";
    NSString *keeperRight = @"GOALIE_RIGHT_DIVE-hd.png";
    NSString *bottomKeeperUp = @"GOALIE_DOWN_DIVE-hd.png";
    NSString *bottomKeeperUpRight = @"GOALIE_BOTTOM_RIGHT_UP_DIVE-hd.png";
    NSString *bottomKeeperUpLeft = @"GOALIE_BOTTOM_LEFT_UP_DIVE-hd.png";
    NSString *topKeeperUp = @"GOALIE_UP_DIVE-hd.png";
    NSString *topKeeperUpRight = @"GOALIE_TOP_RIGHT_UP_DIVE-hd.png";
    NSString *topKeeperUpLeft = @"GOALIE_TOP_LEFT_UP_DIVE-hd.png";
    
    //NSString
    
    if (saveInProgress)
    {
        
        // //printf("\n**** --- do keeper diving anim : save in progress---\n");
        
        if ([self isTeamShootingUp])
        {
            if (saveVector.x < -1)
            {
                if ([ball z] > PLAYER_WAIST_HEIGHT)
                {
                    frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                             spriteFrameByName:bottomKeeperUpLeft];
                    ////printf("\n --- Bottom Keeper - dive up left--- \n");
                }
                else
                {
                    frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                             spriteFrameByName:keeperLeft];
                    ////printf("\n --- Bottom Keeper - dive left --- \n");
                }
                
            }
            else if (saveVector.x > 1)
            {
                if ([ball z] > PLAYER_WAIST_HEIGHT)
                {
                    frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                             spriteFrameByName:bottomKeeperUpRight];
                    ////printf("\n --- Bottom Keeper - dive up right--- \n");
                }
                else
                {
                    frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                             spriteFrameByName:keeperRight];
                    ////printf("\n --- Bottom Keeper - dive right --- \n");
                    
                }
            }
            else
            {
                if ([ball z] > PLAYER_WAIST_HEIGHT)
                {
                    frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                             spriteFrameByName:bottomKeeperUp];
                    
                    [self doBallKeeperReorderIfRequired:ball];

                    ////printf("\n --- Bottom Keeper - dive up --- \n");
                }
                else if ([ball z] < PLAYER_FOOT_HEIGHT)
                {
                    frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                             spriteFrameByName:frame1];
                    ////printf("\n --- Bottom Keeper - dive down --- \n");
                }
                else
                {
                    frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                             spriteFrameByName:frame1];
                    ////printf("\n --- Bottom Keeper - stay middle --- \n");
                    
                }
            }
            
        }
        else
        {
            if (saveVector.x < -1)
            {
                if ([ball z] > PLAYER_WAIST_HEIGHT)
                {
                    frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                             spriteFrameByName:topKeeperUpLeft];
                    // //printf("\n --- Top Keeper - dive up left --- \n");
                }
                else
                {
                    frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                             spriteFrameByName:keeperLeft];
                    // //printf("\n --- Top Keeper - dive left --- \n");
                }
                
            }
            else if (saveVector.x > 1)
            {
                if ([ball z] > PLAYER_WAIST_HEIGHT)
                {
                    frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                             spriteFrameByName:topKeeperUpRight];
                    // //printf("\n --- Top Keeper - dive up right --- \n");
                }
                else
                {
                    frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                             spriteFrameByName:keeperRight];
                    ////printf("\n --- Top Keeper - dive right --- \n");
                    
                }
            }
            else
            {
                if ([ball z] > PLAYER_WAIST_HEIGHT)
                {
                    frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                             spriteFrameByName:topKeeperUp];
                    
                    [self doBallKeeperReorderIfRequired:ball];

                    
                    
                    ////printf("\n --- Top Keeper - dive up --- \n");
                }
                else if ([ball z] < PLAYER_FOOT_HEIGHT)
                {
                    frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                             spriteFrameByName:frame1];
                    // //printf("\n --- Top Keeper - dive down --- \n");
                }
                else
                {
                    frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                             spriteFrameByName:frame1];
                    //  //printf("\n --- Top Keeper - stay middle --- \n");
                    
                }
            }
        }
    }
    CCLOG(@">>>> Save Vector : %f,%f", saveVector.x, saveVector.y);
    CCLOG(@">>>> Frame : %@,", frame);
    //[sprite  setSpriteFrame:frame];
   // frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
     //        spriteFrameByName:frame1];
    
    [self.sprite  setSpriteFrame:frame];
    
}

-(CCSpriteFrame *)getFrame;
{
    return frame;
}

-(void) doKeeperAnimHumanControl:(Ball *)ball
{
    NSString *frame1 = @"keeperGlovesN1.png";
    NSString *frame2 = @"keeperGlovesN2.png";
    
    animCount++;

    self.shadow.scale=0.5;
    if (frame == nil)
    {
        //printf("/n *** -> Frame null intially - setting to first anim frame/n");
        frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
                 spriteFrameByName:frame1];
        [self setFrameName:frame1];
        [self showPlayerFrame1Masks : FALSE];
        [self showPlayerFrame2Masks : TRUE];
        
    }
    
    if ([self isPlayerMoving] && animCount > animRate) {
        

        
        if (animFrame==0) {
            frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frame1];
            [self setFrameName:frame1];
            [self showPlayerFrame1Masks : FALSE];
            [self showPlayerFrame2Masks : TRUE];
            

        } else {
            frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frame2];
            [self setFrameName:frame2];
            [self showPlayerFrame1Masks : TRUE];
            [self showPlayerFrame2Masks : FALSE];
        }
        if (animFrame == 0)
            animFrame=1;
        else
            animFrame=0;
        
        animCount=0;
    }
    
       
    [self.sprite  setSpriteFrame:frame];
    
}

-(NSString *) getFrameName {
    return frameName;
}

-(void) setFrameName:(NSString *)name {
    //CCLOG(@"???? Frame name = %@", name);
    frameName=name;
    
}

//
//
-(void) doKeeperAnim:(Ball *)ball
{
    // //printf("\n**** --- do keeper anim ----1\n");
    animCount++;
    
    self.shadow.scale=0.5;

    //[sprite  setSpriteFrame:frame];
    
    NSString *frame1 = @"keeperGlovesN1.png";
    NSString *frame2 = @"keeperGlovesN2.png";
    //    NSString *keeperLeft = @"keeper_left.png";
    //    NSString *keeperRight = @"keeper_right.png";
    //    NSString *bottomKeeperUp = @"bottomKeeper_up.png";
    //    NSString *bottomKeeperDown = @"bottomKeeper_down.png";
    //    NSString *bottomKeeperUpRight = @"bottomKeeper_upRight.png";
    //    NSString *bottomKeeperUpLeft = @"bottomKeeper_upLeft.png";
    //    NSString *topKeeperUp = @"topKeeper_up.png";
    //    NSString *topKeeperDown = @"topKeeper_down.png";
    //    NSString *topKeeperUpRight = @"topKeeper_upRight.png";
    //    NSString *topKeeperUpLeft = @"topKeeper_upLeft.png";
    //
    
    // efault
    //[self setFrameName:frame1];

    
    //handle first time - TODO: clean this up
    if (frame == nil)
    {
        //printf("/n *** -> Frame null intially - setting to first anim frame/n");
        frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frame1];
        [self setFrameName:frame1];
        [self showPlayerFrame1Masks : TRUE];
        [self showPlayerFrame2Masks : FALSE];
    }
    
  
    if ([self isPlayerMoving] && animCount > animRate) {
        if (animFrame==0) {
            frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frame1];
            [self setFrameName:frame1];
            [self showPlayerFrame1Masks : TRUE];
            [self showPlayerFrame2Masks : FALSE];
            

        } else {
            frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frame2];
            [self setFrameName:frame2];
            [self showPlayerFrame1Masks : FALSE];
            [self showPlayerFrame2Masks : TRUE];
        }
        if (animFrame == 0)
            animFrame=1;
        else
            animFrame=0;
        
        animCount=0;
    }
    
    
    if ([self isKeeperBallCollision:ball])
    {
        if ([self isTeamShootingUp])
        {
            facingVector=ccp(0,1);
            //facingVector=Vector;
            // vector=facingVector;
        }
        else
        {
            facingVector=ccp(0,-1);
            //vector=facingVector;
            //spriteRotation=-CC_RADIANS_TO_DEGREES(ccpToAngle(facingVector))+90;
        }
        self.sprite.rotation=-CC_RADIANS_TO_DEGREES(ccpToAngle(facingVector))+90;
        //[self doCompStickyBall:ball];
        
    }
    else
    {
        //[self setFaceBallVector:ball];
    }
    
    //}
    
    CGFloat rotationRadians;
    rotationRadians = ccpToAngle(facingVector);
    CGFloat rotationDegrees = -CC_RADIANS_TO_DEGREES(rotationRadians);
    rotationDegrees += 90.0f;
    
    self.scale=1.0f;
    self.sprite.rotation = rotationDegrees;
    [self.sprite setSpriteFrame:frame];
    
}


-(bool) isBallCloseEnoughForPassOrShotHuman:(Ball *)ball
{
    //CCLOG(@">>>> Ball not close enough for shot/pass ...waiting...");
    
    if ([ball attached])
    {
        return true;
    }
    
    return false;
}

-(bool) isBallCloseEnoughForPassOrShot:(Ball *)ball
{
    //NSLog(@">>>> Ball not close enough for shot/pass ...waiting...");
    
    if ([ball attached] && [self isBallCollision:ball])
    {
       // NSLog(@">>isBall close : true");
        return true;
    }
    
    
   // NSLog(@">>isBall close : false");
    return false;
}

-(bool) canShootOriginal
{
    // if player is within X distance of middle of goal marker
    // if facing goal
    // based on direction they are shooting
    if ([self isPlayerFacingGoal]  && [self isWithinShootingDistance] )
        return true;
    
    return false;
    
}

-(bool) canShoot
{
    if (![self isPlayerFacingGoal])
        return false;
    
    if ([self isWithinShootingDistanceAdv : SHOT_DISTANCE_CLOSE] )
        return true;
    
    if ([self isWithinShootingDistanceAdv : SHOT_DISTANCE_MEDIUM])
    {
        if ([Util random:SHOT_DISTANCE_MEDIUM_RATIO] == 1)
            return true;
        else
            return false;
    }
    if ([self isWithinShootingDistanceAdv : SHOT_DISTANCE_FAR] )
    {
        if ([Util random:SHOT_DISTANCE_FAR_RATIO] == 1)
            return true;
        else
            return false;
    }
    
    return false;
    
}


//
-(bool) isWithinShootingDistanceAdv:(int) distance
{
    //todo measure distance to goal markers once in method above
    
    if ([[self team] getPlayingDirection] == 0) //up
    {
        CGPoint topGoalCenter = ccp(PITCH_X_CENTER,PITCH_TOP);
        if (ccpLengthSQ(ccpSub([self getSpritePosition], topGoalCenter)) < distance)
            return true;
        else
            return false;
    }
    else
    {
        CGPoint bottomGoalCenter = ccp(PITCH_X_CENTER,PITCH_BOTTOM);
        if (ccpLengthSQ(ccpSub([self getSpritePosition], bottomGoalCenter)) < distance)
            return true;
        else
            return false;
    }
}
//
-(bool) isWithinShootingDistance
{
    
    
    if ([[self team] getPlayingDirection] == 0) //up
    {
        CGPoint topGoalCenter = ccp(PITCH_X_CENTER,PITCH_TOP);
        if (ccpLengthSQ(ccpSub([self getSpritePosition], topGoalCenter)) < SHOT_DISTANCE)
            //if (ccpDistance([self getSpritePosition], topGoalCenter) < 200)
            
        /*|| ([self getSpritePosition].y >= 650))*/
            return true;
        else
            return false;
    }
    else
    {
        CGPoint bottomGoalCenter = ccp(PITCH_X_CENTER,PITCH_BOTTOM);
        if (ccpLengthSQ(ccpSub([self getSpritePosition], bottomGoalCenter)) < SHOT_DISTANCE)
            //if (ccpDistance([self getSpritePosition], bottomGoalCenter) < 250)
            
        /*|| ([self getSpritePosition].y <= 50)) */
            
            return true;
        else
            return false;
    }
}

-(void) doSlide
{
    isSliding = true;
    slidingCounter = 0;
}

-(void) doSlideSound {
    
    if ([Util random1inX:5]) {
        if ([Util random5050]) {
            [self playSoundEffect:SLIDE_CLEAN];
        }
        else {
            [self playSoundEffect:SLIDE_DIRTY];
        }
    }
}

//
-(void) doHumanSwipeSlide:(CGPoint)swipeVec
{
    if (!self.ballJustKicked && !passJustMade && !isDoingSlide && !isCantSlideActivated)
    {
        isDoingSlide=true;
        doSlideTimer=0;
        [self doSlideSound];
        slideVec=ccpNormalize(swipeVec);
    }
}

//
-(void) doHumanSlide
{
     if (!self.ballJustKicked && !passJustMade && !isDoingSlide && !isCantSlideActivated)
    {
        isDoingSlide=true;
        doSlideTimer=0;
        [self doSlideSound];
        slideVec=ccpForAngle(-CC_DEGREES_TO_RADIANS(self.sprite.rotation+25)+90);;
    }
}

//
-(bool) isPlayerFacingGoal
{
    CGPoint facing = ccpForAngle(-CC_DEGREES_TO_RADIANS(self.sprite.rotation)+90);
    
    if ([[self team] getPlayingDirection] == 0) //up
    {
        //if (self.vector.y > 0)
        if (facing.y > 0)
            return true;
        else
            return false;
    }
    else
    {
        if (facing.y < 0)
            return true;
        else
            return false;
    }
}

//
-(bool)isFutureCollision:(CGPoint)moveVec
{
    // check if the position the player is going to go to will collide with an opposing or team mate
    
    
    CGPoint futurePos = ccpAdd([self getSpritePosition],moveVec);
    
    for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
    {
        if ([self isPlayerCollision:oppPlayer FuturePos:&futurePos])
            return true;
    }
    
    //    for (Player * teamPlayer in [[self team] getPlayers])
    //    {
    //        if ([self getPlayerId] != [teamPlayer getPlayerId])
    //        {
    //
    //            if ([self isPlayerCollision:teamPlayer FuturePos:&futurePos])
    //                return true;
    //        }
    //    }
    return false;
    
}

//
-(bool) isPlayerCollision:(Player *)otherPlayer FuturePos:(CGPoint *)futurePos
{
    if (ccpLengthSQ(ccpSub(*futurePos, [otherPlayer getSpritePosition])) <= 20.0)
        return true;
    
    return false;
}


-(bool) isInDefenseZone :(int) pos :(enum teamCurrentDirection) dir
{
    if (dir == SHOOTING_UP)
        return [self getCurrentPositionZoneShootingUp:pos] == ZONE_DEFENSE;
    else
        return [self getCurrentPositionZoneShootingDown:pos] == ZONE_DEFENSE;
}

-(bool) isInMidfieldDefenseZone :(int) pos :(enum teamCurrentDirection) dir
{
    if (dir == SHOOTING_UP)
        return [self getCurrentPositionZoneShootingUp:pos] == ZONE_MIDFIELD_DEFENSE;
    else
        return [self getCurrentPositionZoneShootingDown:pos] == ZONE_MIDFIELD_DEFENSE;
}

-(bool) isInMidfieldAttackZone :(int) pos :(enum teamCurrentDirection) dir
{
    if (dir == SHOOTING_UP)
        return [self getCurrentPositionZoneShootingUp:pos] == ZONE_MIDFIELD_ATTACK;
    else
        return [self getCurrentPositionZoneShootingDown:pos] == ZONE_MIDFIELD_ATTACK;
}

-(bool) isInAttackZone :(int) pos :(enum teamCurrentDirection) dir
{
    if (dir == SHOOTING_UP)
        return [self getCurrentPositionZoneShootingUp:pos] == ZONE_ATTACK;
    else
        return [self getCurrentPositionZoneShootingDown:pos] == ZONE_ATTACK;
}



//
-(enum pitchZone) getCurrentPositionZoneShootingUp:(int) pos
{
    //TODO - do this once in config/setup
    int pitchLength = PITCH_TOP - PITCH_BOTTOM;
    int zoneSegmentSize = pitchLength / 4;
    
    //shooting up
    int defenseZone = PITCH_BOTTOM + ( zoneSegmentSize  * 1);
    int midfieldDefensiveZone = PITCH_BOTTOM + ( zoneSegmentSize  * 2);
    int midfieldAttackingZone = PITCH_BOTTOM + ( zoneSegmentSize  * 3);
    //int attackZone = PITCH_BOTTOM + ( zoneSegmentSize  * 4);
    
    if (pos < defenseZone)
    {
        return ZONE_DEFENSE;
    }
    else if (pos < midfieldDefensiveZone)
    {
        return ZONE_MIDFIELD_DEFENSE;
    }
    else if (pos < midfieldAttackingZone)
    {
        return ZONE_MIDFIELD_ATTACK;
    }
    else
    {
        return ZONE_ATTACK;
    }
}

//
-(enum pitchZone) getCurrentPositionZoneShootingDown:(int) pos
{
    //TODO - do this once in config/setup
    int pitchLength = PITCH_TOP - PITCH_BOTTOM;
    int zoneSegmentSize = pitchLength / 4;
    
    //shooting up
    //    int defenseZone = PITCH_BOTTOM + ( zoneSegmentSize  * 1);
    //    int midfieldDefensiveZone = PITCH_BOTTOM + ( zoneSegmentSize  * 2);
    //    int midfieldAttackingZone = PITCH_BOTTOM + ( zoneSegmentSize  * 3);
    //    int attackingZone = PITCH_BOTTOM + ( zoneSegmentSize  * 4);
    //
    
    // shootingDown
    //int defenseZone = PITCH_BOTTOM + ( zoneSegmentSize  * 4);
    int midfieldDefensiveZone = PITCH_BOTTOM + ( zoneSegmentSize  * 3);
    int midfieldAttackingZone = PITCH_BOTTOM + ( zoneSegmentSize  * 2);
    int attackZone = PITCH_BOTTOM + ( zoneSegmentSize  * 1);
    
    
    if (pos < attackZone)
    {
        return ZONE_ATTACK;
    }
    else if (pos < midfieldAttackingZone)
    {
        return ZONE_MIDFIELD_ATTACK;
    }
    else if (pos < midfieldDefensiveZone)
    {
        return ZONE_MIDFIELD_DEFENSE;
    }
    else
    {
        return ZONE_DEFENSE;
    }
}

//
-(CGFloat) getInitialRotateDirection : (CGPoint)newTargetVec : (CGPoint)currentVec
{
    
    CGFloat angle = ccpDot(ccpNormalize(newTargetVec), ccpNormalize(currentVec));
    CCLOG(@">> initial rotate diff in angle = %f", angle);
    return angle;
}

//
-(void) avoidAllPlayers
{
    
    //CGPoint targetVec;
    CGPoint desiredVector = ccp(0,0);
    int playerAheadDir = 0;
    int desiredPlayerAheadDir = 0;
    int rotateAngle = PLAYER_ROTATION_ANGLE;
    
    if (ccpLength(self.vector) < 1)
        return;
    
    
    targetVec = ccpNormalize((ccpSub(targetPos, [self getSpritePosition])));
    
    //TODO: make player turn to target vector - copy prefered turn direction code - put into seperate functionf or resuse
    
    // is current vec same as target vec
   
    if (ccpFuzzyEqual(ccpNormalize(targetVec), ccpNormalize(self.vector), 0.15))
    {
        //printf("\n*** Vectors equal ***-->");
        playerAheadDir = [self checkIfAnyPlayerAhead:self.vector];
        
        // if can go straight ahead the go straight ahead
        if (playerAheadDir == NO_PLAYER_AHEAD)
        {
            targetVec = self.vector;
            [self setVector:targetVec];
        }
        else
        {
            //TODO: calculate avoid angle based on proximity
            [self avoidPlayer : AVOID_PLAYER_BIGGER_ANGLE:playerAheadDir];
        }
    }
    else
    {
        //CCLOG(@">> get turn angle diff ");
        
        
        // can we turn towards target vector
        if ([self getClosestDirectionToRotate:targetVec :self.vector :3] == TURN_RIGHT) //10 //CHANGED
        {
            // player turned right originally, we want to turn left
            // get current vector - 45 degrees.
            //CCLOG(@">>> >>>Vector: can go- rotate left ***-->");
            desiredVector = [self rotateVector:self.vector Angle:-rotateAngle];
        }
        else
        {
            //CCLOG(@">>> >>>Vector: can go- rotate right ***-->");
            desiredVector = [self rotateVector:self.vector Angle:rotateAngle];
        }
        
        desiredPlayerAheadDir = [self checkIfAnyPlayerAhead:desiredVector];
        
        // check the direction we wish to turn to first
        
        if (desiredPlayerAheadDir == NO_PLAYER_AHEAD)
        {
            // we can move to the desired vector
            // back toward our target vector
            targetVec = desiredVector;
            targetVec = ccpMult(targetVec, 50.0);
            [self setVector:targetVec];
        }
        else
        {
            // can we at least continue on our current vector
            playerAheadDir = [self checkIfAnyPlayerAhead:self.vector];
            
            // if can go straight ahead the go straight ahead
            if (playerAheadDir == NO_PLAYER_AHEAD)
            {
                targetVec = self.vector;
                [self setVector:targetVec];
            }
            else
            {
                [self avoidAnyPlayer : AVOID_ANY_PLAYER_ROTATION_ANGLE : playerAheadDir];
            }
        }
    }
    self.sprite.rotation  = -CC_RADIANS_TO_DEGREES(ccpToAngle(targetVec))+90;
}


//
-(void) avoidAllPlayersOld
{
    /*
     
     get all the players - team mates and oppTeam
     order by distance
     getClosestPlayer in FOV? or order by closestPlayer first
     (for now just get all players)
     Avoid
     
     */
    
    
    //CGPoint targetVec;
    CGPoint desiredVector = ccp(0,0);
    int playerAheadDir = 0;
    int desiredPlayerAheadDir = 0;
    int rotateAngle = 10.0;
    
    if (ccpLength(self.vector) < 1)
        return;
    
    
    targetVec = ccpNormalize((ccpSub(targetPos, [self getSpritePosition])));
    //targetVec = vector;
    
    if (ccpFuzzyEqual(ccpNormalize(targetVec), ccpNormalize(self.vector), 0.15))
    {
        //printf("\n*** Vectors equal ***-->");
        
        playerAheadDir = [self checkIfAnyPlayerAhead:self.vector];
        
        
        
        // if can go straight ahead the go straight ahead
        if (playerAheadDir == NO_PLAYER_AHEAD)
        {
            
            //  //printf("\n*** Vector: can go ahead ***-->");
            // carry on same vector
            targetVec = self.vector;
            [self setVector:targetVec];
        }
        else
        {
            
            Player *oppPlayerAhead = [self checkIfAnyPlayerAheadDistance:self.vector];
            //float distanceOppPlayer = ccpLengthSQ(ccpSub([oppPlayerAhead getSpritePosition], [self getSpritePosition]));
            //float distanceOppPlayer = ccpDistance([oppPlayerAhead getSpritePosition], [oppPlayerAhead] );
            float distanceOppPlayer = ccpDistance([oppPlayerAhead position], [self position]);
            
            
            //            if(self.playerId == [[self team] getMainPlayer] playerId)
            //            {
            //                [[[SceneManager sharedSceneManager] gameLayer]
            //                 drawLineWithTag:position :[oppPlayerAhead position] :1 :500+self.playerId];
            //
            //            }
            //            if([self isActivePlayer])
            //            {
            //                [[[SceneManager sharedSceneManager] gameLayer]
            //                 drawLineWithTag:self.position :ccpAdd( self.position , targetVec) :1 :601+[self getTeamId]];
            //            }
            //rotateAngle= (51.0-distanceOppPlayer)*1.5;
            
            rotateAngle = (100 - distanceOppPlayer)/2;
            
            //            rotateAngle =100 - distanceOppPlayer;
            //            if (rotateAngle > 45)
            //            {
            //                rotateAngle=45;
            //            }
            //rotateAngle= 45.0;
            ////printf("\n ** Distance to oppPlayer = %f, rotateAngle = %d", distanceOppPlayer, rotateAngle);
            
            // else rotate
            if (playerAheadDir < 0)
            {
                // player to the left, so turn right
                //  //printf("\n*** Vector: can go- rotate right ***-->");
                
                targetVec = [self rotateVector:self.vector Angle:rotateAngle];
                targetVec = ccpMult(targetVec, 50.0);
                [self setVector:targetVec];
                rotateDir=1;
                actionCount=490;
            }
            else
            {
                // player to the right, so turn left
                //   //printf("\n*** Vector: can go- rotate left ***-->");
                
                targetVec = [self rotateVector:self.vector Angle:-rotateAngle];
                targetVec = ccpMult(targetVec, 50.0);
                [self setVector:targetVec];
                rotateDir=-1;
                actionCount=490;
                
            }
            //if(self.playerId == [[self team] getMainPlayer] playerId)
            //            if([self isActivePlayer])
            //            {
            //                [[[SceneManager sharedSceneManager] gameLayer]
            //                    drawLineWithTag:self.position :ccpAdd( self.position , targetVec) :1 :600+[self getTeamId]];
            //            }
            
            
        }
    }
    else
    {
        if(self.playerId == 5)
        {
            //CCLOG(@">>>> Vectors not equal *** ");
        }
        
        
        // can we turn towards target vector
        if (rotateDir == 1) {
            // player turned right originally, we want to turn left
            // get current vector - 45 degrees.
            
            desiredVector = [self rotateVector:self.vector Angle:-rotateAngle];
            //            if(self.playerId == 5)
            //             CCLOG(@"*** Desired Vector : turn left (-45) *** ");
        }
        else
        {
            desiredVector = [self rotateVector:self.vector Angle:rotateAngle];
            //            if(self.playerId == 5)
            //            CCLOG(@"*** Desired Vector : turn right (+45) *** ");
            
            
        }
        // //printf("\n*** Desired Vector : equals %f,%f", desiredVector.x, desiredVector.y);
        
        // the feeler vector is the desiredVector
        desiredPlayerAheadDir = [self checkIfOppPlayerAhead:desiredVector];
        
        // check the direction we wish to turn to first
        
        if (desiredPlayerAheadDir == NO_PLAYER_AHEAD)
        {
            // we can move to the desired vector
            //printf("\n *** Can move desired Vector... turn to desired Vector");
            
            targetVec = desiredVector;
            targetVec = ccpMult(targetVec, 60.0);
            [self setVector:targetVec];
        }
        else
        {
            //
            playerAheadDir = [self checkIfAnyPlayerAhead:self.vector];
            
            // if can go straight ahead the go straight ahead
            if (playerAheadDir == NO_PLAYER_AHEAD)
            {
                
                // //printf("\n*** Vector: can go ahead ***-->");
                // carry on same vector
                targetVec = self.vector;
                [self setVector:targetVec];
            }
            else
            {
                //
                Player *oppPlayerAhead = [self checkIfAnyPlayerAheadDistance:self.vector];
                //float distanceOppPlayer = ccpLengthSQ(ccpSub([oppPlayerAhead getSpritePosition], [self getSpritePosition]));
                //float distanceOppPlayer = ccpDistance([oppPlayerAhead getSpritePosition], [self getSpritePosition]);
                float distanceOppPlayer = ccpDistance([oppPlayerAhead position], [self position]);
                
                
                
                //rotateAngle= (51.0-distanceOppPlayer)*1.5;
                //rotateAngle= (51.0-distanceOppPlayer)*1.5;
                
                rotateAngle = (100 - distanceOppPlayer)/2;
                //                if (rotateAngle > 45)
                //                {
                //                    rotateAngle=45;
                //                }
                
                //rotateAngle= 45.0;
                
                // //printf("\n ** Distance to oppPlayer = %f, rotateAngle = %d", distanceOppPlayer, rotateAngle);
                
                // else rotate
                if (playerAheadDir < 0)
                {
                    // player to the left, so turn right
                    //printf("\n*** Vector: can go- rotate right ***-->");
                    
                    targetVec = [self rotateVector:self.vector Angle:rotateAngle];
                    targetVec = ccpMult(targetVec, 50.0);
                    [self setVector:targetVec];
                    rotateDir=1;
                    actionCount=490;
                }
                else
                {
                    // player to the right, so turn left
                    ////printf("\n*** Vector: can go- rotate left ***-->");
                    
                    targetVec = [self rotateVector:self.vector Angle:-rotateAngle];
                    targetVec = ccpMult(targetVec, 50.0);
                    [self setVector:targetVec];
                    rotateDir=-1;
                    actionCount=490;
                    
                }
                
            }
            //
            
            
            
            // we cant turn, keep going
            ////printf("\n *** Cant turn to desired vector, keep going same direction");
            //targetVec = vector;
            //targetVec = ccpMult(targetVec, 5.0);
            //[self setVector:targetVec];
            
        }
    }
    
    self.sprite.rotation  = -CC_RADIANS_TO_DEGREES(ccpToAngle(targetVec))+90;
    
}

//
-(float) getDegreesAngle:(float)radianDegrees
{
    if (radianDegrees == 0 || (radianDegrees > 0 && radianDegrees < 270))
        return radianDegrees;
    
    return (360 + radianDegrees);
}

//
-(void) whatAngleIsCloser : (float)targetAngle :(float)angle1 :(float)angle2
{
    //     0
    // 270     120
    //360 - 270 = 90
    //360 - 120 = 240
    
    // ----
    
    // target is    180
    //           300    90
    
    
    // bring target angle upto 360 :
    //----------------
    
}


//
-(int) getClosestDirectionToRotate:(CGPoint)targetVector : (CGPoint)startVector : (CGFloat)angle
{
    int turnLeftRotations =0;
    int turnRightRotations = 0;
    
    turnLeftRotations = [self getNumRotationsToVector : targetVector:startVector:-angle];
    turnRightRotations = [self getNumRotationsToVector : targetVector:startVector:angle];
    
    //CCLOG(@">> targetVec : %f,%f  startVec : %f,%f  angle %f - leftRotations : %d, rightRotations : %d",
    //      targetVector.x, targetVector.y, startVector.x, startVector.y, angle, turnLeftRotations, turnRightRotations);
    
    if (turnLeftRotations == turnRightRotations)
    {
        //CCLOG(@">> TURN LEFT or RIGHT");
        int result = [Util random:2] == 0 ? -1 : 1;
        //CCLOG(@" >> Result : %d", result);
        
        return result;
        //return ([Util random:2] == 0 ? -1 : 1);
    }
    else if (turnLeftRotations < turnRightRotations)
    {
        //CCLOG(@">> TURN LEFT");
        return TURN_RIGHT;
    }
    else
    {
        //CCLOG(@">> TURN RIGHT");
        return TURN_LEFT;
    }
}


//
-(int) getNumRotationsToVector:(CGPoint)targetVector : (CGPoint)startVector : (CGFloat)angle
{
    //CCLOG(@">> getNumRotationsToVector Angle: %f",angle);
    // if equals return 0;
    if (ccpFuzzyEqual(ccpNormalize(targetVector), ccpNormalize(startVector), 0.1)) {
        return 0;
    }
    
    CGPoint currentRotatedVector=startVector;
    int maxRotations = 360/fabs(angle);
    // CCLOG(@">> MAx rotations: %d", maxRotations);
    int i=1;
    
    for (; i< maxRotations; i++)
    {
        currentRotatedVector = [self rotateVector:currentRotatedVector Angle:angle];
        if (ccpFuzzyEqual(ccpNormalize(targetVector), ccpNormalize(currentRotatedVector), 0.1))
        {
            return i;
        }
    }
    return i;
}


//
-(void) testRotate
{
    // test if we have a target vector - if we can see what direction rotated is the shortest angle to turn
    CGPoint tVec = ccp(0,1);
    CGPoint vec1 = ccp(1,1);
    CGPoint vec2 = ccp(-1,1);
    CGPoint vec3 = ccp(-0.1,1);
    
    
    float targetAngle = -CC_RADIANS_TO_DEGREES( ccpToAngle(tVec));
    float angle1 = -CC_RADIANS_TO_DEGREES( ccpToAngle(vec1));
    float angle2 = -CC_RADIANS_TO_DEGREES( ccpToAngle(vec2));
    float angle3 = -CC_RADIANS_TO_DEGREES( ccpToAngle(vec3));
    
    
    CCLOG(@">> Target Angle : %f", targetAngle);  //0
    CCLOG(@">> Angle 1: %f", angle1);             //90
    CCLOG(@">> Angle 2: %f", angle2);            //-90
    CCLOG(@">> Angle 3: %f", angle3);            //-90
    
    
    CCLOG(@">>> My normal target angle : %f ", [self getDegreesAngle:targetAngle]);
    CCLOG(@">>> My normal angle 1 : %f ", [self getDegreesAngle:angle1]);
    CCLOG(@">>> My normal angle 2: %f ", [self getDegreesAngle:angle2]);
    CCLOG(@">>> My normal angle 3: %f ", [self getDegreesAngle:angle3]);
    
    CCLOG(@">>> Dot Product 1: %f ", ccpDot(tVec,vec1));
    CCLOG(@">>> Dot Product 2: %f ", ccpDot(tVec,vec2));
    
    //ccp
    
    [self getClosestDirectionToRotate:tVec:vec1:5];
    //[self getClosestDirectionToRotate:tVec:vec2:5];
    
    
    
    
    float diff1 = [self getInitialRotateDirection:tVec :vec1];
    float diff2 = [self getInitialRotateDirection:tVec :vec2];
    
    CCLOG(@">> Diff - Angle 1: %f", diff1);
    CCLOG(@">> Diff - Angle 2: %f", diff2);
    
//    for (int i=0; i < 360; i++)
//    {
//        // CCLOG(@"%d : %f",i, CC_DEGREES_TO_RADIANS(i));
//    }
    
    
}


//
-(void) avoidAnyPlayer:(CGFloat)rotateAngle : (int)playerAheadDir
{

    if (playerAheadDir < NO_PLAYER_AHEAD)
    {
        // player to the left, so turn right
        targetVec = [self rotateVector:self.vector Angle:rotateAngle];
        targetVec = ccpMult(targetVec, self.speed);
        [self setVector:targetVec];
    }
    else
    {
        // player to the right, so turn left
        targetVec = [self rotateVector:self.vector Angle:-rotateAngle];
        targetVec = ccpMult(targetVec, self.speed);
        [self setVector:targetVec];
    }
}


//
-(void) avoidPlayer:(CGFloat)rotateAngle : (int)playerAheadDir
{

    if (playerAheadDir < NO_PLAYER_AHEAD) // 0
    {
        // player to the left, so turn right
        targetVec = [self rotateVector:self.vector Angle:rotateAngle];
        //CHANGED
        //targetVec = ccpMult(targetVec, self.speed*1.5);
        targetVec = ccpMult(targetVec, self.speed);
        
        [self setVector:targetVec];
    }
    else
    {
        // player to the right, so turn left
        targetVec = [self rotateVector:self.vector Angle:-rotateAngle];
        //CHANGED
        targetVec = ccpMult(targetVec, self.speed);
        [self setVector:targetVec];
    }
}


//
-(void)doAiNewOld:(Ball *)ball
{
    
    //CGPoint targetVec;
    CGPoint desiredVector = ccp(0,0);
    int playerAheadDir = 0;
    int desiredPlayerAheadDir = 0;
    
    if ([[self team] getPlayingDirection] == 0)
    {
        // up
        //targetVec= ccp(0,1);
        targetVec = ccpNormalize((ccpSub(TOP_GOAL_CENTER_POS, [self getSpritePosition])));
    }
    else
    {
        //targetVec = ccp(0,-1);
        targetVec = ccpNormalize((ccpSub(BOTTOM_GOAL_CENTER_POS, [self getSpritePosition])));
    }
    
    //TODO: make player turn to target vector - copy prefered turn direction code - put into seperate functionf or resuse
    //    if (firstTouch)
    //    {
    //        targetVec = ccpMult(targetVec, self.speed);
    //        [self setVector:targetVec];
    //        spriteRotation = -CC_RADIANS_TO_DEGREES(ccpToAngle(targetVec))+90;
    //        return;
    //    }
    
    // is current vec same as target vec
    // if (vector.x = targetVec.x && vector.y = targetVec.y)
    //   //printf("\n*** targetVec = %f,%f  currentVec =%f,%f", targetVec.x,targetVec.y, vector.x, vector.y);
    if (ccpFuzzyEqual(ccpNormalize(targetVec), ccpNormalize(self.vector), 0.15))
    {
        //printf("\n*** Vectors equal ***-->");
        //rotateDir=0;
        playerAheadDir = [self checkIfOppPlayerAhead:self.vector];
        
        // if can go straight ahead the go straight ahead
        if (playerAheadDir == NO_PLAYER_AHEAD)
        {
            targetVec = self.vector;
            [self setVector:targetVec];
            //rotateDir=0;
        }
        else
        {
            [self avoidPlayer:AVOID_PLAYER_ANGLE:playerAheadDir];
        }
    }
    else
    {
        
        
        //ction we wish to turn to first
        
        if (desiredPlayerAheadDir == NO_PLAYER_AHEAD)
        {
            // we can move to the desired vector
            // back toward our target vector
            targetVec = desiredVector;
            targetVec = ccpMult(targetVec, self.speed);
            [self setVector:targetVec];
        }
        else
        {
            // can we at least continue on our current vector
            playerAheadDir = [self checkIfOppPlayerAhead:self.vector];
            
            // if can go straight ahead the go straight ahead
            if (playerAheadDir == NO_PLAYER_AHEAD)
            {
                targetVec = self.vector;
                [self setVector:targetVec];
            }
            else
            {
                [self avoidPlayer: AVOID_PLAYER_ANGLE :playerAheadDir];
            }
        }
    }
    
    
    self.sprite.rotation  = -CC_RADIANS_TO_DEGREES(ccpToAngle(targetVec))+90;
}


//
-(int) getVariedXTargetPos {
    
    int xRange = 50;
    int randomX = [Util random:xRange];
    int xPos = (self.position.x-(xRange/2))+randomX;
    
    if (xPos < PITCH_LEFT) {
        xPos=PITCH_LEFT;
    }
    else if ( xPos > PITCH_RIGHT) {
        xPos=PITCH_RIGHT;
    }
    
    return xPos;
}

////
-(CGPoint) getVariedTargetVectorOriginal
{
    CGPoint tPos;
    CGPoint tVec;
    int randomXPos = [Util random:GOAL_WIDTH/2];  //50
    
    if (self.position.x < PITCH_X_CENTER)
    {
        randomXPos=-randomXPos;
    }
    
    // if in attacking area, target it the goal
    // if in defensive side of pitch, we dont want to head directly to the goal yet
    if ([self isInAttackingHalf] && [Util random1inX:10]) {
        if ([[self team] getPlayingDirection] == 0)
        {
            //targetVec= ccp(0,1);
            tPos = ccp(PITCH_X_CENTER+randomXPos, PITCH_TOP);
            tVec = ccpNormalize((ccpSub(tPos, [self getSpritePosition])));
        }
        else
        {
            //targetVec = ccp(0,-1);
            tPos = ccp(PITCH_X_CENTER+randomXPos, PITCH_BOTTOM);
            tVec = ccpNormalize((ccpSub(tPos, [self getSpritePosition])));
        }
    }
    else {
        if ([[self team] getPlayingDirection] == 0)
        {
            //targetVec= ccp(0,1);
            tPos = ccp([self getVariedXTargetPos], PITCH_TOP);
            tVec = ccpNormalize((ccpSub(tPos, [self getSpritePosition])));
        }
        else
        {
            //targetVec = ccp(0,-1);
            tPos = ccp([self getVariedXTargetPos], PITCH_BOTTOM);
            tVec = ccpNormalize((ccpSub(tPos, [self getSpritePosition])));
        }
    }
    return tVec;
}


-(CGPoint) getGoTowardsGoalVec {

    CGPoint tPos;
    CGPoint tVec;
  
    int randomXPos = [Util random:GOAL_WIDTH/2];  //50
    
    if (self.position.x < PITCH_X_CENTER)
    {
        randomXPos=-randomXPos;
    }

    
    if ([[self team] getPlayingDirection] == 0)
    {
        //targetVec= ccp(0,1);
        tPos = ccp(PITCH_X_CENTER+randomXPos, PITCH_TOP);
        tVec = ccpNormalize((ccpSub(tPos, [self getSpritePosition])));
    }
    else
    {
        //targetVec = ccp(0,-1);
        tPos = ccp(PITCH_X_CENTER+randomXPos, PITCH_BOTTOM);
        tVec = ccpNormalize((ccpSub(tPos, [self getSpritePosition])));
    }
    
    return tVec;

}


-(CGPoint) getGoDownWingVec {
    
    CGPoint tPos;
    CGPoint tVec;

    if ([[self team] getPlayingDirection] == 0)
    {
        //targetVec= ccp(0,1);
        tPos = ccp([self getVariedXTargetPos], PITCH_TOP);
        tVec = ccpNormalize((ccpSub(tPos, [self getSpritePosition])));
    }
    else
    {
        //targetVec = ccp(0,-1);
        tPos = ccp([self getVariedXTargetPos], PITCH_BOTTOM);
        tVec = ccpNormalize((ccpSub(tPos, [self getSpritePosition])));
    }
    return tVec;
}


-(bool) isByOpposingGoalLine {
    
    
    if ([[self team] isPlayingUpPitch])
    {
        if (self.position.y > (PITCH_TOP - PITCH_EDGE_BOUNDARY_DEPTH))
        {
            return true;
        
        }
    }
    else {
        if (self.position.y < (PITCH_BOTTOM + PITCH_EDGE_BOUNDARY_DEPTH))
        {
            return true;
        }
    }
        
        return false;
}



//
-(CGPoint) getVariedTargetVector:(Ball *) ball
{
    CGPoint tPos;
    CGPoint tVec;
    int randomXPos = [Util random:GOAL_WIDTH/2];  //50
    
    
    
    // if wingPossessionId is same as ball possession (i.e same player has the ball
    // continue with what ever decision was previosuly made (need to save this possession somewhere)
    // else do random pick of what to do - save this choice as well as wingPossessionId
    
    if (self.position.x < PITCH_X_CENTER)
    {
        randomXPos=-randomXPos;
    }
    
    // if in attacking area, target it the goal
    // if in defensive side of pitch, we dont want to head directly to the goal yet
    if ([self isInAttackingHalf]) { // choose when
        
        //dont run into the wayy and keep going
        if ([self isByOpposingGoalLine] /*&& [Util random1inX:5]*/) {
            return [self getGoTowardsGoalVec];
        }
        
        if (self.runDownWingPossessionId == [ball possessionId]) {
            
            //same player still has the ball - continue with whatever he was doing before
            
            if (self.doWingPlay==ON) {
                //NSLog(@">>> (Continue)Wing play on - continue down wing..");

                return [self getGoDownWingVec];
            }
            else if (self.doWingPlay==OFF) {
                //NSLog(@">>> (continue) Towards Goal on - go towards goal..");

                return [self getGoTowardsGoalVec];
            } else {
                //NSLog(@">>> (continue) Staggered..");

                if ([Util random1inX:5]) {
                    return [self getGoTowardsGoalVec];
                } else {
                    return [self getGoDownWingVec];
                }
            }
        }
        else {
            // this is a new decision - wing or towards goal
            int choice = [Util random:3];
            
            if (choice==0) {
                [self setDoWingPlay:ON];
                //NSLog(@">>> new decision - go down wing..");
                self.runDownWingPossessionId=[ball possessionId];
                return [self getGoDownWingVec];


            } else if (choice==1) {
                //NSLog(@">>> new decision - go towards goal..");
                [self setDoWingPlay:OFF];
                self.runDownWingPossessionId=[ball possessionId];
                return [self getGoTowardsGoalVec];
            } else {
                // NSLog(@">>> new decision - staggered..");
                [self setDoWingPlay:STAGGERED];
                self.runDownWingPossessionId=[ball possessionId];

                if ([Util random1inX:5]) {
                     return [self getGoTowardsGoalVec];
                } else {
                     return [self getGoDownWingVec];
                }
            }
        }
        
    }
    else
    {
        if ([[self team] getPlayingDirection] == 0)
        {
            //targetVec= ccp(0,1);
            tPos = ccp([self getVariedXTargetPos], PITCH_TOP);
            tVec = ccpNormalize((ccpSub(tPos, [self getSpritePosition])));
        }
        else
        {
            //targetVec = ccp(0,-1);
            tPos = ccp([self getVariedXTargetPos], PITCH_BOTTOM);
            tVec = ccpNormalize((ccpSub(tPos, [self getSpritePosition])));
        }
    }
    return tVec;
}





//
-(void) drawVector :(CGPoint) vec : (CGPoint) pos  : (CCColor *) color : (id) tagName {
    
    [[[SceneManager sharedSceneManager] gameLayer]
        drawLineWithCustomTag :pos : ccpAdd(pos,vec) :tagName : color];

}


//
-(void)doAiNew:(Ball *)ball
{
    
    //CGPoint targetVec;
    CGPoint desiredVector = ccp(0,0);
    int playerAheadDir = 0;
    int desiredPlayerAheadDir = 0;
    int rotateAngle = PLAYER_ROTATION_ANGLE;
    
#ifdef DO_VARIED_TARGET_VECTOR
    targetVec = [self getVariedTargetVector:ball];
#else
    if ([[self team] getPlayingDirection] == PLAYING_UP)
    {
        // up
        //targetVec= ccp(0,1);
        if ([self isPlayerInCenterAreaOfPitch])
        {
            targetVec = ccpNormalize((ccpSub(TOP_GOAL_CENTER_POS, [self getSpritePosition])));
            //targetVec= ccp(0,1);
        }
        else if([self isInTnPositionToCross:ball])
        {
            targetVec = ccpNormalize((ccpSub(TOP_GOAL_CENTER_CROSS_POS, [self getSpritePosition])));
            //                if (self.vector.y>0) //if faceing towards goal (we only want to switch direction once)
            //                {
            //                    self.vector = ccp(self.vector.x,-self.vector.y);
            //                }
            
        }
        else
        {
            #ifdef WING_PLAY_ON
                //CCLOG(@">> On Wing - move straight");
                targetVec= ccp(0,1);
            #else
                targetVec = ccpNormalize((ccpSub(TOP_GOAL_CENTER_POS, [self getSpritePosition])));
            #endif
        }
    }
    else
    {
        //targetVec = ccp(0,-1);
        if ([self isPlayerInCenterAreaOfPitch] || [self isInTnPositionToCross:ball])
        {
            targetVec = ccpNormalize((ccpSub(BOTTOM_GOAL_CENTER_POS, [self getSpritePosition])));
            //targetVec= ccp(0,-1);
            
        }
        else if([self isInTnPositionToCross:ball])
        {
            targetVec = ccpNormalize((ccpSub(BOTTOM_GOAL_CENTER_CROSS_POS, [self getSpritePosition])));
            //                if (self.vector.y<0) //if faceing towards goal (we only want to switch direction once)
            //                {
            //                    self.vector = ccp(self.vector.x,-self.vector.y);
            //                }
        }
        else
        {
           
            #ifdef WING_PLAY_ON
                //CCLOG(@">> On Wing - move straight");
                targetVec= ccp(0,-1);
            #else
                targetVec = ccpNormalize((ccpSub(BOTTOM_GOAL_CENTER_POS, [self getSpritePosition])));
            #endif

        }
    }
#endif
    
#ifdef DRAW_PLAYER_TARGET_VECTORS
    [self drawVector  : ccpMult( targetVec,15.0) : self.position : [CCColor orangeColor] : @"targetVec"];
#endif
    
    // is current vec same as target vec
    if (ccpFuzzyEqual(ccpNormalize(targetVec), ccpNormalize(self.vector), 0.15))
    {
        //printf("\n*** Vectors equal ***-->");
        //rotateDir=0;
        playerAheadDir = [self checkIfOppPlayerAhead:self.vector];
        
        // if can go straight ahead the go straight ahead
        if (playerAheadDir == NO_PLAYER_AHEAD)
        {
            targetVec = self.vector;
            [self setVector:targetVec];
            //rotateDir=0;
        }
        else
        {
#ifdef DO_ALT_RUNCOLLIDE
            if (![self playerHasBall:ball] || [self playerHasBall:ball] && [self isBallCollision:ball])
            {
                [self avoidPlayer:AVOID_PLAYER_ANGLE:playerAheadDir];
            }
            else
            {
                targetVec = self.vector;
                [self setVector:targetVec];
            }
#else
            {
                //TODO check what this does - is it random skill change?
                if ([Util random:5]==0)
                {
                    self.vector = ccp(-self.vector.x,self.vector.y);
                }
                
                [self avoidPlayer:AVOID_PLAYER_ANGLE:playerAheadDir];
            }
#endif
        }
    }
    else
    {
        // can we turn towards target vector
        if ([self getClosestDirectionToRotate:targetVec :self.vector :5] == TURN_RIGHT)
        {
            // player turned right originally, we want to turn left
            // get current vector - 45 degrees.
            //CCLOG(@">>> >>>Vector: can go- rotate left ***-->");
            desiredVector = [self rotateVector:self.vector Angle:-rotateAngle];
        }
        else
        {
            //CCLOG(@">>> >>>Vector: can go- rotate right ***-->");
            desiredVector = [self rotateVector:self.vector Angle:rotateAngle];
        }
        
    #ifdef DRAW_PLAYER_TARGET_VECTORS
        [self drawVector  : ccpMult( desiredVector,15.0) : self.position : [CCColor redColor] : @"desireVec"];
    #endif
        
        //TODO est turning 90 degrees to mix it up
        //        if ([Util random:20] < 1)
        //        {
        //            if (self.vector.x < 0)
        //                desiredVector = [self rotateVector:self.vector Angle:90];
        //            else
        //                desiredVector = [self rotateVector:self.vector Angle:-90];
        //
        //
        //        }
        
        desiredPlayerAheadDir = [self checkIfOppPlayerAhead:desiredVector];
        
        // check the direction we wish to turn to first
        
        if (desiredPlayerAheadDir == NO_PLAYER_AHEAD)
        {
            // we can move to the desired vector
            // back toward our target vector
            targetVec = desiredVector;
            targetVec = ccpMult(targetVec, self.speed);
            [self setVector:targetVec];
        }
        else
        {
            // can we at least continue on our current vector
            playerAheadDir = [self checkIfOppPlayerAhead:self.vector];
            
            // if can go straight ahead the go straight ahead
            if (playerAheadDir == NO_PLAYER_AHEAD)
            {
                targetVec = self.vector;
                [self setVector:targetVec];
            }
            else
            {
#ifdef DO_ALT_RUNCOLLIDE
                if (![self playerHasBall:ball] || [self playerHasBall:ball] && [self isBallCollision:ball])
                {
                    [self avoidPlayer:AVOID_PLAYER_ANGLE:playerAheadDir];
                }
                else
                {
                    targetVec = self.vector;
                    [self setVector:targetVec];
                }
#else
                {
                    if ([Util random:5]==0) {
                        self.vector = ccp(-self.vector.x,self.vector.y);
                    }
                    
                    [self avoidPlayer:AVOID_PLAYER_ANGLE:playerAheadDir];
                }
#endif
            }
        }
    }
    self.sprite.rotation = -CC_RADIANS_TO_DEGREES(ccpToAngle(targetVec))+90;
}
//


//

//
// For now creturn player thats actually ahead - calculate disance in calling method
//

//TODO: get ALl players from both teams in order of closest first
-(Player *)checkIfOppPlayerAheadDistance:(CGPoint)feelVector
{
    for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
    {
        //TODO : get closest person
        if ([self isInNarrowFOV:ccpSub([oppPlayer getSpritePosition], [self getSpritePosition])])
        {
            //int pAheadDir = [self getPlayerAheadDirection:oppPlayer];
            int pAheadDir = [self isPlayerAheadAdvanced:oppPlayer Feeler:feelVector Length:FEELER_LENGTH]; // 50.0 CHANGED
            
            if (pAheadDir !=0)
            {
                return oppPlayer;
            }
        }
    }
    
#ifdef AVOID_TEAM_MATES

    for (Player * teamMate in [[self team] getPlayers])
    {
        //TODO : get closest person
        if ([self playerId] != [teamMate playerId] &&
            [self isInNarrowFOV:ccpSub([teamMate getSpritePosition], [self getSpritePosition])])
        {
            //int pAheadDir = [self getPlayerAheadDirection:oppPlayer];
            int pAheadDir = [self isPlayerAheadAdvanced:teamMate Feeler:feelVector Length:FEELER_LENGTH]; // 50.0 CHANGED
            
            if (pAheadDir !=0)
            {
                return teamMate;
            }
        }
    }
#endif    

    return nil;
}


-(bool) isInAttackingHalf {
    
    if ([[self team] isPlayingUpPitch]) {
        if (self.position.y > PITCH_Y_CENTER) {
            return true;
        } else {
            return false;
        }
    } else {
        if (self.position.y < PITCH_Y_CENTER) {
            return true;
        } else {
            return false;
        }
    }
    
    return false;
}


//
-(int) getOppostionPlayersAhead {
    int playersAhead =0;
    if ([[self team] isPlayingUpPitch]) {
       
        for (Player * oppPlayer in [[[self team] getOppTeam] getOutfieldPlayers])
        {
            if (oppPlayer.position.y > self.position.y) {
                playersAhead++;
            }
        }
        
    } else {
        for (Player * oppPlayer in [[[self team] getOppTeam] getOutfieldPlayers])
        {
            if (oppPlayer.position.y < self.position.y) {
                playersAhead++;
            }
        }
    }
    return playersAhead;
}


//
-(bool) areNoOppPlayersAhead {
    return ([self getOppostionPlayersAhead] == 0);
}


//
-(bool) isPlayerThroughOnGoal {
    
    bool inAttackingHalf=false;
    bool noOppositionPlayersAhead=false;
    
    // is in attacking half
    inAttackingHalf = [self isInAttackingHalf];
    
    // number of opposition players ahead
    noOppositionPlayersAhead= [self areNoOppPlayersAhead];

    return (inAttackingHalf && noOppositionPlayersAhead);
}

//
-(Player *)checkIfAnyPlayerAheadDistance:(CGPoint)feelVector
{
    for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
    {
        //TODO : get closest person
        if ([self isInNarrowFOV:ccpSub([oppPlayer getSpritePosition], [self getSpritePosition])])
        {
            //int pAheadDir = [self getPlayerAheadDirection:oppPlayer];
            int pAheadDir = [self isPlayerAheadAdvanced:oppPlayer Feeler:feelVector Length:FEELER_LENGTH]; // 50.0 CHANGED
            
            if (pAheadDir !=0)
            {
                return oppPlayer;
            }
        }
    }
    
#ifdef AVOID_TEAM_MATES
    
    //for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
    for (Player * teamMate in [[self team] getPlayers])
    {
        //TODO : get closest person
        if ([self playerId] != [teamMate playerId] &&
            [self isInNarrowFOV:ccpSub([teamMate getSpritePosition], [self getSpritePosition])])
        {
            //int pAheadDir = [self getPlayerAheadDirection:oppPlayer];
            int pAheadDir = [self isPlayerAheadAdvanced:teamMate Feeler:feelVector Length:FEELER_LENGTH]; // 50.0 CHANGED
            
            if (pAheadDir !=0)
            {
                return teamMate;
            }
        }
    }
#endif

    
    return nil;
}



//
-(bool)isOppPlayerAhead:(int)distance
{
    for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
    {
        //TODO : get closest person
        if ([self isInNarrowFOV:ccpSub([oppPlayer getSpritePosition], [self getSpritePosition])])
        {
            //int pAheadDir = [self getPlayerAheadDirection:oppPlayer];
            int pAheadDir = [self isPlayerAheadAdvanced:oppPlayer Feeler:self.vector Length:distance];
            
            if (pAheadDir !=0)
            {
                return true;
            }
        }
    }
    
    return false;
}
//
-(bool)isAnyPlayerAhead:(int)distance
{
    for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
    {
        //TODO : get closest person
        if ([self isInNarrowFOV:ccpSub([oppPlayer getSpritePosition], [self getSpritePosition])])
        {
            //int pAheadDir = [self getPlayerAheadDirection:oppPlayer];
            int pAheadDir = [self isPlayerAheadAdvanced:oppPlayer Feeler:self.vector Length:distance];
            
            if (pAheadDir !=0)
            {
                return true;
            }
        }
    }
    
#ifdef AVOID_TEAM_MATES
  
    // my team mates
    for (Player * teamMate in [[self team] getPlayers])
    {
        //TODO : get closest person
        if ([self playerId] != [teamMate playerId] &&
            [self isInNarrowFOV:ccpSub([teamMate getSpritePosition], [self getSpritePosition])])
        {
            //int pAheadDir = [self getPlayerAheadDirection:oppPlayer];
            int pAheadDir = [self isPlayerAheadAdvanced:teamMate Feeler:self.vector Length:distance];
            
            if (pAheadDir !=0)
            {
                return true;
            }
        }
    }
#endif
  
    
    
    return false;
}



//
-(int)checkIfOppPlayerAhead:(CGPoint)feelVector
{
    for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
    {
        
        if ((ccpDistance(self.position, oppPlayer.position) < OPP_PLAYER_AHEAD_CHECK_DISTANCE) && // CHANGED 100.0
            [self isInNarrowFOV:ccpSub([oppPlayer getSpritePosition], [self getSpritePosition])])
        {
            //int pAheadDir = [self getPlayerAheadDirection:oppPlayer];
            int pAheadDir = [self isPlayerAheadAdvanced:oppPlayer Feeler:feelVector Length:FEELER_LENGTH]; // 50.0 CHANGED
            
            if (pAheadDir !=0)
            {
                if (pAheadDir<0)
                {
                    //printf("\n***--->>>>>>>*TURN RIGHT");
                    return TURN_RIGHT;
                }
                else
                {
                    //printf("\n***--->>>>>>>*TURN LEFT");
                    return TURN_LEFT;
                }
            }
        }
    }
    return NO_PLAYER_AHEAD;
}

//
-(int)checkIfAnyPlayerAhead:(CGPoint)feelVector
{
    for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
    {
        if ((ccpDistance(self.position, oppPlayer.position) < OPP_PLAYER_AHEAD_CHECK_DISTANCE) && // CHANGED 75.0
            [self isInNarrowFOV:ccpSub([oppPlayer getSpritePosition], [self getSpritePosition])])
        {
            int pAheadDir = [self isPlayerAheadAdvanced:oppPlayer Feeler:feelVector Length:FEELER_LENGTH]; // CHANGED 50.0
            
            if (pAheadDir !=0)
            {
                if (pAheadDir<0)
                {
                    return TURN_RIGHT;
                }
                else
                {
                    return TURN_LEFT;
                }
            }
        }
    }
    
    //my team
    //for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
    
    #ifdef AVOID_TEAM_MATES
    for (Player * teamMate in [[self team] getPlayers])
    {
        if ([self playerId] != [teamMate playerId]
            && (ccpDistance(self.position, teamMate.position) < OPP_PLAYER_AHEAD_CHECK_DISTANCE)  // CHANGED 100.0
            && [self isInNarrowFOV:ccpSub([teamMate getSpritePosition], [self getSpritePosition])])
        {
            int pAheadDir = [self isPlayerAheadAdvanced:teamMate Feeler:feelVector Length:FEELER_LENGTH]; // CHANGED 50.0
            
            if (pAheadDir !=0)
            {
                if (pAheadDir < 0)
                {
                    return TURN_RIGHT;
                }
                else
                {
                    return TURN_LEFT;
                }
            }
        }
    }
    #endif
    
    return NO_PLAYER_AHEAD;
}

//
-(int) getTeamId
{
    return [[self team] getTeamId];
}




-(CGPoint) doRotate:(CGFloat)currAngle Angle:(float)theta
{
    CGFloat currentAngle = currAngle;
    CGFloat newAngle;
    
    //    if (currAngle < 0) {
    //        newAngle = 360 - currAngle;
    //    }
    //    else
    //    {
    //        newAngle =currentAngle+ theta;
    //    }
    //
    //    if (newAngle > 360)
    //    {
    //        newAngle = newAngle - 360;
    //
    //    }
    newAngle = currentAngle + theta;
    
    // pVector = ccpForAngle(-CC_DEGREES_TO_RADIANS(spriteRotation)+90);
    
    
    CGPoint newVec = ccpForAngle(CC_DEGREES_TO_RADIANS(newAngle));
    return newVec;
    
    
}
-(CGPoint) doRotateOld:(CGFloat)currAngle Angle:(float)theta
{
    CGFloat currentAngle = currAngle;
    CGFloat newAngle =currentAngle+ theta;
    
    if (newAngle > 360)
    {
        newAngle = newAngle - 360;
        
    }
    
    CGPoint newVec = ccpForAngle(CC_DEGREES_TO_RADIANS(newAngle));
    return newVec;
    
    
}

////
//-(CGPoint) rotateVector:(CGPoint)vec Angle:(float)theta
//{
//    CGPoint newVec;
//    float angle = -CC_RADIANS_TO_DEGREES( ccpToAngle(vec) );
//    angle += theta;
//    newVec = ccpForAngle(-CC_DEGREES_TO_RADIANS(angle));
//    return newVec;
//}

//
-(bool)isPlayerAhead:(Player *)player
{
    CGPoint toOppPlayerVec;
    CGPoint feelerVecProj;
    CGPoint oppFeelerDiffVec;
    CGPoint feelerVec;
    CGPoint feelerVecNorm;
    
    feelerVec = self.vector;
    feelerVecNorm = ccpNormalize(feelerVec); // u
    feelerVec = ccpMult(feelerVecNorm, 60.0);
    
    
    toOppPlayerVec = ccpSub([player position], [self position]); // a
    
    // project toOppPlayerVec to feelerVec
    feelerVecProj = ccpMult (feelerVecNorm, ccpDot(toOppPlayerVec, feelerVecNorm)) ; // p
    
    // get distance between feeler vec and toOppPlayerVec
    oppFeelerDiffVec = ccpSub( feelerVecProj, toOppPlayerVec); // b
    
    
    
    ////
    //    feelerVecNorm = ccpNormalize(feelerVec);    // u
    //    feelerVec = ccpMult(feelerVecNorm, 39.0);
    //
    //    toOppPlayerVec = ccpSub(player, activePlayerPos); // a =
    //
    //    // project toOppPlayerVec to feelerVec
    //    feelerVecProj = ccpMult (feelerVecNorm, ccpDot(toOppPlayerVec, feelerVecNorm)) ; // p =
    //
    //    // get distance between feeler vec and toOppPlayerVec
    //    oppFeelerDiffVec = ccpSub( feelerVecProj, toOppPlayerVec); // b
    
    
    //printf("** b diff = %f", ccpLength(oppFeelerDiffVec));
    
    ////
    CGPoint fovVec;
    if ((ccpLength(oppFeelerDiffVec) < 20) && (ccpLength(feelerVecProj) < ccpLength(feelerVec)))
    {
        //printf("\n ** PLAYER IS AHEAD ***");
        fovVec = [self getFOV: [player getSpritePosition]];
        
        if (fovVec.x < 0)
        {
            // [self setPositionX:475 Y:[self getSpritePosition].y];
            //printf("\n*** -----> To the left ***");
        }
        else
        {
            // [self setPositionX:5 Y:[self getSpritePosition].y];
            //printf("\n*** -----> To the right ***");
            
        }
        return true;
    }
    return false;
    
}




//
-(int)isPlayerAheadAdvanced:(Player *)player Feeler:(CGPoint)feelVector Length:(CGFloat)feelLength
{
    CGPoint toOppPlayerVec;
    CGPoint feelerVecProj;
    CGPoint oppFeelerDiffVec;
    CGPoint feelerVec;
    CGPoint feelerVecNorm;
    
    feelerVec = feelVector;
    
#ifdef DRAW_PLAYER_FEELER_VECTORS
    [self drawVector  : feelerVec : self.position : [CCColor yellowColor] : @"feelerVec"];
#endif
    
    
    feelerVecNorm = ccpNormalize(feelerVec); // u
    feelerVec = ccpMult(feelerVecNorm, feelLength);
    //[[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag:position :ccpAdd(position,feelerVec) :1 :201];
    

    
    toOppPlayerVec = ccpSub([player position], [self position]); // a
    //[[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag:position :ccpAdd(position,toOppPlayerVec) :0 :202];
#ifdef DRAW_PLAYER_FEELER_VECTORS
    [self drawVector  : toOppPlayerVec : self.position : [CCColor purpleColor] : @"oppPlayerVec"];
#endif
    
    
    // project toOppPlayerVec to feelerVec
    feelerVecProj = ccpMult (feelerVecNorm, ccpDot(toOppPlayerVec, feelerVecNorm)) ; // p
    
    // get distance between feeler vec and toOppPlayerVec
    oppFeelerDiffVec = ccpSub( feelerVecProj, toOppPlayerVec); // b
    // [[[SceneManager sharedSceneManager] gameLayer] drawLineWithTag:ccpAdd(position,feelerVecProj) :ccpAdd(position,toOppPlayerVec) :2 :203];
    
    
    //printf("** b diff = %f", ccpLength(oppFeelerDiffVec));
    
    ////
    CGPoint fovVec;
    if ((ccpLength(oppFeelerDiffVec) < DO_AVOID_PLAYER_WIDTH) && (ccpLength(feelerVecProj) < ccpLength(feelerVec)))
    {
        //printf("\n ** PLAYER IS AHEAD ***");
        fovVec = [self getFOV: toOppPlayerVec];
        
        if (fovVec.x < 0)
        {
            // [self setPositionX:475 Y:[self getSpritePosition].y];
            //printf("\n*** -----> To the left ***");
            return TURN_RIGHT;
        }
        else
        {
            // [self setPositionX:5 Y:[self getSpritePosition].y];
            //printf("\n*** -----> To the right ***");
            return TURN_LEFT;
            
        }
        //  return true;
        
    }
    //  return false;
    return NO_PLAYER_AHEAD;
    
}

//
-(int)getPlayerAheadDirectionDeprecated:(Player *)player
{
    CGPoint toOppPlayerVec;
    CGPoint feelerVecProj;
    CGPoint oppFeelerDiffVec;
    CGPoint feelerVec;
    CGPoint feelerVecNorm;
    
    feelerVec = self.vector;
    feelerVecNorm = ccpNormalize(feelerVec); // u
    feelerVec = ccpMult(feelerVecNorm, 55.0);
    
    
    
    toOppPlayerVec = ccpSub([player getSpritePosition], [self getSpritePosition]); // a
    
    // project toOppPlayerVec to feelerVec
    feelerVecProj = ccpMult (feelerVecNorm, ccpDot(toOppPlayerVec, feelerVecNorm)) ; // p
    
    // get distance between feeler vec and toOppPlayerVec
    oppFeelerDiffVec = ccpSub( feelerVecProj, toOppPlayerVec); // b
    
    
    
    ////
    //    feelerVecNorm = ccpNormalize(feelerVec);    // u
    //    feelerVec = ccpMult(feelerVecNorm, 39.0);
    //
    //    toOppPlayerVec = ccpSub(player, activePlayerPos); // a =
    //
    //    // project toOppPlayerVec to feelerVec
    //    feelerVecProj = ccpMult (feelerVecNorm, ccpDot(toOppPlayerVec, feelerVecNorm)) ; // p =
    //
    //    // get distance between feeler vec and toOppPlayerVec
    //    oppFeelerDiffVec = ccpSub( feelerVecProj, toOppPlayerVec); // b
    
    
    //printf("** b diff = %f", ccpLength(oppFeelerDiffVec));
    
    ////
    CGPoint fovVec;
    if ((ccpLength(oppFeelerDiffVec) < 30) && (ccpLength(feelerVecProj) < ccpLength(feelerVec)))
    {
        //printf("\n ** PLAYER IS AHEAD ***");
        // fovVec = [self getFOV: [player getSpritePosition]];
        fovVec = [self getFOV: toOppPlayerVec];
        
        //printf("\n*** FOv x diff = %f", fovVec.x);
        if (fovVec.x < 0)
        {
            // [self setPositionX:475 Y:[self getSpritePosition].y];
            //printf("\n*** -----> To the left ***");
            return TURN_RIGHT;
        }
        else
        {
            // [self setPositionX:5 Y:[self getSpritePosition].y];
            //printf("\n*** -----> To the right ***");
            return TURN_LEFT;
            
        }
        //return true;
    }
    // return false;
    return NO_PLAYER_AHEAD;
    
}

//
-(void) shoot:(Ball *)ball
{
    //printf("\n *** Kick ball 1");
    if ([ball attached]) {
        //printf("\n *** Kick ball 2");
        //ballAttached=false;
        //ballJustKicked=true;
        [ball setAttached:false];
        [ball setZVector:SHOT_HEIGHT +[Util random:SHOT_HEIGHT_RANDOM_RANGE]];
        
        passCompletedTime=0;
        self.ballJustKicked=true;
        
        CGPoint kickVec = ccpMult(ccpNormalize(self.vector),10);
        [ball setVector: kickVec];
    }
}

//-(void) doSlideKick
-(void) doSlideKick:(Ball *)ball
{
    if ([self isBallCollision:ball])
    {
        //[self passToClosestPlayer:ball];
        //}
        //printf("\n *** Kick ball 1");
        //[self shoot:ball];
        //if ([ball attached]) {
        //printf("\n *** Kick ball 2");
        //ballAttached=false;
        //ballJustKicked=true;
        [ball setAttached:false];
        [ball setZVector:5.0];
        
        passCompletedTime=0;
        self.ballJustKicked=true;
        if (ccpLength(self.vector) < 1)
            self.vector=ccp(1,1);
        
        CGPoint kickVec = ccpMult(ccpNormalize(self.vector),30);
        [ball setVector: kickVec];
        //[ball setVector: ccp(0,60)];
        
    }
}

-(void) shootBallHumanKeeper:(Ball *)ball
{
    CCLOG(@">>> ShootBallHuman...1");
    if (![self isBallCloseEnoughForPassOrShot:ball])
    {
        CCLOG(@">>> Waiting for shot true");
        self.waitingToShoot=true;
        return;
    }
    
    //if ([self isPlayerFacingGoal])
    //{
    CCLOG(@">> ShootBallHuman...2");
    [self shootBallSimple:ball];
    //}
}


//
-(void) shootBallHuman:(Ball *)ball
{
    CCLOG(@">>> ShootBallHuman...1");
    if (![self isBallCloseEnoughForPassOrShot:ball])
    {
        CCLOG(@">>> Waiting for shot true");
        self.waitingToShoot=true;
        return;
    }
    
    //if ([self isPlayerFacingGoal])
    //{
    CCLOG(@">> ShootBallHuman...2");
    [self shootBallSimple:ball];
    self.waitingToShoot=false;
    //}
}

//
-(void) shootBall:(Ball *)ball
{
    if (![self isBallCloseEnoughForPassOrShot:ball])
    {
        self.waitingToShoot=true;
        return;
    }
    
    [self shootBallSimple:ball];
}


//
-(void) shootBallSimpleVector:(Ball *)ball :(CGPoint) shotVec :(long) swipeTimer
{
    
    //CCLOG(@">> ShootBallSimple...1");
    if ([ball attached])
    {
         [ball setAttached:false];
               
        // shot height
        long height = 1 + ((swipeTimer+1)/65);
        CCLOG(@">> Swipe Height : %ld",  height);
        
        if (height > MAX_SWIPE_SHOT_HEIGHT) {
            height=MAX_SWIPE_SHOT_HEIGHT;
        }
        [ball setZVector:height];
        
        
        // shot power
        float shotPower = 100+ccpLength(shotVec)*1.9;
        
        if (shotPower > MAX_SWIPE_SHOT_POWER) {
            shotPower=MAX_SWIPE_SHOT_POWER;
        }

        CGPoint kickVec = shotVec;
        kickVec = ccpMult(ccpNormalize(kickVec),shotPower);
        passCompletedTime=0;
        self.ballJustKicked=true;
        [ball setVector: kickVec];
       // [self playSoundEffect:@"kick1_rs.wav"];
        [self doShotSound];
    }
}



//
-(void) shootBallSimpleVectorOld:(Ball *)ball :(CGPoint) shotVec :(long) swipeTimer
{

    //CCLOG(@">> ShootBallSimple...1");
    if ([ball attached])
    {
        //CCLOG(@">> ShootBallSimple...2");
        //printf("\n *** Kick ball 2");
        //ballAttached=false;
        //ballJustKicked=true;
        [ball setAttached:false];
        
#ifdef DO_LOW_SHOTS
        int height = 1 + arc4random() % 5;
        [ball setZVector:height];
#else
        int height = 5+ arc4random() % 15;
        [ball setZVector:4];
#endif
        

        passCompletedTime=0;
        self.ballJustKicked=true;
        
        CGPoint kickVec = shotVec;
        kickVec = ccpMult(ccpNormalize(kickVec),250+ arc4random() % 100);
        
        [ball setVector: kickVec];
        //[self playSoundEffect:@"kick1_rs.wav"];
        [self doShotSound];

    }
}


-(int) getShotWidthDifficultyRange :(int)shotRange {
    
    // shotRange -> less is better
    int newShotRange=shotRange;
    
    // only change comp team
    
    if ([[self team] isHumanTeam]) {
        //NSLog(@">>Human team - not changing shot difficulty");
        return shotRange;
    }
    //NSLog(@">> OriginalShotRange %d",shotRange);
    
    switch([GameData getDifficulty]) {
            
        case EASY:
            // if easy for human, make computer shot range wider
            newShotRange+=(float)newShotRange*(EASY_SHOT_PERC/PERCENT_100);
          //  NSLog(@">> Shot Range After %d",newShotRange);
            return newShotRange;
            break;
            
        case MEDIUM:
            newShotRange+=(float)newShotRange*(MEDIUM_SHOT_PERC/PERCENT_100);
          //  NSLog(@">> Shot Range After %d",newShotRange);
            return newShotRange;
            break;
            
        case HARD:
            newShotRange-=(float)newShotRange*(HARD_SHOT_PERC/PERCENT_100);
           // NSLog(@">> Shot Range After %d",newShotRange);
            return newShotRange;
            break;
            
        default:
            return newShotRange;
            break;
    }
 
}


-(int) getShotWidthSkillRange {
 
    // calculate shot range based on score accuracy percentage (0-100)
    int shotAccuracy = [[self playerData] shotAccuracy];
    //int shotAccuracy=0;
    
    // worst distance - ((worst distance - best distance / 100 ) * skill)
    float worstDistance = GOAL_WIDTH/2;
    float bestDistance = GOAL_WIDTH/4;
    float range = worstDistance-bestDistance;
    
//    NSLog(@">> Worst Distance= %f",worstDistance);
//    NSLog(@">> Best Distance = %f",bestDistance);
//    NSLog(@">>Shot Range = %f",range);
    
    float rangePerc = (float)range/100;
    float rangeScore = rangePerc*shotAccuracy;
    
//    NSLog(@">>Range Score = %f",rangeScore);

    int actualScore = worstDistance-rangeScore;
//    NSLog(@">>Final Shot Accuracy = %d",shotAccuracy);
//    NSLog(@">>Final Shot Range = %d",actualScore);
    
    //return actualScore;
    return [self getShotWidthDifficultyRange:actualScore];
}


//
-(void) shootBallSimple:(Ball *)ball
{
    if ([ball attached])
    {
         [ball setAttached:false];
        
#ifdef DO_LOW_SHOTS
        int height = 1 + arc4random() % 4; //5
        [ball setZVector:height];
#else
        int height = 5+ arc4random() % 15;
        [ball setZVector:4];
#endif
        
        [ball setCurlAngle : 2];
        
        CGPoint shotTarget;
        int shotTargetX=PITCH_X_CENTER;
        //int randomTarget = arc4random() % 75;
        int randomTarget =[self getShotWidthSkillRange];
        
        if ([Util random5050])
            shotTargetX = PITCH_X_CENTER + randomTarget;
        else
            shotTargetX = PITCH_X_CENTER - randomTarget;
        
        if ([self isTeamShootingUp])
            shotTarget = ccp(shotTargetX,PITCH_TOP);
        else
            shotTarget = ccp(shotTargetX,PITCH_BOTTOM);
        
        
        passCompletedTime=0;
        self.ballJustKicked=true;
        
        CGPoint kickVec = ccpSub( shotTarget, [self getSpritePosition]);
        kickVec = ccpMult(ccpNormalize(kickVec), SHOT_BASE_STRENGTH + [Util random:SHOT_STRENGTH_RANGE]); // SHOT STRENGTH
        
        [ball setVector: kickVec];
        [self doShotSound];
    }
}

//
-(void) shootBallSimpleOriginal:(Ball *)ball
{
    if ([ball attached])
    {
        //CCLOG(@">> ShootBallSimple...2");
        //printf("\n *** Kick ball 2");
        //ballAttached=false;
        //ballJustKicked=true;
        [ball setAttached:false];
        
#ifdef DO_LOW_SHOTS
        int height = 1 + arc4random() % 4; //5
        [ball setZVector:height];
#else
        int height = 5+ arc4random() % 15;
        [ball setZVector:4];
#endif
        
        //[ball setZVector:5];
        [ball setCurlAngle : 2];
        
        
        CGPoint shotTarget;
        int shotTargetX=240;
        int randomTarget = arc4random() % 75;
        
        if ([Util random5050])
            shotTargetX = 240 + randomTarget;
        else
            shotTargetX = 240 - randomTarget;
        
        if ([self isTeamShootingUp])
            shotTarget = ccp(shotTargetX,652);
        else
            shotTarget = ccp(shotTargetX,38);
        
        
        passCompletedTime=0;
        self.ballJustKicked=true;
        
        CGPoint kickVec = ccpSub( shotTarget, [self getSpritePosition]);
        kickVec = ccpMult(ccpNormalize(kickVec),250+ arc4random() % 100);
        
        [ball setVector: kickVec];
        [self doShotSound];

    }
}

//
-(bool) isInTnPositionToCross:(Ball *)ball
{
    if ([self isInCrossingZone:ball])
    {
        if (self.position.y >= PITCH_TOP-60 || self.position.y <= PITCH_BOTTOM+40)
        {
            return true;
        }
        
        //        if ([Util random:50] == 1)
        //        {
        //            return true;
        //        }
    }
    return false;
}

//
-(bool) isInCrossingZone:(Ball *)ball
{
    if (![self isPlayerOnWings])
        return false;
    
    int zone =0;
    if ([[self team] isPlayingUpPitch])
    {
        zone= [Formation getZone:[ball position]];
        if (zone == 0 || zone == 2)
            return true;
    }
    else
    {
        zone= [Formation getReverseZone:[ball position]];
        if (zone == 0 || zone == 2)
            return true;
    }
    
    return false;
}


//
-(int) getRandomCrossHeight
{
    int height = CROSS_HEIGHT_BASE;
    return height+[Util random:CROSS_HEIGHT_RANGE];
}


//
-(bool) isPlayerInTheArea :(Player *)player {
    int x = player.position.x;
    int y = player.position.y;
    
    bool inBox = true;
    
    if (x < PITCH_X_CENTER-(GOAL_AREA_WIDTH/2)) {
        inBox=false;
    } else if (x > PITCH_X_CENTER+(GOAL_AREA_WIDTH/2)) {
        inBox=false;
    }
    
    if ([player isTeamShootingUp]) {
        if (y < (PITCH_TOP - GOAL_AREA_DEPTH)) {
            inBox=false;
        }
    } else {
        if (y > (PITCH_BOTTOM + GOAL_AREA_DEPTH)) {
            inBox=false;
        }
    }
    
    return inBox;
}


//
-(bool) isThereAPlayersInTheBoxForCross
{
    bool playerInBox = false;
    
    for (Player *player in [[self team] getPlayers])
    {
        if ([self isPlayerInTheArea:player]) {
            playerInBox=true;
            break;
        }
    }
    
    return playerInBox;
}


//
-(void) crossBall:(Ball *)ball
{
    CGPoint crossVec;
    if (self.position.x < PITCH_X_CENTER)
    {
        crossVec = ccp(1,0);
    }
    else
    {
        crossVec = ccp(-1,0);
    }
    
    
    //[ball setZVector:CROSS_HEIGHT];
    [ball setZVector:[self getRandomCrossHeight]];
    crossVec = ccpMult(crossVec,250);
    
    if ([self isTeamShootingUp])
    {
        crossVec = [self getVectorRotatedByRandomAngle:crossVec : 10];
    }
    else
    {
        crossVec = [self getVectorRotatedByRandomAngle:crossVec : 10];
        
    }
    [ball setVector: crossVec];
    [ball setAttached:false];
    passCompletedTime=0;
    self.ballJustKicked=true;
    //[self playSoundEffect:@"kick1_rs.wav"];
    [self doShotSound];

    
}


//
-(void) crossBallOld:(Ball *)ball
{
    //printf("\n *** Kick ball 1");
    if ([ball attached]) {
        //printf("\n *** Kick ball 2");
        //ballAttached=false;
        //ballJustKicked=true;
        
        
        if ([self isInCrossingZone:ball])
        {
            [ball setAttached:false];
            
            [ball setZVector:5];
            
            passCompletedTime=0;
            CGPoint crossVec;
            if ([self getSpritePosition].x < 240)
            {
                crossVec = ccp(1,0);
            }
            else
            {
                crossVec = ccp(-1,0);
            }
            passCompletedTime=0;
            //CGPoint kickVec = ccpSub( shotTarget, [self getSpritePosition]);
            crossVec = ccpMult(crossVec,250+ arc4random() % 100);
            
            [ball setVector: crossVec];
        }
    }
}

//
-(void) doGoalKick:(Ball *)ball
{
    if ([ball attached]) {
        [self setPlayerHasBall:ball];
        int randomGoalKickOption = [Util random:4];
        
        switch (randomGoalKickOption) {
                
            case 0:
            case 1:
            case 2:
                [self kickBasicGoalKick:ball];
                 break;
            case 3:
                [self passToClosestPlayerHuman:ball];
                break;
             default:
                [self kickBasicGoalKick:ball];
                break;
        }
        [self doShotSound];
    }

}

//
-(void) kickBasicGoalKick:(Ball *)ball
{
    //CCLOG(@">> kickBasicGoalKick");
    int randomWidth = -5 + [Util random:10];
    
    int yVec=200+[Util random:200];
    
    //CCLOG(@">> KEEPER  >>:%@ TEAM ID : %d - PLAYER ID : %d - PLAYING DIR : %d",self.playerName,[[self team] getTeamId], self.playerId, [[self team] getPlayingDirection] );
    
    // TODO - team shooting direction is inverse- fix
    if ([self isTeamShootingUp])
    {
        yVec = yVec;
    }
    else
    {
        yVec = -yVec;
    }
    
    //CCLOG(@">> Y vec = %d", yVec);
    
    //CCLOG(@">> Ball attached : %d", [ball attached]);
    
    //CCLOG(@"*** Kick ball 1 : pass complete time : %d" , passCompletedTime);
    if ([ball attached]) {
        //ballAttached=false;
        //ballJustKicked=true;
        [ball setAttached:false];
        //[ball setZVector:randomHeight];
        [ball setZVector:5];
        
        
        passCompletedTime=0;
        self.ballJustKicked=true;
        
        CGPoint kickVec = ccp(randomWidth,yVec);
        //CCLOG(@"\n *** Kick Vec %f,%f", kickVec.x,kickVec.y );
        [ball setVector: kickVec];
        [[GameModel sharedGameModel] changeStatetoGamePlayingFromGoalKickHuman];
        //CCLOG(@">> kickBasicGoalKick 2");
        
    }
}

//
-(void) kickBall:(Ball *)ball
{
    //printf("\n *** Kick ball 1");
    if ([ball attached]) {
        //printf("\n *** Kick ball 2");
        //ballAttached=false;
        //ballJustKicked=true;
        [ball setAttached:false];
        [ball setZVector:5.0];
        
        passCompletedTime=0;
        self.ballJustKicked=true;
        
        CGPoint kickVec = ccpMult(ccpNormalize(self.vector),30);
        [ball setVector: kickVec];
    }
}
//-(Player *) getSecondClosestPlayerNotTooClose:(Player *)player :(int)minimumDistance

//
-(void) passToSecondClosestPlayer:(Ball *)ball
{
    //printf("** Pass to closest player\n");
    //if ([ball attached] && ([ball getTeamWithBallId] == [self teamId))
    if ([self playerHasBall:ball])
    {
        
        //Player *closestPlayer = [team getClosestPlayer:self];
        Player *closestPlayer = [team getSecondClosestPlayerNotTooClose:self:100];
        
        
        if (closestPlayer != nil)
        {
            //printf("** Get closest player - id = %d\n", [closestPlayer getPlayerId]);
            
            //CGPoint passVector = ccpSub( [closestPlayer getSpritePosition], [self getSpritePosition]);
            CGPoint passVector = ccpSub( [closestPlayer getAdvancedSpritePosition], [self getSpritePosition]);
            
            //
            float distanceToPlayer = ccpLength(passVector);
            //float passStrengthRatio = distanceToPlayer*2.0;
            
            float passStrengthRatio = distanceToPlayer*1.25;
            
            //
            CGPoint passVectorNorm = ccpNormalize(passVector);
            //CGPoint passVectorFinal = ccpMult(passVectorNorm, 3 + arc4random() % 3 );
            CGPoint passVectorFinal = ccpMult(passVectorNorm, passStrengthRatio);
            
            //CGPoint passVectorFinal = ccpMult(passVectorNorm, 300);
            
            
            //ballAttached=false;
            // ballJustKicked=true;
            [ball setAttached:false];
            //[ball setzVector:1 + arc4random() % 4];
            //[ball setZVector:1.5];
            [ball setZVector:1.0];
            
            // [ball setzVector:2];
            
            
            //  CGPoint kickVec = ccp(5,5);
            [ball setVector: passVectorFinal];
            //printf("** ---> Pass vector = %f,%f",passVectorFinal.x, passVectorFinal.y);
            passCompletedTime=0;
            self.ballJustKicked=true;
            
            
            
        }
    }
    else
    {
        //printf("\n** Player doesnt have ball ");
    }
}

//
-(void) setupRunoutStartPositions
{
    
}

//

-(void) doRunout
{
    
    switch (runoutState)
    {
        case runoutStart:
            self.vector=ccp(5.0,0);
            [self setMoveVector];
            [self doCompAnim];
            //[self checkBoundary];
            [self updateSpritePos];
            
            if (self.position.x<300)
            {
                
            }
            break;
            
        case runoutGoToPosition:
            
            
            break;
            
        default:
            break;
            
    }
    //if (self.position.x)
}

//
-(bool) isBallFootHeight:(Ball *)ball
{
    return ([ball z] < PLAYER_FOOT_HEIGHT);
}

//
-(bool) isBallTooCloseToBody:(Ball *)ball
{
    return (ccpDistance([self position], [ball position]) < BALL_TOO_CLOSE_DISTANCE);
}

//
-(void) passToPlayer:(Ball *)ball :(Player *)player
{
    
#ifdef ONLY_PASS_IF_FOOT_HEIGHT
    if (![self isBallFootHeight:ball])
    {
        //CCLOG(@">> passToPlayer : Ball not footheight - wont do pass");
        return;
    }
    
#endif
    
#ifdef ONLY_PASS_IF_NOT_TOOCLOSE_TOBODY
    if ([self isBallTooCloseToBody:ball])
    {
        //CCLOG(@">> passToPlayer : Ball tooClose to body - wont do pass");
        return;
    }
    
#endif
    
    
    if (![self isBallCloseEnoughForPassOrShot:ball])
    {
        self.waitingToPass=true;
        return;
    }
    
    if ([self playerHasBall:ball])
    {
        
        
        #ifdef DO_PLAY_PASS_SLIGHTLY_AHEAD
            //DOESNT WORK - CAUSES GAME TO CRASH
            CGPoint ballAheadVec = ccpNormalize([self vector]);
            //CCLOG(@">>>Player receiving pass vector length: %f", ccpLength([player vector]));
            ballAheadVec = ccpMult(ballAheadVec, (ccpLength([player vector])*0.3));

            CGPoint passVector = ccpSub( ccpAdd([player getAdvancedSpritePosition], ballAheadVec), [self getSpritePosition]);
        #else
            CGPoint passVector;
            if (ccpDistance([player position], [self getSpritePosition]) < 200) {
                passVector = ccpSub( [player getAdvancedSpritePosition], [self getSpritePosition]);
            } else {
                passVector = ccpSub( [player position], [self getSpritePosition]);
            }
        #endif
        //
        float distanceToPlayer = ccpLength(passVector);
        //float passStrengthRatio = distanceToPlayer*2.0;
        
        float passStrengthRatio =0;
        
        //
        //        CGPoint passVectorNorm = ccpNormalize(passVector);
        //        //CGPoint passVectorFinal = ccpMult(passVectorNorm, 3 + arc4random() % 3 );
        //        CGPoint passVectorFinal = ccpMult(passVectorNorm, passStrengthRatio);
        //
        //CGPoint passVectorFinal = ccpMult(passVectorNorm, 300);
        
        
        //ballAttached=false;
        // ballJustKicked=true;
        [ball setAttached:false];
        //[ball setzVector:1 + arc4random() % 4];
        [ball setZVector:1.5];
        
        if (distanceToPlayer > MEDIUM_PASS_RANGE)
        {
            
            
            // for computer team, do high pass
            if (![[self team] isHumanTeam]) {
                
               
                
                if (distanceToPlayer > LONG_PASS_RANGE) {
                    
                    if ([Util random1NotInX:10]) {
                        passStrengthRatio = distanceToPlayer*0.95; // 1.05 //1.15
                        [ball setZVector:4.5];
                    } else {
                        [ball setZVector:MEDIUM_PASS_HEIGHT];
                        passStrengthRatio=distanceToPlayer*0.95; //1.10; //1.05 //1.15
                    }
                } else {
                    // MEDiUM DISTANCE HIGH PASS
                    
                    if ([Util random5050]) {
                        passStrengthRatio = distanceToPlayer*0.85; // 0.90; //0.8  // 1.05 //1.15
                        [ball setZVector:3.5];
                    } else {
                        [ball setZVector:MEDIUM_PASS_HEIGHT];
                        passStrengthRatio=distanceToPlayer*0.95; //1.15; //1.05  //1.15
                    }
                    
                }
            
                // TEST
                if ([self isPassInPathOfAPlayer:player]) {
                    [ball setZVector:3.5];
                }
            }
        
            else {
                if ([Util random:2] == 0)
                {
                    //[ball setZVector:distanceToPlayer/75];
                    [ball setZVector:MEDIUM_PASS_HEIGHT];
                    passStrengthRatio=distanceToPlayer*1.10; // 1.05
                }
                else
                {
                    if ([Util random:2] == 0)
                    {
                        //[ball setZVector:2.0];
                        [ball setZVector:MEDIUM_PASS_HEIGHT];
                    }
                    else
                    {
                        //[ball setZVector:3.0];
                        [ball setZVector:MEDIUM_PASS_HEIGHT];
                    }
                    passStrengthRatio=distanceToPlayer*1.10; //1.05 //1.15
                }
            }
        }
        else
        {
            //[ball setZVector:1.5];
            [ball setZVector:LOW_PASS_HEIGHT];
            passStrengthRatio=distanceToPlayer*1.15;
            
        }
        // [ball setzVector:2];
        CGPoint passVectorNorm = ccpNormalize(passVector);
        //CGPoint passVectorFinal = ccpMult(passVectorNorm, 3 + arc4random() % 3 );
        CGPoint passVectorFinal = ccpMult(passVectorNorm, passStrengthRatio);
        
        
        [ball setVector: passVectorFinal];
        passCompletedTime=0;
        
        self.ballJustKicked=true;
        //[self playSoundEffect:@"kick3_rs.wav"];
        
        [self doPassSound];

        
#ifdef DO_AFTER_PASS_STAND_STILL_COMP
        [self startStayStillAfterPassCounter];
#endif
        
    }
}


//
-(NSMutableArray *) getPlayersOrderedByClosenessOriginal:(Ball *)ball :(bool)includeObstructedPlayers :(int)minimumDistance
{
    NSMutableArray *playersList = [[self team] getPlayersClosestFirstMinimumDistance: self: minimumDistance]; //100
    NSMutableArray *filteredPlayersList = [[NSMutableArray alloc] init];
    
    
    for (Player *player in playersList)
    {
#ifdef TURN_OFF_BACKWARD_PASS
        if ((![self isPassInPathOfAPlayer:player] && ![self isBackwardPass:ccpSub([player position],self.position)]) ||
            ([self isBackwardPass:ccpSub([player position],self.position)] && [self isWithinBackwardPassDistance:[player position]]))
#else
            if (![self isPassInPathOfAPlayer:player])
#endif
                
            {
                [filteredPlayersList addObject:player];
                //CCLOG(@">>Team : %d | Player Team %d", [self getTeamId], [player getTeamId]);
            }
            else
            {
                if (includeObstructedPlayers) {
                    [filteredPlayersList addObject:player];
                    //CCLOG(@">>(Obstructed Player) Team : %d | Player Team %d", [self getTeamId], [player getTeamId]);
                }
            }
    }
    return filteredPlayersList;
}

//
-(NSMutableArray *) getPlayersOrderedByCloseness:(Ball *)ball :(bool)includeObstructedPlayers :(int)minimumDistance
{
    NSMutableArray *playersList = [[self team] getPlayersClosestFirstMinimumDistance: self: minimumDistance]; //100
    NSMutableArray *filteredPlayersList = [[NSMutableArray alloc] init];

    
    for (Player *player in playersList)
    {
//#ifdef TURN_OFF_BACKWARD_PASS
//        if ((![self isPassInPathOfAPlayer:player] && ![self isBackwardPass:ccpSub([player position],self.position)]) ||
//            ([self isBackwardPass:ccpSub([player position],self.position)] && [self isWithinBackwardPassDistance:[player position]]))
//#else
//            if (![self isPassInPathOfAPlayer:player])
//#endif
        
        bool obstructedPlayer=false;
        bool backwardPass=false;
        bool withinAllowedBackpassDistance=false;
        
        obstructedPlayer = [self isPassInPathOfAPlayer:player];
        backwardPass = [self isBackwardPass:ccpSub([player position],self.position)] /*&& [self isWithinBackwardPassDistance:[player position]]*/;
        withinAllowedBackpassDistance = [self isWithinBackwardPassDistance:[player position]];
        
        if ((!obstructedPlayer || (obstructedPlayer && includeObstructedPlayers)) ) {
            if (!backwardPass || (backwardPass && withinAllowedBackpassDistance)) {
                [filteredPlayersList addObject:player];
            }
        }
        
//            if (/*![self isPassInPathOfAPlayer:player] && */![self isBackwardPass:ccpSub([player position],self.position)])
//            {
//                [filteredPlayersList addObject:player];
//                //CCLOG(@">>Team : %d | Player Team %d", [self getTeamId], [player getTeamId]);
//            }
//            else
//            {
//                if (includeObstructedPlayers) {
//                    [filteredPlayersList addObject:player];
//                    //CCLOG(@">>(Obstructed Player) Team : %d | Player Team %d", [self getTeamId], [player getTeamId]);
//                }
//            }
    }
    return filteredPlayersList;
}




//

//-(NSMutableDictionary *) getPlayersInMostSpaceOfOpposition : (int)distance {
//    /*
//        for each player
//            get the distance to oppPlayers
//            get the number less than given distance
//            order from least to most
//     
//     
//     */
//    
//    NSMutableDictionary *playersDistanceMap = [[NSMutableDictionary alloc] init];
//    
//    for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
//    {
//        int playersWithinDistance = 0;
//        if (ccpDistance(self.position, oppPlayer.position) < distance)
//        {
//            // add to the number within
//            playersWithinDistance++;
//        }
//        
//        [playersDistanceMap setObject: [NSNumber numberWithInt:playersWithinDistance] forKey: [NSNumber numberWithInt: [oppPlayer playerId]] ];
//    }
//    
//     //NSArray *sortedKeysArray = [playersDistanceMap keysSortedByValueUsingSelector:@selector(compare:)];
//    return playersDistanceMap;
//}


-(bool) isPlayerSurrounded :(Player *) targetPlayer : (int) distance {
    int oppPlayersWithinDistance=0;
    
    for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
    {
        if (ccpDistance(targetPlayer.position, oppPlayer.position) < distance)
        {
            // add to the number within
            oppPlayersWithinDistance++;
        }
    }

    return (oppPlayersWithinDistance > 2 );
}



//
-(NSMutableDictionary *) getPlayersInMostSpaceOfOpposition : (NSMutableArray *) myPlayersOrderedByClosesness : (int)distance
                                                           :(bool) onlyPlayersFullyInSpace {
    
    /*
     for each player
     get the distance to oppPlayers
     get the number less than given distance
     order from least to most
     */
    
    NSMutableDictionary *playersDistanceMap = [[NSMutableDictionary alloc] init];
    
    
    for (Player * player in myPlayersOrderedByClosesness) {
        
        if ([player playerId] != [self playerId]) {
            
            int oppPlayersWithinDistance = 0;

            for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
            {
                if (ccpDistance(player.position, oppPlayer.position) < distance)
                {
                    // add to the number within
                    oppPlayersWithinDistance++;
                }
            }
//            
//            if (onlyPlayersFullyInSpace && oppPlayersWithinDistance == 0) {
//                [playersDistanceMap setObject: [NSNumber numberWithInt: oppPlayersWithinDistance]
//                                   forKey: [NSNumber numberWithInt: [player playerId]] ];
//            }
            
            if (onlyPlayersFullyInSpace) {
                if (oppPlayersWithinDistance == 0) {
                    [playersDistanceMap setObject: [NSNumber numberWithInt: oppPlayersWithinDistance]
                                           forKey: [NSNumber numberWithInt: [player playerId]] ];
                }
            } else {
                [playersDistanceMap setObject: [NSNumber numberWithInt: oppPlayersWithinDistance]
                                       forKey: [NSNumber numberWithInt: [player playerId]] ];
            }

        
        }
    }
    
    //NSArray *sortedKeysArray = [playersDistanceMap keysSortedByValueUsingSelector:@selector(compare:)];
    return playersDistanceMap;
}


//
-(void) passToPlayerInMostSpace:(Ball *)ball {
    
    
    // no passing if player is through on goal
#ifdef  NO_PASS_IF_PLAYER_THROUGH_ON_GOAL
    if ([self isPlayerThroughOnGoal]) {
        return;
    }
#endif
    
    
    
    // get players ordered by closest distance - including obstructed players or not
    bool includeObstructedPlayers = false;
    
    NSMutableArray *playersOrderedByClosesnessList = [self getPlayersOrderedByCloseness :ball :includeObstructedPlayers :100];
    
    bool onlyPlayersFullyInSpace;
    
//    if ([Util random1inX:5]) {
//        onlyPlayersFullyInSpace=false;
//    } else {
//        onlyPlayersFullyInSpace=true;
//    }
    onlyPlayersFullyInSpace=true; //true
    
    // filter again by those in space
    NSMutableDictionary *playersOrderedByMostSpaceOfOpposition= [self getPlayersInMostSpaceOfOpposition
                                                                 : playersOrderedByClosesnessList : 75/*50*/ : onlyPlayersFullyInSpace];
    
   // CCLOG(@">>Number of players in Space : %lu " , (unsigned long)playersOrderedByMostSpaceOfOpposition.count);
    
    if (playersOrderedByMostSpaceOfOpposition.count == 0) {
        #ifdef DO_POTENTIALLY_OBSTRUCTED_PASS
        
        
        
        
            // pass to a player that may be obstructed
            [playersOrderedByClosesnessList removeAllObjects];
            playersOrderedByClosesnessList = [self getPlayersOrderedByCloseness :ball :true :100];

            // filter again by those in space
            [playersOrderedByMostSpaceOfOpposition removeAllObjects];
            playersOrderedByMostSpaceOfOpposition= [self getPlayersInMostSpaceOfOpposition
                                                        : playersOrderedByClosesnessList : 50/*50*/ : true ];

            if (playersOrderedByMostSpaceOfOpposition.count == 0) {
                return;
            } else {
                //return;
                NSArray *sortedKeysArray = [playersOrderedByMostSpaceOfOpposition keysSortedByValueUsingSelector:@selector(compare:)];
                NSNumber *closestPlayerVal = [sortedKeysArray firstObject] ;
                //NSNumber *closestPlayerVal = [sortedKeysArray lastObject] ;
                
                int closetPlayerId = [closestPlayerVal intValue];
                
            #ifdef AVOID_PASSES_TO_SURROUNDED_PLAYER
                Player *player = [[self team] getPlayerById :closetPlayerId];
                if ([self isPlayerSurrounded : player : OPP_PLAYERS_TOO_CLOSE_DISTANCE ]) {
                    return;
                }
            #endif
                
                //CCLOG(@">> Current Team Id %d, Pass to Team Id %d", [[self team] getTeamId], [[[self team] getPlayerById :closetPlayerId] teamId]);
                [self passToPlayer :ball :[[self team] getPlayerById :closetPlayerId]];
                
                CGPoint passToPostion = [[[self team] getPlayerById :closetPlayerId] position];
                
            #ifdef DRAW_PASS_LINES

                [[[SceneManager sharedSceneManager] gameLayer] drawLineWithCustomTag : [self position]
                                                                                      : passToPostion                                                                                  : @"passLine" : [CCColor yellowColor]];
            #endif
            }
        
        #else
            return;
        #endif
    } else {
        NSArray *sortedKeysArray = [playersOrderedByMostSpaceOfOpposition keysSortedByValueUsingSelector:@selector(compare:)];
        
        //for (NSNumber *closestPlayerVal in sortedKeysArray) {
            //CCLOG(@">> Player Id : %d, Num Within Distance : %@", [closestPlayerVal intValue],
                 // [playersOrderedByMostSpaceOfOpposition objectForKey: closestPlayerVal] );
        //}
        //CCLOG(@">> Player in Space Id: %@", [sortedKeysArray firstObject]);
        NSNumber *closestPlayerVal = [sortedKeysArray firstObject] ;
        int closetPlayerId = [closestPlayerVal intValue];
        //CCLOG(@">> Player in Space Id: %d", closetPlayerId);

        
//        NSNumber *playersInProximityVal = [playersOrderedByMostSpaceOfOpposition objectForKey:closestPlayerVal];
//        int playersInProximity = [playersInProximityVal intValue];
        
//        CCLOG(@">>Number of opp players close by = %d", playersInProximity);
//       // CCLOG(@">>(Last)Number of opp players close by = %@", [playersOrderedByMostSpaceOfOpposition objectForKey:[closestPlayerVal]);
//        if (playersInProximity > 2) {
//            CCLOG(@">>No Pass - too may players close by");
//            return;
//        }
        
        
        //CCLOG(@">> Pass to Player in Space : %@", [[self team] getPlayerById : closetPlayerId]);
        
       // CCLOG(@">> Pass to Player in Space : %@",[playersOrderedByMostSpaceOfOpposition objectForKey:4];
        
        #ifdef AVOID_PASSES_TO_SURROUNDED_PLAYER
            Player *player = [[self team] getPlayerById :closetPlayerId];
            if ([self isPlayerSurrounded : player : OPP_PLAYERS_TOO_CLOSE_DISTANCE ]) {
                return;
            }
        #endif
        
        [self passToPlayer :ball :[[self team] getPlayerById :closetPlayerId]];
        
        CGPoint passToPostion = [[[self team] getPlayerById :closetPlayerId] position];
        
    #ifdef DRAW_PASS_LINES

        [[[SceneManager sharedSceneManager] gameLayer] drawLineWithCustomTag : [self position]
                                                                             : passToPostion                                                                                  : @"passLine2" : [CCColor redColor]];
    #endif

    }
    
}





//
-(void) passToPlayerAhead:(Ball *)ball :(Player *)player :(int)distanceAhead
{
    if (![self isBallCloseEnoughForPassOrShot:ball])
    {
        self.waitingToPass=true;
        return;
    }
    
    if ([self playerHasBall:ball])
    {
        CGPoint ballAheadVec = ccpNormalize([self vector]);
        ballAheadVec = ccpMult(ballAheadVec, distanceAhead);
        
        CGPoint passVector = ccpSub( ccpAdd([player getAdvancedSpritePosition],ballAheadVec), [self getSpritePosition]);
        
        //        CGPoint passVector = ccpSub( [player getAdvancedSpritePosition], [self getSpritePosition]);
        
        //
        float distanceToPlayer = ccpLength(passVector);
        //float passStrengthRatio = distanceToPlayer*2.0;
        
        float passStrengthRatio =0;
        
        [ball setAttached:false];
        
        if (distanceToPlayer > MEDIUM_PASS_RANGE)
        {
            if ([Util random:2] == 0)
            {
                //[ball setZVector:distanceToPlayer/75];
                [ball setZVector:MEDIUM_PASS_HEIGHT];
                passStrengthRatio=distanceToPlayer*0.70;
            }
            else
            {
                //[ball setZVector:2.0];
                [ball setZVector:MEDIUM_PASS_HEIGHT];
                passStrengthRatio=distanceToPlayer*0.70;
            }
            
        }
        else
        {
            //[ball setZVector:0.5];
            [ball setZVector:LOW_PASS_HEIGHT];
            passStrengthRatio=distanceToPlayer*0.80;
        }
        // [ball setzVector:2];
        CGPoint passVectorNorm = ccpNormalize(passVector);
        //CGPoint passVectorFinal = ccpMult(passVectorNorm, 3 + arc4random() % 3 );
        CGPoint passVectorFinal = ccpMult(passVectorNorm, passStrengthRatio);
        
        
        [ball setVector: passVectorFinal];
        passCompletedTime=0;
        //[self playSoundEffect:@"kick3_rs.wav"];
        [self doPassSound];

        
        self.ballJustKicked=true;
        
#ifdef DO_AFTER_PASS_STAND_STILL_COMP
        [self startStayStillAfterPassCounter];
#endif
    }
}

//
-(void) passToPlayerAdvanced:(Ball *)ball :(Player *)player
{
    if ([self playerHasBall:ball])
    {
        CGPoint passVector = ccpSub( [player getAdvancedSpritePosition], [self getSpritePosition]);
        
        //
        float distanceToPlayer = ccpLength(passVector);
        float passStrengthRatio =0;
        
        //ballAttached=false;
        //ballJustKicked=true;
        [ball setAttached:false];
        //[ball setzVector:1 + arc4random() % 4];
        [ball setZVector:1.5];
        
        if (distanceToPlayer > MEDIUM_PASS_RANGE)
        {
            //[ball setZVector:distanceToPlayer/75];
            [ball setZVector:MEDIUM_PASS_HEIGHT];
            passStrengthRatio=distanceToPlayer*1.0; // 1.0
        }
        else
        {
            //[ball setZVector:1.5];
            //[ball setZVector:0.5];
            [ball setZVector:LOW_PASS_HEIGHT];
            passStrengthRatio=distanceToPlayer*1.15; //1/0
        }
        // [ball setzVector:2];
        CGPoint passVectorNorm = ccpNormalize(passVector);
        //CGPoint passVectorFinal = ccpMult(passVectorNorm, 3 + arc4random() % 3 );
        CGPoint passVectorFinal = ccpMult(passVectorNorm, passStrengthRatio);
        
        
        //  CGPoint kickVec = ccp(5,5);
        [ball setVector: passVectorFinal];
        //printf("** ---> Pass vector = %f,%f",passVectorFinal.x, passVectorFinal.y);
        passCompletedTime=0;
        self.ballJustKicked=true;
        //[self playSoundEffect:@"kick3_rs.wav"];
        [self doPassSound];

        
    }
}


//
-(void) passToPlayerInAir:(Ball *)ball :(Player *)player
{
    if ([self playerHasBall:ball])
    {
        CGPoint passVector = ccpSub( [player getAdvancedSpritePosition], [self getSpritePosition]);
        
        //
        float distanceToPlayer = ccpLength(passVector);
        //float passStrengthRatio = distanceToPlayer*2.0;
        
        float passStrengthRatio = distanceToPlayer*1.05;
        
        //
        CGPoint passVectorNorm = ccpNormalize(passVector);
        //CGPoint passVectorFinal = ccpMult(passVectorNorm, 3 + arc4random() % 3 );
        CGPoint passVectorFinal = ccpMult(passVectorNorm, passStrengthRatio);
        
        //CGPoint passVectorFinal = ccpMult(passVectorNorm, 300);
        
        
        //ballAttached=false;
        // ballJustKicked=true;
        [ball setAttached:false];
        //[ball setzVector:1 + arc4random() % 4];
        //[ball setZVector:1.5];
        [ball setZVector: distanceToPlayer/75];
        
        // [ball setzVector:2];
        
        
        //  CGPoint kickVec = ccp(5,5);
        [ball setVector: passVectorFinal];
        //printf("** ---> Pass vector = %f,%f",passVectorFinal.x, passVectorFinal.y);
        passCompletedTime=0;
        self.ballJustKicked=true;
        //[self playSoundEffect:@"kick3_rs.wav"];
        [self doPassSound];
    }
}

-(void) passToClosestPlayer:(Ball *)ball
{
    //printf("** Pass to closest player\n");
    //if ([ball attached] && ([ball getTeamWithBallId] == [self teamId))
    if ([self playerHasBall:ball])
    {
        CCLOG(@">> Pass to closest player 1");
        //Player *closestPlayer = [team getClosestPlayer:self];
        Player *closestPlayer = [team getClosestPlayerNotTooClose:self:100];
        
        
        if (closestPlayer != nil)
        {
            CCLOG(@">> Pass to closest player 2");
             //
            [ball setAttached:false];
            //[ball setzVector:1 + arc4random() % 4];
            //[ball setZVector:1.0];
            [ball setZVector:LOW_PASS_HEIGHT];
            
            // CCLOG(@">>> Pass vector = %f,%f",passVectorFinal.x, passVectorFinal.y);
            passCompletedTime=0;
            self.ballJustKicked=true;
        }
    }
    else
    {
        //printf("\n** Player doesnt have ball ");
    }
}

-(bool) isCGPointNan :(CGPoint) point {
    return (isnan(point.x) && isnan(point.y));
}


//
-(void) passToClosestPlayerHuman:(Ball *)ball
{
    //CCLOG(@">>> Pass to closest player");
    //if ([ball attached] && ([ball getTeamWithBallId] == [self teamId))
    
    if (![self isBallCloseEnoughForPassOrShotHuman:ball])
    {
        self.waitingToPass=true;
        return;
    }
    
    if ([self playerHasBall:ball])
    {
        //CCLOG(@">>> Pass to closest player - has ball");
        //Player *closestPlayer = [team getClosestPlayer:self];
        Player *closestPlayer = [team getClosestPlayerHuman:self];
        
        if (closestPlayer != nil)
        {
            //CCLOG(@">>> Pass to closest player - id : %d ", [closestPlayer playerId]);
            //CCLOG(@">>> Pass to closest player - vector : %f,%f ", [closestPlayer vector].x, [closestPlayer vector].y );
            
            //TODO - Pass Vector nan,nan when keeper somtimes passes the ball
            //TODO FIX
            CGPoint passVector = ccpSub( [closestPlayer getAdvancedSpritePosition], [self getSpritePosition]);
            
            if ([self isCGPointNan:passVector]) {
                //CCLOG (@">> PASS Vector Nan.ignoring and continuing....");
                return;
            }
                 
            float distanceToPlayer = ccpLength(passVector);
            //float passStrengthRatio = distanceToPlayer*2.0;
            
            float passStrengthRatio;
            
            if(distanceToPlayer < MEDIUM_PASS_RANGE)
            {
                passStrengthRatio = distanceToPlayer*1.50; // 1.95
            }
            else
            {
                passStrengthRatio = distanceToPlayer*1.15;  // 1.25
            }
            
//            if (self.playerId==KEEPER_ID) {
//                CCLOG(@"Pass Vector %f,%f",passVector.x,passVector.y);
//                CCLOG(@"Pass Vector %f,%f",self.vector.x,self.vector.y);
//                
//            }
            
            //
            CGPoint passVectorNorm = ccpNormalize(passVector);
            //CGPoint passVectorFinal = ccpMult(passVectorNorm, 3 + arc4random() % 3 );
            CGPoint passVectorFinal = ccpMult(passVectorNorm, passStrengthRatio);
            
            [ball setAttached:false];
            //[ball setZVector:1.5];
            
            int passHeight = LOW_PASS_HEIGHT;
            
            if ([self isPassInPathOfAPlayer:closestPlayer]) {
                passHeight=MEDIUM_PASS_HEIGHT;
            }
            
            //CHANGED
            //[ball setZVector:LOW_PASS_HEIGHT];

            [ball setZVector:passHeight];
            [ball setVector: passVectorFinal];
            //CCLOG(@">>> Pass to closest player - pass vector : %f,%f ", passVectorFinal.x,passVectorFinal.y);
            
            passCompletedTime=0;
            self.ballJustKicked=true;
            [[GameModel sharedGameModel] changeStatetoGamePlayingFromGoalKickHuman];
        }
    }
    else
    {
        //printf("\n** Player doesnt have ball ");
    }
}

-(void) passToClosestPlayerHumanHigh:(Ball *)ball
{
    //CCLOG(@">>> Pass to closest player");
    //if ([ball attached] && ([ball getTeamWithBallId] == [self teamId))
    
    if (![self isBallCloseEnoughForPassOrShotHuman:ball])
    {
        self.waitingToPass=true;
        return;
    }
    
    if ([self playerHasBall:ball])
    {
        //Player *closestPlayer = [team getClosestPlayer:self];
        Player *closestPlayer = [team getClosestPlayerHuman:self];
        
        if (closestPlayer != nil)
        {
            CGPoint passVector = ccpSub( [closestPlayer getAdvancedSpritePosition], [self getSpritePosition]);
            
            //
            float distanceToPlayer = ccpLength(passVector);
            //float passStrengthRatio = distanceToPlayer*2.0;
            float passStrengthRatio;
            
            if(distanceToPlayer < 150)
            {
                passStrengthRatio = distanceToPlayer*1.15; //1.25 //145
            }
            else
            {
                passStrengthRatio = distanceToPlayer*1.05; //1.15
            }
            
            //
            CGPoint passVectorNorm = ccpNormalize(passVector);
            //CGPoint passVectorFinal = ccpMult(passVectorNorm, 3 + arc4random() % 3 );
            CGPoint passVectorFinal = ccpMult(passVectorNorm, passStrengthRatio);
            
            [ball setAttached:false];
            [ball setZVector:3.5];
            [ball setVector: passVectorFinal];
            
            passCompletedTime=0;
            self.ballJustKicked=true;
        }
    }
    else
    {
        //printf("\n** Player doesnt have ball ");
    }
}

//
-(void) passToFurthestPlayer:(Ball *)ball
{
    //printf("** Pass to furthest player\n");
    //if ([ball attached] && ([ball getTeamWithBallId] == [self teamId))
    if ([self playerHasBall:ball])
    {
        
        Player *closestPlayer = [team getFurthestPlayer:self];
        
        if (closestPlayer != nil)
        {
            //printf("** Get closest player - id = %d\n", [closestPlayer getPlayerId]);
            
            //CGPoint passVector = ccpSub( [closestPlayer getSpritePosition], [self getSpritePosition]);
            CGPoint passVector = ccpSub( [closestPlayer getAdvancedSpritePosition], [self getSpritePosition]);
            
            //
            float distanceToPlayer = ccpLength(passVector);
            float passStrengthRatio = distanceToPlayer*1.0;
            
            //
            CGPoint passVectorNorm = ccpNormalize(passVector);
            //CGPoint passVectorFinal = ccpMult(passVectorNorm, 3 + arc4random() % 3 );
            //CGPoint passVectorFinal = ccpMult(passVectorNorm, passStrengthRatio);
            
            CGPoint passVectorFinal = ccpMult(passVectorNorm, passStrengthRatio);
            
            
            //ballAttached=false;
            // ballJustKicked=true;
            [ball setAttached:false];
            //[ball setzVector:5 + arc4random() % 20];
            //[ball setzVector:distanceToPlayer/50];
            
            //[ball setZVector:2.0];
            [ball setZVector: distanceToPlayer/75];
            
            
            
            //  CGPoint kickVec = ccp(5,5);
            [ball setVector: passVectorFinal];
            //printf("** ---> Pass vector = %f,%f",passVectorFinal.x, passVectorFinal.y);
            passCompletedTime=0;
            self.ballJustKicked=true;
        }
    }
    else
    {
        //printf("\n** Player doesnt have ball ");
    }
}



-(void) resetPassCompletedTime
{
    passCompletedTime=0;
}

//
-(void) passToClosestPlayerOld:(Ball *)ball
{
    //printf("** Pass to closest player\n");
    //if ([ball attached] && ([ball getTeamWithBallId] == [self teamId))
    if ([self playerHasBall:ball])
    {
        
        Player *closestPlayer = [team getClosestPlayer:self];
        
        if (closestPlayer != nil)
        {
            //printf("** Get closest player - id = %d\n", [closestPlayer getPlayerId]);
            
            CGPoint passVector = ccpSub( [closestPlayer getSpritePosition], [self getSpritePosition]);
            // CGFloat passStrength = 5.0;
            CGPoint passVectorNorm = ccpNormalize(passVector);
            CGPoint passVectorFinal = ccpMult(passVectorNorm, 4 + arc4random() % 3 );
            
            //ballAttached=false;
            // ballJustKicked=true;
            [ball setAttached:false];
            //[ball setZVector:1 + arc4random() % 12];
            [ball setZVector:1];
            
            //  CGPoint kickVec = ccp(5,5);
            [ball setVector: passVectorFinal];
            //printf("** ---> Pass vector = %f,%f",passVectorFinal.x, passVectorFinal.y);
            passCompletedTime=0;
            self.ballJustKicked=true;
        }
    }
    else
    {
        //printf("\n** Player doesnt have ball ");
    }
}

//
-(bool) isWithinBackwardPassDistance:(CGPoint)passTargetPos
{
    
    
    if (fabs(self.position.y - passTargetPos.y) <  BACKWARDS_MAX_PATH_LENGTH /* 250 *50*/) {
        //CCLOG(@">>Within backward pass distance... : %f", (fabs(self.position.y - passTargetPos.y)));
        return true;
    }
    //    if (ccpDistance(self.position, passTargetPos) < 200)
    //        return true;
    
    return false;
}

-(bool) isWithinBackwardCrossDistance:(CGPoint)passTargetPos
{
    if (fabs(self.position.y - passTargetPos.y) < BACKWARDS_CROSS_LENGTH)
        return true;
    //    if (ccpDistance(self.position, passTargetPos) < 200)
    //        return true;
    
    return false;
}

//
-(bool) isBackwardPass:(CGPoint)passVec
{
    if ([self isTeamShootingUp])
    {
        if (passVec.y < 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    else
    {
        if (passVec.y > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}


//
-(void) passToFurthestPlayerOld:(Ball *)ball
{
    //printf("** Pass to furthest player\n");
    if ([self playerHasBall:ball])
    {
        Player *closestPlayer = [team getFurthestPlayer:self];
        
        if (closestPlayer != nil)
        {
            //printf("** Get closest player - id = %d\n", [closestPlayer getPlayerId]);
            
            CGPoint passVector = ccpSub( [closestPlayer getSpritePosition], [self getSpritePosition]);
            
            CGPoint passVectorNorm = ccpNormalize(passVector);
            CGPoint passVectorFinal = ccpMult(passVectorNorm, 3 + arc4random() % 8);
            
            [ball setAttached:false];
            [ball setZVector:1 + arc4random() % 10];
            
            [ball setVector: passVectorFinal];
            //printf("** ---> Pass vector = %f,%f",passVectorFinal.x, passVectorFinal.y);
            passCompletedTime=0;
        }
    }
    else
    {
        //printf("\n** Player doesnt have ball ");
    }
    
}



// aka passCompletedTime
-(void) resetNoBallCollisionTime
{
    passCompletedTime=0;
}

-(bool) isPassCompletedTimeElapsed
{
    if (passCompletedTime > 15)
    {
        //passCompletedTime=0;
        return true;
    }
    return false;
}

//
-(int) getStrengthValue:(int) newStrength
{
    int variation = [Util random:8];
    int finalStrength=newStrength;
    
    if ([Util random:2] == 0)
    {
        finalStrength+=variation;
    }
    else
    {
        finalStrength-=variation;
    }
    return finalStrength;
}

//
-(void) checkPlayerCollision
{
    for (Player * oppPlayer in [[[self team] getOppTeam] getPlayers])
    {
        //if (CGRectIntersectsRect([self.sprite di, <#CGRect rect2#>)
        if (ccpDistance(self.position, oppPlayer.position) < 15)
        {
            //self.vector = ccpMult(self.vector, -2.0);
            //            int strengthDiff = [self getStrengthValue : self.strength] - [self getStrengthValue : [oppPlayer strength]];
            //            if (strengthDiff == 0)
            //            {
            //                strengthDiff=1;
            //            }
            
            self.collisionVector = ccpAdd(self.collisionVector,ccpMult(oppPlayer.vector, strength));
            // self.collisionVector = [self getVectorRotatedByRandomAngle:self.collisionVector : 90];
            
        }
    }
    
    for (Player * oppPlayer in [[self team] getPlayers])
    {
        //if (CGRectIntersectsRect([self.sprite di, <#CGRect rect2#>)
        if (playerId != oppPlayer.playerId)
        {
            if (ccpDistance(self.position, oppPlayer.position) < 10)
            {
                //self.vector = ccpMult(self.vector, -2.0);
                //                int strengthDiff = [self getStrengthValue : self.strength] - [self getStrengthValue : [oppPlayer strength]];
                //
                //                if (strengthDiff == 0)
                //                {
                //                    strengthDiff=1;
                //                }
                
                self.collisionVector = ccpAdd(self.collisionVector,ccpMult(oppPlayer.vector, strength));
                //self.collisionVector = [self getVectorRotatedByRandomAngle:self.collisionVector : 90];
                
            }
        }
    }
    
    //CCLOG(@">> COllision vector length = %f",ccpLength(self.collisionVector));
    
    if (ccpLength(self.collisionVector) > self.speed)
    {
        self.collisionVector= ccpMult(ccpNormalize(self.collisionVector), self.speed*0.5);
        //CCLOG(@">> COllision vector length = %f",ccpLength(self.collisionVector));
    }
    
    
}

//
-(void) checkBallJustKickedStatus:(Ball *)ball
{
    if (self.ballJustKicked && ![self isWithinBallCollisionRange:ball])
    {
        self.ballJustKicked=false;
    }
}

//
-(bool) isWithinBallCollisionRange:(Ball *)ball
{
    //if (ccpLengthSQ(ccpSub([ball position], self.sprite.position)) <= (10.0*10.0) && [ball z] <= PLAYER_HEIGHT)
    if (ccpLengthSQ(ccpSub([ball position], self.sprite.position)) <= (PLAYER_BALL_COLLISION_DIST*PLAYER_BALL_COLLISION_DIST)
        && [ball z] <= PLAYER_HEIGHT)
        
        //if (ccpDistance([ball position], self.sprite.position) <= 10.0 && [ball z] <= 10)
        
    {
        return true;
    }
    return false;
}

//
-(bool) isBallCollisionAlt:(Ball *)ball
{
    
    //    if (self.z > ()
    //    {
    //
    //    }
    //if (ccpLengthSQ(ccpSub([ball position], self.sprite.position)) <= (10.0*10.0) && [ball z] <= PLAYER_HEIGHT)
    if (ccpLengthSQ(ccpSub([ball position], self.sprite.position)) <= (PLAYER_BALL_COLLISION_DIST*PLAYER_BALL_COLLISION_DIST)
        && [ball z] <= PLAYER_HEIGHT)
    {
        //if (ccpDistance([ball position], self.sprite.position) <= 10.0 && [ball z] <= 10)
        if (!self.ballJustKicked)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    return false;
}

//
-(bool) isBallCollision:(Ball *)ball
{
    //if (CGRectIntersectsRect([[ball getSprite] boundingBox], sprite.boundingBox))
    if (![self isPassCompletedTimeElapsed]) {
        return false;
    }
    
    int collisionDistance =0;
    
    //if (ccpDistance([ball position], self.sprite.position) <= 10.0 && [ball z] <= 10)
    //CHANGED
    if ([[self team] isHumanTeam] && [Team getControlsActive]) {
        
        // give extra collision space for the first touch
        if ([self hadFirstTouch]) {
            collisionDistance=HUMAN_PLAYER_BALL_COLLISION_DIST;
        } else {
            collisionDistance=HUMAN_PLAYER_BALL_COLLISION_DIST_FIRST_TOUCH;
        }
        
    } else {
        collisionDistance=PLAYER_BALL_COLLISION_DIST;
    }
    
    //    if (ccpLengthSQ(ccpSub([ball position], self.sprite.position)) <= (collisionDistance*collisionDistance)
    //        && [ball z] <= PLAYER_HEIGHT)
    if (ccpLengthSQ(ccpSub([ball position], self.sprite.position)) <= (collisionDistance*collisionDistance)
        &&  ([ball z] <= PLAYER_HEIGHT+self.z))
    {
        return true;
    }
    
    
    return false;
}

//
-(bool) isBallCollisionOriginal:(Ball *)ball
{
    //if (CGRectIntersectsRect([[ball getSprite] boundingBox], sprite.boundingBox))
    if (![self isPassCompletedTimeElapsed]) {
        return false;
    }
    
    int collisionDistance =0;
    
    //if (ccpDistance([ball position], self.sprite.position) <= 10.0 && [ball z] <= 10)
    //CHANGED
    if ([[self team] isHumanTeam] && [Team getControlsActive]) {
    //if ([[self team] isHumanTeam]) {
        collisionDistance=HUMAN_PLAYER_BALL_COLLISION_DIST;
    } else {
        collisionDistance=PLAYER_BALL_COLLISION_DIST;
    }
    
//    if (ccpLengthSQ(ccpSub([ball position], self.sprite.position)) <= (collisionDistance*collisionDistance)
//        && [ball z] <= PLAYER_HEIGHT)
    if (ccpLengthSQ(ccpSub([ball position], self.sprite.position)) <= (collisionDistance*collisionDistance)
        &&  ([ball z] <= PLAYER_HEIGHT+self.z))
    {
        return true;
    }
    
    
    return false;
}

//
-(bool) isKeeperBallCollisionAlt:(Ball *)ball
{
    
    if (ccpLengthSQ(ccpSub([ball position], self.sprite.position)) <= (12.0*12.0) && [ball z] < (PLAYER_HEIGHT+self.z))
    {
        //if (ccpDistance([ball position], self.sprite.position) <= 10.0 && [ball z] <= 10)
        if (self.ballJustKicked)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    return false;
}

//
-(bool) isBallHeightWithinKeeperHeightRange : (Ball *)ball {
    //return ([ball z] < (PLAYER_HEIGHT+(self.z/2)) && [ball z] > (PLAYER_HEIGHT-(self.z/2)));
    return (([ball z] > (self.z-PLAYER_HEIGHT)) && ([ball z] < (self.z+PLAYER_HEIGHT)));
}


//
-(bool) isKeeperBallCollisionProximity:(Ball *)ball
{
    if (ccpLengthSQ(ccpSub([ball position], self.sprite.position)) <= (KEEPER_BALL_COLLISION_DIST*KEEPER_BALL_COLLISION_DIST)) {
        return true;
    }
    
    return false;
}

-(int) getBallKeeperIntersectionWidth {
    
    // EASY - make team one keeper better + other team worse
    // HARD - make other team hard - my team easy
    
    float width = BALL_KEEPER_INTERSECTION_WIDTH;
    //NSLog(@">KEEPER BALL WIDTH before : %f", width);
    
    
    switch([GameData getDifficulty]) {
        
        case EASY:
            if ([[self team] getTeamId] == TEAM1) {
                width+=width*(KEEPER_DIFFICULTY_PERC/PERCENT_100);
            }
            else {
                width-=width*(KEEPER_DIFFICULTY_PERC/PERCENT_100);
            }
            break;
            
        case MEDIUM:
            // nothing - leave width the same for both teams
            break;
            
        case HARD:
            // leave team 1 difficulty as default
            // make team 2 keeper harder
            
            if ([[self team] getTeamId] == TEAM2) {
                width+=width*(KEEPER_DIFFICULTY_PERC/PERCENT_100);
            }
//            else {
//                width-=width*(KEEPER_DIFFICULTY_PERC/PERCENT_100);
//            }
            break;
        
        default:
            break;
    }
    
    //NSLog(@">KEEPER BALL WIDTH after : %f", width);

    return width;
}


//
-(bool) isKeeperBallCollision:(Ball *)ball
{
#ifdef TURN_OFF_KEEPERS
    return false;
#endif
    
    if ([[GameModel sharedGameModel] isHalfOrFullTime])
    {
        return false;
    }
    
    if (ccpLengthSQ(ccpSub([ball position], self.sprite.position)) > (KEEPER_BALL_INTERSECTION_COLLISION_DIST*KEEPER_BALL_INTERSECTION_COLLISION_DIST)) {
        return false;
    }
    
    if (![self isBallHeightWithinKeeperHeightRange:ball]) {
        return false;
    }

    // get keeper intersection line based on sprite frame / keeper dive angle
    LineNode *keeperDiveLine = [self getKeeperDivingIntersectionLine];
    
    
#ifdef KEEPER_BALL_DIFFICULTY_ON
    
    // get ball intersection lines - need two - one vertical, one horizontal
    LineNode *ballHorizontalLine = [ball getBallHorizontalIntersectionLine:[self getBallKeeperIntersectionWidth]];
    LineNode *ballVerticalLine = [ball getBallVerticalIntersectionLine:[self getBallKeeperIntersectionWidth]];

#else
    LineNode *ballHorizontalLine = [ball getBallHorizontalIntersectionLine:BALL_KEEPER_INTERSECTION_WIDTH];
    LineNode *ballVerticalLine = [ball getBallVerticalIntersectionLine:BALL_KEEPER_INTERSECTION_WIDTH];

    
#endif

    
    
    
    bool ballHorizonalIntersect = false;
    bool ballVerticalIntersect = false;
    
    ballHorizonalIntersect = ccpSegmentIntersect(keeperDiveLine.startPoint, keeperDiveLine.endPoint,
                                                 ballHorizontalLine.startPoint, ballHorizontalLine.endPoint);
    
    ballVerticalIntersect = ccpSegmentIntersect(keeperDiveLine.startPoint, keeperDiveLine.endPoint,
                                                 ballVerticalLine.startPoint, ballVerticalLine.endPoint);
    
    if (ballHorizonalIntersect || ballVerticalIntersect) {
        
    #ifdef DRAW_KEEPER_BALL_SAVE_LINES
        [[[SceneManager sharedSceneManager] gameLayer] drawLineWithCustomTag : keeperDiveLine.startPoint : keeperDiveLine.endPoint
                                                                             : @"keeperCollIntersect" : [CCColor yellowColor]];
        
        [[[SceneManager sharedSceneManager] gameLayer] drawLineWithCustomTag :ballHorizontalLine.startPoint : ballHorizontalLine.endPoint
                                                                             : @"ballHorizIntersect" : [CCColor redColor]];
        
        [[[SceneManager sharedSceneManager] gameLayer] drawLineWithCustomTag :ballVerticalLine.startPoint : ballVerticalLine.endPoint
                                                                             : @"ballVerticalIntersect" : [CCColor redColor]];
      #endif
        
        return true;
    }
    
    return [self isKeeperBallCollisionProximity:ball];
    
    //return false;
}

//
-(bool) isKeeperBallCollisionOriginal:(Ball *)ball
{
#ifdef TURN_OFF_KEEPERS
    return false;
#endif
    
    
    if ([[GameModel sharedGameModel] isHalfOrFullTime])
    {
        return false;
    }
    
    // //if (![self isPassCompletedTimeElapsed])
    //     return false;
    
    //use sprite.position due to y offset when keeper is divingin air
    if (ccpLengthSQ(ccpSub([ball position], self.sprite.position)) <= (KEEPER_BALL_COLLISION_DIST*KEEPER_BALL_COLLISION_DIST)
        && [ball z] < (PLAYER_HEIGHT+(self.z/2)))
        //if (ccpDistance([ball position], self.position) <= 10.0 /*&& [ball z] <= 5*/)
    {
        return true;
    }
    return false;
}

//
-(bool) isTeamShootingUp
{
    return ([[self team] getPlayingDirection] == PLAYING_UP) ;
}

//
-(int) getTeamFacingDir
{
    return ([[self team] getPlayingDirection]);
}

//
-(CGPoint) calculateDefensiveTargetPos:(Ball *)ball
{
    int zone=0;
    
    if ([[self team] getPlayingDirection] == 0)
        zone= [Formation getZone:[ball position]];
    else
        zone= [Formation getReverseZone:[ball position]];
    
    if (zone <0 || zone >11)
        zone=5;
    
    NSValue *val = [playerPositions objectAtIndex:zone];
    CGPoint p = [val CGPointValue];
    
    int randomWidth = 20;
    
     // random pos based around core position...shape = square for now
    int randomX = p.x-randomWidth + arc4random() % 20 ;
    int randomY = p.y-randomWidth + arc4random() % 20 ;
    
    
    if ([[self team] getPlayingDirection] == 1)
    {
        p.x= 500-randomX; //480
        p.y= 710-randomY; //690
    }
    
    //
    if ([[self team] getPlayingDirection] == 0)
        p.y-=50;
    else
        p.y+=50;
    
    
    return p;
}

//
-(CGPoint) calculateTargetPosZone:(CGPoint)zonePos
{
    int zone=0;
    
    if ([[self team] getPlayingDirection] == PLAYING_UP)
        zone= [Formation getZone:zonePos];
    else
        zone= [Formation getReverseZone:zonePos];
    
    if (zone < 0) {
        zone=0;
    } else if (zone >11) {
        zone=11;
    }
    
    NSValue *val = [playerPositions objectAtIndex:zone];
    CGPoint p = [val CGPointValue];
    
    int randomWidth = 30;
    int randomX = p.x-randomWidth + arc4random() % 100 ;
    int randomY = p.y-randomWidth + arc4random() % 75 ;
  
    if ([[self team] getPlayingDirection] == 1)
    {
        p.x= 500-randomX; //480
        p.y= 710-randomY; //690
    }
    else
    {
        p.x = randomX;
        p.y = randomY;
    }
    return p;
}

-(CGPoint) calculateTargetPos:(Ball *)ball {
    return [self calculateTargetPosition : [ball position]];
}


-(CGPoint) calculateTargetPosition:(CGPoint)targetPosition

{
    //    CGPoint pitchPosPerc = [FormationUtil getPitchPositionPercentage: CGPointMake([ball position].x, [ball position].y)];
    //    CGPoint testBallPos = [FormationUtil getPlayerPitchPosition: pitchPosPerc :fPos];
    
    CGPoint pitchPosPerc = [FormationUtil getPitchPositionPercentage: targetPosition];
    
    CGPoint pTargetPos;
    if ([[self team] getPlayingDirection] == PLAYING_UP) {
        pTargetPos = [FormationUtil getPlayerPitchPosition: pitchPosPerc : [self formationPosition]];
        //NSLog(@">>> FOrmation Pos : %f,%f",[self formationPosition].horizontalPercAhead, [self formationPosition].horizontalPercBehind);
    } else {
        pTargetPos = [FormationUtil getPlayerPitchPositionInversed: pitchPosPerc : [self formationPosition]];

    }
    
    // random pos based around core position...shape = square for now
    int randomWidth = 60;
    
    float randomX = (-(randomWidth/2) + [Util random:randomWidth]) ;
    float randomY = (-(randomWidth/2) + [Util random:randomWidth]) ;
    
   // NSLog(@"Random x,y = %f,%f)",randomX,randomY);
    
    CGPoint pTargetPosRandom = CGPointMake(pTargetPos.x+randomX, pTargetPos.y+randomY);
    return pTargetPosRandom;

   // return pTargetPos;
}


//TODO
-(CGPoint) calculateTargetPosOriginal:(Ball *)ball
{
    int zone=0;
    
    if ([[self team] getPlayingDirection] == 0)
        zone= [Formation getZone:[ball position]];
    else
        zone= [Formation getReverseZone:[ball position]];
    
    if (zone<0 || zone >11)
    {
        zone=5;
    }
    
    NSValue *val = [playerPositions objectAtIndex:zone];
    CGPoint p = [val CGPointValue];
    
    int randomWidth = 50;
   
    // random pos based around core position...shape = square for now
    int randomX = p.x-randomWidth + arc4random() % 80 ;
    int randomY = p.y-randomWidth + arc4random() % 80 ;
 
    if ([[self team] getPlayingDirection] == PLAYING_DOWN)
    {
        p.x= 500-randomX; //480
        p.y= 710-randomY; //690
    }
    else
    {
        p.x = randomX;
        p.y = randomY;
    }
    return p;
}


//
-(void) setMoveVector
{
#ifdef DO_AFTER_PASS_STAND_STILL
    
    if (self.passJustMade)
    {
        self.stayStillAfterPassCounter++;
        
        //if comp - delay is slightly less
        int time = ([[self team] isHumanTeam] ?  STAY_STILL_AFTER_PASS_TIME : STAY_STILL_AFTER_PASS_TIME_COMP );
        
        
        if (self.stayStillAfterPassCounter < time)
        {
            // time hasnt elapsed - player can't move yet
            
            //CGPoint moveVector = ccpSub( targetPos, self.sprite.position);
            //CGPoint moveVectorNorm = ccpNormalize(moveVector);
            self.prevVector=self.vector;
            //self.vector=ccp(moveVectorNorm.x*self.speed,moveVectorNorm.y*self.speed);
            //[self setP]
            //;
            
            //TODO clean up setfaceballvectorissue - why do we have do seperate set vector to facingvector??
            //[self setFaceBallVector:[[GameModel sharedGameModel] getBall]];
            //self.vector=ccpNormalize(facingVector);
            //self.sprite.rotation = -CC_RADIANS_TO_DEGREES(ccpToAngle(self.vector))+90;
            
            [self setPlayerFaceBall:[[GameModel sharedGameModel] getBall]];
            self.vector=facingVector;
            
            return;
            
        }
        else
        {
            // ok to move now - reset
            stayStillAfterPassCounter=0;
            self.passJustMade=false;
        }
    }
#endif
    
    
    if (ccpFuzzyEqual(targetPos, self.sprite.position, 0.9))
    {
        self.vector=ccp(0,0);
    }
    else
    {
        CGPoint moveVector = ccpSub( targetPos, self.sprite.position);
        CGPoint moveVectorNorm = ccpNormalize(moveVector);
        self.prevVector=self.vector;
        self.vector=ccp(moveVectorNorm.x*self.speed,moveVectorNorm.y*self.speed);
        self.sprite.rotation = -CC_RADIANS_TO_DEGREES(ccpToAngle(self.vector))+90;
    }
}

// TODO - refactor - seperate speed from movevector method so we can pass it in
-(void) setMoveVectorHalfSpeed
{
    //if (ccpFuzzyEqual(targetPos, self.sprite.position, 1.0)) // HACK vector - 0.5
    if (ccpLengthSQ(ccpSub(self.sprite.position, targetPos)) <= (5*5))
    {
        self.vector=ccp(0,0);
    }
    else
    {
        CGPoint moveVector = ccpSub( targetPos, self.sprite.position);
        CGPoint moveVectorNorm = ccpNormalize(moveVector);
        self.prevVector=self.vector;
        self.vector=ccp(moveVectorNorm.x*(self.speed/4),moveVectorNorm.y*(self.speed/4));
        self.sprite.rotation = -CC_RADIANS_TO_DEGREES(ccpToAngle(self.vector))+90;
    }
}


//
-(void) setMoveVectorRunoutWithSpeed:(float) runSpeed
{
    if (ccpFuzzyEqual(targetPos, self.sprite.position, 0.5))
    {
        self.vector=ccp(0,0);
    }
    else
    {
        CGPoint moveVector = ccpSub( targetPos, self.sprite.position);
        CGPoint moveVectorNorm = ccpNormalize(moveVector);
        self.prevVector=self.vector;
        self.vector=ccp(moveVectorNorm.x*runSpeed,moveVectorNorm.y*runSpeed);
        self.sprite.rotation = -CC_RADIANS_TO_DEGREES(ccpToAngle(self.vector))+90;
    }
}

//
-(void) setMoveVectorRunout
{
    if (ccpFuzzyEqual(targetPos, self.sprite.position, 0.5))
    {
        self.vector=ccp(0,0);
    }
    else
    {
        CGPoint moveVector = ccpSub( targetPos, self.sprite.position);
        CGPoint moveVectorNorm = ccpNormalize(moveVector);
        self.prevVector=self.vector;
        self.vector=ccp(moveVectorNorm.x*RUNOUT_SPEED,moveVectorNorm.y*RUNOUT_SPEED);
        self.sprite.rotation = -CC_RADIANS_TO_DEGREES(ccpToAngle(self.vector))+90;
    }
}


-(void)setTargetPos:(CGPoint)target
{
    targetPos=target;
}

-(bool) isAtTargetPos
{
    ////printf("\nisAtTargetPos Distance = %f, target x,y = %f,%f , sprite x,y = %f, %f", ccpDistance(sprite.position, targetPos),targetPos.x, targetPos.y, sprite.position.x, sprite.position.y);
    
    
    if (ccpLengthSQ(ccpSub(self.sprite.position, targetPos)) <= (5*5))
        //if (ccpDistance(self.sprite.position, targetPos) <= 5)
    {
        return true;
    }
    
    return false;
}

//
-(bool)isPlayerTurning
{
    //return false;
    //return true;
    //CCLOG(@">> Prev Rot:  %f, currentRot: %f", self.prevSpriteRotation, spriteRotation);
    CCLOG(@">> Prev vec:  %f,%f current vec: %f,%f", self.prevVector.x, self.prevVector.y, self.vector.x, self.vector.y);
    
    if (ccpFuzzyEqual(ccpNormalize(self.prevVector), ccpNormalize(self.vector), 0.5))
    {
        CCLOG(@"<<< Not turning...");
        return false;
    }
    else
    {
        CCLOG(@"<<< turning...");
        return true;
        
    }
}

- (void)doControlBall:(CGPoint)pVector ball:(Ball *)ball
{
    // if player is facing away from goal
    // ball isn't a collision
    
    if (ccpLength(self.vector) > 0)
    {
        [ball setVector: ccpMult(ccpNormalize(self.vector), self.speed*HUMAN_PLAYER_SPEED_INCREASE)];
    }
    else
    {
        if ([self z] > 0) {
            int rand = [Util random:90];
            float controlRatio = (float)10/(10+rand);
            //CCLOG(@">>Control Ratio : %f",controlRatio);
            [ball setVector : ccpMult(pVector, self.speed*(0.4+controlRatio))];
        } else {
            [ball setVector : ccpMult(pVector, self.speed*HUMAN_PLAYER_SPEED_INCREASE)];
    
        }
    }
 
    [ball setTeamAndPlayerWithBallId:[self getTeamId] :[self playerId]];
    [ball setJustControlled:true];
    [self setHadFirstTouch:true];
    //[ball setAttached:true];
    passCompletedTime=0;
    self.ballJustKicked=true;
    //[ball setZ:1.0];
    [ball setZVector:[ball zVector]/2];
    
    //
    if ([Util random1inX:5]) {
        [self doPlayerTouchBallSound];
    }
}

//
-(void) doFirstTouchNonStickyBall:(Ball *)ball
{
    //CCLOG(@">>>>FIRST TOUCH");
    CGPoint pVector;
    pVector = ccpForAngle(-CC_DEGREES_TO_RADIANS(self.sprite.rotation )+90);
    
//    #ifdef ALLOW_PASSTHROUGH_STICKY_BALL
//        //if ([self isBallCollision:ball] && [self isPlayerFacingGoal]) {
//        if ([self isBallCollision:ball]) {
//            // only do pass through sticky half the time
//            if ([self isPlayerFacingGoal]) {
//                if ([Util random5050]) {
//                    return;
//                }
//            
//    #else
//        if ([self isBallCollision:ball]) {
//    #endif
    
    if ([self isBallCollision:ball]) {
        
        //if facing goal control it
        if ([self isPlayerFacingGoal]) {
            [self doControlBall:pVector ball:ball];
        } else {
            //only control half the time / let ball run through body
            #ifdef ALLOW_PASSTHROUGH_STICKY_BALL
                //to do - check if ball too fast or too slow
                //if ([Util random5050]) {
                
                // if human player - just control it
                //TODO allow human players to control ball via pass through
                
                if ([[self team] isHumanTeam]) {
                    [self doControlBall:pVector ball:ball];
                }
                else
                {
                    if ([Util random1inX:10]) {
                        [self doControlBall:pVector ball:ball];
                    }
                }
            #else
                [self doControlBall:pVector ball:ball];

            #endif

        }
        
        
        // if not facing goal
//        if (![self isPlayerFacingGoal]) {
//            //half the time let the ball g through so player controls it on the turn
//            if ([Util random5050]) {
//                return;
//            }
//
//            [self doControlBall:pVector ball:ball];
//        }
    }
}

-(void) doPlayerStoppedMovingCheck:(Ball *) ball
{
    CGPoint pVector;
    pVector = ccpForAngle(-CC_DEGREES_TO_RADIANS(self.sprite.rotation)+90);
    
    if (ccpLength(self.vector) <= 1)
    {
        CCLOG(@">>Stopping ball");
        [ball setVector : ccp(0,0)];
        CGPoint playerBallVec = ccpMult(pVector, PLAYER_BALL_COLLISION_DIST);
        CGPoint stickyBallPos = ccpAdd(self.position, playerBallVec);
        [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
    } else {
        CCLOG(@"Player stop vector (length) = %f", ccpLength(self.vector));
    }
}

-(float) getPlayerSpeedIncrease {
    float increase = 0.1f;
    switch([GameData getDifficulty]) {
            
        case EASY:
            increase=PLAYER_SPEED_INCREASE_EASY;
            break;
            
        case MEDIUM:
            increase=PLAYER_SPEED_INCREASE_MEDIUM;
            break;
            
        case HARD:
            increase=PLAYER_SPEED_INCREASE_HARD;
            break;
            
        default:
            increase=PLAYER_SPEED_INCREASE_MEDIUM;
            break;
    }

    return increase;
}

//
//
-(void) doCompNonStickyBall:(Ball *)ball
{
    CGPoint pVector;
    pVector = ccpForAngle(-CC_DEGREES_TO_RADIANS(self.sprite.rotation)+90);
    
    if ([self isBallCollision:ball])
    {
        if ([Util random1inX:5]) {
            [self doPlayerTouchBallSound];
        }
        
        if (ccpLength(self.vector) > 0)
        {
            [ball setVector : ccpMult(ccpNormalize(self.vector), self.speed* [self getPlayerSpeedIncrease])];
        }
        else
        {
            [ball setVector : ccpMult(pVector, self.speed* [self getPlayerSpeedIncrease])];
        }
    } else {
        // player stops, ensure ball stops . or reverses
//        if (ccpDistance([self position], [ball position]) > 20) {
//            //[ball setVector :ccp(0,0)];
//            CGPoint playerBallVec = ccpMult(pVector, PLAYER_BALL_COLLISION_DIST);
//            CGPoint stickyBallPos = ccpAdd(self.position, playerBallVec);
//            [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
//
//        }
    }
    
    
    
    //if ball and player not aligned - i.e. player has turned
    if (!ccpFuzzyEqual(ccpNormalize([ball vector]), ccpNormalize(self.vector), 0.1))
    {
        //CGPoint playerBallVec = ccpMult(pVector, ccpDistance([ball position], self.position));
        //CGPoint playerBallVec = ccpMult(pVector, 10.0);
        CGPoint playerBallVec = ccpMult(pVector, PLAYER_BALL_COLLISION_DIST);
        CGPoint stickyBallPos = ccpAdd(self.position, playerBallVec);
        [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
    }
    
    
    //if ([self isBallCollision:ball])
    //{
    //    if ([self isPlayerTurning])
    //    {
    //        [self resetPassCompletedTime];
    //        CGPoint playerBallVec = ccpMult(pVector, 8.0);
    //        CGPoint stickyBallPos = ccpAdd(self.position, playerBallVec);
    //        [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
    //    }
    //    else
    //    {
    //        CCLOG(@">> PLAYER NOT TURNING");
    //        if ([self isBallCollision:ball])
    //        {
    ////            CGPoint playerBallVec = ccpMult(pVector, 11.0);
    ////            CGPoint stickyBallPos = ccpAdd(self.position, playerBallVec);
    ////            [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
    //
    //            if (ccpLength(self.vector) > 0)
    //            {
    //                [ball setVector: ccpMult(ccpNormalize(self.vector), self.speed*2.8)];
    //               // passCompletedTime=5;
    //            }
    //            else
    //            {
    //                [ball setVector : ccpMult(pVector, self.speed*2.8)];
    //                //passCompletedTime=5;
    //            }
    //
    //        }
    //
    //    }
    //}
    
    //        CGPoint stickyBallPos = ccpAdd(self.position, playerBallVec);
    //        [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
    
    //passCompletedTime=15;
    
    
}

//
-(void) doCompNonStickyBallOld:(Ball *)ball
{
    CGPoint pVector;
    pVector = ccpForAngle(-CC_DEGREES_TO_RADIANS(self.sprite.rotation )+90);
    //    CGPoint playerBallVec = ccpMult(pVector, 8.0);
    //
    if ([self isBallCollision:ball])
    {
        //        if (ccpFuzzyEqual(ccpNormalize([ball vector]), ccpNormalize(self.vector), 0.25))
        //        //if ([self isPlayerTurning])
        //        {
        //            CCLOG(@">>1>BALL NOT INLINE WITH PLAYER.. ADJUSTING");
        //            CGPoint playerBallVec = ccpMult(pVector, 8.0);
        //            CGPoint stickyBallPos = ccpAdd(self.position, playerBallVec);
        //            [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
        //            //[ball setVector : ccpMult(pVector, self.speed*2.8)];
        //        }
        //        else
        //        {
        //[ball setVector : ccpMult(pVector, self.speed*2.2)];
        if ([self isPlayerTurning])
        {
            CCLOG(@">> PLAYER TURNING");
            CGPoint playerBallVec = ccpMult(pVector, 10.0);
            CGPoint stickyBallPos = ccpAdd(self.position, playerBallVec);
            [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
        }
        else
        {
            //            CGPoint playerBallVec = ccpMult(pVector, 5.0);
            //            CGPoint stickyBallPos = ccpAdd(self.position, playerBallVec);
            //            [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
            
            CCLOG(@">> PLAYER NOT TURNING");
            if (ccpLength(self.vector) > 0)
            {
                [ball setVector: ccpMult(ccpNormalize(self.vector), self.speed*2.9)];
            }
            else
            {
                [ball setVector : ccpMult(pVector, self.speed*2.9)];
            }
            
        }
        
        //        CGPoint stickyBallPos = ccpAdd(self.position, playerBallVec);
        //        [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
        
        //passCompletedTime=15;
        
    }
    else{
        
        if ([self isPlayerTurning])
            //if (!ccpFuzzyEqual(ccpNormalize([ball vector]), ccpNormalize(self.vector), 0.1))
        {
            //CCLOG(@">>2>BALL NOT INLINE WITH PLAYER.. ADJUSTING");
            CGPoint playerBallVec = ccpMult(pVector, 10.0);
            CGPoint stickyBallPos = ccpAdd(self.position, playerBallVec);
            [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
            //passCompletedTime=0;
        }
        else
        {
            CGPoint playerBallVec = ccpMult(pVector, ccpDistance([ball position], self.position));
            //playerBallVec = ccpMult(playerBallVec,0.95);
            CGPoint stickyBallPos = ccpAdd(self.position, playerBallVec);
            [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
            
        }
    }
    //[ball setVector : ccpMult(pVector, 10.0)];
    
    //CGPoint stickyBallPos = ccpAdd(self.position, playerBallVec);
    
    //[ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
    
    //     [ball setTeamWithBallId: [self teamId]];
    //     [ball setPlayerWithBallId:playerId];
    //     [ball setAttached:true];
    //    [ball setZ:1.0];
    //    [ball setZVector:1.0];
}

//
-(void) doCompStickyBall:(Ball *)ball
{
    CGPoint pVector;
    pVector = ccpForAngle(-CC_DEGREES_TO_RADIANS(self.sprite.rotation)+90);
    
    CGPoint playerBallVec = ccpMult(pVector, 8.0);
    CGPoint stickyBallPos = ccpAdd(self.position, playerBallVec);
    
    [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
    
//    [ball setTeamWithBallId: [self teamId]];
//    [ball setPlayerWithBallId:playerId];
    [ball setTeamAndPlayerWithBallId:[self getTeamId] :[self playerId]];

    [ball setAttached:true];
    [ball setZ:1.0];
    [ball setZVector:1.0];
    
    //
    [self setHadFirstTouch:false];
    [ball setJustControlled:false];
}

//
-(void) doKeeperStickyBall:(Ball *)ball
{
    CGPoint pVector;
    //CCLOG(@">> DO KEEPER STICKY BALL");
    // pVector = ccpForAngle(-CC_DEGREES_TO_RADIANS(spriteRotation)+90);
    
    //CGPoint playerBallVec = ccpMult(pVector, 5.0);
    
    if ([[self team] isPlayingUpPitch]) {
        pVector=ccp(0,PLAYER_BALL_COLLISION_DIST);
    } else {
        pVector=ccp(0,-PLAYER_BALL_COLLISION_DIST);
    }
    
    CGPoint stickyBallPos = ccpAdd(self.sprite.position, pVector);
    
    // set ball data
    [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
    
//    [ball setTeamWithBallId: [self teamId]];
//    [ball setPlayerWithBallId:playerId];
    [ball setTeamAndPlayerWithBallId:[self getTeamId] :[self playerId]];

    
    [ball setAttached:true];
    [ball setVector:self.vector];
    
    //[ball setZ:self.z];
    [ball setZVector:1.0];
    
    // Ensure keeper is facing the ball
    //[self setPlayerFaceBall:[[GameModel sharedGameModel] getBall]];
    //[self.sprite setColor: [CCColor blackColor]];


}

//
-(void) doKeeperSaveStickyBall:(Ball *)ball
{
    CGPoint pVector;
    //CCLOG(@">> DO KEEPER STICKY SAVE BALL ***");
    // pVector = ccpForAngle(-CC_DEGREES_TO_RADIANS(spriteRotation)+90);
    
    //CGPoint playerBallVec = ccpMult(pVector, 5.0);
    
//    if ([[self team] isPlayingUpPitch])
//        pVector=ccp(0,8);
//    else
//        pVector=ccp(0,-8);
//    
//    CGPoint stickyBallPos = ccpAdd(self.sprite.position, pVector);
//    
//    
//    //[ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
//    [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
    
    //ADDED
//    if ([[self team] isPlayingUpPitch]) {
//        pVector=ccp(0,PLAYER_BALL_COLLISION_DIST);
//    } else {
//        pVector=ccp(0,-PLAYER_BALL_COLLISION_DIST);
//    }
    
    if ([[self team] isPlayingUpPitch]) {
        pVector=ccp(0,KEEPER_BALL_COLLISION_DIST);
    } else {
        pVector=ccp(0,-KEEPER_BALL_COLLISION_DIST);
    }
    
    CGPoint stickyBallPos = ccpAdd(self.sprite.position, pVector);
    [ball setPositionX:stickyBallPos.x Y:stickyBallPos.y];
    
//    [ball setTeamWithBallId: [self teamId]];
//    [ball setPlayerWithBallId:playerId];
    [ball setTeamAndPlayerWithBallId:[self getTeamId] :[self playerId]];
    
    [ball setAttached:true];
    //[ball setVector:self.vector];
    
    [ball setVector:CGPointMake(0.0, 0.0)];


    [ball setZ: self.z];
    [ball setZVector:0.f];
    
    //[ball setVector:self.vector];

    
   // [ball setZ:20];
    
    //[self.sprite setColor: [CCColor blackColor]];
    //[ball setZ:self.z];
    //[ball setZVector:1.0];
    
}

//
-(void) checkBoundary
{
    //NSLog(@">>Check boundary...");
    int playerX = self.sprite.position.x;
    int playerY = self.sprite.position.y;
    
    
    if (playerX < PITCH_LEFT) {
        playerX = PITCH_LEFT;
        [self setPositionX:playerX Y:playerY];

    }
    else if(playerX > PITCH_RIGHT)
    {
        playerX=PITCH_RIGHT;
        [self setPositionX:playerX Y:playerY];

    }
    
    if(playerY<PITCH_BOTTOM) {
        playerY=PITCH_BOTTOM;
        [self setPositionX:playerX Y:playerY];

    }
    else if(playerY>PITCH_TOP)
    {
        playerY=PITCH_TOP;
        [self setPositionX:playerX Y:playerY];

    }
    
    
    
    //    int ballX = [ball getSprite].position.x;
    //    int ballY = [ball getSprite].position.y;
    //
    //    if (ballX < 5)
    //    {
    //        ballX = 475;
    //        [ball setPositionX:ballX Y:ballY];
    //    }
    //    else if(ballX >475)
    //    {
    //        ballX=5;
    //        [ball setPositionX:ballX Y:ballY];
    //    }
    
    
    //    if(playerY<5)
    //        playerY=680;
    //    else if(playerY>680)
    //        playerY=5;
    
    //   [self setPositionX:playerX Y:playerY];
    
}

-(void) doStickyBall:(Ball *)ball
{
    
    /*
     ball->vec.x=player->vec.x+Real_From_Int(0);
     ball->vec.y=player->vec.y+Real_From_Int(0);
     ball->z=0;
     ball->original_z_velocity=0;
     ball->current_z_velocity= 0;
     */
    
    //if (!ballAttached) {
    
    //  [ball setVector: &vector];
    //  //printf("* doStickyBall : vector x,y = %f,%f", vector.x, vector.y);
    
    //}
    
	switch(playerDirection) {
            
		case 1:	{
            [ball setPositionX:self.sprite.position.x Y:self.sprite.position.y+8];
			//ball->pos.x = player->pos.x + Real_From_Int(0);
			//ball->pos.y = player->pos.y - PLAYER_BALL_GAP;
			break;
		}
            
		case 2:	{
			//ball->pos.x = player->pos.x + PLAYER_BALL_DIAGONAL_GAP;
			//ball->pos.y = player->pos.y - PLAYER_BALL_DIAGONAL_GAP;
			break;
		}
		case 3:	{
			//ball->pos.x = player->pos.x + PLAYER_BALL_GAP;
			//ball->pos.y = player->pos.y + Real_From_Int(0);
            [ball setPositionX:self.sprite.position.x+8 Y:self.sprite.position.y];
			break;
		}
            
		case 4:	{
			//ball->pos.x = player->pos.x + PLAYER_BALL_DIAGONAL_GAP;
			//ball->pos.y = player->pos.y + PLAYER_BALL_DIAGONAL_GAP;
			break;
		}
            
		case 5:	{
			//ball->pos.x = player->pos.x - Real_From_Int(0);
			//ball->pos.y = player->pos.y + PLAYER_BALL_GAP;
            [ball setPositionX:self.sprite.position.x Y:self.sprite.position.y-8];
			
			break;
		}
            
            
		case 6:	{
			//ball->pos.x = player->pos.x - PLAYER_BALL_DIAGONAL_GAP;
			//ball->pos.y = player->pos.y + PLAYER_BALL_DIAGONAL_GAP;
			break;
		}
            
		case 7:	{
			//ball->pos.x = player->pos.x - PLAYER_BALL_GAP;
			//ball->pos.y = player->pos.y - Real_From_Int(0);
            [ball setPositionX:self.sprite.position.x-8 Y:self.sprite.position.y];
            
			break;
		}
            
		case 8:	{
			//ball->pos.x = player->pos.x - PLAYER_BALL_DIAGONAL_GAP;
			//ball->pos.y = player->pos.y - PLAYER_BALL_DIAGONAL_GAP;
			break;
		}
            
		default:
			break;
	}
    
    
    
}

//
-(CGFloat) getSpriteRotation
{
    return self.sprite.rotation ;
}

//
-(void) setSpriteRotation:(CGFloat)rotation
{
    //self.prevSpriteRotation=spriteRotation;
    self.sprite.rotation=rotation;
}

// Vector approach instead of degrees - seems to work the same
-(void) setSpriteRotationHumanControlsVector:(CGPoint)controlVector : (Ball *)ball
{
    //self.prevSpriteRotation=spriteRotation;
    self.vector=controlVector;
    //self.sprite.rotation=rotation;
    /*if ([self isBallCollision:ball] || [self playerHasBall:ball])
     {
     [self doCompStickyBall:ball];
     
     }*/
    
    if([self isBallCollision:ball] ||  [self playerHasBall:ball]) {
        if ([self hadFirstTouch])
        {
            //CCLOG(@">>>>HAD FIRST TOUCH - Do control");
            //[self doCompStickyBall:ball];
            [self doCompNonStickyBall:ball];
            
        }
        else
        {
            [self doFirstTouchNonStickyBall:ball];
        }
        
    }
}
-(void) setSpriteRotationHumanControls:(CGFloat)rotation : (Ball *)ball
{
    //self.prevSpriteRotation=spriteRotation;
    
    self.sprite.rotation=rotation;
    /*if ([self isBallCollision:ball] || [self playerHasBall:ball])
    {
        [self doCompStickyBall:ball];
        
    }*/
    
    if([self isBallCollision:ball] ||  [self playerHasBall:ball]) {
        if ([self hadFirstTouch])
        {
            //CCLOG(@">>>>HAD FIRST TOUCH - Do control");
            //[self doCompStickyBall:ball];
            [self doCompNonStickyBall:ball];
            
        }
        else
        {
            [self doFirstTouchNonStickyBall:ball];
        }

    }
}
//
-(int) getPlayerDirection:(CGPoint *) vec
{
    
	float xVec = vec->x;
	float yVec = vec->y;
    
    //  //printf("\n *getDirection, xVec,yVec = %f,%f\n", xVec, yVec);
	
    
	if (xVec == 0) {
        
		if (yVec < 0) {
			return TURN_LEFT;
		} else if (yVec > 0) {
			return 5;
		}
        
	} else if (xVec > 0) {
		
		if ( (yVec >= 0 && yVec < 2)  ||  (yVec <= 0 && yVec > -2)) {
			return 3;
		} else if (yVec > 0) {
			return 4;
		} else if (yVec < 0) {
			return 2;
		}
        
        
	} else if (xVec < 0)  {
        
		if ( (yVec >= 0 && yVec < 2)  ||  (yVec <= 0 && yVec > -2)) {
			return 7;
		} else if (yVec > 0) {
			return 6;
		} else if (yVec < 0) {
			return 8;
		}
	}
	
	/* Player must be standing still */
    
	return 0;
}



-(bool)isPlayerAheadOld:(CGPoint)activePlayerPos P:(CGPoint)player
{
    CGPoint toOppPlayerVec;
    CGPoint feelerVecProj;
    CGPoint oppFeelerDiffVec;
    CGPoint feelerVec=ccp(0,200);
    CGPoint feelerVecNorm;
    
    
    feelerVecNorm = ccpNormalize(feelerVec);    // u
    feelerVec = ccpMult(feelerVecNorm, 50.0);
    
    toOppPlayerVec = ccpSub(player, activePlayerPos); // a =
    
    // project toOppPlayerVec to feelerVec
    feelerVecProj = ccpMult (feelerVecNorm, ccpDot(toOppPlayerVec, feelerVecNorm)) ; // p =
    
    // get distance between feeler vec and toOppPlayerVec
    oppFeelerDiffVec = ccpSub( feelerVecProj, toOppPlayerVec); // b
    
    //printf("** 11b diff = %f", ccpLength(oppFeelerDiffVec));
    if(ccpLength(feelerVecProj) > ccpLength(feelerVec))
    {
        //printf("\n 11** OPP PLAYER TOO FAR AHEAD ***");
    }
    CGPoint fovVec;
    if ((ccpLength(oppFeelerDiffVec) < 10) && ((ccpLength(feelerVecProj) < ccpLength(feelerVec))))
    {
        //printf("\n 11** PLAYER IS AHEAD ***");
        fovVec = [self getFOV: player];
        
        if (fovVec.x < 0)
        {
            //[self setPositionX:475 Y:[self getSpritePosition].y];
            //printf("\n*** 11-----> To the left ***");
        }
        else
        {
            //[self setPositionX:5 Y:[self getSpritePosition].y];
            //printf("\n*** 11-----> To the right ***");
            
        }
        return true;
    }
    return false;
}



//
-(CGPoint)getFOV:(CGPoint)pos
{
    CGPoint u;
    u = [Player VRotate2D:CC_DEGREES_TO_RADIANS(self.sprite.rotation) vector:pos];
    u = ccpNormalize(u);
    //printf("*** getFOV : spriteRotation = %f",spriteRotation);
    
    return u;
}

//
-(bool)isInHumanNarrowFOV:(CGPoint)pos
{
    //return [self isInFOV:pos];
//    NSLog(@"isInHumanNarrowFOV...");
//    NSLog(@"isInHumanNarrowFOV... Pos : %f,%f",pos.x,pos.y);
   // NSLog(@"isInHumanNarrowFOV... Pos : %@",&pos);

    //TODO find the real issue
    
    if (isnan(pos.x) || isnan(pos.y)) {
        NSLog(@"isInHumanNarrowFOV NaN error..continuing");
        
        return false;
    }
    
    CGPoint u;
    u = [Player VRotate2D:CC_DEGREES_TO_RADIANS(self.sprite.rotation) vector:pos];
    u = ccpNormalize(u);
    
    if ((u.y > 0) && ( fabs(u.x) < (fabs(u.y) * 1)) )
    {
        //CCLOG(@">> in view...");
        //NSLog(@"isInHumanNarrowFOV 2...");

        return true;
    }
   // NSLog(@"isInHumanNarrowFOV 3...");

    return false;
}

//
-(bool)isInNarrowFOV:(CGPoint)pos
{
    return [self isInFOV:pos];
    
    //    CGPoint u;
    //    u = [Player VRotate2D:CC_DEGREES_TO_RADIANS(spriteRotation) vector:pos];
    //    u = ccpNormalize(u);
    //    
    //    if ((u.y > 0) && ( fabs(u.x) < (fabs(u.y) * 1.0)) )
    //    {
    //        return true;
    //    }
    //    
    //    return false;
}


//
-(bool)isInFOV:(CGPoint)pos
{
    CGPoint u;
    u = [Player VRotate2D:CC_DEGREES_TO_RADIANS(self.sprite.rotation ) vector:pos];
    u = ccpNormalize(u);
    
    if (u.y > 0)
    {
        return true;
    }
    
    return false;
}

+(bool)isInFOV:(CGFloat)angle position:(CGPoint)pos
{
    CGPoint u;
    //printf("\n*** isFOV ***..");
    u = [Player VRotate2D:angle vector:pos];
    //printf("\n*** done rotation..");
    u = ccpNormalize(u);
    //printf("\n*** normalised..");
    //printf("\n U Vec = %f,%f", u.x, u.y);
    
    
    
    if (u.x > 0)
    {
        //printf("\n**--> player right");
    } 
    else if (u.x == 0)
    {
        //printf("\n**--> player directly infront");
    }
    
    else 
    {
        //printf("\n**--> player left");
    }
    
    if (u.y > 0)
    {
        //printf("\n**--> player ahead");
    } 
    else
    {
        //printf("\n**--> player behind");
    }
    
    return false;
    
}

+(CGPoint)VRotate2D:(CGFloat)angle vector:(CGPoint)u
{
	CGFloat	x,y;
    
	//x = u.x * cos(CC_DEGREES_TO_RADIANS(-angle)) + u.y * sin(CC_DEGREES_TO_RADIANS(-angle));
	//y = -u.x * sin(CC_DEGREES_TO_RADIANS(-angle)) + u.y * cos(CC_DEGREES_TO_RADIANS(-angle));
    
    x = u.x * cos(-angle) + u.y * sin(-angle);
	y = -u.x * sin(-angle) + u.y * cos(-angle);
    
	return ccp(x,y);
}

+(void) doTest
{
    CGPoint target = ccp(49,99);
    CGPoint source = ccp(50,100);
    // CGPoint sourceVec = ccp(20,0);
    
    bool inFov;
    
    inFov = [Player isInFOV:CC_DEGREES_TO_RADIANS(90) position:ccpSub(target,source)];
    
    
    
    
}
@end

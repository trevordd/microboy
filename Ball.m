//
//  Ball.m
//  mySoccer
//
//  Created by Trevor Delves on 14/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Ball.h"
#import "GameLayer.h"
#import "Team.h"
#import "CCNode_Private.h"

@implementation Ball

@synthesize attached;
@synthesize justControlled;
@synthesize teamWithBallId;
@synthesize playerWithBallId;
@synthesize possessionId;
@synthesize curlAngle;
@synthesize prevPos;;
@synthesize currentZoneX;
@synthesize previousZoneX;
@synthesize currentZoneY;
@synthesize previousZoneY;

static Ball *ball = nil;


//TDOD: work out how to make it a singleton with initialisation
+ (Ball*)getBall
{
    if (ball == nil) {
        ball = [[super alloc] init];
    }
    return ball;
}


//ToDO: make Ball Singleton getInstance

// on "init" you need to initialize your instance
-(id) initWithSprite:(NSString *)spriteName :(GameLayer *)layer {
    
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
        _gameLayer = layer;
        sprite = [CCSprite spriteWithImageNamed:spriteName];
        self.shadow = [CCSprite spriteWithImageNamed: @"ballShadow.png"];
        self.shadow.opacity=0.6;
        //self.shadow.scale=0.75;
        //self.sprite.scale=0.90;
        self.sprite.scale=0.75;
        self.shadow.scale=0.50;
        self.shadow.zOrder=0;
    
        
        //ccColor3B ballColor = {255,130,0};
        //[self.sprite setColor:ballColor];
        
        
        [_gameLayer addChild: self.shadow];
        [_gameLayer addChild: self.sprite];
        
        attached=false;
        self.position=ccp(0,0);
    }
    
    return self;
}

//
-(id) initWithSpriteNoLayer:(NSString *)spriteName
{
    
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] ))
    {
        
        self.sprite = [CCSprite spriteWithImageNamed:spriteName];
        self.shadow = [CCSprite spriteWithImageNamed: @"ballShadow.png"];
        self.shadow.opacity=0.65;
        //self.shadow.scale=0.75;
        //self.sprite.scale=0.90;
        self.sprite.scale=0.50;
        self.shadow.scale=0.5;
        self.position=ccp(0,0);
        
        //ccColor3B ballColor = {255,130,0};
        //[self.sprite setColor:ballColor];
        
        attached=false;
    }
    
    return self;
}

-(id) initNoSprite
{
    
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
        //        _gameLayer = layer;
        //        sprite = [CCSprite spriteWithSpriteFrameName:spriteName];
        //        self.shadow = [CCSprite spriteWithImageNamed: @"ballShadow.png"];
        //        self.shadow.opacity=90;
        //        self.shadow.scale=0.75;
        //        self.sprite.scale=0.90;
        
        // [_gameLayer addChild: self.sprite];
        // [_gameLayer addChild: self.shadow];
        
        attached=false;
        self.position=ccp(0,0);
    }
    
    return self;
}

//
-(void) setGameLayer :(GameLayer *)layer
{
    _gameLayer = layer;
}

// this could be the team has the ball or the ball is free and was the last team to touch it
-(bool) doesOppTeamHaveBall:(Team *)currentTeam
{
    if ([currentTeam getTeamId] == [self teamWithBallId])
        return false;
    
    return true;
}

//
-(bool) doesTeamHaveHaveBallOrWasLastInPossesion:(Team *)team
{
    if ([team getTeamId] == [self teamWithBallId])
        return true;
    
    return false;
}


-(void) resetBall {
    self.attached=false;
    self.z=0;
    self.zVector=0;
    self.vector=CGPointZero;
    [self setPositionX:PITCH_X_CENTER Y:PITCH_Y_CENTER];
}


//
-(bool) isBallStill {
    return ( (self.vector.x < 1 && self.vector.x > -1 ) && (self.vector.y < 1 && self.vector.y > -1));
    
}

//
-(bool) isBallAlmostStill {
    int stillLength=5;
    return ( (self.vector.x < stillLength && self.vector.x > -stillLength ) && (self.vector.y < stillLength && self.vector.y > -stillLength));
    
}

//
-(void) setTeamAndPlayerWithBallId : (int)teamId : (int)playerId {
    
    // indicated the ball has changed player possession
    // via use of id that updates each time
    
    // only check player id if team with ball hasnt changed
    if (teamId != self.teamWithBallId) {
        // team has changed so possession definitely has changed
        self.possessionId++;
        //NSLog(@"Player possession changed : new id : %d, Possession id: %d", playerId, possessionId);
    }
    else {
        
        // if new player
        if (playerId != self.playerWithBallId) {
          //  NSLog(@">>> Possession id : %d", self.possessionId);
            self.possessionId++;
        //    NSLog(@"Player possession changed : new id : %d, Possession id: %d", playerId, possessionId);
        } /*else {
            NSLog(@"Player lost ball but regained before other player could get : Possession id : %d", possessionId);

        }*/
    }

    [self setTeamWithBallId:teamId];
    [self setPlayerWithBallId:playerId];
}

//
-(int) getPlayerWithBallId {
    return self.playerWithBallId;
}

//
-(bool) doesTeamActuallyHaveBall:(Team *)team
{
    if ([self isBallLoose])
        return false;
    
    if ([team getTeamId] == [self teamWithBallId])
        return true;
    
    return false;
}

//
-(bool) doesTeamActuallyHaveBallTeamId:(int)teamId
{
    if ([self isBallLoose])
        return false;

    
    if (teamId == [self teamWithBallId])
        return true;
    
    return false;
}

//
-(void) moveOffScreen
{
    [self setSpritePosition: ccp(0,0)];
    [self setShadowPosition: ccp(0,0)];
}

//
-(bool) isBallLoose
{
    //return attached;
    if (attached) {
        return false;
    } else {
        return true;
    }
}

-(void) doZReorder:(GameSprite *)spr :(int)level {
    [[[SceneManager sharedSceneManager] gameLayer] reorderChild:spr z:level]; //15

}

-(void)setBallHeightSpriteTest
{
    NSLog(@">> SetBallHeight Test ****");
    
    [[[SceneManager sharedSceneManager] gameLayer] reorderChild:[self sprite] z:950]; //15
}


-(void)setBallHeightSprite
{
    // we now use a goal net mask set at a high Z level which makes Z level reordering simpler
    //NSLog(@">>>> Z Height : %f", self.z);
    
    if (self.z > GOAL_HEIGHT)
    {
        [[[SceneManager sharedSceneManager] gameLayer] reorderChild:[self sprite] z:550]; //15
    }
    else if (self.z >= PLAYER_HEIGHT)
    {
        [[[SceneManager sharedSceneManager] gameLayer] reorderChild:[self sprite] z:BALL_ABOVE_PLAYER_Z_ORDER_LEVEL]; //5
    }
    else
    {
          [[[SceneManager sharedSceneManager] gameLayer] reorderChild:[self sprite] z:0]; //0
    }
    
    // [_gameLayer reorderChild:[self getSprite] z:101];
    
    //CGFloat level = 0.75+z*0.0075;
    CGFloat level = 0.75+z*0.0055;
    
    // - value is due to using a larger sprite as ythe base image so when the ball is in the air its not blurring when scaling
    sprite.scale=level-0.45;
    
}


//
-(void) updateReplaySpritePosition:(CGPoint) pos
{
    self.sprite.position = pos;
    self.shadow.position=CGPointMake(pos.x+2+(z * 0.5), pos.y-2);
}

//
-(void) updateReplaySpritePositionPlus:(CGPoint) pos :(int)height :(long)zOrder :(CGFloat)scale
{
    self.position = pos;
    self.z=height;
    
    self.sprite.position = pos;
    self.shadow.position=CGPointMake(pos.x+2+(z * 0.5), pos.y-2);
    self.sprite.scale=scale;
    self.zOrder=zOrder;
    
    
    
    
    [[[SceneManager sharedSceneManager] gameLayer] reorderChild:[self sprite] z:self.zOrder];
}


//
-(void) updateSpritePos:(CCTime)dt
{
    
    self.prevPos=position;
    
    self.position = CGPointMake(self.position.x + self.vector.x*dt, self.position.y + self.vector.y*dt);
    
    self.sprite.position = CGPointMake(self.position.x, self.position.y);
    
    self.shadow.position = CGPointMake(self.position.x + 2 + (z * 0.5), self.position.y - 2);
    
    //CCLOG(@">> Ball pos : %f,%f", self.position.x, self.position.y);
}

//
-(void) setBallZones {
    prevZoneFacingUp=currentZoneFacingUp;
    currentZoneFacingUp=[Formation getZone:sprite.position];
    
    prevZoneFacingDown=currentZoneFacingDown;
    currentZoneFacingDown=[Formation getReverseZone:sprite.position];
}


-(int) getZoneX {
    int zoneX = self.position.x / PITCH_ZONE_SIZE;
    
    if (zoneX < 0 ) {
        zoneX=0;
    }
    
    return zoneX;
}

-(int) getZoneY {
    int zoneY = self.position.y / PITCH_ZONE_SIZE;
    
    if (zoneY < 0 ) {
        zoneY=0;
    }
    
    return zoneY;
}

//
//
-(bool) isBallInSameZone
{
    self.previousZoneX=currentZoneX;
    self.previousZoneY=currentZoneY;
    
    self.currentZoneX = [self getZoneX];
    self.currentZoneY = [self getZoneY];
    
//    NSLog(@">> Zone X : %d",[self getZoneX]);
//    NSLog(@">> Zone Y : %d",[self getZoneY]);
    
    //return (prevZoneFacingUp == currentZoneFacingUp);
    
    return (self.previousZoneX == self.currentZoneX && self.previousZoneY == self.currentZoneY);
}

//
-(bool) isBallInSameZoneOriginal
{
    return (prevZoneFacingUp == currentZoneFacingUp);
}


//
-(void) moveBallKeeperPossesion:(CCTime)dt {
    //  //printf("***Ball move Vector x,y = %f,%f", vector.x,vector.y);
    //  //printf("\n*** ---> Zone = %d\n", [Formation getZone:sprite.position]);
    // //printf("\n ** attached =%d, playerId =%d, teamId= =%d", attached, playerWithBallId, teamWithBallId);
    self.prevVector=self.vector;
    
    //CCLOG(@"** Ball z, zVector = %f, %f", z, zVector);
    if (attached == false || justControlled == true) {
        
        if (justControlled)
        {
            // CCLOG(@">> Just controlled true");
        }
        
        if (self.zVector !=0) {
            self.zVector+=-GRAVITY*dt;
            
        }
        
        self.z+=self.zVector;
        if (self.z<0.1)
        {
            z=0;
            zVector=-zVector*BOUNCE_FACTOR;
            //zVector = ccpMult(-zVector, 0.90);
        }
        
        if (z>0.1)
        {
            self.vector = ccpMult(self.vector, AIR_FRICTION);
        }
        else
        {
            self.vector = ccpMult(self.vector, GROUND_FRICTION);
        }
        
        // test ball curl
        
        if (curlAngle > 0) {
            self.curlAngle-=0.2;
            self.vector = [self rotateVectorKeepLength: self.vector Angle:curlAngle];
        }
        
        
        
        //CGPoint oldPos = sprite.position;
        //[self setPositionX:oldPos.x+vector.x Y:oldPos.y+vector.y];
        [self updateSpritePos:dt];
    }
    else {
        justControlled = false;
        //[self updateSpritePos:dt];
        // sprite.position = ccp( self.position.x, self.position.y);
        // sprite.position = ccp( self.position.x + (2+z*0.150), self.position.y+2);
        //sprite.position = ccp( self.position.x, self.position.y+(z*0.5));
        //self.vector = ccpMult(self.vector, 0.96);
        //sprite.position = ccp( self.position.x, self.position.y+(z));
        
        //it is attached so have some extra friction while the player runs with it
        if (z>0.1)
        {
            self.vector = ccpMult(self.vector, GROUND_FRICTION);
        }
        else
        {
            self.vector = ccpMult(self.vector, GROUND_FRICTION);
        }
        
        // when player controls ball  we still want the ball to bounce/be controlled on chest potental
        if (self.zVector !=0) {
            self.zVector+=-GRAVITY*dt;
        }
        
        self.z+=self.zVector;
        if (self.z<0.1)
        {
            z=0;
            // Ball bounce ?
            zVector=-zVector*BOUNCE_FACTOR;
            //zVector = ccpMult(-zVector, 0.90);
        }
        
        self.sprite.position = CGPointMake( self.position.x, self.position.y);
        
        self.shadow.position = CGPointMake( self.position.x + 2 + (z * 0.5), self.position.y - 2);
        
        [self updateSpritePos:dt];
    }
    //CCLOG(@">> Ball Z = %f", z);
    //CCLOG(@">>Ball pos =%f,%f", self.position.x, self.position.y);
    //[self setBallHeightSprite];
}


//
-(void) moveBall:(CCTime)dt {
    self.prevVector=self.vector;
    
    //CCLOG(@"** Ball z, zVector = %f, %f", z, zVector);
    if (attached == false || justControlled == true) {
        
        if (justControlled)
        {
           // CCLOG(@">> Just controlled true");
        }
        
        if (self.zVector !=0) {
            self.zVector+=-GRAVITY*dt;
            
        }
        
        self.z+=self.zVector;
        if (self.z<0.1) //0.1
        {
            
            self.z=0;
            self.zVector=-self.zVector*BOUNCE_FACTOR;
            //NSLog(@">>> BOunce : z :%f -- zVector:%f", self.z, self.zVector);
           
            if (self.zVector>0.5 && self.zVector<1.0) {
                [self playSoundEffect:PASS1];
            } else  if(self.zVector>=1.0) {
                [self playSoundEffect:PASS2];
            }
        }
        
        if (z>0.1)
        {
            if ([self isBallPastGoalLine] && [self isBallOnTopOfNet]) {
                self.vector = ccpMult(self.vector, NET_FRICTION);
                //NSLog(@">>>BALL NET Z : %f",self.z);
            }
            else {
                self.vector = ccpMult(self.vector, AIR_FRICTION);
            }
        }
        else
        {
            self.vector = ccpMult(self.vector, GROUND_FRICTION);
        }
        
        // test ball curl
        
        if (curlAngle > 0) {
            self.curlAngle-=0.2;
            self.vector = [self rotateVectorKeepLength: self.vector Angle:curlAngle];
        }
        
        
        
        //CGPoint oldPos = sprite.position;
        //[self setPositionX:oldPos.x+vector.x Y:oldPos.y+vector.y];
        [self updateSpritePos:dt];
    }
    else {
        justControlled = false;
        
        //it is attached so have some extra friction while the player runs with it
        if (z>0.1)
        {
            self.vector = ccpMult(self.vector, GROUND_FRICTION);
        }
        else
        {
            self.vector = ccpMult(self.vector, GROUND_FRICTION);
        }
        
        // when player controls ball  we still want the ball to bounce/be controlled on chest potental
        if (self.zVector !=0) {
            self.zVector+=-GRAVITY*dt;
        }
        
        self.z+=self.zVector;
        if (self.z<0.1)
        {
            z=0;
            // Ball bounce ?
            zVector=-zVector*BOUNCE_FACTOR;
        }
        
        self.sprite.position = CGPointMake( self.position.x, self.position.y);
        
        self.shadow.position = CGPointMake( self.position.x + 2 + (z * 0.5), self.position.y - 2);
        
        [self updateSpritePos:dt];
    }
    //CCLOG(@">> Ball Z = %f", z);
    //CCLOG(@">>Ball pos =%f,%f", self.position.x, self.position.y);
    [self setBallHeightSprite];
}

-(BOOL) isBallPastGoalOrPitchBoundary {
    return (self.position.y >= PITCH_TOP || self.position.y <= PITCH_BOTTOM);
}

/**
 The Y Offset relates to the angle of the goal when viewed from top down.
 As we use a visual angle for the goal, this must be represented when working out if a goal has been scored when the ball is in the air
 or a ball collision with the crossbar etc
 
 We must limit the offset value returned to the GOAL_PERSPECTIVE_OFFSET value as this is the value used to represent the 'angle'
 of the goal mouth ( the ration is caluclated GOAL_PERSPECTIVE_Y_OFFSET/GOAL_HEIGHT)
 
 */
-(CGFloat) getBallGoalPerspectiveYOffset {
    
    return 0;
//    CGFloat yOffset=0;
//    CGFloat distanceFromGoalline=0;
//    CGFloat goalYPerspectiveRatio = (float)GOAL_PERSPECTIVE_Y_OFFSET/GOAL_HEIGHT;
//    
//    
//    if (self.position.y >= PITCH_TOP) {
//        distanceFromGoalline=self.position.y-PITCH_TOP;
//    }
//    else if (self.position.y <= PITCH_BOTTOM) {
//        distanceFromGoalline=PITCH_BOTTOM-self.position.y;
//    }
//    else {
//        return 0;
//    }
//
//    yOffset = (self.z*goalYPerspectiveRatio)/2;
//    if (yOffset > GOAL_PERSPECTIVE_Y_OFFSET) {
//    }
//    
//    return yOffset;
}


-(CGFloat) getBallGoalPerspectiveYOffsetOld {
    //CCLOG(@">>BALL OLD Y = %f", self.position.y);
    CGFloat yOffset =0;
    CGFloat goalYPerspectiveRatio = (float)GOAL_PERSPECTIVE_Y_OFFSET/GOAL_HEIGHT;
    
    
    yOffset = (self.z*goalYPerspectiveRatio);
    //yOffset = GOAL_HEIGHT*goalYPerspectiveRatio;
    
    //yOffset-=(float)10.0; // test value to fix bug where ball rebounds off crossbar but still is a goal
    // TODO - we need to factor in Y value - distance from goal Line
    if (yOffset > GOAL_PERSPECTIVE_Y_OFFSET) {
        //CCLOG(@">>BALL Y OFFSET MAX REACHED");
        
        yOffset=(float)GOAL_PERSPECTIVE_Y_OFFSET;
    }
    //CCLOG(@">>BALL Y OFFSET = %f", yOffset);
    
    return yOffset;
}



-(bool) isGoalPostCollision {
    int innerLeftPostX = PITCH_X_CENTER-(GOAL_WIDTH/2);
    int outerLeftPostX = innerLeftPostX-GOALPOST_WIDTH;
    
    int innerRightPostX = PITCH_X_CENTER+(GOAL_WIDTH/2);
    int outerRightPostX = innerRightPostX+GOALPOST_WIDTH;
    
    if (self.position.x < innerLeftPostX && self.position.x >= outerLeftPostX) {
        return true;
    }
    
    if (self.position.x > innerRightPostX && self.position.x <= outerRightPostX) {
        return true;
    }
    
    return false;
}


-(void) playGoalPostSound {
    if ([Util random5050]) {
        [self playSoundEffect:CROSSBAR];
    }
    else {
        [self playSoundEffect:GOALPOST2];
    }
}


-(bool) isCornerKick {
    
    if (self.position.y > PITCH_TOP) {
        if ([[[GameModel sharedGameModel] getTeam1] isPlayingUpPitch]) {
            if ([self teamWithBallId] == TEAM1) {
                return false;
            }
            else {
                return true;
            }
        } else {
            if ([self teamWithBallId] == TEAM1) {
                return true;
            }
            else {
                return false;
            }
        }
    } else {
        if ([[[GameModel sharedGameModel] getTeam1] isPlayingUpPitch]) {
            if ([self teamWithBallId] == TEAM1) {
                return true;
            }
            else {
                return false;
            }
        } else {
            if ([self teamWithBallId] == TEAM1) {
                return false;
            }
            else {
                return true;
            }
        }

        
    }
}


//
-(void) checkBoundary:(CCTime)dt {
    float ballPosX = self.position.x;
    float ballPosY = self.position.y;
    float ballVecX = self.vector.x;
    float ballVecY = self.vector.y;
    
    int xCollisionOffset=4;
    int yCollisionOffset=0; //4 -1
    
    
    if (self.position.x <= PITCH_LEFT-xCollisionOffset)
    {
        ballVecX=-self.vector.x;
        ballPosX = PITCH_LEFT-xCollisionOffset;
        //[self setPositionX:ballX Y:ballY];
        //[[GameModel sharedGameModel] doBallOutOfBoundsThrowIn:dt :ccp(self.position.x, self.position.y)];

    }
    else if (self.position.x >= PITCH_RIGHT+xCollisionOffset)
    {
        ballVecX=-self.vector.x;
        ballPosX=PITCH_RIGHT+xCollisionOffset;
        //[self setPositionX:ballX Y:ballY];
        //[[GameModel sharedGameModel] doBallOutOfBoundsThrowIn:dt :ccp(self.position.x, self.position.y)];
    }
    
    
//    if (self.position.y <= PITCH_BOTTOM-yCollisionOffset || self.position.y >= PITCH_TOP+yCollisionOffset) {
//        if ([self isCornerKick]) {
//            [[GameModel sharedGameModel] doBallOutOfBoundsCornerKick:dt];
//        } else {
//            [[GameModel sharedGameModel] doBallOutOfBounds:dt];
//        }
//    }


    if(self.position.y <= PITCH_BOTTOM-yCollisionOffset)
    {
        ballVecY=-self.vector.y;
        ballPosY=PITCH_BOTTOM-yCollisionOffset;
        if ([self isGoalPostCollision]) {
            [self playGoalPostSound];
        }
    }
    else if(self.position.y >= PITCH_TOP+yCollisionOffset)
    {
        ballVecY=-self.vector.y;
        ballPosY=PITCH_TOP+yCollisionOffset;
        if ([self isGoalPostCollision]) {
            [self playGoalPostSound];
        }
    }
    
    [self setPositionX: ballPosX Y: ballPosY];
    self.vector = ccp(ballVecX, ballVecY);
}



-(void) checkBoundaryOld
{
    int ballX = sprite.position.x;
    int ballY = sprite.position.y;
    
    if (ballX < 5)
    {
        ballX = 475;
        [self setPositionX:ballX Y:ballY];
    }
    else if(ballX >475)
    {
        ballX=10;
        [self setPositionX:ballX Y:ballY];
    }
    
    if(ballY<5) {
        ballY=680;
        [self setPositionX:ballX Y:ballY];
    }
    else if(ballY>680)
    {
        ballY=10;
        [self setPositionX:ballX Y:ballY];
    }
}


//
-(bool) isBallUpField {
    if (position.y > PITCH_Y_CENTER)
        return true;
    else
        return false;
}

//
-(void) setPositionX:(float)x Y:(float)y {
    prevPos.x=position.x;
    prevPos.y=position.y;
    self.position = ccp (x,y);
}

//-(CCSprite *) getSprite {
//    return sprite;
//}

//-(CGPoint *) getVector{
//    return &vector;
//}

-(float) getVectorLength {
    return ccpLength(vector);
}


//
// rough way of gettin the self.position where ball crosses goal line
-(CGPoint)getGoalCrossPosition
{
    CGPoint finalPos = self.position;
    CGPoint latestVec;
    bool ballStopped= false;
    
    // toDo - use air and ground friction depending on if ball is airbound or not
    float friction = 0.97;
    
    // TODO - stop infinite loop - set max cycle check
    while (!ballStopped)
    {
        latestVec = ccpMult(vector,friction);
        //printf("*** Latest Vec =%f,%f", latestVec.x, latestVec.y);
        //printf("*** finalPos =%f,%f", finalPos.x, finalPos.y);
        
        
        if (attached || (latestVec.x < 10 && latestVec.y < 10))
        {
            ballStopped = true;
        }
        
        finalPos = (ccpAdd(position, latestVec));
        
        // what goal line are we checking
        if (finalPos.x > 180 && finalPos.x < 300)
        {
            if (vector.y > 0)
            {
                // top goal
                //finalPos.
            }
            else
            {
                
            }
            ballStopped = true;
        }
    }
    return finalPos;
}


// TODO: rough code - cleanup
//
-(CGPoint)getFinalPosition
{
    CGPoint finalPos = self.position;
    CGPoint latestVec = ccp(0,0);
    bool ballStopped= false;
    
    // toDo - use air and ground friction depending on if ball is airbound or not
    float friction = 0.95;
    
    // TODO - stop infinite loop - set max cycle check
    while (!ballStopped)
    {
        latestVec = ccpMult(vector,friction);
        //printf("** Latest Vec =%f,%f", latestVec.x, latestVec.y);
        //printf("** finalPos =%f,%f", finalPos.x, finalPos.y);
        
        
        if (attached || (latestVec.x < 10 && latestVec.y < 10))
        {
            ballStopped = true;
        }
        
        finalPos = (ccpAdd(position, latestVec));
    }
    
    return finalPos;
}


-(void) setBallGoalZOrder {
    
}


-(bool) isRebound {
    
    if (self.position.y >= PITCH_TOP) {
        if (self.vector.y <0) {
            return true;
        }
    }
    else if (self.position.y <= PITCH_BOTTOM)
    {
        if (self.vector.y >0) {
            return true;
        }
    }
    return false;
}

-(NSString *) getGoalScoredSound {
    int item = [Util random:4];
    NSString *sound;
    
    switch(item) {
        
        case 0:
            sound=GOAL_SCORED1;
            break;

        case 1:
            sound=GOAL_SCORED2;
            break;

        case 2:
            sound=GOAL_SCORED3;
            break;
            
        case 3:
            sound=GOAL_SCORED4;
            break;

        default:
            sound=GOAL_SCORED1;
        break;
    }
    
    return sound;
    
}

//
-(void) playSoundEffect:(NSString *)sndName
{
    if (![[GameModel sharedGameModel] isManagerMode])
    {
        [Util playSoundEffect:sndName];
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

-(void) doCrossbarSound {
    if ([Util random5050]) {
        [self playSoundEffect:CROSSBAR];
    }
    else
    {
        [self playSoundEffect:GOALPOST2];
    }
}


//
-(void) checkGoalCollision:(CCTime)dt
{
    //TODO: only do check if ball is near eithr goals - not in main part of the pitch - save some time
    //if ball crossed goal line
    if (![self doesBallCrossGoalLine]) {
        [self checkBoundary:dt];
    }
    else
    {
        
        //is rebound?
        if ([self isRebound]) {
            NSLog(@">>>Crossbar rebound...");
            // we don't need to do anything
        }
        
        //printf("/n ** Ball crosses line ***");
        else if ([self isAGoal])
        {
            //CCLOG(@">>GOAL..do collision..");
            //[[[SceneManager sharedSceneManager] gameLayer] reorderChild:[self sprite] z:BALL_ABOVE_PLAYER_Z_ORDER_LEVEL]; //15
            [self doGoalCollision:dt];
            // [[SimpleAudioEngine sharedEngine] playEffect:@"applause1_rs.wav"];
            if (![[GameModel sharedGameModel] isManagerMode])
            {
                //[Util playSoundEffect:@"applause1_rs.wav"];
                [self playSoundEffect:[self getGoalScoredSound]];
            }
        }
        else
        {
            // crossbar collision
            if (  self.z >= GOAL_HEIGHT && self.z <= (GOAL_HEIGHT + CROSSBAR_HEIGHT))
            {
                if (self.position.y >= PITCH_TOP+GOAL_PERSPECTIVE_Y_OFFSET)
                {
                    self.vector = ccp(self.vector.x, self.vector.y*-0.8);
                    [self doCrossbarSound];
                }
                
                
                if (self.position.y <= (PITCH_BOTTOM-GOAL_PERSPECTIVE_Y_OFFSET))
                {
                    self.vector = ccp(self.vector.x, self.vector.y*-0.8);
                    [self doCrossbarSound];
                }
            }
            else {
                //CCLOG(@">>GOAL..do ball out of bounds");
                // let ball go out of bounds | goal kick
                [[GameModel sharedGameModel] doBallOutOfBounds:dt];
                if (self.z <= GOAL_HEIGHT) {
                    self.z=GOAL_HEIGHT+1;
                }
                [self playAlmostGoalSound];
//                NSLog(@">>** Top Goal  Z Level : %ld ", [GameModel sharedGameModel].goalTop.zOrder);
//                NSLog(@">>** Top Goal Mask Z Level : %ld ", [GameModel sharedGameModel].goalTop.zOrder);
//                NSLog(@">>** Ball  Z Level : %ld ", (long)self.zOrder);
//                
//                NSLog(@">>** Bottom Goal  Z Level : %ld ", [GameModel sharedGameModel].goalBottom.zOrder);
//                NSLog(@">>** Bottom Goal Mask Z Level : %ld ", [GameModel sharedGameModel].goalBottom.zOrder);
                
                
            }
        }
    }

}



//
-(CGPoint) getFuturePosition:(float) friction :(CCTime)dt
{
    CGPoint finalVector = ccp(0,0);
    CGPoint futurePosition = ccp(0,0);
    
    //int maxLoops = 100; // shouldnt go above this
    
    CGPoint latestVectorWithFriction = vector;
    //  //printf("\n** getFuturePosition : current ball vector = %f,%f\n", vector.x, vector.y);
    //    CCLOG(@">>>>>>>>>>>>>> Original LastVecFriction %f,%f (Original FinalVec) %f, %f", latestVectorWithFriction.x, latestVectorWithFriction.y, finalVector.x, finalVector.y );
    while (ccpLength(latestVectorWithFriction) > 1.0 )
    {
        latestVectorWithFriction = ccpMult(latestVectorWithFriction, friction);
        finalVector = ccpAdd(finalVector, ccpMult(latestVectorWithFriction,dt));
        
        //        CCLOG(@">>>(LastVecFriction) %f,%f (Final) %f,%f (Ball)x,y %f,%f : (Future) %f,%f", latestVectorWithFriction.x, latestVectorWithFriction.y, finalVector.x, finalVector.y, self.position.x, self.position.y,
        //              tempFuturePosition.x, tempFuturePosition.y);
        //CCLOG(@"*8 Future vec = %f,%f", latestVectorWithFriction.x, latestVectorWithFriction.y);
        //finalVector.x=latestVectorWithFriction.x*friction;
        //finalVector.y=latestVectorWithFriction.y*friction;
        ////printf("\n ** getFuturePosition : Latest Vec With Friction = %f,%f",latestVectorWithFriction.x, latestVectorWithFriction.y);
    }
    //CCLOG(@"------");
    
    //finalVector = ccpAdd(finalVector, latestVectorWithFriction);
    //printf("\n ** getFuturePosition : Final Vector = %f,%f",finalVector.x, finalVector.y);
    // futurePosition = ccpAdd(position, latestVectorWithFriction);
    futurePosition = ccpAdd(CGPointMake(self.position.x, self.position.y), finalVector);
    
    //   //printf("\n ** getFuturePosition : Future Position = %f,%f",futurePosition.x, futurePosition.y);
    
    
    return futurePosition;
}


-(NSString *) getGoalNetSound {
    
    int item = [Util random:2];
    NSString *sound;
    
    switch(item) {
        case 0:
            sound=NET_1;
            break;
            
        case 1:
            sound=NET_2;
            break;
            
        default:
            sound=NET_1;
            break;
    }
    return sound;
}


//
-(void) doGoalCollision:(CCTime)dt
{
    //CGPoint ballPos = [[self getSprite] self.position];
    CGPoint ballPos = self.position;
    
    //[[[SceneManager sharedSceneManager] gameLayer] reorderChild:[self sprite] z:BALL_ABOVE_PLAYER_Z_ORDER_LEVEL]; //15

    
    if (position.y > PITCH_Y_CENTER)
    {
        // check top goal
        if (ballPos.y > TOP_GOAL_BACKNET)
        {
            [self setPositionX:ballPos.x Y:TOP_GOAL_BACKNET];
            //vector = ccp(vector.x*dt, vector.y*dt*-0.7);
            self.vector = ccp(self.vector.x, self.vector.y*-0.3);
            [self playSoundEffect:[self getGoalNetSound]];
            
        }
    }
    else
    {
        // check bottom goal
        if (ballPos.y < BOTTOM_GOAL_BACKNET)
        {
            [self setPositionX:ballPos.x Y:BOTTOM_GOAL_BACKNET];
            self.vector = ccp(self.vector.x, self.vector.y*-0.3);
            [self playSoundEffect:[self getGoalNetSound]];
        }
    }
    
    //CCLOG(@">>Goal Collision : Ball Z = %f", self.z);
    
    // do top of the net collision
    
    //if ([ball z] >= GOAL_HEIGHT) {
    if (self.z >= (float)GOAL_HEIGHT) {
        
        CCLOG(@">>Ball height greater than max - setting to max and doing rebound...");
        //[ball setZ: (float)GOAL_HEIGHT];
        //ball.z=(float)GOAL_HEIGHT;
        self.z=(float)GOAL_HEIGHT-1;
        //TODO sort out net bounce factor
        self.zVector=-zVector*BOUNCE_FACTOR;
        [self playSoundEffect:[self getGoalNetSound]];
    }
    
    //CCLOG(@">>(After) Goal Collision : Ball Z = %f", self.z);

    
    // do side net collision - if balls comes back out of the goal, dont do side collision
    if (ballPos.y > PITCH_TOP || ballPos.y < PITCH_BOTTOM)
    {
        if (ballPos.x < GOAL_LEFT_SIDENET /*&& ballPos.y < PITCH_TOP*/)
        {
            [self setPositionX: GOAL_LEFT_SIDENET Y:ballPos.y];
            //vector = ccp(vector.x*dt*-0.5, vector.y*dt);
            self.vector = ccp(self.vector.x*-0.3, self.vector.y);
            [self playSoundEffect:[self getGoalNetSound]];
        }
        else if (ballPos.x  > GOAL_RIGHT_SIDENET /*&& ballPos.y > PITCH_BOTTOM*/)
        {
            [self setPositionX: GOAL_RIGHT_SIDENET Y:ballPos.y];
            //vector = ccp(vector.x*dt*-0.5, vector.y*dt);
            self.vector = ccp(self.vector.x*-0.3, self.vector.y);
            [self playSoundEffect:[self getGoalNetSound]];
        }
    }
    
    //
    //CCLOG(@">> DO GOAL");
    
    if (![[GameModel sharedGameModel] isHalfOrFullTime])
    {
        [[GameModel sharedGameModel] doGoal];
    }
    
}


//
-(LineNode *) getBallHorizontalIntersectionLine : (int) width
{
    LineNode *intersectionLine = [[LineNode alloc] init];
    intersectionLine.startPoint = CGPointMake(self.position.x-width/2, self.position.y);
    intersectionLine.endPoint = CGPointMake(self.position.x+width/2, self.position.y);
    return intersectionLine;
}


//
-(LineNode *) getBallVerticalIntersectionLine : (int) width
{
    LineNode *intersectionLine = [[LineNode alloc] init];
    intersectionLine.startPoint = CGPointMake(self.position.x, self.position.y-width/2);
    intersectionLine.endPoint = CGPointMake(self.position.x, self.position.y+width/2);
    return intersectionLine;
}

-(bool) isBallPastGoalLine {
    
    if (self.position.y >= PITCH_TOP+GOAL_DEPTH) {
        return true;
    }
    else if (self.position.y <= PITCH_BOTTOM-+GOAL_DEPTH) {
        return true;
    }
    
    return false;
}


-(bool) isBallOnTopOfNet {
    
    int leftGoalPostX = PITCH_X_CENTER-(GOAL_WIDTH/2);
    int rightGoalPostX = PITCH_X_CENTER+(GOAL_WIDTH/2);
    
    if (self.position.x < leftGoalPostX  || self.position.x > rightGoalPostX) {
        return false;
    }


    
    if (self.position.y > PITCH_TOP) {
        if (self.position.y >PITCH_TOP+GOAL_DEPTH ) {
            
            return false;
        }
        
    }
    else if (self.position.y < PITCH_BOTTOM) {
        if (self.position.y <PITCH_BOTTOM-GOAL_DEPTH ) {
            return false;
        }
        
    }
    
    return true;

}


//
-(void) doExternalGoalCollision:(CCTime)dt;
{
    // assumes the ball is past either goal line
    // if the ball lands on the net - set ball height to goal height
    
   
    
    if ([self isBallOnTopOfNet]) {
        
        if (self.z <= GOAL_HEIGHT) {
            self.z=GOAL_HEIGHT+1;
            zVector=-zVector*GOALNET_BOUNCE_FACTOR;
            
            if ([Util random5050]) {
                [self playSoundEffect:NET_1];
            }
            else
            {
                [self playSoundEffect:NET_2];
            }
        }
    }
   // if (/*self.z <= GOAL_HEIGHT && */(self.position.y <= TOP_GOAL_BACKNET && self.position.y >= BOTTOM_GOAL_BACKNET)) {
        
    if (self.z <= GOAL_HEIGHT && (self.position.y <= TOP_GOAL_BACKNET && self.position.y >= BOTTOM_GOAL_BACKNET)) {
        
        if (self.position.x >= GOAL_LEFT_SIDENET && self.position.x <= GOAL_RIGHT_SIDENET) {
            self.vector= ccp(-self.vector.x*0.4, self.vector.y);
        }
    }
    
}

//
-(bool) isAGoalOriginal
{
    
    if (self.z > GOAL_HEIGHT)
        return false;
    
    if (self.position.y > PITCH_TOP)
    {
        //[_gameLayer drawLine:prevPos :position :1];
        if(prevPos.y <= PITCH_TOP)
        {
            if ([self doesBallCrossTopGoalLine])
            {
                //CCLOG(@"**---> Ball Crossed Top Line **");
                return true;
            }
        }
    }
    else if (position.y < PITCH_BOTTOM)
    {//
        //[_gameLayer drawLine:prevPos :position :1];
        if(prevPos.y >= PITCH_BOTTOM)
        {
            if ([self doesBallCrossBottomGoalLine])
            {
                //CCLOG(@"**---> Ball Crossed Bottom Line **");
                return true;
            }
        }
    }
    
    return false;
}


//
-(bool) isAGoal
{
    //[self doesBallCrossTopGoalLine];
    
    if (self.z >= GOAL_HEIGHT) {
        //CCLOG(@">>No GOAL.. z > GOAL_HEIGHT");
        return false;
        
    }
    
    if (self.position.y >= (PITCH_TOP)) {
        if (self.position.y >= (PITCH_TOP + [self getBallGoalPerspectiveYOffset]))
        {
            //[_gameLayer drawLine:prevPos :position :1];
            
            if(prevPos.y <= (PITCH_TOP + [self getBallGoalPerspectiveYOffset]))
            {
                if ([self doesBallCrossTopGoalLine])
                {
                    //[self getBallGoalPerspectiveYOffset];
                    //CCLOG(@"**---> GOAL GOAL Ball Crossed Top Line **");
                    return true;
                }
            }
        }
    }
    else if (position.y <= (PITCH_BOTTOM)) {
        if (position.y <= (PITCH_BOTTOM - [self getBallGoalPerspectiveYOffset]))
        {//
            //[_gameLayer drawLine:prevPos :position :1];
            if(prevPos.y >= (PITCH_BOTTOM - [self getBallGoalPerspectiveYOffset]))
            {
                if ([self doesBallCrossBottomGoalLine])
                {
                    //[self getBallGoalPerspectiveYOffset];
                    //CCLOG(@"**---> GOAL GOAL Ball Crossed Bottom Line **");
                    return true;
                }
            }
        }
    }
    
    return false;
}



//
-(bool) doesBallCrossTopGoalLine
{
//    [[[SceneManager sharedSceneManager] gameLayer] drawLineYellow: ccp(GOAL_LEFT_SIDENET, PITCH_TOP + [self getBallGoalPerspectiveYOffset])
//                                                           : ccp(GOAL_RIGHT_SIDENET , PITCH_TOP  + [self getBallGoalPerspectiveYOffset])
//                                                           :1];
//    [[[SceneManager sharedSceneManager] gameLayer] drawLine:prevPos :position :1];
    
    
    if ( ccpSegmentIntersect(ccp(GOAL_LEFT_SIDENET, PITCH_TOP + [self getBallGoalPerspectiveYOffset]),
                             ccp(GOAL_RIGHT_SIDENET , PITCH_TOP  + [self getBallGoalPerspectiveYOffset]), prevPos, self.position)) {
        
        #ifdef DISPLAY_GOAL_LINE_INTERSECTION

        [[[SceneManager sharedSceneManager] gameLayer] drawLineYellow: ccp(GOAL_LEFT_SIDENET, PITCH_TOP + [self getBallGoalPerspectiveYOffset])
                                                               : ccp(GOAL_RIGHT_SIDENET , PITCH_TOP  + [self getBallGoalPerspectiveYOffset])
                                                               :1];
        [[[SceneManager sharedSceneManager] gameLayer] drawLine:prevPos :position :1];
        #endif

        return true;
    }
    return false;
//    return ccpSegmentIntersect(ccp(GOAL_LEFT_SIDENET, PITCH_TOP + [self getBallGoalPerspectiveYOffset]),
//                               ccp(GOAL_RIGHT_SIDENET , PITCH_TOP  + [self getBallGoalPerspectiveYOffset]), prevPos, self.position);
}

//
-(bool) doesBallCrossBottomGoalLine
{
//    [[[SceneManager sharedSceneManager] gameLayer] drawLineYellow: ccp(GOAL_LEFT_SIDENET, PITCH_BOTTOM - [self getBallGoalPerspectiveYOffset])
//                                                           : ccp(GOAL_RIGHT_SIDENET , PITCH_BOTTOM  - [self getBallGoalPerspectiveYOffset])
//                                                           :1];
//    [[[SceneManager sharedSceneManager] gameLayer] drawLineYellow:prevPos :position :1];
    
    
    if (ccpSegmentIntersect(ccp(GOAL_LEFT_SIDENET, PITCH_BOTTOM - [self getBallGoalPerspectiveYOffset]),
                                   ccp(GOAL_RIGHT_SIDENET , PITCH_BOTTOM - [self getBallGoalPerspectiveYOffset]), prevPos, self.position)) {
       
        
        #ifdef DISPLAY_GOAL_LINE_INTERSECTION
        [[[SceneManager sharedSceneManager] gameLayer] drawLineYellow: ccp(GOAL_LEFT_SIDENET, PITCH_BOTTOM - [self getBallGoalPerspectiveYOffset])
                                                               : ccp(GOAL_RIGHT_SIDENET , PITCH_BOTTOM  - [self getBallGoalPerspectiveYOffset])
                                                               :1];
        [[[SceneManager sharedSceneManager] gameLayer] drawLine:prevPos :position :1];
        #endif
        
        return true;
    }
    return false;
//    return ccpSegmentIntersect(ccp(GOAL_LEFT_SIDENET, PITCH_BOTTOM - [self getBallGoalPerspectiveYOffset]),
//                               ccp(GOAL_RIGHT_SIDENET , PITCH_BOTTOM - [self getBallGoalPerspectiveYOffset]), prevPos, self.position);
}

//
-(bool) doesBallHitLeftGoalPostTopGoal
{
    return ccpSegmentIntersect(ccp(GOAL_LEFT_SIDENET, PITCH_TOP + [self getBallGoalPerspectiveYOffset]),
                               ccp(GOAL_LEFT_SIDENET-GOALPOST_WIDTH , PITCH_TOP + [self getBallGoalPerspectiveYOffset]), prevPos, self.position);
}

//
-(bool) doesBallHitRightGoalPostTopGoal
{
    return ccpSegmentIntersect(ccp(GOAL_RIGHT_SIDENET, PITCH_TOP + [self getBallGoalPerspectiveYOffset]),
                               ccp(GOAL_RIGHT_SIDENET+GOALPOST_WIDTH , PITCH_TOP +  [self getBallGoalPerspectiveYOffset]), prevPos, self.position);
}

//
-(bool) doesBallHitLeftGoalPostBottomGoal
{
    return ccpSegmentIntersect(ccp(GOAL_LEFT_SIDENET, PITCH_BOTTOM - [self getBallGoalPerspectiveYOffset]),
                               ccp(GOAL_LEFT_SIDENET-GOALPOST_WIDTH , PITCH_BOTTOM - [self getBallGoalPerspectiveYOffset]), prevPos, self.position);
}

//
-(bool) doesBallHitRightGoalPostBottomGoal
{
    return ccpSegmentIntersect(ccp(GOAL_RIGHT_SIDENET, PITCH_BOTTOM - [self getBallGoalPerspectiveYOffset]),
                               ccp(GOAL_RIGHT_SIDENET+GOALPOST_WIDTH , PITCH_BOTTOM - [self getBallGoalPerspectiveYOffset]), prevPos, self.position);
}




//
-(bool) doesBallCrossGoalLineOriginalOLD {
    if (self.position.y > PITCH_TOP || self.position.y < PITCH_BOTTOM)
    {
        //[[[SceneManager sharedSceneManager] gameLayer] drawLine:prevPos :position :1];
        //CCLOG(@"** Ball Crossed A Line - potential goal **");
        return true;
    }
    else
    {
        //  CCLOG(@"** Ball Crossed Bottom Line - potential goal **");
        return false;
    }
    
    // return false;
}

-(bool) doesBallCrossGoalLineOriginal {
    if ( z < GOAL_HEIGHT && (self.position.y > PITCH_TOP || self.position.y < PITCH_BOTTOM))
    {
        //[[[SceneManager sharedSceneManager] gameLayer] drawLine:prevPos :position :1];
        //CCLOG(@"** Ball Crossed A Line - potential goal **");
        return true;
    }
    else
    {
        //  CCLOG(@"** Ball Crossed Bottom Line - potential goal **");
        return false;
    }
}

-(bool) isWithinGoalPosts {
    return (self.position.x >= PITCH_X_CENTER-(GOAL_WIDTH/2) && self.position.x <= PITCH_X_CENTER+(GOAL_WIDTH/2));
}


-(bool) doesBallCrossGoalLine {
    if ( /*z < GOAL_HEIGHT &&*/ [self isWithinGoalPosts] && (self.position.y >= PITCH_TOP || self.position.y <= PITCH_BOTTOM))
    {
        //[[[SceneManager sharedSceneManager] gameLayer] drawLine:prevPos :position :1];
        //CCLOG(@"** Ball Crossed A Line - potential goal **");
        return true;
    }
    else
    {
        //  CCLOG(@"** Ball Crossed Bottom Line - potential goal **");
        return false;
    }
}

//
-(bool) doesBallCrossGoalLineOriginal2 {
    if (self.position.y > (PITCH_TOP + [self getBallGoalPerspectiveYOffset]) || self.position.y < (PITCH_BOTTOM - [self getBallGoalPerspectiveYOffset]))
    {
        //[[[SceneManager sharedSceneManager] gameLayer] drawLine:prevPos :position :1];
        //CCLOG(@"** Ball Crossed A Line - potential goal **");
        return true;
    }
    else
    {
        //  CCLOG(@"** Ball Crossed Bottom Line - potential goal **");
        return false;
    }
    
    // return false;
}

//
-(CGPoint) checkLinesIntersect: (float)x0 :(float)y0 :(float)x1 :(float)y1 :(float)x2 :(float)y2 :(float)x3 :(float)y3
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
-(bool) isGoalCollision
{
    
    //CGPoint ballAdvancedPos = ccpAdd([[self getSprite] self.position], vector);
    //    CGPoint ballAdvancedPos = [[self getSprite] self.position];
    //    bool goal = false;
    //
    //    if (ballAdvancedPos.y >= 670 && [self isGoalPreCollision])
    //    {
    //        [self setPositionX:ballAdvancedPos.x Y:670];
    //        vector = ccp(vector.x, vector.y*-0.5);
    //        goal=true;
    //    }
    //
    //    // check if past goal line first
    //    // the check side netting
    //    if (ballAdvancedPos.y > 650 && [self isGoalPreCollision])
    //    {
    //        //goal=true;
    //        //printf("\n ** -> ballPos past goal line x,y **, %f,%f", ballAdvancedPos.x, ballAdvancedPos.y);
    //
    //        // left side net
    //
    //        if (ballAdvancedPos.x <= 200)
    //        {
    //            [self setPositionX: 200 Y:ballAdvancedPos.y];
    //            goal=true;
    //            vector = ccp(vector.x*-0.5, vector.y);
    //            //printf("\n ** -> hit left net **");
    //        }
    //        else if (ballAdvancedPos.x  >= 280)
    //        {
    //            [self setPositionX: 280 Y:ballAdvancedPos.y];
    //            goal=true;
    //            vector = ccp(vector.x*-0.5, vector.y);
    //            //printf("\n ** -> hit right net **");
    //        }
    //
    //
    //
    //    }
    //    if (goal)
    //        [_gameLayer doGoal];
    //
    //    return goal;
    return false;
}





@end

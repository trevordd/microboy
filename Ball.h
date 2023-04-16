//
//  Ball.h
//  mySoccer
//
//  Created by Trevor Delves on 14/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Formation.h"
#import "Pitch.h"
#import "GameSprite.h"
#import "LineNode.h"

@class GameLayer;
@class Team;

@interface Ball : GameSprite {
    bool attached;
    bool justControlled;
    
    int teamWithBallId;
    int playerWithBallId;
    int possessionId;
    
    int currentZoneFacingUp;
    int prevZoneFacingUp;
    int currentZoneFacingDown;
    int prevZoneFacingDown;
    
    int currentZoneX;
    int previousZoneX;
   
    int currentZoneY;
    int previousZoneY;
    
    float rotateAngle;
    


    CGPoint prevPos;
    CCSpriteFrame *frame;
    GameLayer * _gameLayer;    
}

//
@property (nonatomic) bool justControlled;
@property (nonatomic) bool attached;
@property (nonatomic) int teamWithBallId;
@property (nonatomic, assign) int playerWithBallId;
@property (nonatomic) int possessionId;
@property (nonatomic) float curlAngle;
@property (nonatomic) CGPoint prevPos;
@property (nonatomic) int currentZoneX;
@property (nonatomic) int previousZoneX;
@property (nonatomic) int currentZoneY;
@property (nonatomic) int previousZoneY;






//
-(id) initWithSpriteNoLayer:(NSString *)spriteName;
-(id) initWithSprite:(NSString *)spriteName :(GameLayer *)layer;
-(id) initNoSprite;
-(void) setGameLayer:(GameLayer *)layer;
-(void) setPositionX:(float)x Y:(float)y;
//-(int) getAnimFrame;
//
-(bool) isBallLoose;
-(bool) isBallStill;
-(bool) isBallAlmostStill;


-(void) moveBall:(CCTime)dt;
-(void) moveBallKeeperPossesion:(CCTime)dt;
-(void) checkBoundary:(CCTime)dt;
-(void) updateReplaySpritePosition:(CGPoint) pos;
-(void) updateReplaySpritePositionPlus:(CGPoint) pos :(int)height :(long)zOrder :(CGFloat)scale;

-(void) updateSpritePos:(CCTime)dt;
-(bool) isBallUpField;
-(void) setBallHeightSprite;

//
-(bool) isGoalCollision;
-(bool) isAGoal;
-(bool) doesBallCrossGoalLine;
-(void) doGoalCollision:(CCTime)dt;
-(void) doExternalGoalCollision:(CCTime)dt;
-(void) checkGoalCollision:(CCTime)dt;
-(CGFloat) getBallGoalPerspectiveYOffset;
//-(CGFloat) getPerspectiveYPos :(CGFloat) yPos;

//
-(CGPoint) getFinalPosition;
-(CGPoint) getGoalCrossPosition;
-(CGPoint) getFuturePosition:(float) friction :(CCTime)dt;
-(float) getVectorLength;

//
-(void) setBallZones;
-(bool) isBallInSameZone;

//
-(void) resetBall;

//
-(void) setPlayerWithBallId:(int)playerId;
-(int) getPlayerWithBallId;

//
-(LineNode *) getBallHorizontalIntersectionLine : (int) width;
-(LineNode *) getBallVerticalIntersectionLine : (int) width;

//
-(BOOL) isBallPastGoalOrPitchBoundary;
//-(void) setBallGoalPerspective;
-(void)setBallHeightSpriteTest;
//
-(bool) doesBallHitLeftGoalPostTopGoal;
-(bool) doesBallHitRightGoalPostTopGoal;
-(bool) doesBallHitLeftGoalPostBottomGoal;
-(bool) doesBallHitRightGoalPostBottomGoal;

//
-(void) setTeamAndPlayerWithBallId : (int)teamId : (int)playerId;

//
-(void) moveOffScreen;
-(bool) doesBallCrossTopGoalLine;
-(bool) doesBallCrossBottomGoalLine;
-(bool) doesOppTeamHaveBall:(Team *)currentTeam;
-(bool) doesTeamActuallyHaveBall:(Team *)team;
-(bool) doesTeamHaveHaveBallOrWasLastInPossesion:(Team *)team ;
-(bool) doesTeamActuallyHaveBallTeamId:(int)teamId;

//
-(void) doZReorder:(GameSprite *)spr :(int)level;

//
-(CGPoint) checkLinesIntersect: (float)x0 :(float)y0 :(float)x1 :(float)y1 :(float)x2 :(float)y2 :(float)x3 :(float)y3;


@end

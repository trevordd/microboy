//
//  Player.h
//  mySoccer
//
//  Created by Trevor Delves on 08/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Ball.h"
#import "Util.h"
#import "LineNode.h"
#import "PlayerData.h"
#import "FormationPosition.h"


//#import "SimpleAudioEngine.h"


@class Team;
@class HUDLayer;
@class GameLayer;

enum playerState {running, jumping, sliding};
enum runoutState {runoutStairs, runoutStart, runoutGoToPosition};
enum pitchZone {ZONE_DEFENSE, ZONE_MIDFIELD_DEFENSE, ZONE_MIDFIELD_ATTACK, ZONE_ATTACK};
enum teamCurrentDirection {SHOOTING_UP=0, SHOOTING_DOWN=1};
enum wingPlay {ON=0, OFF=1, STAGGERED=2};



@interface Player : GameSprite {
 
    //
    PlayerData *playerData;
    
    //
    FormationPosition *formationPosition;
    
    //   
    NSMutableArray *playerPositions;
    NSMutableArray *lineupPositions;
    NSMutableArray *previousPositions;
    
    //
    CCSprite* kitSprite;
    CCSprite* kitCentreStripSprite;
    CCSprite* kitArmsSprite;
    CCSprite* skinSprite;
    CCSprite* hairSprite;
    
    //
    CCSprite* kitSlideSprite;
    CCSprite* kitSleeveSlideSprite;
    CCSprite* kitCentreStripSlideSprite;
    CCSprite* skinSlideSprite;
    CCSprite* hairSlideSprite;
    
    // temp
    CCSprite* playerSlideSprite;
    
    //
    CCLabelTTF* nameLabel;
    
    //
    float speed;
    
    //
    float animCount;
    float animRate;
    int animFrame;
    NSString *frameName;
    
    //
    enum wingPlay doWingPlay;
    
    //
    int playerDirection;
    int playerFacing;
    
    // TODO: damn do we really need all these just for sliding??
    bool isSliding;
    bool isDoingSlide;
    bool isCantSlideActivated;
    bool canSlide;
    int slidingCounter;
    int doSlideTimer;
    int cantSlideTimer;
    
    //
    bool isJumping;
    bool canJump;
    bool cantJumpTimer;
   
    //
    bool ballAttached;
    bool ballJustKicked;
    bool hadFirstTouch;
    
    //
    bool targetPosSet;
    
    // 
    //CGFloat spriteRotation;
    //CGFloat prevSpriteRotation;
    
    CGPoint facingVector;
    CGPoint saveVector;
    CGPoint targetPos;
    CGPoint targetVec;
    CGPoint slideVec;

    
    //
    int actionCount;
    int passCompletedTime;
    int rotateDir; // -1 left, 1 right
    int firstTouch;
    
    //
    float strength;
    CGPoint collisionVector;
    
    //
    bool saveJustStarted;
    bool saveInProgress;
    
    //
    bool waitingToPass;
    bool waitingToShoot;
    
    //
    bool standingOff;
    int currentOppActivePlayerId;
    int previousOppActivePlayerId;
    int standOffPossessionId;
    long standoffTime;
    long standoffClock;
    
    //temp
    CGPoint tempSavePos;
    
    //
    enum runoutState runoutState;
    bool readyForKickOff;
    
    //
    int stayStillAfterPassCounter;
    bool passJustMade;
    
    //
    int possessionId;
    int runDownWingPossessionId;
    
    //
    CCSpriteFrame *frame;
    GameLayer * _gameLayer;
}

@property (strong, nonatomic) FormationPosition *formationPosition;


//
@property (nonatomic,readwrite,strong) PlayerData *playerData;


//
@property (nonatomic) int teamId;
@property (nonatomic) int playerId;
@property (nonatomic) float speed;
//@property (assign, nonatomic) NSString *playerName;
@property (strong, nonatomic) NSString *playerName;
@property (strong, nonatomic) NSString *frameName;
//
@property (strong, nonatomic) CCSprite *kitSprite;
@property (strong, nonatomic) CCSprite *kitArmsSprite;
@property (strong, nonatomic) CCSprite* kitCentreStripSprite;
@property (strong, nonatomic) CCSprite* skinSprite;
@property (strong, nonatomic) CCSprite* hairSprite;
//
@property (strong, nonatomic) CCSprite *kitSprite2;
@property (strong, nonatomic) CCSprite *kitArmsSprite2;
@property (strong, nonatomic) CCSprite* kitCentreStripSprite2;
@property (strong, nonatomic) CCSprite* skinSprite2;
@property (strong, nonatomic) CCSprite* hairSprite2;

// temp
@property (strong, nonatomic) CCSprite* playerSlideSprite;


//
@property (strong, nonatomic) CCSprite* kitSlideSprite;
@property (strong, nonatomic) CCSprite* kitSleeveSlideSprite;
@property (strong, nonatomic) CCSprite* kitCentreStripSlideSprite;
@property (strong, nonatomic) CCSprite* skinSlideSprite;
@property (strong, nonatomic) CCSprite* hairSlideSprite;


@property (strong, nonatomic) Team *team;
@property (strong, nonatomic) CCLabelTTF *nameLabel;
@property (nonatomic) float strength;
@property (nonatomic, assign) CGPoint collisionVector;
@property (nonatomic, assign) CGFloat prevSpriteRotation;
@property (nonatomic) bool ballJustKicked;
@property (nonatomic) bool waitingToPass;
@property (nonatomic) bool waitingToShoot;
@property (nonatomic) enum runoutState runoutState;
@property (nonatomic) enum wingPlay doWingPlay;
@property (nonatomic) bool readyForKickOff;
@property (nonatomic) bool passJustMade;
@property (nonatomic) bool hadFirstTouch;
@property (nonatomic) bool standingOff;
@property (nonatomic) int stayStillAfterPassCounter;
@property (nonatomic) bool isJumping;
@property (nonatomic) bool canJump;
@property (nonatomic) bool cantJumpTimer;

//
@property (nonatomic) int possessionId;
@property (nonatomic) int runDownWingPossessionId;
@property (nonatomic) int currentOppActivePlayerId;
@property (nonatomic) int previousOppActivePlayerId;
@property (nonatomic) int standOffPossessionId;

@property (nonatomic)long standoffTime;
@property (nonatomic)long standoffClock;



//
-(id) initWithSprite:(NSString *)spriteName;
//-(id) initWithSprite:(NSString *)spriteName;
//-(id) initWithoutSprite;
//-(id) initWithSprite:(NSString *)spriteName :(int)pId;

//
-(void) drawVector :(CGPoint) vec : (CGPoint) pos  : (CCColor *) color : (id) tagName;

//
-(void) setNameLabelPosition:(CGPoint) pos;
-(void) setPositionX:(float)x Y:(float)y;
-(void) updatePlayer:(CCTime)dt Ball:(Ball *)ball;
-(bool) isKeeper;

//
-(CGPoint) getAdvancedSpritePosition;
-(void) setPlayerDirection:(int)direction;
-(int) getPlayerDirection;
-(void) movePlayerOffField:(CCTime)dt;
-(void) movePlayerOffFieldHalfSpeed:(CCTime)dt;
-(void) movePlayerGoalScoredAgainst:(CCTime)dt;
-(void) movePlayersOntoPitch:(CCTime)dt :(Ball *)ball;
-(void) resetPassCompletedTime;
-(int) getAnimFrame;
-(void) setAnimFrame:(int)frame;

//
//-(void) setSpeed:(int)value;

-(int) getPlayerDirection:(CGPoint *) vec;
-(bool) isPlayerStill;

//
-(void) setGameLayer :(GameLayer *)layer;
-(GameLayer *) getGameLayer;

//
-(void) checkBallJustKickedStatus:(Ball *)ball;
-(bool) isWithinBallCollisionRange:(Ball *)ball;
-(void) doPlayerStoppedMovingCheck:(Ball *) ball;
-(bool) isBallCollision:(Ball *)ball;
-(bool) isKeeperBallCollision:(Ball *)ball;
-(void) doStickyBall:(Ball *)ball;
-(void) kickBall:(Ball *)ball;
-(void) shootBall:(Ball *)ball;
-(void) shootBallSimple:(Ball *)ball;
//-(void) shootBallSimpleVector:(Ball *)ball :(CGPoint) shotVec;
-(void) shootBallSimpleVector:(Ball *)ball :(CGPoint) shotVec :(long) swipeTimer;
-(void) shootBallHuman:(Ball *)ball;
-(bool) isKeeperUnderHumanControl:(Ball *)ball;
-(bool) isKeeperWithinBoundary;
-(void) setKeeperGoalAreaBoundary;
-(float) getPlayerSpeedIncrease;

//

-(NSString *) getFrameName;
-(void) setFrameName:(NSString *)name;


//
-(void) startStayStillAfterPassCounter;
-(CGPoint) calculateTargetPos:(Ball *)ball;
-(CGPoint) calculateTargetPosition: (CGPoint)targetPosition;


-(bool) isAtTargetPos;
-(void) setMoveVector;
-(void) setMoveVectorHalfSpeed;
-(void) setMoveVectorRunout;
-(CGPoint) getStartPosition;

//- (void) updateCompPlayer:(CCTime)dt;

-(void) updateNonActiveCompPlayer:(CCTime)dt theBall:(Ball *)ball;
-(void) updateActiveCompPlayer:(CCTime)dt theBall:(Ball *)ball;

-(void) setPlayerStanding;
//-(void) updatePlayer:(CCTime)dt;
-(void) doCompAnim;
-(void) doCompSlideAnim;

//
-(void) showPlayerFrame1Masks : (Boolean) status;
-(void) showPlayerFrame2Masks : (Boolean) status;


//
-(int) getStrengthValue:(int) strength;

//
-(bool)isPlayerTurning;
-(void) moveKeeper:(CCTime)dt :(Ball *)ball;
-(void) setFaceBallVector:(Ball *)ball;
//-(LineNode *) getKeeperDivingIntersectionLine:(Ball *)ball;
-(void) doKeeperAnim:(Ball *)ball;
-(void) doKeeperAnimHumanControl:(Ball *)ball;
-(void) doKeeperDivingAnim:(Ball *)ball;
-(bool) isPlayerMoving;
-(bool) isActivePlayer;
-(bool) playerHasBall:(Ball *)ball;
-(void) setPlayerHasBall:(Ball *)ball;
-(void) doCompStickyBall:(Ball *)ball;
-(void) doCompNonStickyBall:(Ball *)ball;
-(void) doFirstTouchNonStickyBall:(Ball *)Ball;
-(void) doKeeperStickyBall:(Ball *)ball;
-(void) doKeeperSaveStickyBall:(Ball *)ball;
-(void) moveActivePlayerToTarget:(CCTime)dt;
-(CCSpriteFrame *)getFrame;

//
-(void) passToClosestPlayerHuman:(Ball *)ball;
-(void) passToClosestPlayerHumanHigh:(Ball *)ball;
-(void) passToClosestPlayer:(Ball *)ball;
-(void) passToSecondClosestPlayer:(Ball *)ball;
-(void) passToFurthestPlayer:(Ball *)ball;
-(void) passToPlayer:(Ball *)ball :(Player *)player;
-(void) passToPlayerInAir:(Ball *)ball :(Player *)player;
-(void) passToNoNObstructedPlayer:(Ball *)ball;
-(void) passToNoNObstructedPlayerForwardOnly:(Ball *)ball;
-(void) passToPlayerAhead:(Ball *)ball :(Player *)player :(int)distanceAhead;
-(void) crossToNoNObstructedPlayer:(Ball *)ball;
-(void) passToPlayerInMostSpace:(Ball *)ball;


-(enum pitchZone) getCurrentPositionZoneShootingDown:(int) pos;
//-(enum pitchZone) getCurrentPositionZoneShootingup:(int) pos;

-(bool) isInDefenseZone :(int) pos :(enum teamCurrentDirection) dir;
-(bool) isInMidfieldDefenseZone :(int) pos :(enum teamCurrentDirection) dir;
-(bool) isInMidfieldAttackZone :(int) pos :(enum teamCurrentDirection) dir;
-(bool) isInAttackZone :(int) pos :(enum teamCurrentDirection) dir;



//
-(void) playSoundEffect:(NSString *)sndName;
-(void) playSoundMusic:(NSString *)sndName loop:(bool)loop;
//
-(bool) isPlayerGoalSide:(CGPoint)position;

-(int) getDistanceOfClosestOpponentPlayer:(Player *)player;
-(int) getNumberOfOpponentPlayersInVicinity:(Player *)player :(int)distance;

//
-(void) setSpriteRotation:(CGFloat)rotation;
-(void) setSpriteRotationHumanControls:(CGFloat)rotation :(Ball *)ball;
-(void) setSpriteRotationHumanControlsVector:(CGPoint)controlVector : (Ball *)ball;

-(CGFloat) getSpriteRotation;

-(void) doPlayerAnim;
-(void) doPlayerReplayAnim;
-(void) doKeeperReplayAnim;
-(void) updatePassCompletedTime;
-(bool) isPassCompletedTimeElapsed;


+(void) doTest;

//
//-(void) c:(NSMutableArray *)positions;
-(void) setPlayerLineupPositions:(NSMutableArray *)positions;
-(NSMutableArray *)getPlayerFormationPositions;
-(void)setPlayerFormationPositions:(NSMutableArray *)positions;

//
-(void) setTargetPosToCurrentPos;
-(void) setTargetPos:(CGPoint)target;
-(CGPoint) getDefensiveStandOffTargetPostition:(Player *)oppPlayer;
-(CGPoint) getPreviousPosition:(int)index;


//
-(void) checkBoundary;
//-(void) doAi;
//-(void) doAiNew;
-(void)doAiNew:(Ball *)ball;
//-(void) doAiBasic;
-(void) doPassAi:(Ball *)ball;
-(void) avoidAllPlayers;
-(void) avoidPlayer:(CGFloat)rotateAngle :(int)playerAheadDir;


//
-(bool) isThereAPlayersInTheBoxForCross;
-(bool) isPlayerThroughOnGoal;
//-(bool) isPlayerAhead:(CGPoint)activePlayerPos P:(CGPoint)player;
//-(int) getPlayerAheadDirection:(Player *)player;
-(bool) isBallComingTowardsMe:(Ball *)ball;
-(bool) isBallChestHeightOrHeigher :(Ball *)ball;
-(bool) isPassInPathOfSpecificPlayer:(Player *)myPassPlayer :(Player *)oppPlayers;
-(bool) isPassInPathOfAPlayer:(Player *)myPassPlayer;
-(bool) isBackwardPass:(CGPoint)passVec;
-(bool) isWithinBackwardPassDistance:(CGPoint)passTargetPos;
-(bool) isWithinBackwardCrossDistance:(CGPoint)passTargetPos;
//-(CGPoint)rotateVector:(CGPoint)vec Angle:(float)theta;
-(bool) isBallCloseEnoughForPassOrShot:(Ball *)ball;
-(bool) isBallCloseEnoughForPassOrShotHuman:(Ball *)ball;



//
-(int) getClosestDirectionToRotate:(CGPoint)targetVector :(CGPoint)startVector :(CGFloat)angle;
-(int) getNumRotationsToVector:(CGPoint)targetVector :(CGPoint)startVector :(CGFloat)angle;
//-(CGPoint) rotateVector:(CGPoint)vec Angle:(float)theta;
-(CGPoint) doRotate:(CGFloat)currAngle Angle:(float)theta;
-(int) isPlayerAheadAdvanced:(Player *)player Feeler:(CGPoint)feelVector Length:(CGFloat)feelLength;
-(Player *) checkIfOppPlayerAheadDistance:(CGPoint)feelVector;
-(Player *)checkIfAnyPlayerAheadDistance:(CGPoint)feelVector;
-(int)checkIfAnyPlayerAhead:(CGPoint)feelVector;
-(bool)isOppPlayerAhead:(int)distance;
-(bool)isAnyPlayerAhead:(int)distance;
-(bool) isPlayerCollision:(Player *)otherPlayer FuturePos:(CGPoint *)futurePos;
-(int)checkIfOppPlayerAhead:(CGPoint)feelVector;
//-(bool) isPlayerAhead:(Player *)player;
-(CGPoint) getFOV:(CGPoint)pos;
-(bool)isInNarrowFOV:(CGPoint)pos;
-(bool)isInHumanNarrowFOV:(CGPoint)pos;
-(void) checkPlayerCollision;
-(CGFloat) getInitialRotateDirection:(CGPoint)targetVec :(CGPoint)currentVec;
//-(CGPoint) getVectorRotatedByRandomAngle:(CGPoint)originalVec :(int)range;


//
-(void) resetNoBallCollisionTime;
-(bool) isFutureCollision:(CGPoint)moveVec;
-(void) jump;
-(void) jump:(int) ballHeight;
-(void) keeperJump:(int) ballHeight;


-(bool) isPlayerInCenterAreaOfPitch;
-(bool) isPlayerOnWings;
-(bool) isPlayerInAttackingHalf;
-(bool) isPlayerInDefensiveHalf;
//
-(bool) isPlayerFacingGoal;
-(void) setPlayerFaceBall:(Ball *)ball;
-(void) setPlayerFacePos:(CGPoint)facePos;
-(bool) isWithinShootingDistance;
-(bool) isWithinShootingDistanceAdv:(int) distance;
-(bool) canShoot;
-(bool) isBallFootHeight:(Ball *)ball;
-(bool) isBallTooCloseToBody:(Ball *)ball;

//
-(int) getTeamFacingDir;
-(bool) isTeamShootingUp;
-(bool) isOutfieldPlayer;
-(int) getTeamId;

-(void) kickBasicGoalKick:(Ball *)ball;
//-(void) resetDoSlideStatus;

//
-(void) updateTimers;
-(void) checkTimers;

// slides
-(void) doHumanSlide;
-(void) doHumanSwipeSlide:(CGPoint)swipeVec;
-(bool) canSlide;
-(void) setCantSlide;
-(void) resetDoSlideStatus: (CCTime) dt;
-(void) startDoSlideTimer;
-(void) startAllowSlideTimer;
-(void) resetAllowSlideStatus: (CCTime) dt;

//
-(void) updatePlayerGoalKick:(CCTime)dt :(CGPoint)zonePos :(Ball *)ball;
-(void) doGoalKick:(Ball *)ball;
-(bool) isWithinGoalPosts:(int)ballXPos;

//
-(void) resetTargetPos:(Ball *)ball;
-(CGPoint) calculateTargetPosZone:(CGPoint)zonePos;
-(CGPoint) calculateDefensiveTargetPos:(Ball *)ball;
//-(CGPoint) getVariedTargetVector;
//
-(void) updateSpritePos;
-(void) updateSpritePos:(CCTime)dt;
-(void) updateReplaySpritePosition:(CGPoint) position;
-(void) updateReplayKeeperSpritePosition:(CGPoint) pos;

//
-(CGPoint) getKeeperIntersectionLineStartTop;
-(CGPoint) getKeeperIntersectionLineEndTop;
-(CGPoint) getKeeperIntersectionLineStartBottom;
-(CGPoint) getKeeperIntersectionLineEndBottom;
-(CGPoint) getKeeperIntersectionLineVerticalStandingStart;
-(CGPoint) getKeeperIntersectionLineVerticalStandingEnd;

//
-(void) doPassSound;
-(void) doShotSound;

//
-(bool) isFutureBallXPositionNearGoal:(CGPoint)pos;
-(void) updateKeeperSaveSpritePos:(CCTime)dt;
-(void) setSaveVector:(CGPoint)saveTargetPos :(int)saveDistanceRatio;
-(bool) isPotentialSaveRequired:(Ball *) ball;
-(bool) isBallHeadingTowardsKeeper:(Ball *) ball;
-(void) performKeeperSaveIfRequired:(Ball *)ball :(CCTime)dt;

//
-(void) hideMaskSprites;
-(void) showMaskSprites;
-(void) hideSlideMaskSprites;
-(void) showSlideMaskSprites;

//
-(bool) isInTnPositionToCross:(Ball *)ball;
-(bool) isInCrossingZone:(Ball *)ball;
-(void) crossBall:(Ball *)ball;
-(void) doSlideKick:(Ball *)ball;

//
-(void) updatePossessionId;

//
+(CGPoint)VRotate2D:(CGFloat)angle vector:(CGPoint)u;
-(bool)isInFOV:(CGPoint)pos;
-(CGPoint) getFacingVector;

//
-(CGPoint) checkLinesIntersect:(float) x0 :(float) y0 :(float)x1 :(float) y1 :(float)x2 :(float)y2 :(float)x3 :(float)y3;

//
-(void) testRotate;
-(float) getDegreesAngle:(float)radianDegrees;
@end

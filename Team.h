//
//  Team.h
//  mySoccer
//
//  Created by Trevor Delves on 14/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Ball.h"
#import "SceneManager.h"
#import "TeamData.h"
#import "Colours.h"


@class Player;
//@class HUDLayer;

@interface Team : NSObject {
    
    //
    int teamId;
    int activePlayerId;
    int activeTargetPlayerId;
    int score;
    
    //
    Team *oppTeam;
    NSString *teamName;

    //
    NSMutableArray * players;
    NSMutableArray * outfieldPlayers;
    NSMutableArray * playerNames;
    NSMutableArray * activePlayersIds;
    //NSMutableArray * scannerPlayers;

    
    //
    Formation *formations;
    NSMutableArray *lineupPositions;
    NSMutableArray *lineupPositionsFaceUp;
    NSMutableArray *lineupPositionsFaceDown;
       
    //
    CCSprite *activePlayerSprite;
    CCSprite *activeTargetSprite;
    CCSprite *playerArrowSprite;
    
    //
    Player * activePlayer;
    int gameClock;
    int playingDirection; // 0 up, 1 down
    bool humanTeam;
    bool kickingOff;
    // 
    bool celebPositionSet;
    
    //
    bool overrideActivePlayer;
    long overrideActivePlayerCounter;
    long humanControlTimer;
    
    //
    TeamData *teamData;
    
    //
    int passRate;
    
    // TODO : make Singleton - getInstance
    HUDLayer * _hudLayer;
    
}

@property (nonatomic) bool kickingOff;
@property (nonatomic) bool overrideActivePlayer;
@property (nonatomic) long overrideActivePlayerCounter;
@property (nonatomic,readwrite,strong) TeamData *teamData;
@property (nonatomic) int passRate;
@property (nonatomic) long humanControlTimer;
@property (nonatomic) int activeTargetPlayerId;
@property (nonatomic) int activePlayerId;


//
+(void) setControlsActive:(bool)active;
+(bool) getControlsActive;

//
-(void) showActivePlayerSprite:(bool)show;
-(void) showActiveTargetSprite:(bool)show;


-(void) setTeamPassRate;
-(void) assignTeamAndPlayerData;

//
//-(id) initNoSprite;
-(id) initWithId:(NSString *)spriteId myTeamId:(int)tId;
//-(id) initNoSprite :(int)tId;

//-(void) setHudLayer:(HUDLayer *)hudLayer;
//-(void) setGameLayer:(GameLayer *)gameLayer;

+(CCColor *) getColour : (int) colourIndex;
+(CCColor *) getHoardingColour : (int) colourIndex;

//
//+(void) setSpriteSheet:(CCSpriteBatchNode *)spriteSheet team1:(NSArray *)players team2:(NSArray *)players;
//-(void) setSpriteSheet:(CCSpriteBatchNode *)spriteSheet;

-(NSMutableArray *)getLineupPositionsFaceUp;
-(NSMutableArray *)getLineupPositionsFaceDown;
-(void) displayPlayersDirectionInfo;


//
-(void) updatePlayers:(CCTime)dt Ball:(Ball *)ball;
-(Player *) getMainPlayer;
-(Player *) getPlayer:(int)index;
-(NSMutableArray *) getPlayers;
-(NSMutableArray *) getOutfieldPlayers;
-(void) setVisible:(BOOL)status;
-(Player *) getPlayerById:(int)id;

//
-(Formation *)getFormations;

//
-(void) setTeamColour;
-(void) setPlayerSkinHair;

-(void) setTeamId:(int)_teamId;
-(int) getTeamId;
-(void) doMySort:(Ball *) ball;

//
-(void) activateClosestPlayerDeprecated:(Ball *)ball;
-(bool) isActivePlayer:(Player *)player;
-(void) setActivePlayerSpritePosition:(CGPoint) pos;
-(void) setActiveTargetSpritePosition:(CGPoint) pos;


//
-(Player *) getClosestPlayer:(Player *)player;
-(Player *) getClosestPlayerHuman:(Player *)player;
-(Player *) getClosestPlayerNotTooClose:(Player *)player :(int)minimumDistance;
-(Player *) getSecondClosestPlayerNotTooClose:(Player *)player :(int)minimumDistance;
-(Player *) getFurthestPlayer:(Player *)player;
-(Player *) getOppTeamActivePlayer;
-(NSMutableArray *) getPlayersClosestFirstMinimumDistance:(Player *)player :(int)minimumDistance;
-(NSArray *) getPlayersOrderedByDistance :(CGPoint)position;
-(void) showSecondClosestPlayerTest :(Ball *)ball;
-(Player *) getSecondClosestPlayer :(Ball *)ball;
-(void) activateSecondClosestPlayer :(Ball *) ball;

//
-(void) updateActivePlayerverrideTimer;
-(void) resetActivePlayerverrideTimer;
-(void) updateTimers;


//
-(void) activateClosestXPlayers:(int) numberToActivate :(CGPoint)position;
-(void) activateClosestXPlayersRestricted:(int) numberToActivate :(CGPoint)position;
-(void) activateClosestXPlayersGoalNonGoalSide:(int) numGoalSide :(int) numNonGoalSide :(CGPoint)position;
//-(void) resetTargetPosClosestPlayersWithinDistance:(int)range :(CGPoint)position;
//
-(void) setupRunoutStartPositions;
-(void)setPlayerLineupPositions:(NSMutableArray *)positions;
-(void)setPlayerLineupPositionsFacingUp:(NSMutableArray *)positions;
-(void)setPlayerLineupPositionsFacingDown:(NSMutableArray *)positions;
-(void)setPlayerNames:(NSMutableArray *)names;

//
-(CGPoint) getKickOffStriker1Position;
-(CGPoint) getKickOffStriker2Position;

//
-(void) setLineupPositions;
-(void) checkBoundary;

//
-(bool) isPrimeActivePlayer:(Player *)player;
-(bool) isAnActivePlayer:(Player *)player;

//
-(void) setActivePlayerSprite:(CCSprite *)sprite;
-(void) setActiveTargetSprite:(CCSprite *)sprite;
-(void) highlightClosestPlayerinFov:(Player *)player;
-(void) setPlayerArrowSprite:(CCSprite *)sprite;

//
-(int) getPlayingDirection;
-(void) setPlayingDirection:(int)dir;

//
-(void) setOppTeam:(Team *)team;
-(Team *)getOppTeam;
-(Player *) getKeeper;

//
-(void) movePlayersOntoPitch:(CCTime)dt :(Ball *)ball;
-(void) movePlayersOffField:(CCTime)dt;
-(void) movePlayersOffFieldHalfSpeed:(CCTime)dt;
-(void) movePlayersFullTimeHalfSpeed:(CCTime)dt;
-(void) movePlayersGoalNotScored:(CCTime)dt;
-(void) movePlayersGoalScored:(CCTime)dt :(Ball *)ball;

//
-(void) setHumanPlayer:(bool)human;
-(bool) isHumanTeam;
-(bool) isHumanTeamPlaying;
-(NSString *) getTeamName;
-(void) setTeamName:(NSString *)name;
-(void) showPlayers:(bool) show;
-(void) showAllPlayers:(bool) show;
-(void) setPlayersStanding;


//
-(void) setScore:(int)goals;
-(int) getScore;
-(void) updateScore;
-(void) setGoalScorerCelebPosition:(CCTime)dt :(Ball *)ball;
-(void) setCelebPositionSet:(bool)status;

//
-(bool) isPlayingUpPitch;
-(void) setPlayersFaceBall :(Ball *)ball;
-(void) updatePlayersGoalKick:(CCTime)dt :(Ball *)ball;
-(void) updatePlayersCornerKick:(CCTime)dt :(Ball *)ball;
-(void) updatePlayersBallOutOfBounds:(CCTime)dt;
-(void) updatePlayersThrowIn:(CCTime)dt :(Ball *)ball;
-(void) resetTargetPositionsForGoalKick;
-(bool) doesTeamHaveBall:(Ball *)ball;
-(void) setStandOff:(bool) status;

//
-(void) pickRandomFormation;
//-(void) setFormation332;
//-(void) setFormation323;
//-(void) setFormation422;
//-(void) setFormation431;
//-(void) setFormation431Wide;
//-(void) setFormation341;
//-(void) setFormation343;

-(void) set442;
-(void) set424;
-(void) set433;
-(void) set451;
-(void) set343;

-(void) setLineup433;


//
//-(void) setFormation332Attacking;
//-(void) setFormation323Attacking;
//-(void) setFormation422Attacking;
//-(void) setFormation431Attacking;
//-(void) setFormation431WideAttacking;
//-(void) setFormation341Attacking;

//
-(void) setStartPositions;
-(void) moveAllPlayersOffScreen;
-(bool) isReadyForKickOff;

//
+(void) resetAllTeamsToOriginalPLayerLineup;


//
//+(void)checkActivePlayerCollisionNew:(Team *)team1 :(Team *)team2 Ball:(Ball *)ball;
//+(void)checkActivePlayerCollision:(Team *)team1 :(Team *)team2;

@end

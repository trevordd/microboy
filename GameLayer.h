//
//  HelloWorldLayer.h
//  mySoccer
//
//  Created by Trevor Delves on 07/10/2011.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
//#import "CCTouchDispatcher.h"
#import "HUDLayer.h"
#import "Team.h"
#import "Player.h"
#import "Ball.h"
#import "CCLabelTTF.h"
#import "SceneManager.h"
#import "GameData.h"
#import "GameModel.h"
#import "GameInfoLayer.h"

@interface GameLayer : CCNode
{

    double timeAccumulator;
    int frameRate;
    int direction ;

    HUDLayer * _hud;
    
    // GameInfoLayer * _gameInfoLayer;
    CGPoint cameraPos;
    CGPoint cameraVec;
    
    Player *player;
    Team *team1;
    Team *team2;
    Ball *ball;
    
    CGPoint leftDPadPos;
    CGPoint rightDPadPos;
    CGPoint upDPadPos;
    CGPoint downDPadPos;
    CGPoint centerDPadPos;
    
    //
    CCSprite *pitch;
    CCSprite *goalTop, *goalBottom;
    CCSprite *kickOffSpr;
    CCSpriteFrame *frame;
    CCNode *line;
    
    
    CCSprite *activePlayerSprite;
    CCSprite *activeTargetSprite;
    
    CCSprite *testBallShadow;
    CCSprite *weatherShadow;
    
    CCSprite *testBall;
 
    // controls
    bool centerTouchBegan;
    bool outsideDeadzone;
    CGPoint swipeStart;
    CGPoint swipeEnd;
    
    //TODO - where to put this
    int passButtonHeldDownTime;
    bool passButtonTouchBegan;

    
    CGPoint swipeVector;
    // test
    bool kickOffDone;
    bool goalSprShown;
    bool halfTimeSprShown;
    bool keeperHasBallDone;
    bool goToMainMenuDone;
    bool goToFullTimeInfoDone;
    bool goToHalfTimeInfoDone;
    bool showPremMatchInfoDone;
    
    //
    bool isSecondHalf;
    int matchSecs;
    
    //
    bool humanPlayer;
    
    //
    CCTime deltaTime;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
//+(CCScene *) scene;
+(CCScene *) sceneNew;
//+(CCNode *) getGameLayer;


-(void) attachModel;
-(void) detachPlayersAndBall;
-(void) attachPlayersAndBall;
-(void) removeMyChild:(int)tag;

-(void) nextFrame:(CCTime)dt;
-(void) tick:(CCTime)dt;


// Add after @interface
-(id) initSimple;

//-(id) initWithHUD:(HUDLayer *)hud;
-(void) initTeamSprites;
-(void) centerPitch;
-(void) setViewpointCenter:(CGPoint) pos;
-(void) setViewpointPitchCenter;

-(CGPoint) normalise:(CGPoint)origVec;

-(void) setGameState :(enum gameState) newGameState;
-(void) setMatchState :(enum matchState) newMatchState;

//
-(void) doKickOff;

//
-(void) update:(CCTime)dt;

//
-(void) doPassControls:(bool) highPass;
-(void) doJoystickControls:(CGPoint)convertedLocation;

//
-(Team *) getTeamWhoScored;
-(Team *) getNonScoringTeam;
-(Player *) getKeeperWithBall;
-(void) startMainMenuTimer;
-(void) goToMainMenu;
-(void) goToFullTime;
-(void) goToHalfTime;


//-(void) drawLine :(CGPoint) p1 : (CGPoint) p2;
-(void) drawLine :(CGPoint) p1 : (CGPoint) p2 :(int) colour;
-(void) drawLineWithCustomTag :(CGPoint) p1 : (CGPoint) p2 :(id) tagName : (CCColor *) lineColor;
//-(void) drawLineWithTag :(CGPoint) p1 : (CGPoint) p2 :(int) colour :(int) tagId;
//-(void) drawLineWithTag :(CGPoint) p1 : (CGPoint) p2 :(int) colour;
-(void) drawLineYellow :(CGPoint) p1 : (CGPoint) p2 :(int) colour;

-(void) drawPitch;

//
- (BOOL) isWithinAreaNotDeadzone:(CGPoint)touchPos :(CGPoint)spritePos :(float)width :(int)deadZoneWidth;
//


@end

//
//  GameLayerData.h
//  mySoccer
//
//  Created by Trevor Delves on 18/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "cocos2d.h"
//#import "CCTouchDispatcher.h"
#import "HUDLayer.h"
#import "Team.h"
#import "Player.h"
#import "Ball.h"
#import "CCLabelTTF.h"
#import "SceneManager.h"
#import "GameData.h"
#import "GameInfoLayer.h"
#import "MatchData.h"
#import "ReplayItem.h"
    
    //#import "SimpleAudioEngine.h"
    
    enum gameState {mainMenu, chooseTeam, choosePlayers, matchInfo, matchStarted, matchInfoFullTime};
    enum matchState {preKickOffRunout, preKickOff, kickOff, gamePlaying, halfTime, halfTimeInfo, halfTimePreKickoff, fullTime, postGame, postGameReplay, throwIn, goal, keeperHasBall, ballOutOfBounds, ballOutOfBoundsThrowIn, cornerKick, goalKick, paused, replay, startManagerMode, managerModeStarted, managerModePaused, managerModeResumed, showTutorial, inGamePaused};

    enum taskName {none,taskKickOff,taskKeeperHasBall, taskHalfTime, taskFullTime, taskGoal, taskBallOutOfBounds};
    enum replayState {noReplay, replayPlay, replayPause, replayStop, replayRewind, replayForward, replayFastRewind, replayFastForward};
    enum matchMode {matchModeHuman, matchModeManager, matchModePlayerManager};
    enum matchType {matchDemo, matchExhibition, matchCup, matchManager};

    // HelloWorldLayer
    @interface GameModel : CCNode 
    {        
        double timeAccumulator;
        int frameRate;
        
        long numTicks;
        int tickTaskTime;
        bool tickTaskActive;
        bool managerMode;
        enum taskName taskName;
        enum replayState replayState;
        int replayTimer;
        int replaySpeed;
        bool pauseManagerMode;
        
        // controls
        long swiperTimer;
        
        
        //GameInfoLayer* giLayer;
        int direction;
        
        CCScene * scene;
        HUDLayer * hudLayer;
        GameLayer * gameLayer;
        GameInfoLayer * gameInfoLayer;
        
        MatchData * matchData;
        
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
        CCSprite *stadium;
        CCSprite *stadiumLevels;
        
        CCSprite *goalTop, *goalBottom, *goalTopMask, *goalBottomMask;
        CCSprite *kickOffSpr;
//        CCSpriteBatchNode *spriteSheet;
//        CCSpriteBatchNode *ballSpriteSheet;
        CCSpriteFrame *frame;
        CCNode *line;
        CCSprite *testBall;
        CCSprite *testRightGoal;
        CCSprite *testLeftGoal;
        CCSprite *testActivePlayer1;
        CCSprite *testActivePlayer2;
        CCSprite *testKeeperTeam1;
        CCSprite *testKeeperTeam2;
        CCSprite *topAdvert1;
        CCSprite *topAdvert2;
        CCSprite *topAdvert1b;
        CCSprite *topAdvert2b;
        
        CCSprite *leftAdvert;
        CCSprite *rightAdvert;
        CCSprite *leftAdvertBlank;
        CCSprite *rightAdvertBlank;
        
        
        CCSprite *leftAdvertLogo;
        CCSprite *rightAdvertLogo;
   
        CCSprite *leftAdvertMicroLogo;
        CCSprite *rightAdvertMicroLogo;
        
        CCSprite *topAdvertLogo;
        CCSprite *bottomAdvertLogo;
        CCSprite *topAdvertMicroLogo;
        CCSprite *bottomAdvertMicroLogo;
        
        CCSprite *microboybanner;
        CCSprite *stairs;
        
        CCSprite* topHoarding;
        CCSprite* bottomHoarding;
  
        CCSprite* topHoardingBlank;
        CCSprite* bottomHoardingBlank;

        
        CCSprite *topCrowd;
        CCSprite *bottomCrowd;
        
        CCSprite* micropitchlogo1;
        CCSprite* micropitchlogo2;

        CCSprite* microboypitchlogo1;
        CCSprite* microboypitchlogo2;
        
        CCSprite* microboysolopitchlogo1;
        CCSprite* microboysolopitchlogo2;
        
        CCSprite*  rightAdvertTwitter;
        CCSprite*  leftAdvertTwitter;
        CCSprite*  rightAdvertEmail;
        CCSprite*  leftAdvertEmail;
        
        CCSprite* leftHoardingBorderTop;
        CCSprite* leftHoardingBorderBottom;
        CCSprite* rightHoardingBorderTop;
        CCSprite* rightHoardingBorderBottom;

        CCSprite* topHoardingBorder;
        CCSprite* bottomHoardingBorder;

        CCSprite* pitchPattern;
        CCSprite* teamBadge;

        
        NSMutableArray *fovSprites;
        //
        //    CCLabelTTF *scorelabel;
        //    CCLabelTTF *timelabel;
        //    CCLabelTTF *p1Namelabel;
        //    CCLabelTTF *p2Namelabel;
        
        CCSprite *activePlayerSprite;
        CCSprite *activeTargetSprite;
        CCSprite *playerArrowSprite;
        
        CCSprite *testBallShadow;
        CCSprite *weatherShadow;
        
        enum gameState gameState;
        enum gameState prevGameState;
        
        enum matchState matchState;
        enum matchState prevMatchState;
        
        enum matchMode matchMode;
        enum matchType matchType;
//        
        // controls
        bool centerTouchBegan;
        bool outsideDeadzone;
        
        // test
        bool kickOffDone;
        bool goalSprShown;
        bool halfTimeSprShown;
        bool keeperHasBallDone;
        bool ballOutOfBoundsDone;
        bool goToMainMenuDone;
        bool goToFullTimeInfoDone;
        bool goToHalfTimeInfoDone;
        bool showPremMatchInfoDone;
        bool preKickOffRunoutDone;
        
        
        //
        bool isSecondHalf;
        int matchSecs;
        bool tickTimePaused;
        bool managerModedGameOver;
        
        //
        bool humanPlayer;
        int kickOffTeamId;
        
        //
        CCTime deltaTime;
        
        //
        bool passButtonTouched;
        int passButtonHeldDownTime;
        
        //
        int noControlsAfterPassCounter;
        bool controlsPassJustMade;
        
        //
        NSMutableArray *pitchFrames;
        NSMutableArray *pitchPatterns;
        
        NSMutableArray *scannerObjects;
        
        //
//        CCNodeColor *tutorialBackground1;
//        CCNodeColor *tutorialBackground2;
    }
    
@property (nonatomic, strong) CCSprite* pitch;
@property (nonatomic, strong) CCSprite* stadium;
@property (nonatomic, strong) CCSprite* stadiumLevels;
@property (nonatomic, strong) CCSprite* goalTop;
@property (nonatomic, strong) CCSprite* goalBottom;
@property (nonatomic, strong) CCSprite* goalTopMask;
@property (nonatomic, strong) CCSprite* goalBottomMask;
@property (nonatomic, strong) CCSprite* activePlayerSprite;
@property (nonatomic, strong) CCSprite* activeTargetSprite;
@property (nonatomic, strong) CCSprite* playerArrowSprite;
@property (nonatomic, strong) CCSprite* kickOffSpr;
@property (nonatomic, strong) CCSprite* testBall;
@property (nonatomic, strong) CCSprite* testRightGoal;
@property (nonatomic, strong) CCSprite* testLeftGoal;
@property (nonatomic, strong) CCSprite* testActivePlayer1;
@property (nonatomic, strong) CCSprite* testActivePlayer2;
@property (nonatomic, strong) CCSprite* testKeeperTeam1;
@property (nonatomic, strong) CCSprite* testKeeperTeam2;
@property (nonatomic, strong) CCSprite* topAdvert1;
@property (nonatomic, strong) CCSprite* topAdvert2;
@property (nonatomic, strong) CCSprite* topAdvert1b;
@property (nonatomic, strong) CCSprite* topAdvert2b;
@property (nonatomic, strong) CCSprite* leftAdvert;
@property (nonatomic, strong) CCSprite* rightAdvert;
@property (nonatomic, strong) CCSprite* leftAdvertLogo;
@property (nonatomic, strong) CCSprite* rightAdvertLogo;
@property (nonatomic, strong) CCSprite* leftAdvertMicroLogo;
@property (nonatomic, strong) CCSprite* rightAdvertMicroLogo;
@property (nonatomic, strong) CCSprite* leftAdvertBlank;
@property (nonatomic, strong) CCSprite* rightAdvertBlank;
@property (nonatomic, strong) CCSprite* topCrowd;
@property (nonatomic, strong) CCSprite* bottomCrowd;
@property (nonatomic, strong) CCSprite* microboybanner;
@property (nonatomic, strong) CCSprite* stairs;
@property (nonatomic, strong) CCSprite* topHoarding;
@property (nonatomic, strong) CCSprite* bottomHoarding;
@property (nonatomic, strong) CCSprite* topHoardingBlank;
@property (nonatomic, strong) CCSprite* bottomHoardingBlank;
@property (nonatomic, strong) CCSprite* micropitchlogo1;
@property (nonatomic, strong) CCSprite* micropitchlogo2;
@property (nonatomic, strong) CCSprite* microboypitchlogo1;
@property (nonatomic, strong) CCSprite* microboypitchlogo2;
@property (nonatomic, strong) CCSprite* microboysolopitchlogo1;
@property (nonatomic, strong) CCSprite* microboysolopitchlogo2;

@property (nonatomic, strong) NSMutableArray *pitchFrames;
@property (nonatomic, strong) NSMutableArray *pitchPatterns;
@property (nonatomic, strong) NSMutableArray *scannerObjects;

@property (nonatomic, strong) CCSprite* leftHoardingBorderTop;
@property (nonatomic, strong) CCSprite* leftHoardingBorderBottom;
@property (nonatomic, strong) CCSprite* rightHoardingBorderTop;
@property (nonatomic, strong) CCSprite* rightHoardingBorderBottom;
@property (nonatomic, strong) CCSprite* topHoardingBorder;
@property (nonatomic, strong) CCSprite* bottomHoardingBorder;
@property (nonatomic, strong) CCSprite *topAdvertLogo;
@property (nonatomic, strong) CCSprite *bottomAdvertLogo;
@property (nonatomic, strong) CCSprite *topAdvertMicroLogo;
@property (nonatomic, strong) CCSprite *bottomAdvertMicroLogo;
@property (nonatomic, strong) CCSprite* pitchPattern;
@property (nonatomic, strong) CCSprite*  rightAdvertTwitter;
@property (nonatomic, strong) CCSprite*  leftAdvertTwitter;
@property (nonatomic, strong) CCSprite*  rightAdvertEmail;
@property (nonatomic, strong) CCSprite*  leftAdvertEmail;


@property (nonatomic, strong) CCSprite*  teamBadge;


@property (nonatomic) int kickOffTeamId;
@property (nonatomic) int noControlsAfterPassCounter;
@property (nonatomic, assign) bool controlsPassJustMade;

@property (nonatomic, strong) NSMutableArray* fovSprites;
@property (nonatomic, strong) MatchData* matchData;
@property (nonatomic, assign) long numTicks;
@property (nonatomic, assign) int tickTaskTime;

@property (nonatomic, assign) long swipeTimer;

//@property (nonatomic, assign) enum replayState replayState;
@property (nonatomic, assign) int replaySpeed;

//
@property (nonatomic, assign) enum matchMode matchMode;
@property (nonatomic, assign) enum matchType matchType;

//
//@property (nonatomic, strong) CCNodeColor *tutorialBackground1;
//@property (nonatomic, strong) CCNodeColor *tutorialBackground2;




    // returns a CCScene that contains the HelloWorldLayer as the only child
    //+(CCScene *) scene;
    //+(CCNode *) getGameLayer;
    
+ (GameModel*)sharedGameModel;
-(void) setScene:(CCScene *)scene;
-(void) setGameLayer:(CCNode *)layer;
-(void) setHudLayer:(CCNode *)layer;
-(void) setGameInfoLayer:(CCNode *)layer;
-(CCNode *) getGameLayer;
-(void) clearMatchData;

-(void) playSoundEffect:(NSString *)sndName;
-(void) setManagerMode:(bool)mState;
-(bool) isManagerMode;
-(void) saveMatchData;
-(Ball *)getBall;
-(void) addHightlightMarker;
//-(CCSprite *)getPitch;

-(int) getMatchSecs;
-(long) getTickTimeSecs:(long)tickTime;
-(long) getTickTimeMins:(long)tickTime;
-(int) getTickTimeInMins;
-(int) getTickTimeInSecs;
-(void) updateTickTime;
-(void) checkTimerTasks;
-(void) setCurrentTask:(enum taskName) task;
-(void) pauseTickTimer;
-(void) restartTickTimer;
-(void) resetTickTimer;
-(void) updateSwipeTime;
-(void) resetSwipeTime;

-(void) deactivateTickTaskTimer;
-(void) restartTickTaskTimer;
-(void) resetGame;
-(void) stopMatchClock;
-(void) startMatchClock;
-(void) updateMatchClockManagerMode;


-(void) startGameTick;
-(void) tick:(CCTime)dt;
    -(void) nextFrame:(CCTime)dt;
    -(void) createGameObjects;
    -(void) initMatchTeamData;
    -(void) initMatch;
    //-(id) initWithHUD:(HUDLayer *)hud;
//    -(void) setViewpointCenter:(CGPoint) position;
    -(void) moveCamera:(CCTime)dt;
    -(CGPoint) getCameraPos;
    -(CGPoint) normalise:(CGPoint)origVec;
    
    -(void) setGameState:(enum gameState)newGameState;
    -(void) setMatchState:(enum matchState)newMatchState;
    -(enum gameState) getGameState;
    -(enum matchState) getMatchState;

    
    //
    -(void) doKickOff;
    -(void) doGamePlaying:(CCTime)dt;
    -(void) doGoal;
    //-(void) doKeeperHasBall;
    -(void) doKeeperHasBall: (CCTime)dt;
    -(void) doBallOutOfBounds: (CCTime)dt;
    -(void) doBallOutOfBoundsCornerKick: (CCTime)dt;
    -(void) doBallOutOfBoundsThrowIn: (CCTime)dt  :(CGPoint)pos;

    //
    -(void) playMatchManagerMode;
    -(void) changeStateToGamePlaying;
    -(void) changeStateHalfTimeToKickOff;
    -(void) changeStatetoKickOffAfterGoal;
    -(void) changeStatetoGoalKickFromOutOfBounds;
    -(void) changeStatetoCornerKickFromOutOfBounds;
-(void) changeStatetoThrowninFromOutOfBounds;
    -(void) showPreMatchInfo;
    -(void) showHalfTimeInfo;
//    -(void) hideHalfTimeSpr;
    -(void) updateScoreInfo;
    -(void) resetHalfTimePlayerLineups;

    -(void) setCameraPos:(CGPoint)camPos;


    -(void) showScanner:(bool)status;

    //
    -(void) changeStatetoGamePlayingFromGoalKick;
    -(void) changeStatetoGamePlayingFromGoalKickHuman;
    -(void) changeStatetoGamePlayingFromCornerKick;
    -(void) setStateKeeperHasBall;

    //
    -(Team *)getTeam1;
    -(Team *)getTeam2;

    -(void) setKickOffTeamGoalScored;
    -(void) doFullTimeCelebrations:(CCTime)dt :(Ball *) theBall;
    -(Team *) getTeamWhoScored;
    -(Team *) getNonScoringTeam;
    -(Player *) getKeeperWithBall;
    -(bool) isKeeperWithBallHumanPlayer;
    -(void) startMainMenuTimer;
    -(void) goToMainMenu;
    -(void) goToFullTime;
    -(void) goToHalfTime;
//    -(void) goToFullTimeReplay;
    -(bool) isHalfOrFullTime;
    
    //-(void) drawLine :(CGPoint) p1 : (CGPoint) p2;
    -(void) drawLine :(CGPoint) p1 : (CGPoint) p2 :(int) colour;
    -(void) drawPitch;
    
    //
    - (BOOL) isWithinAreaNotDeadzone:(CGPoint)touchPos :(CGPoint)spritePos :(float)width :(int)deadZoneWidth;
    -(void) checkControlsPause;
    //
//    -(void)nextFrameTest;

    // replays
    -(void) replayMatch;
    -(void) replayFrame:(ReplayFrame *)replayFrame;
    -(void) setReplayState:(enum replayState) state;
    -(void) showFirstReplayFrame;
    -(void) replayFullMatch;
    -(void) replayGoals;
    -(void) replayHighlights;


    //
    -(void) moveAdverts: (CCTime)dt;

    //
    -(void) setPitchFrame:(int) frameIndex;
    -(void) chooseRandomPitch;




@end

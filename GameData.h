//
//  GameData.h
//  mySoccer
//
//  Created by Trevor Delves on 07/05/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TeamData.h"
#import "GameModel.h"

@class GameModel;

//enum gameState {mainMenu, matchStarted};
//enum matchState {preKickOff, kickOff, gamePlaying, halfTime, halfTimeInfo, halfTimePreKickoff, fullTime, postGame, throwIn, goal, keeperHasBall, goalKick};
//

@interface GameData : CCNode
{
    
    GameModel *gameModel;
    NSMutableArray *teams;
    NSMutableArray *currentTeams; //modified squad used during match
    NSMutableArray *matchTeams;
    NSMutableArray *originalTeams;
    
    
    int team1Score;
    int team2Score;
    
    int matchLength;
    int difficulty;
    bool buttonControlsOn;
    bool swipeControlsOn;
    bool crowdSoundsOn;
    bool fxSoundsOn;
    bool menuSoundsOn;
    NSString *menuSong;
    
    bool matchInProgress;
    CCNode *savedGameLayer;
    CCScene *savedGameScene;
    
    bool doTestLoop;
    
    //
    bool tutorialShown;
    bool tutorialShownPractice;
    int timesTutorialShown;
    
  // int testNum;
}

@property (nonatomic, assign) bool matchInProgress;
@property (nonatomic, strong) CCScene* savedGameScene;
@property (nonatomic, assign) int team1score;
@property (nonatomic, assign) int team2score;
@property (nonatomic, assign) int matchLength;
@property (nonatomic, strong) GameModel *gameModel;
@property (nonatomic, assign) int timesTutorialShown;
@property (nonatomic, assign) bool tutorialShown;
@property (nonatomic, assign) bool tutorialShownPractice;
@property (nonatomic, assign) bool soundsLoaded;







+ (GameData*)sharedGameDataManager;
+ (void) setTestNum:(int)num;
+ (int) getTestNum;
+ (bool) isHumanTeam;
+ (void) setHumanTeam:(bool)human;
+ (void) setPracticeMatch:(bool)practice;
+ (bool) isPracticeMatch;

// FUll time zoom
+ (void) setFulltimeZoom:(bool)doZoom;
+ (bool) getFulltimeZoom;


//Options
+ (void) setMatchLength:(int)level;
+ (int) getMatchLength;

+ (void) setBallColour:(int)level;
+ (int) getBallColour;

+ (void) setDifficulty:(int)level;
+ (int) getDifficulty;

+ (int) getScreenHeight;
+ (int) getScreenWidth;

+ (void) setScreenHeight:(int)height;
+ (void) setScreenWidth:(int)width;

+ (void) setButtonControls:(bool)status;
+ (bool) isButtonControlsOn;

+ (void) setSwipeControls:(bool)status;
+ (bool) isSwipeControlsOn;

+ (void) setMoveAssist:(bool)status;
+ (bool) isMoveAssistOn;

+ (void) setPartialMoveAssist:(bool)status;
+ (bool) isPartialMoveAssistOn;

+ (void) setCrowdSounds:(bool)status;
+ (bool) isCrowdSoundsOn;

+ (void) setFxSounds:(bool)status;
+ (bool) isFxSoundsOn;

+ (void) setMenuSounds:(bool)status;
+ (bool) isMenuSoundsOn;

+ (void) setMenuSong:(NSString *)menuSong;
+ (NSString *) getMenuSong;

+ (void) setDoResetMenuMusic:(bool)status;
+ (bool) getDoResetMenuMusic;

+ (void) setMicroSoccerStarted:(bool)status;
+ (bool) getMicroSoccerStarted;

+ (void) setLastReplayScale:(float)scale;
+ (float) getLastReplayScale;


+ (void) setLastGameScale:(float)scale;
+ (float) getLastGameScale;

//
- (long) getNumberOfTeams;
- (void) initTeams;
- (NSMutableArray *)getTeams;
- (TeamData *)getTeam:(int)teamId;
- (TeamData *)getOriginalTeam:(int)teamId;

- (TeamData *)getCurrentTeam:(int)teamId;
- (TeamData *)getMatchTeam:(int)teamId;
- (void) addMatchTeam:(TeamData *)team;
- (void) clearMatchTeams;


- (void)addTeam:(TeamData *)team;
- (void) setSavedGameLayer:(CCNode *)layer;
- (CCNode *) getSavedGameLayer;

@end

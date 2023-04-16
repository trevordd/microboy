//
//  SceneManager.h
//  mySoccer
//
//  Created by Trevor Delves on 24/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "MenuLayer.h"
#import "GameLayer.h"
#import "HUDLayer.h"
#import "GameData.h"
#import "MenuTeamLayer.h"
#import "MenuChooseTeamLayer.h"
#import "MenuGameTypeLayer.h"
#import "MenuOptionsLayer.h"
#import "MenuHelpLayer.h"
#import "MenuOptionsTimeLayer.h"
#import "MenuOptionsDifficultyLayer.h"
#import "MenuOptionsSoundLayer.h"
#import "MenuOptionsControlsLayer.h"
#import "BallOptionsLayer.h"
//#import "SwipeInfoLayer.h"

#import "cocos2d.h"
//#import "GameModel.h"

@class GameInfoLayer;
@class GameModel;

@interface SceneManager : NSObject {
    
    GameLayer* gameLayer;
    GameInfoLayer* gameInfoLayer;
    HUDLayer* hudLayer;
    GameData *gameData;
    GameModel *gameModel;
    HudModel *hudModel;
    //SwipeInfoLayer *swipeInfoLayer;
    //TutorialLayer *tutorialLayer;
    
    bool initialised;
}



@property (nonatomic, strong) GameLayer* gameLayer;
@property (nonatomic, strong) GameInfoLayer* gameInfoLayer;
@property (nonatomic, strong) HUDLayer* hudLayer;
@property (nonatomic, strong) GameData* gameData;
@property (nonatomic, strong) GameModel* gameModel;
@property (nonatomic, strong) HudModel* hudModel;

//@property (nonatomic, strong) SwipeInfoLayer* swipeInfoLayer;
//@property (nonatomic, strong) TutorialLayer* tutorialLayer;



+(SceneManager *) sharedSceneManager;
+(void) initGame;

+(void) goMenu;
+(void) goGame;
+(void) goDemoGame;
+(void) goTeamMenu;
+(void) goChooseTeamMenu;
+(void) goGameTypeMenu;

+(void) goMenuOptions;
+(void) goMenuOptionsTime;
+(void) goMenuOptionsDifficulty;
+(void) goMenuOptionsControls;
+(void) goMenuOptionsSound;
+(void) goMenuOptionsBall;
+(void) goHelpMenu;
+(CCScene *) getTeamOptionsScene;

//
-(void) initGame;

@end
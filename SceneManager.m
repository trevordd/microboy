//
//  SceneManager.m
//  mySoccer
//
//  Created by Trevor Delves on 24/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//


#import "SceneManager.h"
#import "GameModel.h"


@interface SceneManager ()
+(void) go: (CCNode *) layer;
+(CCScene *) wrap: (CCNode *) layer;

@end


@implementation SceneManager

@synthesize gameInfoLayer;
@synthesize gameLayer;
@synthesize hudLayer;
@synthesize gameData;
@synthesize gameModel;
@synthesize hudModel;
//@synthesize swipeInfoLayer;
//@synthesize tutorialLayer;

static SceneManager *sceneManager = nil;

+ (SceneManager*)sharedSceneManager
{
    if (sceneManager == nil) {
        sceneManager = [[super alloc] init];
    }
    return sceneManager;
}

+(void) goMenu{
	CCNode *layer = [MenuLayer node];
	[SceneManager go: layer];
}

+(void) goTeamMenu{
	CCNode *layer = [MenuTeamLayer node];
	[SceneManager go: layer];
}

+(void) goChooseTeamMenu{
	CCNode *layer = [MenuChooseTeamLayer node];
	[SceneManager go: layer];
}

+(void) goGameTypeMenu{
	CCNode *layer = [MenuGameTypeLayer node];
	[SceneManager go: layer];
}

+(void) goMenuOptions{
	CCNode *layer = [MenuOptionsLayer node];
	[SceneManager go: layer];
}

+(void) goMenuOptionsTime {
    CCNode *layer = [MenuOptionsTimeLayer node];
    [SceneManager go: layer];
}

+(void) goMenuOptionsDifficulty {
    CCNode *layer = [MenuOptionsDifficultyLayer node];
    [SceneManager go: layer];
}

+(void) goMenuOptionsControls {
    CCNode *layer = [MenuOptionsControlsLayer node];
    [SceneManager go: layer];
}

+(void) goMenuOptionsSound {
    CCNode *layer = [MenuOptionsSoundLayer node];
    [SceneManager go: layer];
}

+(void) goMenuOptionsBall {
    CCNode *layer = [BallOptionsLayer node];
    [SceneManager go: layer];
}

+(void) goHelpMenu {
    CCNode *layer = [MenuHelpLayer node];
    [SceneManager go: layer];
}

+(CCScene *) getTeamOptionsScene
{
    CCNode *layer = [MenuTeamLayer node];
    CCScene *newScene = [CCScene node];
	[newScene addChild: layer];
	return newScene;
}




//
+(void) initGame
{
    GameData *gd = [GameData sharedGameDataManager];
    GameModel *gm = [GameModel sharedGameModel];
    [gd setGameModel:gm];
    
    CCLOG(@" >>* Game Model created...");
}

//
-(void) initGame
{
    
    if (!initialised)
    {
        CCLOG(@">> INIT GAME <<");
        
        CGSize viewSize = [CCDirector sharedDirector].viewSize;
        [GameData setScreenWidth:viewSize.width];
        [GameData setScreenHeight:viewSize.height];

    
        self.gameData = [GameData sharedGameDataManager];
        self.gameModel = [GameModel sharedGameModel];
        [self.gameModel createGameObjects];
    
        self.hudModel = [HudModel sharedHudModel];
        [self.hudModel createHudObjects];
        
        
    
        initialised = true;
    
        // [self.gameData setGameModel:gameModel];
    
        CCLOG(@" >> Game Model created >> ...");
    }
    
}

//
+(void) goDemoGame{
    CCDirector *director = [CCDirector sharedDirector];

    //COMMENTED
    [director replaceScene:[GameLayer sceneNew]];

}


+(void) goGame
{
    CCDirector *director = [CCDirector sharedDirector];
    
    CCLOG(@">>> Current scene is %@", [[CCDirector sharedDirector] runningScene]);
    
    //COMMENTED
    //[director replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene: [GameLayer sceneNew]]];
    [director replaceScene:[GameLayer sceneNew]];
}

+(void) go: (CCNode *) layer{
	CCDirector *director = [CCDirector sharedDirector];
	CCScene *newScene = [SceneManager wrap:layer];
	if ([director runningScene])
    {
        CCLOG(@">> go: Replace scene");
        
        //COMMENTED
        //[director runWithScene:newScene];
        [director replaceScene:newScene];
	} else {
        CCLOG(@">> go: Run With Scene");
        [director runWithScene:newScene];
	}
}

+(CCScene *) wrap: (CCNode *) layer{
	CCScene *newScene = [CCScene node];
	[newScene addChild: layer];
	return newScene;
}

@end
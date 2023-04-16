//
//  MenuGameType.m
//  mySoccer
//
//  Created by Trevor Delves on 09/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuGameTypeLayer.h"


@implementation MenuGameTypeLayer

-(id) init{
	self = [super init];
    
    // Menu Position
    
    int menuX = [CCDirector sharedDirector].viewSize.width/2;
    int menuY = [CCDirector sharedDirector].viewSize.height/2;
    
    menuBG =[CCSprite spriteWithImageNamed: MENU_BG];
    menuBG.scale=MENU_BG_SCALE;
    [menuBG setPosition :ccp(menuX,menuY)];
    
    [self addChild:menuBG z:0];
    // [self addChild:menu2BG z:0];
    
    titleLabel = [CCLabelTTF labelWithString:@"GAME TYPE" fontName:@MENU_FONT fontSize:32];
    [titleLabel setPosition: ccp(menuX, 290)];
    [self addChild:titleLabel];
    
    forwardLabel = [CCLabelTTF labelWithString:@FORWARD_BUTTON fontName:@MENU_FONT fontSize:20];
    [forwardLabel setPosition: ccp(380, 50)];
    
//    backLabel = [CCLabelTTF labelWithString:@"BACK" fontName:@MENU_FONT fontSize:20];
//    [backLabel setPosition: ccp(50, 50)];
//    
//    // [self addChild:forwardLabel z:1];
//    [self addChild:backLabel z:1];
    
    CCButton * prevBtn = [CCButton buttonWithTitle:@BACK_BUTTON fontName:@MENU_FONT fontSize:20];
    prevBtn.anchorPoint = ccp(0.5,0.5);
    [prevBtn setPosition: ccp(50, 25)];
    [prevBtn setTarget:self selector:@selector(onGoBack:)];
    [self addChild:prevBtn];
    
    CCButton * modeHuman = [CCButton buttonWithTitle:@"Human" fontName:@MENU_FONT fontSize:24];
    [modeHuman setPosition: ccp(menuX +(0*100),230-(0*50))];
    [modeHuman setTarget:self selector:@selector(onHumanGame:)];
    [self addChild: modeHuman];
    
    CCButton * modeManager = [CCButton buttonWithTitle:@"Manager***" fontName:@MENU_FONT fontSize:24];
    [modeManager setPosition: ccp(menuX +(0*100),230-(1*50))];
    [modeManager setTarget:self selector:@selector(onManagerGame:)];
    [self addChild: modeManager];
    
    CCButton * modePlayerManager = [CCButton buttonWithTitle:@"Player Manager" fontName:@MENU_FONT fontSize:24];
    [modePlayerManager setPosition: ccp(menuX +(0*100),230-(2*50))];
    [modePlayerManager setTarget:self selector:@selector(onPManagerGame:)];
    [self addChild: modePlayerManager];
    
    [self setMultipleTouchEnabled:YES];
	return self;
}


- (void)onHumanGame:(id)sender
{
    [MenuLayer playMenuButtonSound];

    [GameData setHumanTeam:true]; //TODO DEPRECATED
    [[GameModel sharedGameModel] setMatchMode:matchModeHuman];
    
	[SceneManager goChooseTeamMenu];
}


- (void)onManagerGame:(id)sender
{
    [MenuLayer playMenuButtonSound];

    [GameData setHumanTeam:false]; //TODO DEPRECATED
    [[GameModel sharedGameModel] setMatchMode:matchModeManager];
    [SceneManager goChooseTeamMenu];
}


- (void)onPManagerGame:(id)sender
{
    [MenuLayer playMenuButtonSound];

    [GameData setHumanTeam:false]; //TODO DEPRECATED
    [[GameModel sharedGameModel] setMatchMode:matchModePlayerManager];
    [SceneManager goChooseTeamMenu];
}


- (void)onGoBack : (id)sender {
    NSLog(@"GOBACK >>>");
    [MenuLayer playMenuButtonSound3];
    [SceneManager goMenu];
}


- (BOOL) isWithinArea:(CGPoint)touchPos :(CGPoint)spritePos :(float)width {
    
    if (touchPos.x > spritePos.x - width &&
        touchPos.x < spritePos.x + width &&
        touchPos.y > spritePos.y - width &&
        touchPos.y < spritePos.y + width  )
        return true;
    else
        return false;
}
//COMMENTED-REMOVED

- (void)touchBegan:(CCTouch*) touch withEvent:(CCTouchEvent*) event {
}


@end

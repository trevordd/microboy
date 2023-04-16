//
//  MenuOptionsLayer.m
//  mySoccer
//
//  Created by Trevor Delves on 10/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuOptionsLayer.h"


@implementation MenuOptionsLayer


-(id) init{
	self = [super init];
    
    int menuX = [CCDirector sharedDirector].viewSize.width/2;
    int menuY = [CCDirector sharedDirector].viewSize.height/2;
    
    menuBG =[CCSprite spriteWithImageNamed: MENU_BG];
    menuBG.scale=MENU_BG_SCALE;
    [menuBG setPosition :ccp(menuX,menuY)];
        
   
    [self addChild:menuBG z:0];
   // [self addChild:menu2BG z:0];
    
    //
    CCSprite *menuBox=[CCSprite spriteWithImageNamed: @"menu_box_1.png"];
    CCSprite *menuLogo=[CCSprite spriteWithImageNamed: @"logo.png"];;
    CCSprite *menuTab=[CCSprite spriteWithImageNamed: @"menuBar.png"];;
    
    [menuBox setPosition : ccp(menuX,menuY+8)];
    [menuLogo setPosition : ccp(menuX,menuY+125)];
    [menuTab setPosition : ccp(menuX,menuY+120)];
    
    menuBox.scaleX=0.50;
    menuBox.scaleY=0.29;
    
    menuLogo.scale=0.13;
    
    menuTab.scaleX=0.85;
    menuTab.scaleY=0.30;
    
 //
    //
    [self addChild: menuBox z:0];
    [self addChild: menuTab z:0];
    [self addChild: menuLogo z:0];
    
    int menuYBase=menuY+(menuY/5);
    
    CCButton * prevBtn = [CCButton buttonWithTitle:@BACK_BUTTON fontName:@MENU_FONT fontSize:NEXT_FORWARD_BUTTON_FONT_SIZE];
    prevBtn.anchorPoint = ccp(0.5,0.5);
    [prevBtn setPosition: ccp(50, 25)];
    [prevBtn setTarget:self selector:@selector(onGoBack:)];
    [self addChild:prevBtn z:1];

    //
    CCSprite *backBox =[CCSprite spriteWithImageNamed: @"transparent_box.png"];
    backBox.scaleY=0.75;
    backBox.scaleX=0.60;
    [backBox setPosition :prevBtn.position];
    [self addChild:backBox z: 0];
    

    //
    titleLabel = [CCLabelTTF labelWithString:@"OPTIONS" fontName:@MENU_FONT fontSize:MENU_TITLE_FONT_SIZE];
    [titleLabel setPosition: ccp(menuX, menuYBase+50)];
    [self addChild:titleLabel];
    
    int yGap=30;
    
    //
    CCButton * matchLength = [CCButton buttonWithTitle:@"MATCH LENGTH" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [matchLength setPosition: ccp(menuX +(0*100),menuYBase-(0*yGap))];
    [matchLength setTarget:self selector:@selector(onMatchLength:)];
    [self addChild: matchLength];
    
    //
    CCButton * difficulty = [CCButton buttonWithTitle:@"DIFFICULTY" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [difficulty setPosition: ccp(menuX +(0*100),menuYBase-(1*yGap))];
    [difficulty setTarget:self selector:@selector(onDifficulty:)];
    [self addChild: difficulty];
    
    //
    CCButton * controls = [CCButton buttonWithTitle:@"CONTROLS" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [controls setPosition: ccp(menuX +(0*100),menuYBase-(2*yGap))];
    [controls setTarget:self selector:@selector(onControls:)];
    [self addChild: controls];

    //
    CCButton * sound = [CCButton buttonWithTitle:@"SOUND" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [sound setPosition: ccp(menuX +(0*100),menuYBase-(3*yGap))];
    [sound setTarget:self selector:@selector(onSound:)];
    [self addChild: sound];

    //
    CCButton * ball = [CCButton buttonWithTitle:@"BALL" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [ball setPosition: ccp(menuX +(0*100),menuYBase-(4*yGap))];
    [ball setTarget:self selector:@selector(onBall:)];
    [self addChild: ball];

    
	return self;
}

- (void)onMatchLength:(id)sender
{
    [MenuLayer playMenuButtonSound];

    //[GameData setHumanTeam:true];
	[SceneManager goMenuOptionsTime];
}

- (void)onDifficulty:(id)sender
{
    [MenuLayer playMenuButtonSound];

    //[GameData setHumanTeam:true];
    [SceneManager goMenuOptionsDifficulty];
}

- (void)onSkillLevel:(id)sender
{
    [MenuLayer playMenuButtonSound];

    //[GameData setHumanTeam:false];
    [SceneManager goMenuOptionsDifficulty];
}

- (void)onControls:(id)sender
{
    [MenuLayer playMenuButtonSound];

    //[GameData setHumanTeam:true];
    [SceneManager goMenuOptionsControls];
}

- (void)onSound:(id)sender
{
    [MenuLayer playMenuButtonSound];

    //
    [GameData setHumanTeam:true];
    [SceneManager goMenuOptionsSound];
}

- (void)onBall:(id)sender
{
    [MenuLayer playMenuButtonSound];
    
    //
    [GameData setHumanTeam:true];
    [SceneManager goMenuOptionsBall];
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
//COMMENTED_REMOVED

- (void)touchBegan:(CCTouch*) touch withEvent:(CCTouchEvent*) event {
//- (BOOL)ccTouchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    
    if (!self.visible)
    {
       // return false;
    }
    
    NSLog(@"TOUCH BEGAN...");
    
    //    if ([self isWithinArea: convertedLocation : forwardLabel.position : forwardLabel.textureRect.size.width])
    //    {
    //        NSLog(@"GO TO TEAM MENU");
    //        [SceneManager goTeamMenu];
    //    }
    
//    if ([self isWithinArea: convertedLocation: backLabel.position : backLabel.textureRect.size.width])
//    {
//        NSLog(@"GO BACK TO MENU");
//        [SceneManager goMenu];
//    }
    //return YES;
}

- (void) dealloc
{
    [self removeAllChildrenWithCleanup:YES];
}


@end

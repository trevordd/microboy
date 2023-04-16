//
//  MenuGameType.m
//  mySoccer
//
//  Created by Trevor Delves on 09/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuOptionsControlsLayer.h"



//
@implementation MenuOptionsControlsLayer

-(id) init{
    self = [super init];
    
    // Menu Position
    
    int menuX = [CCDirector sharedDirector].viewSize.width/2;
    int menuY = [CCDirector sharedDirector].viewSize.height/2;
    
    menuBG =[CCSprite spriteWithImageNamed: MENU_BG];
    menuBG.scale=MENU_BG_SCALE;
    menuBG.position = MENU_BG_POS;
    [menuBG setPosition :ccp(menuX,menuY)];
    [self addChild:menuBG z:0];
    //[self addChild:menu2BG z:0];
    
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
    
    
    [self addChild: menuBox z:0];
    [self addChild: menuTab z:0];
    [self addChild: menuLogo z:0];
    
    //
    int menuYBase=menuY+(menuY/5);
    
    
    //
    titleLabel = [CCLabelTTF labelWithString:@"CONTROLS" fontName:@MENU_FONT fontSize:24];
    [titleLabel setPosition: ccp(menuX, menuYBase+50)];
    [self addChild:titleLabel];
    
    
    //
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
    buttonControls = [CCButton buttonWithTitle:@"" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE-2];
    [buttonControls setPosition: ccp(menuX +(0*100),menuYBase-(0*50))];
    [buttonControls setTarget:self selector:@selector(onButtonControls)];
    [self addChild: buttonControls];
    
    swipeControls = [CCButton buttonWithTitle:@"" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE-2];
    [swipeControls setPosition: ccp(menuX +(0*100),menuYBase-(1*50))];
    [swipeControls setTarget:self selector:@selector(onSwipeControls)];
    [self addChild: swipeControls];
    
    playerMoveAssist = [CCButton buttonWithTitle:@"" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE-2];
    [playerMoveAssist setPosition: ccp(menuX +(0*100),menuYBase-(2*50))];
    [playerMoveAssist setTarget:self selector:@selector(onMoveAssistControls)];
    [self addChild: playerMoveAssist];

    
//    time3mins = [CCButton buttonWithTitle:@"3 Mins" fontName:@MENU_FONT fontSize:24];
//    [time3mins setPosition: ccp(menuX +(0*100),230-(2*50))];
//    [time3mins setTarget:self selector:@selector(on3mins:)];
//    [self addChild: time3mins];
//    
//    time5mins = [CCButton buttonWithTitle:@"5 Mins" fontName:@MENU_FONT fontSize:24];
//    [time5mins setPosition: ccp(menuX +(0*100),230-(3*50))];
//    [time5mins setTarget:self selector:@selector(on5mins:)];
//    [self addChild: time5mins];
//    
//    time7mins = [CCButton buttonWithTitle:@"7 Mins" fontName:@MENU_FONT fontSize:24];
//    [time7mins setPosition: ccp(menuX +(0*100),230-(4*50))];
//    [time7mins setTarget:self selector:@selector(on7mins:)];
//    [self addChild: time7mins];
//    
//    [self onButtonControls];
//    [self onSwipeControls];
//    
    [self updateButtonColors];
    
    [self setMultipleTouchEnabled:YES];
    return self;
}


-(void) updateButtonColors {
 
//    [self onButtonControls];
//    [self onSwipeControls];

   
    if ([GameData isButtonControlsOn]) {
        [buttonControls setColor:[CCColor yellowColor]];
        [buttonControls setTitle:@"BUTTON CONTROLS ON"];

    } else {
        [buttonControls setColor:[CCColor whiteColor]];
        [buttonControls setTitle:@"BUTTON CONTROLS OFF"];

    }
    
    if ([GameData isSwipeControlsOn]) {
        [swipeControls setColor:[CCColor yellowColor]];
        [swipeControls setTitle:@"SWIPE CONTROLS ON"];

    } else {
        [swipeControls setColor:[CCColor whiteColor]];
        [swipeControls setTitle:@"SWIPE CONTROLS OFF"];
    }
    
    if ([GameData isMoveAssistOn]) {
        [playerMoveAssist setColor:[CCColor yellowColor]];
        [playerMoveAssist setTitle:@"PLAYER AUTO MOVE ASSIST - ON"];
    } else if ([GameData isPartialMoveAssistOn]) {
        [playerMoveAssist setColor:[CCColor orangeColor]];
        [playerMoveAssist setTitle:@"PLAYER AUTO MOVE ASSIST - SEMI"];    }
    else {
        [playerMoveAssist setColor:[CCColor whiteColor]];
        [playerMoveAssist setTitle:@"PLAYER AUTO MOVE ASSIST - OFF"];
    }
}




-(void) onEnter
{
    [super onEnter];
    NSLog(@">>>>>>> Enter Time Options....");
    [self updateButtonColors];
}

- (void)onButtonControls
{
    [MenuLayer playMenuButtonSound];
    if ([GameData isButtonControlsOn]) {
        [GameData setButtonControls:false];
        
        if (![GameData isSwipeControlsOn]) {
            [GameData setSwipeControls:true];
        }
    }
    else {
        [GameData setButtonControls:true];
    }
    
    
    
    [self updateButtonColors];
}

- (void)onSwipeControls {
    [MenuLayer playMenuButtonSound];

    if ([GameData isSwipeControlsOn]) {
        [GameData setSwipeControls:false];
        
        if (![GameData isButtonControlsOn]) {
            [GameData setButtonControls:true];
        }
    }
    else {
        [GameData setSwipeControls:true];
    }
    
    [self updateButtonColors];
}


- (void)onMoveAssistControls {
    [MenuLayer playMenuButtonSound];
    
    if ([GameData isMoveAssistOn]) {
        [GameData setMoveAssist:false];
        [GameData setPartialMoveAssist:true];
        
    } else if ([GameData isPartialMoveAssistOn]) {
        [GameData setPartialMoveAssist:false];
        [GameData setMoveAssist:false];
    }
    else {
        [GameData setMoveAssist:true];
        [GameData setPartialMoveAssist:false];
    }
    
    [self updateButtonColors];
}

- (void)on3mins:(id)sender
{
    
    [GameData setMatchLength:MINS_3];
    [self updateButtonColors];
}


- (void)on5mins:(id)sender
{
    [GameData setMatchLength:MINS_5];
    [self updateButtonColors];
}


- (void)on7mins:(id)sender
{
    [self updateButtonColors];
    [GameData setMatchLength:MINS_7];
    
}


- (void)onGoBack : (id)sender {
    NSLog(@"GOBACK >>>");
    [MenuLayer playMenuButtonSound3];
    [SceneManager goMenuOptions];
}



- (void)touchBegan:(CCTouch*) touch withEvent:(CCTouchEvent*) event {
    //- (BOOL)ccTouchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    
    if (!self.visible)
    {
        //return false;
    }
    
    NSLog(@"TOUCH BEGAN - MENU GAME TYPE");
    
}


@end

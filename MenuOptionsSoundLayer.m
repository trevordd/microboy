//
//  MenuGameType.m
//  mySoccer
//
//  Created by Trevor Delves on 09/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuOptionsSoundLayer.h"



//
@implementation MenuOptionsSoundLayer

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
    
    
    [self addChild: menuBox z:0];
    [self addChild: menuTab z:0];
    [self addChild: menuLogo z:0];
    
    //
    int menuYBase=menuY+(menuY/5);
    
    
    //
    titleLabel = [CCLabelTTF labelWithString:@"SOUND" fontName:@MENU_FONT fontSize:MENU_TITLE_FONT_SIZE];
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
    crowdSounds = [CCButton buttonWithTitle:@"" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [crowdSounds setPosition: ccp(menuX +(0*100),menuYBase-(0*50))];
    [crowdSounds setTarget:self selector:@selector(onCrowdSounds:)];
    [self addChild: crowdSounds];
    
    fxSounds = [CCButton buttonWithTitle:@"" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [fxSounds setPosition: ccp(menuX +(0*100),menuYBase-(1*50))];
    [fxSounds setTarget:self selector:@selector(onFxSounds:)];
    [self addChild: fxSounds];
    
    menuSounds = [CCButton buttonWithTitle:@"" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [menuSounds setPosition: ccp(menuX +(0*100),menuYBase-(2*50))];
    [menuSounds setTarget:self selector:@selector(onMenuSounds:)];
    [self addChild: menuSounds];
    
    
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
    
    
    if ([GameData isCrowdSoundsOn]) {
        [crowdSounds setColor:[CCColor yellowColor]];
        [crowdSounds setTitle:@"CROWD SOUNDS ON"];
        
    } else {
        [crowdSounds setColor:[CCColor whiteColor]];
        [crowdSounds setTitle:@"CROWD SOUNDS OFF"];
        
    }
    
    if ([GameData isFxSoundsOn]) {
        [fxSounds setColor:[CCColor yellowColor]];
        [fxSounds setTitle:@"FX SOUNDS ON"];
        
    } else {
        [fxSounds setColor:[CCColor whiteColor]];
        [fxSounds setTitle:@"FX SOUNDS OFF"];
    }
    
    if ([GameData isMenuSoundsOn]) {
        [menuSounds setColor:[CCColor yellowColor]];
        [menuSounds setTitle:@"MENU MUSIC ON"];
        
    } else {
        [menuSounds setColor:[CCColor whiteColor]];
        [menuSounds setTitle:@"MENU MUSIC OFF"];
    }
}


-(void) updateButtonColorsOld {
    
    //[self resetButtonColors];
    
    switch ([GameData getMatchLength]) {
        case MINS_1 :
            // [time1mins setColor:[CCColor yellowColor]];
            break;
            
        case MINS_2 :
            //[time2mins setColor:[CCColor yellowColor]];
            break;
            
            //        case MINS_3 :
            //            [time3mins setColor:[CCColor yellowColor]];
            //            break;
            //
            //        case MINS_5 :
            //            [time5mins setColor:[CCColor yellowColor]];
            //            break;
            //
            //        case MINS_7 :
            //            [time7mins setColor:[CCColor yellowColor]];
            //            break;
            
        default:
            break;
    }
}


-(void) onEnter
{
    [super onEnter];
    NSLog(@">>>>>>> Enter Time Options....");
    [self updateButtonColors];
}

- (void)onCrowdSounds:(id)sender
{
    if ([GameData isCrowdSoundsOn]) {
        [GameData setCrowdSounds:false];
    }
    else {
        [GameData setCrowdSounds:true];
    }
    
    [self updateButtonColors];
}

- (void)onFxSounds:(id)sender {
    
    if ([GameData isFxSoundsOn]) {
        [GameData setFxSounds:false];
        
    }
    else {
        [GameData setFxSounds:true];
    }
    
    [self updateButtonColors];
}


- (void)onMenuSounds:(id)sender {
    
    if ([GameData isMenuSoundsOn]) {
        [GameData setMenuSounds:false];
        [Util stopMenuMusic];
        
    }
    else {
        [GameData setMenuSounds:true];
        NSString * menuSong = [GameData getMenuSong];
        
        if (menuSong == nil) {
            menuSong=CHOOSE_TEAM;
        }
        [Util playSoundMusic:menuSong loop:true];
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
    if (!self.visible)
    {
        //return false;
    }
    
    NSLog(@"TOUCH BEGAN - MENU GAME TYPE");
    
}


@end

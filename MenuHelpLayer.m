//
//  MenuGameType.m
//  mySoccer
//
//  Created by Trevor Delves on 09/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuHelpLayer.h"



//
@implementation MenuHelpLayer

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
    //
    int menuYBase=menuY+(menuY/2);
    
    
    //
    titleLabel = [CCLabelTTF labelWithString:@"INFO" fontName:@MENU_FONT fontSize:MENU_TITLE_FONT_SIZE];
    [titleLabel setPosition: ccp(menuX, menuYBase)];
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
    time1mins = [CCButton buttonWithTitle:@"" fontName:@MENU_FONT fontSize:HELP_FONT_SIZE];
    [time1mins setPosition: ccp(menuX +(0*100),menuYBase-(0*40))];
    [time1mins setTarget:self selector:@selector(on1mins:)];
    [self addChild: time1mins];
    
    time2mins = [CCButton buttonWithTitle:@"Email - info@MICROBOY.COM" fontName:@MENU_FONT fontSize:HELP_FONT_SIZE];
    [time2mins setPosition: ccp(menuX +(0*100),menuYBase-(1*40))];
    [time2mins setTarget:self selector:@selector(on2mins:)];
    [self addChild: time2mins];
    
    time3mins = [CCButton buttonWithTitle:@"Twitter - @MICROBOYGAMES" fontName:@MENU_FONT fontSize:HELP_FONT_SIZE];
    [time3mins setPosition: ccp(menuX +(0*100),menuYBase-(2*40))];
    [time3mins setTarget:self selector:@selector(on3mins:)];
    [self addChild: time3mins];
    
    //time5mins = [CCButton buttonWithTitle:@"info@MICROBOY.COM" fontName:@MENU_FONT fontSize:HELP_FONT_SIZE];
    time5mins = [CCButton buttonWithTitle:@"Concept & Code : Trevor Delves" fontName:@MENU_FONT fontSize:HELP_FONT_SIZE];
    [time5mins setPosition: ccp(menuX +(0*100),menuYBase-(3*40))];
    [time5mins setTarget:self selector:@selector(on5mins:)];
    [self addChild: time5mins];
   
    time7mins = [CCButton buttonWithTitle:@"Art & Design : ADAM 'Fanastic Mr' FOX" fontName:@MENU_FONT fontSize:HELP_FONT_SIZE];
    [time7mins setPosition: ccp(menuX +(0*100),menuYBase-(4*40))];
    [time7mins setTarget:self selector:@selector(on7mins:)];
    [self addChild: time7mins];
    
    
    [self setMultipleTouchEnabled:YES];
    return self;
}


-(void) resetButtonColors {
    
    [time1mins setColor:[CCColor whiteColor]];
    [time2mins setColor:[CCColor yellowColor]];
    [time3mins setColor:[CCColor orangeColor]];
    [time5mins setColor:[CCColor cyanColor]];
    [time7mins setColor:[CCColor magentaColor]];
    
}


-(void) updateButtonColors {
    
    [self resetButtonColors];
    
//    switch ([GameData getMatchLength]) {
//        case MINS_1 :
//            [time1mins setColor:[CCColor yellowColor]];
//            break;
//            
//        case MINS_2 :
//            [time2mins setColor:[CCColor yellowColor]];
//            break;
//            
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
//            
//        default:
//            break;
//    }
}


-(void) onEnter
{
    [super onEnter];
    NSLog(@">>>>>>> Enter Time Options....");
    [self updateButtonColors];
}

- (void)on1mins:(id)sender
{
    [GameData setMatchLength:MINS_1];
    [self updateButtonColors];
}

- (void)on2mins:(id)sender
{
    [GameData setMatchLength:MINS_2];
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
    [SceneManager goMenu];
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

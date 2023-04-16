//
//  MenuGameType.m
//  mySoccer
//
//  Created by Trevor Delves on 09/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuOptionsDifficultyLayer.h"



//
@implementation MenuOptionsDifficultyLayer


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
    titleLabel = [CCLabelTTF labelWithString:@"DIFFICULTY" fontName:@MENU_FONT fontSize:MENU_TITLE_FONT_SIZE];
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
    easy = [CCButton buttonWithTitle:@"EASY" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [easy setPosition: ccp(menuX +(0*100),menuYBase-(0*40))];
    [easy setTarget:self selector:@selector(onEasy:)];
    [self addChild: easy];
    
    medium = [CCButton buttonWithTitle:@"MEDIUM" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [medium setPosition: ccp(menuX +(0*100),menuYBase-(1*40))];
    [medium setTarget:self selector:@selector(onMedium:)];
    [self addChild: medium];
    
    hard = [CCButton buttonWithTitle:@"HARD" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [hard setPosition: ccp(menuX +(0*100),menuYBase-(2*40))];
    [hard setTarget:self selector:@selector(onHard:)];
    [self addChild: hard];
    
  
    
    [self setMultipleTouchEnabled:YES];
    return self;
}


-(void) resetButtonColors {
    
    [easy setColor:[CCColor whiteColor]];
    [medium setColor:[CCColor whiteColor]];
    [hard setColor:[CCColor whiteColor]];
}


-(void) updateButtonColors {
    
    [self resetButtonColors];
    
    switch ([GameData getDifficulty]) {
        case EASY :
            [easy setColor:[CCColor yellowColor]];
            break;
            
        case MEDIUM :
            [medium setColor:[CCColor yellowColor]];
            break;
            
        case HARD :
            [hard setColor:[CCColor yellowColor]];
            break;
            
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

- (void)onEasy:(id)sender
{
    [MenuLayer playMenuButtonSound];

    [GameData setDifficulty:EASY];
    [self updateButtonColors];
}

- (void)onMedium:(id)sender
{
    [MenuLayer playMenuButtonSound];

    [GameData setDifficulty:MEDIUM];
    [self updateButtonColors];
}

- (void)onHard:(id)sender
{
    [MenuLayer playMenuButtonSound];

    [GameData setDifficulty:HARD];
    [self updateButtonColors];
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

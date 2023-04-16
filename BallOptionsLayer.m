//
//  MenuGameType.m
//  mySoccer
//
//  Created by Trevor Delves on 09/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BallOptionsLayer.h"



//
@implementation BallOptionsLayer

-(id) init{
    self = [super init];
    
    // Menu Position
    
    int menuX = [CCDirector sharedDirector].viewSize.width/2;
    int menuY = [CCDirector sharedDirector].viewSize.height/2;
    
    menuBG =[CCSprite spriteWithImageNamed: MENU_BG];
    menuBG.scale=MENU_BG_SCALE;
    menuBG.position = MENU_BG_POS;
    [menuBG setPosition :ccp(menuX,menuY)];
    [menu2BG setPosition :ccp(menuX,menuY)];
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
    titleLabel = [CCLabelTTF labelWithString:@"BALL COLOUR" fontName:@MENU_FONT fontSize:MENU_TITLE_FONT_SIZE];
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
    
    int yGap = 25;
    
    //
    random = [CCButton buttonWithTitle:@"RANDOM" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [random setPosition: ccp(menuX +(0*100),menuYBase-(0*yGap))];
    [random setTarget:self selector:@selector(onRandom:)];
    [self addChild: random];
    
    white = [CCButton buttonWithTitle:@"WHITE" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [white setPosition: ccp(menuX +(0*100),menuYBase-(1*yGap))];
    [white setTarget:self selector:@selector(onWhite:)];
    [self addChild: white];
    
    yellow = [CCButton buttonWithTitle:@"YELLOW" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [yellow setPosition: ccp(menuX +(0*100),menuYBase-(2*yGap))];
    [yellow setTarget:self selector:@selector(onYellow:)];
    [self addChild: yellow];
    
    orange = [CCButton buttonWithTitle:@"ORANGE" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [orange setPosition: ccp(menuX +(0*100),menuYBase-(3*yGap))];
    [orange setTarget:self selector:@selector(onOrange:)];
    [self addChild: orange];
    
    blue = [CCButton buttonWithTitle:@"BLUE" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [blue setPosition: ccp(menuX +(0*100),menuYBase-(4*yGap))];
    [blue setTarget:self selector:@selector(onBlue:)];
    [self addChild: blue];
    
    magenta = [CCButton buttonWithTitle:@"MAGENTA" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [magenta setPosition: ccp(menuX +(0*100),menuYBase-(5*yGap))];
    [magenta setTarget:self selector:@selector(onMagenta:)];
    [self addChild: magenta];
    
    [self setMultipleTouchEnabled:YES];
    return self;
}


-(void) resetButtonColors {
    [random setColor:[CCColor whiteColor]];
    [white setColor:[CCColor whiteColor]];
    [yellow setColor:[CCColor whiteColor]];
    [orange setColor:[CCColor whiteColor]];
    [blue setColor:[CCColor whiteColor]];
    [magenta setColor:[CCColor whiteColor]];
}


-(void) updateButtonColors {
    
    [self resetButtonColors];
    
    switch ([GameData getBallColour]) {
        case BALL_COL_RANDOM :
            [random setColor:[CCColor yellowColor]];
            break;
            
        case BALL_COL_WHITE :
            [white setColor:[CCColor yellowColor]];
            break;
            
        case BALL_COL_YELLOW :
            [yellow setColor:[CCColor yellowColor]];
            break;
            
        case BALL_COL_ORANGE :
            [orange setColor:[CCColor yellowColor]];
            break;
            
        case BALL_COL_BLUE :
            [blue setColor:[CCColor yellowColor]];
            break;
  
        case BALL_COL_MAGENTA:
            [magenta setColor:[CCColor yellowColor]];
            break;
            
        default:
            NSLog(@">>Default colour");
            break;
    }
}


-(void) onEnter
{
    [super onEnter];
    NSLog(@">>>>>>> Enter Time Options....");
    [self updateButtonColors];
}

- (void)onRandom:(id)sender
{
    [MenuLayer playMenuButtonSound];
    [GameData setBallColour:BALL_COL_RANDOM];
    [self updateButtonColors];
}
//

- (void)onWhite:(id)sender
{
    [MenuLayer playMenuButtonSound];
    [GameData setBallColour:BALL_COL_WHITE];
    [self updateButtonColors];
}

- (void)onYellow:(id)sender
{
    [MenuLayer playMenuButtonSound];
    [GameData setBallColour:BALL_COL_YELLOW];
    [self updateButtonColors];
}


- (void)onOrange:(id)sender
{
    [MenuLayer playMenuButtonSound];
    [GameData setBallColour:BALL_COL_ORANGE];
    [self updateButtonColors];
}


- (void)onBlue:(id)sender
{
    [MenuLayer playMenuButtonSound];
    [GameData setBallColour:BALL_COL_BLUE];
    [self updateButtonColors];
}

- (void)onMagenta:(id)sender
{
    [MenuLayer playMenuButtonSound];
    [GameData setBallColour:BALL_COL_MAGENTA];
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

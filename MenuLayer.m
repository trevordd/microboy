//
//  MenuLayer.m
//  mySoccer
//
//  Created by Trevor Delves on 18/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//


#import "MenuLayer.h"

@implementation MenuLayer



//CCSprite *menuBox;
//CCSprite *menuLogo;
//CCSprite *menuTab;

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	MenuLayer *layer = [MenuLayer node];
    
	// add layer as a child to scene
	[scene addChild: layer];
    
	// return the scene
	return scene;
}

//
//  MenuLayer.m
//  MenuLayer
//
//  Created by MajorTom on 9/7/10.
//  Copyright iphonegametutorials.com 2010. All rights reserved.
//


+(void) playMenuButtonSound {
    [Util playSoundEffect:BUTTON1];
}

+(void) playMenuButtonSound2 {
    [Util playSoundEffect:BUTTON2];
}

+(void) playMenuButtonSound3 {
    [Util playSoundEffect:BUTTON3];
}

+(void) playMenuButtonSound4 {
    [Util playSoundEffect:BUTTON4];
}

+(void) playMenuButtonSound5 {
    [Util playSoundEffect:BUTTON5];
}

+(void) playMenuButtonSound6 {
    [Util playSoundEffect:BUTTON6];
}

-(void) preloadSounds {
    // Preload sounds
    
    NSLog(@">>Pre loading sounds...");
    
    
    
    // FX
   
    
    [[OALSimpleAudio sharedInstance] preloadEffect: EXCITING_CROWD];
    [[OALSimpleAudio sharedInstance] preloadEffect: KEEPER_SAVE1];
    [[OALSimpleAudio sharedInstance] preloadEffect: KEEPER_SAVE2];
    
    [[OALSimpleAudio sharedInstance] preloadEffect: BALL_OVER_BAR1];
    [[OALSimpleAudio sharedInstance] preloadEffect: BALL_OVER_BAR2];
    
    [[OALSimpleAudio sharedInstance] preloadEffect: SOFT_APPLAUSE];
    [[OALSimpleAudio sharedInstance] preloadEffect: STRONG_APPLAUSE];
    
    [[OALSimpleAudio sharedInstance] preloadEffect: CHANTS1];
    [[OALSimpleAudio sharedInstance] preloadEffect: CHANTS2];
    [[OALSimpleAudio sharedInstance] preloadEffect: CHANTS3];
   // [[OALSimpleAudio sharedInstance] preloadEffect: CHANTS4];
    
    [[OALSimpleAudio sharedInstance] preloadEffect: JEER1];
    [[OALSimpleAudio sharedInstance] preloadEffect: BASSDRUM];
    [[OALSimpleAudio sharedInstance] preloadEffect: HORN1];
    [[OALSimpleAudio sharedInstance] preloadEffect: HORN2];
    
    [[OALSimpleAudio sharedInstance] preloadEffect: BUTTON1];
    [[OALSimpleAudio sharedInstance] preloadEffect: BUTTON2];
    [[OALSimpleAudio sharedInstance] preloadEffect: BUTTON3];
    [[OALSimpleAudio sharedInstance] preloadEffect: BUTTON4];
    [[OALSimpleAudio sharedInstance] preloadEffect: BUTTON5];
    [[OALSimpleAudio sharedInstance] preloadEffect: BUTTON6];
        
    [[OALSimpleAudio sharedInstance] preloadEffect: GOAL_SCORED1];
    [[OALSimpleAudio sharedInstance] preloadEffect: GOAL_SCORED2];
    [[OALSimpleAudio sharedInstance] preloadEffect: GOAL_SCORED3];
    [[OALSimpleAudio sharedInstance] preloadEffect: GOAL_SCORED4];    
    
    [[OALSimpleAudio sharedInstance] preloadEffect: NET_1];
    [[OALSimpleAudio sharedInstance] preloadEffect: NET_2];
    
    [[OALSimpleAudio sharedInstance] preloadEffect: KICK1];
    [[OALSimpleAudio sharedInstance] preloadEffect: KICK2];
    [[OALSimpleAudio sharedInstance] preloadEffect: KICK3];
    
    [[OALSimpleAudio sharedInstance] preloadEffect: PASS1];
    [[OALSimpleAudio sharedInstance] preloadEffect: PASS2];
    [[OALSimpleAudio sharedInstance] preloadEffect: PASS3];

    [[OALSimpleAudio sharedInstance] preloadEffect: GOALPOST1];
    [[OALSimpleAudio sharedInstance] preloadEffect: GOALPOST2];
    [[OALSimpleAudio sharedInstance] preloadEffect: CROSSBAR];
    
    [[OALSimpleAudio sharedInstance] preloadEffect: WHISTLE_KICK_OFF];
    [[OALSimpleAudio sharedInstance] preloadEffect: WHISTLE_FINAL1];
    [[OALSimpleAudio sharedInstance] preloadEffect: WHISTLE_FINAL2];
    
    [[OALSimpleAudio sharedInstance] preloadEffect: SLIDE_CLEAN];
    [[OALSimpleAudio sharedInstance] preloadEffect: SLIDE_DIRTY];
    
    
    // BG SOunds
//    [[OALSimpleAudio sharedInstance] preloadBg:STADIUM_CROWD1];
//    [[OALSimpleAudio sharedInstance] preloadBg:STADIUM_CROWD2];
    
}

-(void) playMenuMusic {
    int tune = [Util random:5];
    NSString *song;
    
    switch(tune) {
        case 0:
            song=LETS_PLAY;
            break;
            
        case 1:
            song=STATS_LOVER;
            break;
            
        case 2:
            song=LETS_PLAY;
            break;
            
        case 3:
            song=STATS_LOVER;
            break;
            
        case 4:
            song=LETS_PLAY;
            break;
            
        case 5:
            song=STATS_LOVER;
            break;
            
        default:
            song=STATS_LOVER;
            break;
    }
    [Util playMenuMusic:song loop: true];
    [GameData setMenuSong:song];
}


//-(void) playMenuMusicOriginal {
//    int tune = [Util random:5];
//    NSString *song;
//    
//    switch(tune) {
//        case 0:
//            song=ROAD_TO_BRAZIL;
//            break;
//            
//        case 1:
//            song=PROFESSIONAL_ANTHEM;
//            break;
//            
//        case 2:
//            song=CHOOSE_TEAM;
//            break;
//            
//        case 3:
//            song=STATS_LOVER;
//            break;
//            
//        case 4:
//            song=STREET_SOCCER;
//            break;
//            
//        case 5:
//            song=CHOOSE_TEAM;
//            break;
//            
//        default:
//            break;
//    }
//    [Util playMenuMusic:song loop: true];
//    [GameData setMenuSong:song];
//}


-(void) onEnter
{
    [super onEnter];
    NSLog(@">>>>>MENU onENter....");
    
    if ([GameData getMicroSoccerStarted] == false) {
        NSLog(@">>>>>MENU onENter - micro soccer not started - first time");

        [GameData setMicroSoccerStarted:true];
        
        
        
        NSLog(@">>>>>Pre loading sounds...");
        [self preloadSounds];
        [self playMenuMusic];
        NSLog(@">>>>>Sounds preloaded...");
        
    } else {
        
        if ([GameData getDoResetMenuMusic] == true) {
            NSLog(@">>>>>MENU onENter - reset menu music true ");

            [self playMenuMusic];
        } else{
            NSLog(@">>>>>MENU onENter - continue playing same music ");
            //[self playMenuMusic];
        }
    }
}


-(id) init{
	self = [super init];

    //
    CGSize viewSize = [CCDirector sharedDirector].viewSize;
    
    //
    CCColor *bgColor = [CCColor colorWithRed:(25.0/255.0) green:(25.0/255.0) blue:(48.0/255.0) alpha:(1.0f)];
    CCNodeColor *nodeColor = [CCNodeColor nodeWithColor:bgColor width:viewSize.width height:viewSize.height];
    [self addChild:nodeColor];
    
    
    //
    CCColor *boxColor = [CCColor colorWithRed:(0.0f) green:(0.00f) blue:(0.0f) alpha:(.35f)];
    
    CCNodeColor *menuHighlight;
    menuHighlight = [CCNodeColor nodeWithColor:boxColor width:viewSize.width/2+10 height:viewSize.height];
    menuHighlight.anchorPoint = CGPointMake(0.5,0.5);
    menuHighlight.position = CGPointMake(viewSize.width/2, viewSize.height/2);
    
    //[self addChild:menuHighlight z:10];
    
    // Menu Position
    
    int menuX = [CCDirector sharedDirector].viewSize.width/2;
    int menuY = [CCDirector sharedDirector].viewSize.height/2;
    
    menuBG =[CCSprite spriteWithImageNamed: MENU_BG];
    menuBG.scale=MENU_BG_SCALE;
    [menuBG setPosition :ccp(menuX,menuY)];
    

//    menu2BG =[CCSprite spriteWithImageNamed: @"menuBackgroundLogo.png"];
//    menu2BG.scale=0.6; //1.0
//    menu2BG.position = MENU_BG_POS;
//    [menu2BG setPosition :ccp(menuX,menuY)];

    
    [self addChild:menuBG z:0];
    //[self addChild:menu2BG z:0];
    
    //
    menuBox=[CCSprite spriteWithImageNamed: @"menu_box_1.png"];
    menuLogo=[CCSprite spriteWithImageNamed: @"logo.png"];;
    menuTab=[CCSprite spriteWithImageNamed: @"menuBar.png"];;
    
    [menuBox setPosition : ccp(menuX,menuY-25)];
    [menuLogo setPosition : ccp(menuX,menuY+108)];
    [menuTab setPosition : ccp(menuX,menuY+95)];
    
    menuBox.scaleX=0.43;
    menuBox.scaleY=0.30;
    
    menuLogo.scale=0.18;

    menuTab.scaleX=0.75;
    menuTab.scaleY=0.33;
    
    [self addChild: menuBox z:10];
    [self addChild: menuLogo z:11];
    [self addChild: menuTab z:10];

    //
    CCSprite *microboy=[CCSprite spriteWithImageNamed: @"logo_dark.png"];
    [microboy setPosition : ccp(50,25)];
    microboy.scale=0.25;
    [self addChild: microboy z:12];
    
    
    //
    titleLabel = [CCLabelTTF labelWithString:@GAME_TITLE fontName:@MENU_FONT fontSize:36];
    [titleLabel setPosition: ccp(menuX, 290)];
    //[self addChild:titleLabel z: 100];
    
    [[GameModel sharedGameModel] setGameState:mainMenu];
    
    int halfScreenHeight = viewSize.height/2;
    int baseYLevel = halfScreenHeight+(halfScreenHeight/3.3) ;
    
    int nextRowIdx =0;
    int rowYGap = 35;
    
    // Exhibition
    CCButton * startExhibitionBtn = [CCButton buttonWithTitle:@"PLAY" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [startExhibitionBtn setPosition: ccp(menuX,baseYLevel-(nextRowIdx*rowYGap))];
    [startExhibitionBtn setTarget:self selector:@selector(onNewGame:)];
    [self addChild: startExhibitionBtn z: 100];
    nextRowIdx++;
    
    // ALLOW_ANDROID_MANAGER_MODE
    //#elif __CC_PLATFORM_IOS || __CC_PLATFORM_ANDROID

    #if __CC_PLATFORM_IOS 
        rowYGap=40;

        #ifdef ALLOW_ANDROID_MANAGER_MODE
            rowYGap = 35;
        // Manager
        CCButton * startManagerBtn = [CCButton buttonWithTitle:@"MICRO MANAGE" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
        [startManagerBtn setPosition: ccp(menuX,baseYLevel-(nextRowIdx*rowYGap))];
        [startManagerBtn setTarget:self selector:@selector(onManagerGame:)];
        [self addChild: startManagerBtn z:100];
        nextRowIdx++;
        #endif
    #endif
    
    // Practice
    CCButton * startPracticeBtn = [CCButton buttonWithTitle:@"PRACTICE" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [startPracticeBtn setPosition: ccp(menuX,baseYLevel-(nextRowIdx*rowYGap))];
    [startPracticeBtn setTarget:self selector:@selector(onPracticeGame:)];
    [self addChild: startPracticeBtn z: 100];
    nextRowIdx++;
    
    
    // Demo
    CCButton * startDemoBtn = [CCButton buttonWithTitle:@"WATCH DEMO" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [startDemoBtn setPosition: ccp(menuX,baseYLevel-(nextRowIdx*rowYGap))];
    [startDemoBtn setTarget:self selector:@selector(onDemoGame:)];
    [self addChild: startDemoBtn z: 100];
    nextRowIdx++;
    
    
    // Options
    CCButton * startOptionsBtn = [CCButton buttonWithTitle:@"OPTIONS" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [startOptionsBtn setPosition: ccp(menuX,baseYLevel-(nextRowIdx*rowYGap))];
    [startOptionsBtn setTarget:self selector:@selector(onOptions:)];
    [self addChild: startOptionsBtn z: 100];
    nextRowIdx++;
    
    
    // Help
    CCButton * startHelpBtn = [CCButton buttonWithTitle:@"INFO" fontName:@MENU_FONT fontSize:MENU_FONT_SIZE];
    [startHelpBtn setPosition: ccp(menuX,baseYLevel-(nextRowIdx*rowYGap))];
    [startHelpBtn setTarget:self selector:@selector(onHelp:)];
    [self addChild: startHelpBtn z: 100];
    
    
    //
    //[GameData setDoResetMenuMusic :true];
    CCSpriteFrame *musicOnButtonFrame = [CCSpriteFrame frameWithImageNamed:@"musicon.png"];
    CCSpriteFrame *musicOffButtonFrame = [CCSpriteFrame frameWithImageNamed:@"musicoff.png"];


    CCButton * musicBtn = [CCButton buttonWithTitle:@"" spriteFrame:musicOnButtonFrame highlightedSpriteFrame:musicOffButtonFrame disabledSpriteFrame:musicOnButtonFrame];
    musicBtn.scale=0.1;
    musicBtn.position = ccp( viewSize.width-50, viewSize.height-50 );
     
    //self.musicButton.opacity=1.0f;  // 0.5
    [self addChild: musicBtn z: 100];
    [musicBtn setTarget:self selector:@selector(onMusic:)];
    [musicBtn setTogglesSelectedState:true];

    
    //[self onMusic:self];
    if ([GameData isMenuSoundsOn]) {
        [musicBtn setHighlighted:false];
    } else {
        [musicBtn setHighlighted:true];
    }
    
    
    //
    [[SceneManager sharedSceneManager] initGame];
	return self;
}


- (void)onNewGame:(id)sender{
//    FormationPosition *fPos = [[FormationPosition alloc] init];
//    [fPos setStartPositionPercentage:CGPointMake(50, 50)];
//    [fPos setAheadHorizPerc:2.0];
//    [fPos setBehindHorizPerc:0.5];
//    
//    [fPos setAheadVerticalPerc:0.5];
//    [fPos setBehindVerticalPerc:0.5];
//
//    
//    CGPoint pitchPosPerc = [FormationUtil getPitchPositionPercentage: CGPointMake(PITCH_X_CENTER+100, PITCH_Y_CENTER)];
//    [FormationUtil getPlayerPitchPosition: pitchPosPerc :fPos];
//    return;
    
    //NSLog(@">> MEmory Available KB %f", [CCDirector getAvailableKiloBytes]);
    //NSLog(@">> MEmory Available MB %f", [CCDirector getAvailableMegaBytes]);
    
    //[GameData setHumanTeam:true];
	//[SceneManager goChooseTeamMenu];
    [MenuLayer playMenuButtonSound];
    [GameData setHumanTeam:true];
    [GameData setPracticeMatch:false];
    [[GameModel sharedGameModel] setMatchMode:matchModeHuman];
    [[GameModel sharedGameModel] setMatchType:matchExhibition];
    //[SceneManager goGameTypeMenu];
    [SceneManager goChooseTeamMenu];
    [GameData setDoResetMenuMusic :false];
}

- (void)onPracticeGame:(id)sender
{
    [MenuLayer playMenuButtonSound];
    [GameData setHumanTeam:true]; //TODO DEPRECATED
    [GameData setPracticeMatch:true];
    [[GameModel sharedGameModel] setMatchType:matchExhibition];
    [[GameModel sharedGameModel] setMatchMode:matchModeHuman];
    [SceneManager goChooseTeamMenu];
    [GameData setDoResetMenuMusic :false];
}


- (void)onManagerGame:(id)sender
{
    [MenuLayer playMenuButtonSound];
    [GameData setHumanTeam:false]; //TODO DEPRECATED
    [GameData setPracticeMatch:false];
    [[GameModel sharedGameModel] setMatchMode:matchModeManager];
    [[GameModel sharedGameModel] setMatchType:matchManager];
    [SceneManager goChooseTeamMenu];
    [GameData setDoResetMenuMusic :false];
}


- (void)onDemoGame:(id)sender{
    //NSLog(@">> MEmory Available KB %f", [CCDirector getAvailableKiloBytes]);
    //NSLog(@">> MEmory Available MB %f", [CCDirector getAvailableMegaBytes]);
    
    [MenuLayer playMenuButtonSound];
    [GameData setPracticeMatch:false];
    [GameData setHumanTeam:false];
    [[GameModel sharedGameModel] setMatchType:matchDemo];
	[SceneManager goChooseTeamMenu];
    [GameData setDoResetMenuMusic :false];

}


- (void)onOptions:(id)sender{
    [MenuLayer playMenuButtonSound];
	[SceneManager goMenuOptions];
    [GameData setDoResetMenuMusic :false];
}

- (void)onHelp:(id)sender{
    [MenuLayer playMenuButtonSound];
    [SceneManager goHelpMenu];
    [GameData setDoResetMenuMusic :false];
}

- (void)onMusic:(id)sender{
    
    NSLog(@">>>On Music");
    
    if ([GameData isMenuSoundsOn]) {
        [GameData setMenuSounds:false];
        [Util stopMenuMusic];
        //[sender setHighlighted:true];

    }
    else {
        [GameData setMenuSounds:true];
        NSString * menuSong = [GameData getMenuSong];
        
        if (menuSong == nil) {
            menuSong=CHOOSE_TEAM;
        }
        [Util playSoundMusic:menuSong loop:true];
        //[sender setHighlighted:false];

    }

    
}

- (void)onCupGame:(id)sender{
    //NSLog(@">> MEmory Available KB %f", [CCDirector getAvailableKiloBytes]);
    //NSLog(@">> MEmory Available MB %f", [CCDirector getAvailableMegaBytes]);
    
	//[SceneManager goChooseTeamMenu];
    [GameData setPracticeMatch:false];
    [SceneManager goGameTypeMenu];
    [[GameModel sharedGameModel] setMatchType:matchCup];
    
    //[SceneManager initGame];
}


- (void)touchBegan:(CCTouch*) touch withEvent:(CCTouchEvent*) event {
//- (BOOL)ccTouchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    //CGPoint location = [touch locationInView: [touch view]];
	//CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
    if (!self.visible)
    {
        //return false;
    }
    NSLog(@"TOUCH BEGAN - MENU LAYER");
    
    //return YES;
}

- (void) dealloc
{
    [self removeAllChildrenWithCleanup:YES];
}


@end

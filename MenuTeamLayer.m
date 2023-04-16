//
//  MenuTeam.m
//  mySoccer
//
//  Created by Trevor Delves on 09/11/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuTeamLayer.h"
//#import "GameData.h"

@implementation MenuTeamLayer
//CCSprite *menuBG;
CCSprite *menu2BG;

//CCSprite *menuBox;
//CCSprite *menuLogo;
//CCSprite *menuTab;

CCSprite *transparentBox;

CCSprite *nextBox;
CCSprite *backBox;



CCSprite *pitch;


-(id) init{
	self = [super init];

    //
    CGSize viewSize = [CCDirector sharedDirector].viewSize;
    int screenCenterX = viewSize.width/2;
    int screenCenterY = viewSize.height/2;
    int screenHalfHeight = screenCenterY;
    
    //
    CCColor *boxColor = [CCColor colorWithRed:(0.0f) green:(0.00f) blue:(0.0f) alpha:(.35f)];
    
    CCNodeColor *menuHighlight;
    menuHighlight = [CCNodeColor nodeWithColor:boxColor width:viewSize.width/2+10 height:viewSize.height];
    menuHighlight.anchorPoint = CGPointMake(0.5,0.5);
    menuHighlight.position = CGPointMake(viewSize.width/2, viewSize.height/2);
    
    //[self addChild:menuHighlight z:1];
    
    //
    [[GameModel sharedGameModel] setGameState:choosePlayers];
    
    
    //
    gd = [GameData sharedGameDataManager];
    
    // Menu Position
    
    int menuX = [CCDirector sharedDirector].viewSize.width/2;
    int menuY = [CCDirector sharedDirector].viewSize.height/2;
    
    //
    menuBG =[CCSprite spriteWithImageNamed: MENU_BG];
    menuBG.scale=MENU_BG_SCALE;
    menuBG.position = MENU_BG_POS;
    [menuBG setPosition :ccp(menuX,menuY)];
    
    //
   // menu2BG =[CCSprite spriteWithImageNamed: @"menuBackgroundLogo.png"];
    //menu2BG.opacity=0.5f;
    //menu2BG.scaleY=0.55;
    //menu2BG.scaleX=0.75;

    //menu2BG.position = CGPointMake(menuX+menuX/2, menuY);// MENU_BG_POS;
    //[menu2BG setPosition :ccp(menuX+menuX/3,menuY+30)];
 
    //
    menuBox=[CCSprite spriteWithImageNamed: @"menu_box_1.png"];
    menuLogo=[CCSprite spriteWithImageNamed: @"logo.png"];;
    menuTab=[CCSprite spriteWithImageNamed: @"menuBar.png"];;
    
    [menuBox setPosition : ccp(menuX+menuX/3,menuY+6)];
    //[menuLogo setPosition : ccp(110,menuY+120)];
    [menuLogo setPosition : ccp(menuX+menuX/3,menuY+128)];
    [menuTab setPosition : ccp(menuX+menuX/3,menuY+120)];
    
    menuBox.scaleX=0.40;
    menuBox.scaleY=0.30; //0.29
    
    menuLogo.scale=0.13;
    
    menuTab.scaleX=0.70;
    menuTab.scaleY=0.30;
    
    
    
    [self addChild: menuBox z:10];
    [self addChild: menuLogo z:11];
    [self addChild: menuTab z:10];
    
    //
    transparentBox =[CCSprite spriteWithImageNamed: @"transparent_box.png"];
    transparentBox.scale=1.0;
    [transparentBox setPosition :ccp(menuX,23)];
    [self addChild:transparentBox z: 1];
    
    
    
    //pitch = [CCSprite spriteWithImageNamed: @"Football_PitchTeam2.png"];
    pitch = [CCSprite spriteWithImageNamed: @"formation_pitch.png"];
    
    pitch.scaleX=0.70;
    pitch.scaleY=0.64;
    pitch.position = ccp( 105, screenHalfHeight); //
    pitch.opacity=0.80;
    
    [self addChild:menuBG z:0];
    //[self addChild:menu2BG z:0];
    [self addChild:pitch z: 2];
    
    //
    titleLabel = [CCLabelTTF labelWithString:[[gd getMatchTeam:TEAM1] teamName] fontName:@MENU_FONT fontSize:CHOOSE_TEAM__TEAM_TITLE_FONT_SIZE];
    //[titleLabel setPosition: ccp(menuX+menuX/4, 290)];
    
    [titleLabel setPosition: ccp(110, screenHalfHeight+(screenHalfHeight/1.30))]; //280
    [self addChild:titleLabel z:10];
    
    nameLabels = [[NSMutableArray alloc] init];
    formationsNames = [[NSMutableArray alloc] initWithObjects:@"4-4-2", @"4-2-4", @"4-5-1", @"4-3-3", @"3-4-3",nil];
    
    //
    #define ROW_GAP     24
    #define COLUMN_GAP  155
    
    
    //
    NSLog(@"Got team...");
    
    int row =0;
    int column = 0;
    
    int nameBaseYLevel = screenHalfHeight+(screenHalfHeight/2);
    int nameBaseXLevel = menuX-(menuX/5);
   
//    for (NSString *name in [[gd getMatchTeam:TEAM1] getPlayerNames]) {
    for (PlayerData *pData in [[gd getMatchTeam:TEAM1] playersData]) {
            
        //for (NSString *name in [t1 getPlayerNames]) {
        NSLog(@"player name found");
        NSString *playerName;
        int labelIndex;
        
        if (column==0) {
            labelIndex=row+1;
        } else {
            labelIndex=10+(row);
        }
        
        playerName =  [NSString stringWithFormat: @"%d. %@",labelIndex, [pData playerName]];
        
        testLabel = [CCButton buttonWithTitle:playerName fontName:@MENU_FONT fontSize:CHOOSE_TEAM_PLAYER_NAME_FONT_SIZE];
        [testLabel setTarget:self selector:@selector(selectPlayer:)];
        //testLabel.label.horizontalAlignment = kCTLeftTextAlignment;
        testLabel.anchorPoint = CGPointZero;
        testLabel.verticalPadding=1.5;
        
        [nameLabels addObject:testLabel];
        [testLabel setPosition: ccp(nameBaseXLevel +(column*COLUMN_GAP),nameBaseYLevel-(row*ROW_GAP))];
        
        [self addChild:testLabel z:10];
        row+=1;
        if (row == 9) {
            column+=1;
            row=0;
        }
    }
    
    //
    CCLOG(@">>Current Formation : %ld", currentFormation);
    
    //
    //leftFormationLabel = [CCLabelTTF labelWithString:@"<" fontName:@MENU_FONT fontSize:40];
    leftFormationLabel = [CCButton buttonWithTitle:@"<" fontName:@MENU_FONT fontSize:FORMATION_LABEL_FONT_SIZE+10];
    [leftFormationLabel setTarget:self selector:@selector(moveLeftFormation)];
    leftFormationLabel.anchorPoint = ccp(0.5,0.5);
    [leftFormationLabel setPosition:ccp(screenCenterX-72,27)];

    
    //
    //formationLabel = [CCLabelTTF labelWithString:@"- - -" fontName:@MENU_FONT fontSize:FORMATION_LABEL_FONT_SIZE];
    formationLabel = [CCButton buttonWithTitle:@""fontName:@MENU_FONT fontSize:FORMATION_LABEL_FONT_SIZE];
       
    formationLabel.anchorPoint = ccp(0.5,0.5);
    [formationLabel setTarget:self selector:@selector(moveRightFormation)];

    [formationLabel setTitle: [formationsNames objectAtIndex:currentFormation]];
    [formationLabel setPosition:ccp(screenCenterX,22)];
    CCColor *neonGreen = [CCColor colorWithRed:(167/255.0) green:(253.0/255.0) blue:(49.0/255.0) alpha:(1.0f)];
    [formationLabel setColor:neonGreen];

    //rightFormationLabel = [CCLabelTTF labelWithString:@">" fontName:@MENU_FONT fontSize:40];
    rightFormationLabel = [CCButton buttonWithTitle:@">" fontName:@MENU_FONT fontSize:FORMATION_LABEL_FONT_SIZE+10];
    [rightFormationLabel setTarget:self selector:@selector(moveRightFormation)];
    rightFormationLabel.anchorPoint = ccp(0.5,0.5);
    [rightFormationLabel setPosition:ccp(screenCenterX+66,27)];
    
    
    // [self addChild:forwardLabel z:1];
    [self addChild:formationLabel z:1];
    [self addChild:leftFormationLabel z:1];
    [self addChild:rightFormationLabel z:1];
    
    
    NSString *nextButtonTxt;
    if ([[GameModel sharedGameModel] getMatchState] == gamePlaying) {
        nextButtonTxt=@"MATCH";
    } else {
        nextButtonTxt=@FORWARD_BUTTON;
    }

    
    CCButton * nextBtn = [CCButton buttonWithTitle:nextButtonTxt fontName:@MENU_FONT fontSize:NEXT_FORWARD_BUTTON_FONT_SIZE];
    nextBtn.anchorPoint = ccp(0.5,0.5);
    [nextBtn setPosition: ccp(viewSize.width-50, 25)];
    [nextBtn setTarget:self selector:@selector(onDemoGame:)];
    [self addChild:nextBtn z:1];
    
    CCButton * prevBtn = [CCButton buttonWithTitle:@BACK_BUTTON fontName:@MENU_FONT fontSize:NEXT_FORWARD_BUTTON_FONT_SIZE];
    prevBtn.anchorPoint = ccp(0.5,0.5);
    [prevBtn setPosition: ccp(50, 25)];
    [prevBtn setTarget:self selector:@selector(onGoBack:)];
    [self addChild:prevBtn z:1];
    
    
    //
    nextBox =[CCSprite spriteWithImageNamed: @"transparent_box.png"];
    nextBox.scaleY=0.75;
    nextBox.scaleX=0.60;
    [nextBox setPosition :nextBtn.position];
    [self addChild:nextBox z: 0];
    
    //
    backBox =[CCSprite spriteWithImageNamed: @"transparent_box.png"];
    backBox.scaleY=0.75;
    backBox.scaleX=0.60;
    [backBox setPosition :prevBtn.position];
    [self addChild:backBox z: 0];
    
    
    //
    if ([[GameModel sharedGameModel] getMatchState] == gamePlaying) {
        [prevBtn setVisible:true];
        [prevBtn setTitle:@"EXIT"];
    } else {
        [prevBtn setVisible:true];
    }
    
    chosenLabel = [CCLabelTTF labelWithString:@"CHOSEN" fontName:@MENU_FONT fontSize:18];
    [chosenLabel setPosition: ccp(380, 30)];
    chosenLabel.visible=false;
    [self addChild:chosenLabel];
    
    selectedLabel = [CCLabelTTF labelWithString:@"SELECTED" fontName:@MENU_FONT fontSize:18];
    [selectedLabel setPosition: ccp(380, 30)];
    selectedLabel.visible=false;
    [self addChild:selectedLabel];
    
    //
    int keeperYLine= screenHalfHeight-(screenHalfHeight/1.70); //1.95  // 65
    
    int xCenter = 105;
    int yGap = 50;
    int xGap = 60;
    int centreMidYGap = 10;
    int defenderMidYGap = 7;
    
    // 332 (442)
    formationPositions332 = [[NSMutableArray alloc] init];
    [formationPositions332 addObject: [NSValue valueWithCGPoint:CGPointMake(xCenter,keeperYLine)]];
    //defence
    [formationPositions332 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap,    keeperYLine+1*yGap)]];
    [formationPositions332 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/3,  keeperYLine+1*yGap)]];
    [formationPositions332 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/3,  keeperYLine+1*yGap)]];
    [formationPositions332 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap,    keeperYLine+1*yGap)]];
    
    //midfield
    [formationPositions332 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap,    keeperYLine+2*yGap)]];
    [formationPositions332 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/3,  keeperYLine+2*yGap)]];
    [formationPositions332 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/3,  keeperYLine+2*yGap)]];
    [formationPositions332 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap,    keeperYLine+2*yGap)]];
    //attack
    [formationPositions332 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/3,keeperYLine+3*yGap)]];
    //[formationPositions332 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter,keeperYLine+3*yGap)]];
    [formationPositions332 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/3,keeperYLine+3*yGap)]];
    
    
    // 323 (424)
    formationPositions323 = [[NSMutableArray alloc] init];
    [formationPositions323 addObject: [NSValue valueWithCGPoint:CGPointMake(xCenter,keeperYLine)]];
    //defence
    [formationPositions323 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap,    keeperYLine+1*yGap)]];
    [formationPositions323 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/3,  keeperYLine+1*yGap)]];
    [formationPositions323 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/3,  keeperYLine+1*yGap)]];
    [formationPositions323 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap,    keeperYLine+1*yGap)]];
    //midfield
    [formationPositions323 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/2,  keeperYLine+2*yGap)]];
    [formationPositions323 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/2,  keeperYLine+2*yGap)]];
    //attack
    [formationPositions323 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap,    keeperYLine+3*yGap)]];
    //[formationPositions323 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/2,keeperYLine+3*yGap)]];
    [formationPositions323 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/3,  keeperYLine+3*yGap)]];
    [formationPositions323 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/3,  keeperYLine+3*yGap)]];
    //[formationPositions323 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/2,keeperYLine+3*yGap)]];
    [formationPositions323 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap,    keeperYLine+3*yGap)]];
    
    // 341 (451)
    formationPositions341 = [[NSMutableArray alloc] init];
    [formationPositions341 addObject: [NSValue valueWithCGPoint:CGPointMake(xCenter,keeperYLine)]];
    //defence
    [formationPositions341 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap,    keeperYLine+1*yGap)]];
    [formationPositions341 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/3,  keeperYLine+1*yGap)]];
    [formationPositions341 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/3,  keeperYLine+1*yGap)]];
    [formationPositions341 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap,    keeperYLine+1*yGap)]];
    //midfield
    [formationPositions341 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap,    keeperYLine+2*yGap)]];
    [formationPositions341 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/3,  keeperYLine-centreMidYGap+2*yGap)]];
    [formationPositions341 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter,         keeperYLine+centreMidYGap+2*yGap)]];
    [formationPositions341 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/3,  keeperYLine-centreMidYGap+2*yGap)]];
    [formationPositions341 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap,    keeperYLine+2*yGap)]];
    //attack
    //[formationPositions341 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/2,keeperYLine+3*yGap)]];
    //[formationPositions341 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/2,keeperYLine+3*yGap)]];
    [formationPositions341 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter,keeperYLine+3*yGap)]];
    
    // 433
    formationPositions431 = [[NSMutableArray alloc] init];
    [formationPositions431 addObject: [NSValue valueWithCGPoint:CGPointMake(xCenter,keeperYLine)]];
    //defence
    [formationPositions431 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap,    keeperYLine+1*yGap)]];
    [formationPositions431 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/3,  keeperYLine+1*yGap)]];
    [formationPositions431 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/3,  keeperYLine+1*yGap)]];
    [formationPositions431 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap,    keeperYLine+1*yGap)]];
    
    //midfield
    [formationPositions431 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/1.5,    keeperYLine+2*yGap)]];
    [formationPositions431 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter,         keeperYLine+2*yGap)]];
    [formationPositions431 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/1.5,    keeperYLine+2*yGap)]];
    
    //attack
    [formationPositions431 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/1.5,keeperYLine+3*yGap)]];
    [formationPositions431 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter,         keeperYLine+3*yGap)]];//
    [formationPositions431 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/1.5,keeperYLine+3*yGap)]];
    
    
    // 343
    formationPositions343 = [[NSMutableArray alloc] init];
    [formationPositions343 addObject: [NSValue valueWithCGPoint:CGPointMake(xCenter,keeperYLine)]];
    //defence
    [formationPositions343 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/1.5,keeperYLine+1*yGap)]];
    [formationPositions343 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter,     keeperYLine+1*yGap)]];
    [formationPositions343 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/1.5,keeperYLine+1*yGap)]];
    
    //midfield
    [formationPositions343 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap,    keeperYLine+2*yGap)]];
    [formationPositions343 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/3,  keeperYLine+2*yGap)]];
    [formationPositions343 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/3,  keeperYLine+2*yGap)]];
    [formationPositions343 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap,    keeperYLine+2*yGap)]];
    
    //attack
    [formationPositions343 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter-xGap/1.5,keeperYLine+3*yGap)]];
    [formationPositions343 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter,5+       keeperYLine+3*yGap)]];//
    [formationPositions343 addObject:[NSValue valueWithCGPoint:CGPointMake(xCenter+xGap/1.5,keeperYLine+3*yGap)]];
    

    
    //
    allFormations = [[NSMutableArray alloc] init];
    [allFormations addObject:formationPositions332];
    [allFormations addObject:formationPositions323];
    [allFormations addObject:formationPositions341];
    [allFormations addObject:formationPositions431];
    [allFormations addObject:formationPositions343];
    
    
    //names
    NSString* fontName = @MENU_FONT;
    int fontSize = CHOOSE_TEAM_FORMATION_NAME_FONT_SIZE;
    formationNames = [[NSMutableArray alloc] init];
    
    [formationNames addObject:[CCButton buttonWithTitle:@"-" fontName:fontName fontSize:fontSize]];
    [formationNames addObject:[CCButton buttonWithTitle:@"-" fontName:fontName fontSize:fontSize]];
    [formationNames addObject:[CCButton buttonWithTitle:@"-" fontName:fontName fontSize:fontSize]];
    [formationNames addObject:[CCButton buttonWithTitle:@"-" fontName:fontName fontSize:fontSize]];
    [formationNames addObject:[CCButton buttonWithTitle:@"-" fontName:fontName fontSize:fontSize]];
    [formationNames addObject:[CCButton buttonWithTitle:@"-" fontName:fontName fontSize:fontSize]];
    [formationNames addObject:[CCButton buttonWithTitle:@"-" fontName:fontName fontSize:fontSize]];
    [formationNames addObject:[CCButton buttonWithTitle:@"-" fontName:fontName fontSize:fontSize]];
    [formationNames addObject:[CCButton buttonWithTitle:@"-" fontName:fontName fontSize:fontSize]];
    [formationNames addObject:[CCButton buttonWithTitle:@"-" fontName:fontName fontSize:fontSize]];
    [formationNames addObject:[CCButton buttonWithTitle:@"-" fontName:fontName fontSize:fontSize]];
    

    for (CCLabelTTF *name in formationNames)
    {
        [self addChild:name z:12];
    }
    
    
    //players
    formationPlayers = [[NSMutableArray alloc] init];
    NSString *formationIconSpr = @"formationItem.png";
    [formationPlayers addObject: [CCSprite spriteWithImageNamed: formationIconSpr]];
    [formationPlayers addObject: [CCSprite spriteWithImageNamed: formationIconSpr]];
    [formationPlayers addObject: [CCSprite spriteWithImageNamed: formationIconSpr]];
    [formationPlayers addObject: [CCSprite spriteWithImageNamed: formationIconSpr]];
    [formationPlayers addObject: [CCSprite spriteWithImageNamed: formationIconSpr]];
    [formationPlayers addObject: [CCSprite spriteWithImageNamed: formationIconSpr]];
    [formationPlayers addObject: [CCSprite spriteWithImageNamed: formationIconSpr]];
    [formationPlayers addObject: [CCSprite spriteWithImageNamed: formationIconSpr]];
    [formationPlayers addObject: [CCSprite spriteWithImageNamed: formationIconSpr]];
    [formationPlayers addObject: [CCSprite spriteWithImageNamed: formationIconSpr]];
    [formationPlayers addObject: [CCSprite spriteWithImageNamed: formationIconSpr]];
    
    
    Team *team1Kit = [[GameModel sharedGameModel] getTeam1];
    [team1Kit setTeamData:[[GameData sharedGameDataManager] getMatchTeam:TEAM1]];
    CCColor *mainKitColor = [Team getColour: [team1Kit teamData].stripMainColour];
    
    for (CCSprite * spr in formationPlayers) {
        [spr setColor:mainKitColor];
        spr.scale=2.2;
    }
    //[[[formationPlayers objectAtIndex:1] sprite] setColor:[CCColor blackColor]];
    
//    CCColor *formationColour =  [Team getColour: [[gd getMatchTeam:TEAM1] stripMainColour]];
//    [[formationPlayers objectAtIndex:0] setColor:formationColour];
//    [[formationPlayers objectAtIndex:1] setColor:formationColour];
//    [[formationPlayers objectAtIndex:2] setColor:formationColour];
//    [[formationPlayers objectAtIndex:3] setColor:formationColour];
//    [[formationPlayers objectAtIndex:4] setColor:formationColour];
//    [[formationPlayers objectAtIndex:5] setColor:formationColour];
//    [[formationPlayers objectAtIndex:6] setColor:formationColour];
//    [[formationPlayers objectAtIndex:7] setColor:formationColour];
//    [[formationPlayers objectAtIndex:8] setColor:formationColour];
    
    
    int currentPlayer=0;
    for (CCSprite *player in formationPlayers)
    {
        player.scale=0.3;
        
        NSValue *val = [[allFormations objectAtIndex:currentFormation ] objectAtIndex: currentPlayer];
        CGPoint pos = [val CGPointValue];
        player.position = pos;
 
        [[formationNames objectAtIndex:currentPlayer] setTitle: [[gd getMatchTeam:TEAM1] getPlayerSurname:currentPlayer]];
        [[formationNames objectAtIndex:currentPlayer] setTarget:self selector:@selector(selectPlayerAndUpdateListing:)];
        [[formationNames objectAtIndex:currentPlayer] setHitAreaExpansion:5.0];

        CCLabelTTF *playerLabel = [formationNames objectAtIndex:currentPlayer];
        [playerLabel setPosition: CGPointMake(pos.x, pos.y-12)];
        [playerLabel setColor: [Team getColour:BRAZIL_YELLOW]];
                                   
        [self addChild:player z:10];
        currentPlayer++;
        
        //
        [self updateActualFormation:currentFormation];
    }
    
	return self;
}




- (void)selectPlayer:(id)sender{
    NSLog(@"** Player selected **** %@", sender);
    CCButton *button = sender;
    
    NSLog(@" Button name : %@", [button title]);
    
    if (!player1Chosen) {
        [MenuLayer playMenuButtonSound4];
        player1Chosen=true;
        chosenButton1=button;
        
    } else {
        [MenuLayer playMenuButtonSound5];
        tempButton = [CCButton buttonWithTitle:[button title]];
        [button setTitle:[chosenButton1 title]];
        [chosenButton1 setTitle: [tempButton title]];
        player1Chosen=false;
    }
    
    int player1Id = [[gd getMatchTeam:TEAM1] getPlayerIdByName: [chosenButton1 title]];
    int player2Id = [[gd getMatchTeam:TEAM1] getPlayerIdByName: [button title]];

    
    [[gd getMatchTeam:TEAM1] swapPlayers:player1Id :player2Id];
    [self updateTeamDisplay];
    [self updatePlayerListings];

}


//
- (void)selectPlayerAndUpdateListing:(id)sender{
    [MenuLayer playMenuButtonSound4];

    [self selectPlayer:sender];
    [self updatePlayerListings];
}


//
-(void)updatePlayerListings {
    
    int i=0;
    for (PlayerData *pData in [[gd getMatchTeam:TEAM1] playersData]) {
        
        testLabel = [nameLabels objectAtIndex:i];
        
        int playerId = [[gd getMatchTeam:TEAM1] getPlayerIdByName: [pData playerName]];

        NSString *playerEntry = [NSString stringWithFormat: @"%d. %@",playerId+1, [pData playerName]];;
        
        [testLabel setTitle:playerEntry];

        i++;
    }    
}

- (void)onDemoGame:(id)sender{
    NSLog(@"GOTO GAME>>>");
    //NSLog(@">> MEmory Available MB %f", [CCDirector getAvailableMegaBytes]);
    //[[GameModel sharedGameModel] initMatchTeamData];
    //[[GameModel sharedGameModel] initMatch];
    
    
    //        [[[GameData sharedGameDataManager] gameModel] schedule:@selector(tick:)];
    //        [[[GameData sharedGameDataManager] gameModel] setMatchState: preKickOff];
    //        [[[GameData sharedGameDataManager] gameModel] showPreMatchInfo];
    
    [MenuLayer playMenuButtonSound3];
    [SceneManager goGame];
    

}

- (void)onGoBack:(id)sender{
    NSLog(@"GO BACK >>>");
    
//    [MenuLayer playMenuButtonSound3];
//
    
    if ([[GameModel sharedGameModel] getMatchState] == gamePlaying) {
        [MenuLayer playMenuButtonSound3];
        [SceneManager goMenu];
    }
    else {
        [MenuLayer playMenuButtonSound3];
        [SceneManager goChooseTeamMenu];
    }

}



- (BOOL) isWithinArea:(CGPoint)touchPos :(CCLabelTTF *)label {
    //NSLog(@"TouchPos% f,%f",touchPos.x,touchPos.y);
    //NSLog(@"SpritePos% f,%f",spritePos.x,spritePos.y);
    
    
    if (touchPos.x > label.position.x - label.textureRect.size.width/2 &&
        touchPos.x < label.position.x + label.textureRect.size.width/2 &&
        touchPos.y > label.position.y - label.textureRect.size.height/2 &&
        touchPos.y < label.position.y + label.textureRect.size.height/2  )
        return true;
    else
        return false;
}


-(void) updateActualFormation : (long) selectedFormation {
    
    // **CUrrent Formation =
    Team *team1 = [[GameModel sharedGameModel] getTeam1];
    
    switch (selectedFormation) {
        
        case 0:
            [team1 set442];
            break;
            
        case 1:
            [team1 set424];
            break;
            
        case 2:
            [team1 set451];
            break;
            
        case 3:
            [team1 set433];
            break;
        
        case 4:
            [team1 set343];
            break;

        default:
            [team1 set442];
            break;
    }
}


- (void) moveLeftFormation {
    [MenuLayer playMenuButtonSound4];


    currentFormation--;
    if (currentFormation < 0) {
        currentFormation=[formationsNames count]-1;
    }
    
    [formationLabel setTitle: [formationsNames objectAtIndex:currentFormation]];
    [self updateTeamDisplay];
    [self updateActualFormation:currentFormation];
}


//
- (void) moveRightFormation {
    [MenuLayer playMenuButtonSound4];

    currentFormation++;
    if (currentFormation > ([formationsNames count]-1)) {
        currentFormation=0;
    }
    
    [formationLabel setTitle: [formationsNames objectAtIndex:currentFormation]];
    [self updateTeamDisplay];
    [self updateActualFormation:currentFormation];
}


//COMMENTED-REMOVE

- (void)touchBegan:(CCTouch*) touch withEvent:(CCTouchEvent*) event {
//- (BOOL)ccTouchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
    if ([[GameModel sharedGameModel] getGameState] != choosePlayers)
    {
        //return TRUE;
    }
    
    if (!self.visible)
    {
        //return false;
    }
    
    CCLOG(@">>>> (MenuTeamLayer) Current scene is %@", [[CCDirector sharedDirector] runningScene]);
    
    if ([[GameModel sharedGameModel] getGameState] == choosePlayers)
    {
        [MenuLayer playMenuButtonSound];

        
        NSLog(@"TOUCH BEGAN - MENU TEAM LAYER");
        
        //[backLabel
        if ([self isWithinArea: convertedLocation : forwardLabel])
        {
            NSLog(@"GO TO GAME");
            [SceneManager goGame];
        }
    }
    
    if ([self isWithinArea: convertedLocation: backLabel])
    {
        [MenuLayer playMenuButtonSound];

        NSLog(@"GO BACK TO TEAM MENU");
        [SceneManager goChooseTeamMenu];
    }
    
    int chosenPlayer1Index=0;
    for (CCLabelTTF * currentLabel in nameLabels)
    {
        if ([self isWithinArea: convertedLocation : currentLabel] )
        {
            [MenuLayer playMenuButtonSound];

            NSLog(@" *Chose Label : %@", [currentLabel string]);
            //chosenLabel=currentLabel;
            selectedLabel=currentLabel;
            [chosenLabel setString:[currentLabel string]];
            [chosenLabel setPosition:[currentLabel position]];
            chosenLabel.visible=true;
            chosenPlayer1Id=chosenPlayer1Index;
            NSLog(@" *Chosen player 1 Id : %d", chosenPlayer1Id);
            
            break;
        }
        chosenPlayer1Index++;
    }
    
    //return YES;
}

- (void)ccTouchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    if ([[GameModel sharedGameModel] getGameState] != choosePlayers)
    {
        return;
    }
    
    if (!self.visible)
    {
        return;
    }
    
    NSLog(@"TOUCH MOVED");
    CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
    if (chosenLabel != nil) {
        
        for (CCLabelTTF * currentLabel in nameLabels)
        {
            // NSLog(@"-- %@",[currentLabel string]);
            //NSLog(@" *current hover over Label : %@",  [currentLabel string]);
            if ([self isWithinArea: convertedLocation : currentLabel] )
            {
                NSLog(@" *current hover over Label : %@",  [currentLabel string]);
                // NSLog(@" *Chosen Label : %@",  [chosenLabel string]);
                
                //chosenLabel=currentLabel;
                //[currentLabel setString:[chosenLabel string]];
                //break;
            }
        }
        
        
        [chosenLabel setPosition:convertedLocation];
    }
    
}

- (void)ccTouchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    if ([[GameModel sharedGameModel] getGameState] != choosePlayers)
    {
        return;
    }
    
    if (!self.visible)
    {
        return;
    }
    
    NSLog(@"TOUCH FINISHED");
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
    if (chosenLabel != nil)
    {
        
        int chosenPlayer2Index=0;
        for (CCLabelTTF * currentLabel in nameLabels)
        {
            if ([self isWithinArea: convertedLocation : currentLabel] )
            {
                [MenuLayer playMenuButtonSound];
                
                NSLog(@" *Final Label : %@",  [currentLabel string]);
                // NSLog(@" *Chosen Label : %@",  [chosenLabel string]);
                
                //chosenLabel=currentLabel;
                [selectedLabel setString:[currentLabel string]];
                [currentLabel setString:[chosenLabel string]];
                chosenLabel.visible=false;
                gd = [GameData sharedGameDataManager];
                [[gd getMatchTeam:TEAM1] swapPlayers:chosenPlayer1Id :chosenPlayer2Index];
//                [self updateTeamDisplay];
                //[gd getCurrentTeam:1];
                //NSLog(@"name = %@",[[gd getTeam:1] getPlayerName:3]);
                NSLog(@" *Chosen player 2 Id : %d", chosenPlayer2Index);
                
                
                //break;
            }
            chosenPlayer2Index++;
        }
        
        //chosenLabel = nil;
    }    
}

//
-(void) updateTeamDisplay
{
    int currentPlayer=0;
    for (CCSprite *player in formationPlayers)
    {
        //player.scale=0.3;
        
        //NSLog(@"**CUrrent Formation = %d", currentFormation);
        //NSLog(@"**CUrrent Player = %d", currentPlayer);
        
        NSValue *val = [[allFormations objectAtIndex:currentFormation ] objectAtIndex: currentPlayer];
        //NSLog(@"**CUrrent Player *= %d", currentPlayer);
        
        CGPoint pos = [val CGPointValue];
        player.position = pos;
        
        [[formationNames objectAtIndex:currentPlayer] setTitle: [[gd getMatchTeam:TEAM1] getPlayerSurname:currentPlayer]];
       // [[formationNames objectAtIndex:currentPlayer] setPosition:ccp(pos.x, pos.y-10)];
        
        
        CCLabelTTF *playerLabel = [formationNames objectAtIndex:currentPlayer];
        [playerLabel setPosition: CGPointMake(pos.x, pos.y-12)];

        
        //[self addChild:player z:10];
        currentPlayer++;
    }
    
}

- (void) dealloc
{
    [self removeAllChildrenWithCleanup:YES];
}


@end

//
//  MenuChooseTeamLayer.m
//  mySoccer
//
//  Created by Trevor Delves on 10/11/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuChooseTeamLayer.h"
#import "cocos2d.h"
#import "SceneManager.h"


@implementation MenuChooseTeamLayer

//CCSprite *menuBG;
//CCSprite *menu2BG;
//CCSprite *menuBox;
//CCSprite *menuLogo;
//CCSprite *menuTab;
//CCSprite *pitch;
//CCSprite *backBox;


-(id) init{
	self = [super init];
    //
    CGSize viewSize = [CCDirector sharedDirector].viewSize;

    CCColor *boxColor = [CCColor colorWithRed:(0.0f) green:(0.00f) blue:(0.0f) alpha:(.35f)];
    
    CCNodeColor *menuHighlight;
    menuHighlight = [CCNodeColor nodeWithColor:boxColor width:viewSize.width/2+10 height:viewSize.height];
    menuHighlight.anchorPoint = CGPointMake(0.5,0.5);
    menuHighlight.position = CGPointMake(viewSize.width/2, viewSize.height/2);
    
    // Menu Position
    int menuX = [CCDirector sharedDirector].viewSize.width/2;
    int viewHalfHeight = [CCDirector sharedDirector].viewSize.height/2;
    int menuY = viewHalfHeight;
    
    //
    menuBG =[CCSprite spriteWithImageNamed: MENU_BG];
    menuBG.scale=MENU_BG_SCALE;
    menuBG.position = MENU_BG_POS;
    [menuBG setPosition :ccp(menuX,menuY)];
        
    //
    menuBox=[CCSprite spriteWithImageNamed: @"menu_box_1.png"];
    menuLogo=[CCSprite spriteWithImageNamed: @"logo.png"];;
    menuTab=[CCSprite spriteWithImageNamed: @"menuBar.png"];;
    
    [menuBox setPosition : ccp(menuX,menuY+8)];
    [menuLogo setPosition : ccp(menuX,menuY+125)];
    [menuTab setPosition : ccp(menuX,menuY+120)];
    
    menuBox.scaleX=0.50;
    menuBox.scaleY=0.29;
    
    menuLogo.scale=0.13;
    
    menuTab.scaleX=0.85;
    menuTab.scaleY=0.30;
    
    
    
    [self addChild: menuBox z:10];
    [self addChild: menuLogo z:11];
    [self addChild: menuTab z:10];
    
    
    
    //
    NSString *title;
    if ([[GameModel sharedGameModel] matchType] == matchDemo) {
        title =@"CHOOSE TEAM 1";
    } else {
        title =@"CHOOSE YOUR TEAM";
    }
  
    int halfScreenHeight = viewSize.height/2;
    int baseYLevel = halfScreenHeight+(halfScreenHeight/2) ;
    
    
    
    titleLabel = [CCLabelTTF labelWithString:title fontName:@MENU_FONT fontSize:MENU_TITLE_FONT_SIZE]; //32
    [titleLabel setPosition: ccp(menuX, baseYLevel)];
    [self addChild:titleLabel z:100];

    nameButtons = [[NSMutableArray alloc] init];
    
    
    [self addChild:menuBG z:0];
   // [self addChild:menu2BG z:0];
    
    int row =0;
    int column = 0;
    int rowGap = 30;
    int columnGap = 140;
    
    for (TeamData* team in [[GameData sharedGameDataManager] getTeams]) {
        
        CCButton * teamBtn = [CCButton buttonWithTitle:[team teamName] fontName:@MENU_FONT fontSize:CHOOSE_TEAM_FONT_SIZE];
        [teamBtn setPosition: ccp(menuX-menuX/2 +(column*columnGap),menuY+rowGap-(row*rowGap))];
        [nameButtons addObject:teamBtn];
        [teamBtn setTarget:self selector:@selector(onDemoGame:)];

        [self addChild: teamBtn z:100];
        
        row+=1;
        if (row == 5 )
        {
            column+=1;
            row=0;
        }
    }
    
    CCButton * prevBtn = [CCButton buttonWithTitle:@BACK_BUTTON fontName:@MENU_FONT fontSize:NEXT_FORWARD_BUTTON_FONT_SIZE];
    prevBtn.anchorPoint = ccp(0.5,0.5);
    [prevBtn setPosition: ccp(50, 25)];
    [prevBtn setTarget:self selector:@selector(onGoBack:)];
    [self addChild:prevBtn z: 1];
    
    //
    backBox =[CCSprite spriteWithImageNamed: @"transparent_box.png"];
    backBox.scaleY=0.75;
    backBox.scaleX=0.60;
    [backBox setPosition :prevBtn.position];
    [self addChild:backBox z: 0];
    
    
    
    chosenTeam1Id=0;
    chosenTeam2Id=0;
    team1Chosen=false;;
    team2Chosen=false;;
    [[GameData sharedGameDataManager] clearMatchTeams];
    [[GameData sharedGameDataManager] setMatchInProgress:false];
    
    [[GameModel sharedGameModel] setGameState:chooseTeam];

    //COMMENTED
    /*[[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self
                                                     priority:0
                                              swallowsTouches:YES];
    */
    [self setMultipleTouchEnabled:YES];

	return self;
}
// row:(int)rowId
- (void)onTestButton:(CCButton *)button {
    NSLog(@">>>>> *** TEST BUTTON %@", button);
   // CCButton *button = sender;
    //[sender g]
    
    NSLog(@">>>>> *** Button : %@" , button.title);
    
    NSLog(@">>>>> *** Index : %d", [self getTeamIndex:button]);
}


- (int)getTeamIndex:(CCButton*)button {
    NSLog(@">>>>> Get Button Index....");
    int i=0;
    for (CCButton *currentButton in nameButtons) {
        if (currentButton.title == button.title) {
            NSLog(@">>>>> Button Index match : %d" , i);
            return i;
        }
//        NSLog(@">>>>> Button Title : %@", currentButton.title);
        i++;
    }
    
    return -1;
    
}

-(int) choseRandomTeamId:(int)chosenTeamId {
    int randomTeamId = -1;
    
    while (randomTeamId== -1) {
        int rand = [Util random:MAX_TEAMS];
        
        if (rand != chosenTeamId) {
            randomTeamId=rand;
        }
    }
    
    return randomTeamId;
}


- (void)onDemoGame:(CCButton *)button{
    [MenuLayer playMenuButtonSound];

    //
    [Team resetAllTeamsToOriginalPLayerLineup];
    
    
    NSLog(@">>>>> *** TEAM BUTTON 1***");
    //NSLog(@">> MEmory Available MB %f", [CCDirector getAvailableMegaBytes]);
    if (!team1Chosen)
    {
        [button setColor:[CCColor yellowColor]];
        chosenTeam1Id=[self getTeamIndex:button];
        [[GameData sharedGameDataManager] addMatchTeam: [[GameData sharedGameDataManager] getTeam:chosenTeam1Id]];
        CCLOG(@"* Team 1 chosen : %@",[[[GameData sharedGameDataManager] getTeam:chosenTeam1Id] teamName]);
        
        team1Chosen=true;
        //[currentLabel setColor:ccYELLOW];
       

        
        if ([GameData isPracticeMatch]) {
            chosenTeam2Id=[self choseRandomTeamId:chosenTeam1Id];
            [[GameData sharedGameDataManager] addMatchTeam: [[GameData sharedGameDataManager] getTeam:chosenTeam2Id]];
            CCLOG(@"* Practice Mode * Team 2 chosen : %@",[[[GameData sharedGameDataManager] getTeam:chosenTeam2Id] teamName]);
            [SceneManager goTeamMenu];
        }
        
       
        if ([[GameModel sharedGameModel] matchType] == matchDemo) {
            [titleLabel setString:@"CHOOSE TEAM 2"];
        } else {
            [titleLabel setString:@"CHOOSE OPPONENT"];
        }

    }
    else if (!team2Chosen && (chosenTeam1Id != [self getTeamIndex:button]))
    {
        [button setColor:[CCColor orangeColor]];
        chosenTeam2Id=[self getTeamIndex:button];
        [[GameData sharedGameDataManager] addMatchTeam: [[GameData sharedGameDataManager] getTeam:chosenTeam2Id]];
        CCLOG(@"* Team 2 chosen : %@",[[[GameData sharedGameDataManager] getTeam:chosenTeam2Id] teamName]);
        //[currentLabel setColor:ccRED];
        
        // skip Team Options Menu if demo mode
        
        if ([[GameModel sharedGameModel] matchMode] == matchModeManager ) {
            [SceneManager goTeamMenu];
        } else if ([[GameModel sharedGameModel] matchType] != matchDemo) {
            CCLOG(@"* MATCH MODE NOT DEMO");
            [SceneManager goTeamMenu] ;
        } else  {
            CCLOG(@"* MATCH MODE DEMO");
            [SceneManager goGame];

        }
        
//        if ([[GameModel sharedGameModel] matchMode] == matchModeManager || [[GameModel sharedGameModel] matchMode] == matchModeHuman) {
//            
//            
//            
//            if ([[GameModel sharedGameModel] matchType] == matchDemo) {
//                CCLOG(@"* MATCH MODE DEMO");
//                [SceneManager goGame];
//            } else {
//                CCLOG(@"* MATCH MODE MANAGER | HUMAN");
//                [SceneManager goTeamMenu];
//            }
//        } else {
//            CCLOG(@"* MATCH MODE OTHER");
//            [SceneManager goGame];
//        }
//        
        team2Chosen=true;
    }

    
}

- (void)onDemoGame2:(id)sender{
    NSLog(@">>>>> *** TEAM BUTTON 2");
    //NSLog(@">> MEmory Available MB %f", [CCDirector getAvailableMegaBytes]);
}

//
- (BOOL) isWithinArea:(CGPoint)touchPos :(CCLabelTTF *)label 
{
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

- (void)onGoBack : (id)sender {
    NSLog(@"GOBACK >>>");
    [MenuLayer playMenuButtonSound3];
    [SceneManager goMenu];
}


//
//COMMENTED_REMOVED

- (void)touchBegan:(CCTouch *) touch withEvent:(CCTouchEvent*) event {
//- (BOOL)ccTouchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    
    if (!self.visible)
    {
        //return false;
    }
    
    if ([[GameModel sharedGameModel] getGameState] != chooseTeam)
    {
        //return FALSE;
    }
    NSLog(@"TOUCH BEGAN - MENU CHOOSE TEAM");
}



//
- (void)ccTouchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    if (!self.visible)
    {
        return;
    }
    
    NSLog(@"TOUCH MOVED");
    CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];

   
    [forwardLabel setPosition:convertedLocation];
}

- (void)ccTouchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event 
{
    if (!self.visible)
    {
        return;
    }
    
    NSLog(@"TOUCH FINISHED");
}

- (void) dealloc
{
    [self removeAllChildrenWithCleanup:YES];
}


@end
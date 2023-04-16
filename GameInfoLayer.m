//
//  GameInfoLayer.m
//  mySoccer
//
//  Created by Trevor Delves on 15/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameInfoLayer.h"
#import "SceneManager.h"
#import "GameInfoLayer.h"

@implementation GameInfoLayer

@synthesize titleLabel;
@synthesize info1Label;
@synthesize info2Label;
@synthesize info3Label;
@synthesize info4Label;
@synthesize continueLabel;
@synthesize recBackground;
@synthesize recBackgroundHeader;
@synthesize recBackgroundHeaderSmall;
@synthesize recBackgroundSmall;

//
@synthesize buttonCenter;
@synthesize buttonCenterEdge;
@synthesize buttonLeft;
@synthesize buttonLeftEdge;
@synthesize buttonRight;
@synthesize buttonRightEdge;

@synthesize leftButtonLabel;
@synthesize centerButtonLabel;
@synthesize rightButtonLabel;

//
@synthesize recBackgroundTitle;
@synthesize recBackgroundTitleHeader;
@synthesize buttonBigLeft;
@synthesize buttonBigCenter;
@synthesize buttonBigRight;
@synthesize leftButtonBigLabel;
@synthesize centerButtonBigLabel;
@synthesize rightButtonBigLabel;
@synthesize recBackgroundTitleLabel;

CCSprite *menuBox;
CCSprite *menuLogo;
CCSprite *menuTab;


-(id) init{
	self = [super init];
    
    CGSize viewSize = [CCDirector sharedDirector].viewSize;
    CGSize viewSizePixels = [CCDirector sharedDirector].viewSizeInPixels;
    

    int menuX = viewSize.width/2;
    int menuY = viewSize.height/2;
    int screenCenterX = viewSize.width/2;
 
    CCLOG(@"*>>>>>> VIEW SIZE : %f,%f", viewSize.width, viewSize.height);
    CCLOG(@"*>>>>>> VIEW SIZE PIXELS: %f,%f", viewSizePixels.width, viewSizePixels.height);
  
    //menuBG.position = ccp( 240, 170 );
    menuBG.scale=0.9;
    menuBG.opacity=100.0;
 
    int buttonY = 5;
    int buttonWidth = 140;
    int buttonXGap = 145;
    int textY = buttonY+20;
    int textXOffset = 70;
    
    
    //
    CCSprite *menuBox=[CCSprite spriteWithImageNamed: @"menu_box_1.png"];
    CCSprite *menuLogo=[CCSprite spriteWithImageNamed: @"logo.png"];;
    CCSprite *menuTab=[CCSprite spriteWithImageNamed: @"menuBar.png"];;
    
    [menuBox setPosition : ccp(menuX,menuY+20)];
    [menuLogo setPosition : ccp(menuX,menuY+125)];
    [menuTab setPosition : ccp(menuX,menuY+120)];
    
    menuBox.scaleX=0.45;
    menuBox.scaleY=0.25;
    
    menuLogo.scale=0.16;
    
    menuTab.scaleX=0.85;
    menuTab.scaleY=0.40;
    
   // [self addChild: menuBox z:10];
    [self addChild: menuLogo z:11];
    [self addChild: menuTab z:10];

    //
    Team *team1 = [[GameModel sharedGameModel] getTeam1];
    [team1 setTeamData:[[GameData sharedGameDataManager] getMatchTeam:TEAM1]];
    CCColor *mainKitColor = [Team getColour: [team1 teamData].stripMainColour];
    
    
    //
    CCColor *boxColor = [CCColor colorWithRed:(0.0f) green:(0.00f) blue:(0.0f) alpha:(1.0f)];

    
    //CCColor *boxHeadColor = [CCColor colorWithRed:(0.45f) green:(0.05f) blue:(0.1f) alpha:(.9f)];
    CCColor *boxHeadColor = mainKitColor;
    
    
    //
    //self.recBackground = [CCNodeColor nodeWithColor:boxColor width:420 height:60];
    self.recBackground=[CCSprite spriteWithImageNamed: @"menu_box_1.png"];
    //self.recBackground.position = CGPointMake(menuX,menuY+20);
    
    self.recBackground.scaleX=0.50;
    self.recBackground.scaleY=0.10;
    
    self.recBackground.anchorPoint = CGPointMake(0.5,0);
    self.recBackground.position = CGPointMake(screenCenterX, 210);
    
    self.recBackgroundHeader = [CCNodeColor nodeWithColor: boxHeadColor width:420 height:20];
    self.recBackgroundHeader.anchorPoint = CGPointMake(0.5,0);
    self.recBackgroundHeader.position = CGPointMake(screenCenterX, 290);
    self.recBackgroundHeader.opacity=0.75;
    
    //self.recBackgroundSmall = [CCNodeColor nodeWithColor:boxColor width:420 height:220];
    self.recBackgroundSmall=[CCSprite spriteWithImageNamed: @"menu_box_1.png"];
    self.recBackgroundSmall.position = CGPointMake(menuX,menuY+20);
    self.recBackgroundSmall.scaleX=0.50;
    self.recBackgroundSmall.scaleY=0.26;
    self.recBackgroundSmall.anchorPoint = CGPointMake(0.5,0);
    self.recBackgroundSmall.position = CGPointMake(screenCenterX, 70);
    
    self.recBackgroundHeaderSmall = [CCNodeColor nodeWithColor: boxHeadColor width:420 height:20];
    self.recBackgroundHeaderSmall.anchorPoint = CGPointMake(0.5,0);
    self.recBackgroundHeaderSmall.position = CGPointMake(screenCenterX, 270);
    self.recBackgroundHeaderSmall.opacity=0.75;

    //
    //
    [self addChild:self.recBackground z:0];
   // [self addChild:self.recBackgroundHeader z:0];
    
    [self addChild:self.recBackgroundSmall z:0];
    //[self addChild:self.recBackgroundHeaderSmall z:0];
    
    //
    
    //self.buttonLeft = [CCNodeColor nodeWithColor:boxColor width:buttonWidth height:buttonHeight];
    
    //self.buttonLeft = [CCNodeColor nodeWithColor:boxColor width:buttonWidth height:buttonHeight];
    self.buttonLeft = [CCSprite spriteWithImageNamed: @"menu_box_1.png"];
    self.buttonLeft.scaleX=0.16;
    self.buttonLeft.scaleY=0.07;
    
    self.buttonLeft.anchorPoint = CGPointMake(0.5,0);
    self.buttonLeft.position = CGPointMake(screenCenterX-5-buttonWidth, 5);
    
    //self.buttonCenter = [CCNodeColor nodeWithColor:boxColor width:buttonWidth height:buttonHeight];
    self.buttonCenter = [CCSprite spriteWithImageNamed: @"menu_box_1.png"];
    self.buttonCenter.scaleX=0.16;
    self.buttonCenter.scaleY=0.07;
    
    
    self.buttonCenter.anchorPoint = CGPointMake(0.5,0);
    self.buttonCenter.position = CGPointMake(screenCenterX, 5);
    
    //self.buttonRight = [CCNodeColor nodeWithColor:boxColor width:buttonWidth height:buttonHeight];
    self.buttonRight = [CCSprite spriteWithImageNamed: @"menu_box_1.png"];
    self.buttonRight.scaleX=0.16;
    self.buttonRight.scaleY=0.07;
    
    self.buttonRight.anchorPoint = CGPointMake(0.5,0);
    self.buttonRight.position = CGPointMake(screenCenterX+5+(buttonWidth), 5);
    
    
//    leftButtonLabel = [CCLabelTTF labelWithString:@"Left" fontName:@MENU_FONT fontSize:16];
//    [leftButtonLabel setPosition: ccp((PITCH_X_CENTER-buttonWidth/2)-buttonXGap+textXOffset,textY)];
//    [self addChild:leftButtonLabel z:1];
    
    CCLOG(@"*>>>>>>>>");
    
    leftButtonLabel = [CCButton buttonWithTitle:@"" fontName:@MENU_FONT fontSize:MATCH_INFO_FONT_SIZE];
    leftButtonLabel.anchorPoint = CGPointMake(0.5,0);
    [leftButtonLabel setPosition: ccp((screenCenterX)-buttonWidth-5,textY)];
    [leftButtonLabel setTarget:self selector:@selector(doLeftButton:)];
    [leftButtonLabel setHitAreaExpansion:20.0];
    [self addChild:leftButtonLabel z:1];

    centerButtonLabel = [CCButton buttonWithTitle:@"" fontName:@MENU_FONT fontSize:MATCH_INFO_FONT_SIZE];
    centerButtonLabel.anchorPoint = CGPointMake(0.5,0);
    [centerButtonLabel setPosition: ccp(screenCenterX,textY)];
    [centerButtonLabel setTarget:self selector:@selector(doSmallCenterButton:)];
    [centerButtonLabel setHitAreaExpansion:20.0];
    [self addChild:centerButtonLabel z:1];
    
    rightButtonLabel = [CCButton buttonWithTitle:@"" fontName:@MENU_FONT fontSize:MATCH_INFO_FONT_SIZE];
    rightButtonLabel.anchorPoint = CGPointMake(0.5,0);
    [rightButtonLabel setPosition: ccp((screenCenterX)+buttonWidth+5,textY)];
    [rightButtonLabel setTarget:self selector:@selector(doRightButton:)];
    [rightButtonLabel setHitAreaExpansion:20.0];
    [self addChild:rightButtonLabel z:1];

    
    
    [self addChild:self.buttonCenter z:0];
    [self addChild:self.buttonLeft z:0];
    [self addChild:self.buttonRight z:0];
    
    // Replay screen
    
    //int buttonBigX = PITCH_X_CENTER;
    int buttonBigY = 70;
    int textBigY = buttonBigY+70;
    int buttonBigHeight = 160;
    //int buttonBigWidth = 140;
    //int buttonBigXGap = 145;
    
    self.recBackgroundTitle = [[RectangleNode alloc] init :ccp(25,240) : ccp(455,310) : ccc4f(0.0f, 0.0f, 0.0f, 0.45f)];
    self.recBackgroundTitleHeader = [[RectangleNode alloc] init :ccp(25,290) : ccp(455,310) : ccc4f(0.45f, 0.05f, 0.1f, 0.9f)];
    
//    [self addChild:self.recBackgroundTitle z:0];
//    [self addChild:self.recBackgroundTitleHeader z:0];
    
    recBackgroundTitleLabel = [CCLabelTTF labelWithString:@"" fontName:@MENU_FONT fontSize:GAME_INFO_TITLE_FONT_SIZE];
    [recBackgroundTitleLabel setPosition: ccp((screenCenterX)+buttonXGap+textXOffset,textBigY)];
    [recBackgroundTitleLabel setPosition:ccp(screenCenterX, 235)];
    [self addChild:recBackgroundTitleLabel z:1];
    
    
    //
    //self.buttonBigLeft = [CCNodeColor nodeWithColor:boxColor width:buttonWidth height:buttonBigHeight];
    self.buttonBigLeft = [CCSprite spriteWithImageNamed: @"menu_box_1.png"];
    self.buttonBigLeft.scaleX=0.16;
    self.buttonBigLeft.scaleY=0.16;
    self.buttonBigLeft.anchorPoint = CGPointMake(0.5,0);
    self.buttonBigLeft.position = CGPointMake(screenCenterX-5-(buttonWidth), 70);
    
    //self.buttonBigCenter = [CCNodeColor nodeWithColor:boxColor width:buttonWidth height:buttonBigHeight];
    self.buttonBigCenter = [CCSprite spriteWithImageNamed: @"menu_box_1.png"];
    self.buttonBigCenter.scaleX=0.16;
    self.buttonBigCenter.scaleY=0.16;
    self.buttonBigCenter.anchorPoint = CGPointMake(0.5,0);
    self.buttonBigCenter.position = CGPointMake(screenCenterX, 70);
    
    self.buttonBigRight = [CCNodeColor nodeWithColor:boxColor width:buttonWidth height:buttonBigHeight];
    self.buttonBigRight = [CCSprite spriteWithImageNamed: @"menu_box_1.png"];
    self.buttonBigRight.scaleX=0.16;
    self.buttonBigRight.scaleY=0.16;
    self.buttonBigRight.anchorPoint = CGPointMake(0.5,0);
    self.buttonBigRight.position = CGPointMake(screenCenterX+5+(buttonWidth), 70);
    
    
    [self addChild:self.buttonBigCenter z:0];
    [self addChild:self.buttonBigLeft z:0];
    [self addChild:self.buttonBigRight z:0];
    
    
    leftButtonBigLabel = [CCButton buttonWithTitle:@"" fontName:@MENU_FONT fontSize:MATCH_INFO_BIG_BUTTON_FONT_SIZE];
    leftButtonBigLabel.anchorPoint = CGPointMake(0.5,0.5);
    [leftButtonBigLabel setPosition: ccp((screenCenterX)-5-buttonWidth,textBigY)];
    [leftButtonBigLabel setTarget:self selector:@selector(doLeftButton:)];
    [leftButtonBigLabel setHitAreaExpansion:20.0];
    [self addChild:leftButtonBigLabel z:1];
    
    centerButtonBigLabel = [CCButton buttonWithTitle:@"" fontName:@MENU_FONT fontSize:MATCH_INFO_BIG_BUTTON_FONT_SIZE];
    centerButtonBigLabel.anchorPoint = CGPointMake(0.5,0.5);
    [centerButtonBigLabel setPosition: ccp((screenCenterX),textBigY)];
    [centerButtonBigLabel setTarget:self selector:@selector(doCenterButton:)];
    [centerButtonBigLabel setHitAreaExpansion:20.0];
    [self addChild:centerButtonBigLabel z:1];
    
    rightButtonBigLabel = [CCButton buttonWithTitle:@"" fontName:@MENU_FONT fontSize:MATCH_INFO_BIG_BUTTON_FONT_SIZE];
    rightButtonBigLabel.anchorPoint = CGPointMake(0.5,0.5);
    [rightButtonBigLabel setPosition: ccp((screenCenterX)+5+buttonWidth,textBigY)];
    [rightButtonBigLabel setTarget:self selector:@selector(doRightButton:)];
    [rightButtonBigLabel setHitAreaExpansion:20.0];
    [self addChild:rightButtonBigLabel z:1];
    
    //titleLabel = [CCLabelTTF labelWithString:@"MATCH DAY" fontName:@MENU_FONT fontSize:36];
    titleLabel = [CCLabelTTF labelWithString:@"" fontName:@MENU_FONT fontSize:GAME_INFO_TITLE_FONT_SIZE];
    
    [titleLabel setPosition: ccp(screenCenterX, 235)];
    [self addChild:titleLabel z:15];
    
 
    //
    //info1Label = [CCLabelTTF labelWithString:matchString fontName:@MENU_FONT fontSize:28];
    info1Label = [CCLabelTTF labelWithString:@"" fontName:@MENU_FONT fontSize:GAME_INFO_1_FONT_SIZE];
    [info1Label setPosition: ccp(screenCenterX, 170)];
    [self addChild:info1Label z:15];
    
    info2Label = [CCLabelTTF labelWithString:@"" fontName:@MENU_FONT fontSize:INFO_LABEL_FONT_SIZE]; //16
    [info2Label setPosition: ccp(screenCenterX-100, 120)];
    [self addChild:info2Label z:15];
    
    info3Label = [CCLabelTTF labelWithString:@"" fontName:@MENU_FONT fontSize:INFO_LABEL_FONT_SIZE];
    [info3Label setPosition: ccp(screenCenterX+100, 120)];
    [self addChild:info3Label z:15];
    
    info4Label = [CCLabelTTF labelWithString:@"" fontName:@MENU_FONT fontSize:GAME_INFO_4_FONT_SIZE];
    [info4Label setPosition: ccp(screenCenterX, 100)];
    [self addChild:info4Label z:15];
    
    
    //continueLabel = [CCLabelTTF labelWithString:@"GO TO MATCH" fontName:@MENU_FONT fontSize:18];
    continueLabel = [CCLabelTTF labelWithString:@"" fontName:@MENU_FONT fontSize:18];
    
    [continueLabel setPosition: ccp(screenCenterX, 50)];
    [self addChild:continueLabel z:1];
    
    //COMMENTED
    //[[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self
    //                                                          priority:0
    //                                                   swallowsTouches:NO];
    CCLOG(@"*** GAME INFO LAYER ***");
    
	return self;
}

- (void)onDemoGame:(id)sender{
    NSLog(@"START GAME>>>");
    CCLOG(@">>MANAGER MODE : Watch Match");
    //[[GameModel sharedGameModel] setMatchState:kickOff];
    [[GameModel sharedGameModel] setMatchState:preKickOffRunout];
    [[GameModel sharedGameModel] setManagerMode:false];
    
    //todo check if not attached first
    [[[SceneManager sharedSceneManager] gameLayer] attachPlayersAndBall];
}

-(void) onManagerModeGetResult:(id)sender{
    
    CCLOG(@">>MANAGER MODE : Get result");
    [[GameModel sharedGameModel] setManagerMode:false];
    [[[SceneManager sharedSceneManager] gameInfoLayer] setMatchInProgressInfo];
    [[SceneManager sharedSceneManager] gameInfoLayer].visible=true;
    [[[SceneManager sharedSceneManager] gameLayer] detachPlayersAndBall];
    [[SceneManager sharedSceneManager] hudLayer].visible=false;
    [[[SceneManager sharedSceneManager] hudLayer] turnHudControlsOff];
    [[GameModel sharedGameModel] setMatchState:startManagerMode];    
}

-(void) onReplayGoals:(id)sender{
    CCLOG(@">> REPLAY GOALS ONLY");
    
    [self setupReplay];
    [[GameModel sharedGameModel] replayGoals];

}

-(void) onEnter
{
    [super onEnter];
    self.visible=true;
    //self.position=ccp(100,200);
    [GameData setDoResetMenuMusic :true];
}

-(void) onExit
{
    [super onExit];
    self.visible=false;
}

- (void) dealloc
{
    [self removeAllChildrenWithCleanup:YES];
}

-(void) set3ButtonPositions {
    
    CGSize viewSize = [CCDirector sharedDirector].viewSize;
    
    int screenCenterX = viewSize.width/2;
    int buttonY = 5;
    int buttonWidth = 140;
    int textY = buttonY+20;
    
    self.buttonLeft.position = CGPointMake(screenCenterX-5-buttonWidth, 5);
    self.buttonCenter.position = CGPointMake(screenCenterX, 5);
    self.buttonRight.position = CGPointMake(screenCenterX+5+(buttonWidth), 5);
    
    [leftButtonLabel setPosition: ccp((screenCenterX)-buttonWidth-5,textY)];
    [centerButtonLabel setPosition: ccp(screenCenterX,textY)];
    [rightButtonLabel setPosition: ccp((screenCenterX)+buttonWidth+5,textY)];
}

-(void) set2ButtonPositions {
    
    CGSize viewSize = [CCDirector sharedDirector].viewSize;
    
    int screenCenterX = viewSize.width/2;
    int buttonY = 5;
    int buttonWidth = 140;
    int textY = buttonY+20;
    
    self.buttonCenter.visible=false;
    self.buttonLeft.position = CGPointMake(screenCenterX-5-buttonWidth/2, 5);
    //self.buttonCenter.position = CGPointMake(screenCenterX, 5);
    self.buttonRight.position = CGPointMake(screenCenterX+5+(buttonWidth/2), 5);
    
    centerButtonLabel.visible=false;
    [leftButtonLabel setPosition: ccp((screenCenterX)-buttonWidth/2-5,textY)];
    //[centerButtonLabel setPosition: ccp(screenCenterX,textY)];
    [rightButtonLabel setPosition: ccp((screenCenterX)+buttonWidth/2+5,textY)];
}


-(void) resetScoreLabel {
    GameData *gd = [GameData sharedGameDataManager];

    NSString *score =  [NSString stringWithFormat:@"%@ %d-%d %@",
                       [[gd getMatchTeam:TEAM1] shortTeamName], 0, 0,
                       [[gd getMatchTeam:TEAM2] shortTeamName]];
    
    [[HudModel sharedHudModel]setScorelabelString:score];
    
    [gd getMatchTeam:TEAM1];
    
    [[[GameModel sharedGameModel] getTeam1] setScore:0];
    [[[GameModel sharedGameModel] getTeam2] setScore:0];
    
    [[GameData sharedGameDataManager] setTeam1score:0];
    [[GameData sharedGameDataManager] setTeam2score:0];
    
    //
    [info2Label setString:@""];
    [info3Label setString:@""];
    [info4Label setString:@""];
}

-(NSString *)getMatchTitle {
    //      enum matchMode {matchModeHuman, matchModeManager, matchModePlayerManager};
    //      enum matchType {matchDemo, matchExhibition, matchCup};

    enum matchMode  mode = [[GameModel sharedGameModel] matchMode];
    enum matchType  type = [[GameModel sharedGameModel] matchType];
    
    NSString *title = @GAME_TITLE;
    
    if ([GameData isPracticeMatch]) {
        title=@"MATCH PRACTICE";
    } else if (mode==matchModeHuman) {
        if (type==matchDemo) {
            title=@"DEMO MATCH";
        } else if (type==matchExhibition) {
             title=@"EXHIBITION MATCH";
        }
    } else if (mode==matchModeManager) {
         title=@"MICRO MANAGER";
    }
    return title;
}

//
-(void) setPreMatchInfo
{
    NSLog(@"** Set Prematch Info");
 
    GameData *gd = [GameData sharedGameDataManager];

    [[[SceneManager sharedSceneManager] gameInfoLayer] clearInfoLabels];
    [[[SceneManager sharedSceneManager] gameLayer] detachPlayersAndBall];
    
    
    [[HudModel sharedHudModel] showReplayControls: false];
    [self resetScoreLabel];

    [titleLabel setString:[self getMatchTitle]];
    
    //GameData *gd = [GameData sharedGameDataManager];
    NSString *matchString = [NSString stringWithFormat:@"%@ vs %@",[[gd getMatchTeam:TEAM1] teamName],
                             [[gd getMatchTeam:TEAM2] teamName] ];
    
    [info1Label setString:matchString];
 
    [self showSmallBackground];
    
    // clear all buttons
    self.leftButtonLabel.visible=false;
    self.centerButtonLabel.visible=false;
    self.rightButtonLabel.visible=false;

    if ([[GameModel sharedGameModel] matchMode] == matchModeManager && [[GameModel sharedGameModel] matchType] != matchDemo) {
        [[[SceneManager sharedSceneManager] gameLayer] setScale: 1.0];
        [self setManagerGotoMatchButtons];
    }
    else if ([[GameModel sharedGameModel] matchType] == matchDemo )
    {
        
        [self setDemoGotoMatchButtons];
        
    }
    else
    {
        [self setHumanGotoMatchButtons];
    }
    
    //
    [[[SceneManager sharedSceneManager] gameInfoLayer] showBigButtons:false];
    [[[SceneManager sharedSceneManager] gameInfoLayer] showBigButtonsLabels:false];
}

//
-(void) setHalfTimeInfo
{
    //NSLog(@">> MEmory Available KB %f", [CCDirector getAvailableKiloBytes]);
    //NSLog(@">> MEmory Available MB %f", [CCDirector getAvailableMegaBytes]);
    
    NSLog(@"** Set Halftime Info");
    [titleLabel setString:@"HALF TIME"];
    GameData *gd = [GameData sharedGameDataManager];
    NSString *matchString = [NSString stringWithFormat:@"%@ %d - %d %@",[[gd getMatchTeam:TEAM1] teamName],
                             [gd team1score], [gd team2score],[[gd getMatchTeam:TEAM2] teamName] ];
    
    [info1Label setString:matchString];
    //[continueLabel setString:@"TEAM INFO / BACK TO MATCH"];
    [continueLabel setString:@""];
    
    [self showFooterButtons:true];
    [self setHalftimeButtons];

    
}

-(void) setMatchInProgressInfo
{
    //NSLog(@">> MEmory Available KB %f", [CCDirector getAvailableKiloBytes]);
    //NSLog(@">> MEmory Available MB %f", [CCDirector getAvailableMegaBytes]);
    
    
    NSLog(@"** Set MatchInProgress Info");
    [titleLabel setString:@"MATCH IN PROGRESS"];
    GameData *gd = [GameData sharedGameDataManager];
    NSString *matchString = [NSString stringWithFormat:@"%@ %d - %d %@",[[gd getMatchTeam:TEAM1] teamName],
                             [gd team1score], [gd team2score],[[gd getMatchTeam:TEAM2] teamName] ];
    
    [info1Label setString:matchString];
    [continueLabel setString:@""];
}

-(void) updateScorerInfo:(int)teamId :(NSString *)scorer
{
    NSString *scorers;
    NSString *currentScorer;
    
    if (teamId==TEAM1) {
        currentScorer = [info2Label string];
    } else {
        currentScorer = [info3Label string];
    }
    
    
    if (currentScorer == NULL || [currentScorer isEqualToString:@""]) {
        scorers = [NSString stringWithFormat: @"%@",scorer ];
    } else {
        if (([currentScorer length] + [scorer length]) > 30 ) {
            scorers = [NSString stringWithFormat: @"%@\n%@",currentScorer, scorer ];
        }
        else {
            scorers = [NSString stringWithFormat: @"%@, %@",currentScorer, scorer ];
        }
    }
    
    if (teamId==TEAM1) {
        [info2Label setString:scorers];
    } else {
        [info3Label setString:scorers];
    }
    
    [continueLabel setString:@""];
}


-(void) clearInfoLabels {
    [info1Label setString:@""];
    [info2Label setString:@""];
    [info3Label setString:@""];
    [info4Label setString:@""];
}

//
-(void) showInfoLabels:(bool) show
{
    info1Label.visible=show;
    info2Label.visible=show;
    info3Label.visible=show;
    info4Label.visible=show;
}

//
-(void) showFooterButtons:(bool) show
{
    [self.buttonLeft setVisible:show];
    [self.buttonCenter setVisible:show];
    [self.buttonRight setVisible:show];
    
    [self.leftButtonLabel setVisible:show];
    [self.centerButtonLabel setVisible:show];
    [self.rightButtonLabel setVisible:show];
}

//
-(void) showBigButtons:(bool) show
{
    [self.buttonBigLeft setVisible:show];
    [self.buttonBigCenter setVisible:show];
    [self.buttonBigRight setVisible:show];
    
    //    [self.leftButtonLabel setVisible:show];
    //    [self.centerButtonLabel setVisible:show];
    //    [self.rightButtonLabel setVisible:show];
}


//
-(void) showBigButtonsLabels:(bool) show
{
    [self.leftButtonBigLabel setVisible:show];
    [self.centerButtonBigLabel setVisible:show];
    [self.rightButtonBigLabel setVisible:show];
}

-(void) showBigBackground:(bool) show
{
    [self.recBackground setVisible:show];
    [self.recBackgroundHeader setVisible:show];
}

-(void) showSmallBackground:(bool) show
{
    [self.recBackgroundSmall setVisible:show];
    [self.recBackgroundHeaderSmall setVisible:show];
}

-(void) showBackgroundTitle:(bool) show
{
    [self.recBackgroundTitle setVisible:show];
    [self.recBackgroundTitleHeader setVisible:show];
    [self showReplayLabels:true];
    
}

//
-(void) showBigBackground
{
    [self showBigBackground:true];
    //    [self.recBackground setVisible:true];
    //    [self.recBackgroundHeader setVisible:true];
    [self showSmallBackground: false];
    [self showBackgroundTitle: false];
    
    
    //    [self.recBackgroundSmall setVisible:false];
    //    [self.recBackgroundHeaderSmall setVisible:false];
    //
    [self showBigButtons:false];
    [self showFooterButtons:false];
    
    //    [self.buttonLeft setVisible:false];
    //    [self.buttonCenter setVisible:false];
    //    [self.buttonRight setVisible:false];
    //
    //    [self.leftButtonLabel setVisible:false];
    //    [self.centerButtonLabel setVisible:false];
    //    [self.rightButtonLabel setVisible:false];
}




//
-(void) showSmallBackground
{
    [self showSmallBackground:true];
    [self showBigBackground:false];
    [self showBackgroundTitle:false];
    
    //    [self.recBackgroundSmall setVisible:true];
    //    [self.recBackgroundHeaderSmall setVisible:true];
    //
    [self showFooterButtons:true];
    [self showBigButtons:false];
}


//
-(void) hideReplayButtons {
    [self showSmallBackground:false];
    [self showBigBackground:true];
    [self showBackgroundTitle:true];
    
    [self showBigButtons:true];
    [self showFooterButtons:false];
    
    self.buttonCenter.visible=true;
    self.centerButtonLabel.visible=true;
    [self.centerButtonLabel setTitle:@"EXIT REPLAY"];
    
    
    
    [self showInfoLabels:false];
    self.titleLabel.visible=false;
}

//
-(void) showBackgroundTitle
{
    [self showSmallBackground:false];
    [self showBigBackground:true];
    [self showBackgroundTitle:true];
    
    [self showBigButtons:true];
    [self showFooterButtons:false];
    
    self.buttonCenter.visible=true;
    self.centerButtonLabel.visible=true;
    [self.centerButtonLabel setTitle:@"EXIT REPLAY"];
    
    
    
    [self showInfoLabels:false];
    self.titleLabel.visible=false;
}


-(void) showReplayLabels:(bool) show
{
    [self set3ButtonPositions];
    
    self.leftButtonBigLabel.visible=show;
    self.centerButtonBigLabel.visible=show;
    self.rightButtonBigLabel.visible=show;
}


//
-(void) setAfterMatchLabels
{
    [self set3ButtonPositions];
    
    [self.leftButtonLabel setTitle:@"MAIN MENU"];
    
    if ([GameData isPracticeMatch]) {
        [self.centerButtonLabel setTitle:@"PRACTICE"];
    } else {
        [self.centerButtonLabel setTitle:@"REMATCH"];
    }
    
    [self.rightButtonLabel setTitle:@"REPLAYS"];
    self.recBackgroundTitleLabel.visible=false;
}

//
-(void) setHumanGotoMatchButtons
{
    [self set3ButtonPositions];
  
    //[self.centerButtonLabel setTitle:@"GO TO MATCH"];
    if ([GameData isPracticeMatch]) {
        [self.centerButtonLabel setTitle:@"PRACTICE"];
    } else {
        [self.centerButtonLabel setTitle:@"GO TO MATCH"];
    }

    
    self.buttonLeft.visible=false;
    self.buttonCenter.visible=true;
    self.buttonRight.visible=false;
    
    self.leftButtonLabel.visible=false;
    self.centerButtonLabel.visible=true;
    self.rightButtonLabel.visible=false;

    
    self.leftButtonLabel.visible=false;
    self.centerButtonLabel.visible=true;
    self.rightButtonLabel.visible=false;
}

//
-(void) setManagerGotoMatchButtons
{
    [self set2ButtonPositions];
    self.leftButtonLabel.visible=true;
    self.centerButtonLabel.visible=false;
    self.rightButtonLabel.visible=true;
    
    self.buttonLeft.visible=true;
    self.buttonCenter.visible=false;
    self.buttonRight.visible=true;
    
    [self.leftButtonLabel setTitle:@"WATCH MATCH"];
    [self.centerButtonLabel setTitle:@"MATCH UPDATES"]; //"MATCH UPDATES"
    [self.rightButtonLabel setTitle:@"GET RESULT"];
    
  }


//
-(void) setDemoGotoMatchButtons
{
    [self set3ButtonPositions];
    
    self.leftButtonLabel.visible=false;
    self.centerButtonLabel.visible=true;
    self.rightButtonLabel.visible=false;
    
    self.buttonLeft.visible=false;
    self.buttonCenter.visible=true;
    self.buttonRight.visible=false;

    [self.leftButtonLabel setTitle:@""];
    [self.centerButtonLabel setTitle:@"WATCH MATCH"];
    [self.rightButtonLabel setTitle:@""];
    
}

-(void) setHalftimeButtons
{
    NSLog(@">>>Set Half Time Buttons...");
    [self set3ButtonPositions];
    
    
    self.leftButtonLabel.visible=false;
    self.centerButtonLabel.visible=true;
    self.rightButtonLabel.visible=false;
    
    self.buttonLeft.visible=false;
    self.buttonCenter.visible=true;
    self.buttonRight.visible=false;
    
    //
    self.buttonBigLeft.visible=false;
    self.buttonBigCenter.visible=false;
    self.buttonBigRight.visible=false;
    self.recBackground.visible=false;
    
    
    [self.leftButtonLabel setTitle:@""];
    [self.centerButtonLabel setTitle:@"TO MATCH"];
    [self.rightButtonLabel setTitle:@""];
    
}


//
-(void) setReplayLabels
{
    [self set3ButtonPositions];
    
    self.leftButtonLabel.visible=false;
    self.centerButtonLabel.visible=true;
    self.rightButtonLabel.visible=false;

    
    //[self.leftButtonLabel setTitle:@"FULL GAME"];
    [self.centerButtonLabel setTitle:@"EXIT REPLAY"];
    //[self.rightButtonLabel setTitle:@"GOALS"];


    [self.leftButtonBigLabel setTitle:@"THE FULL\n MATCH"];
    [self.centerButtonBigLabel setTitle:@"MATCH\nHIGHLIGHTS"];
    [self.rightButtonBigLabel setTitle:@"ALL THE\nGOALS"];
//    self.leftButtonBigLabel.visible=false;
//    self.centerButtonBigLabel.visible=false;
//    self.rightButtonBigLabel.visible=false;
    
    
    self.leftButtonBigLabel.visible=true;
    self.centerButtonBigLabel.visible=true;
    self.rightButtonBigLabel.visible=true;
   

    self.recBackgroundTitleLabel.visible=true;
    
    
    GameData *gd = [GameData sharedGameDataManager];
    NSString *matchString = [NSString stringWithFormat:@"%@ %d - %d %@",[[gd getMatchTeam:TEAM1] teamName],
                             [gd team1score], [gd team2score],[[gd getMatchTeam:TEAM2] teamName] ];
    
    [self.recBackgroundTitleLabel setString:matchString];
    
}

//
-(void) updateMatchEggTimer:(int)matchSecs
{
    //GameData *gd = [GameData sharedGameDataManager];
    NSString *matchString = [NSString stringWithFormat:@"-----------------"];
   // [info4Label setString:matchString];

    if ([Util random1inX:2]) {
        [info4Label setString:matchString];
    } else {
        [info4Label setString:@"-------"];

    }
}

//
-(void) updateScore:(int)t1Score :(int)t2Score
{
    GameData *gd = [GameData sharedGameDataManager];
    NSString *matchString = [NSString stringWithFormat:@"%@ %d - %d %@",[[gd getMatchTeam:TEAM1] teamName],
                             t1Score, t2Score,[[gd getMatchTeam:TEAM2] teamName] ];
    
    [info1Label setString:matchString];
}


//
-(void) setFullTimeInfo
{
    //NSLog(@">> MEmory Available KB %f", [CCDirector getAvailableKiloBytes]);
    //NSLog(@">> MEmory Available MB %f", [CCDirector getAvailableMegaBytes]);
    
    //NSLog(@"** Set FullTime Info");
    
    NSString *title;
    
    if ([GameData isPracticeMatch]) {
        title=@"PRACTICE OVER";
    } else {
        title=@"FULL TIME";
    }
    
    [titleLabel setString:title];
    GameData *gd = [GameData sharedGameDataManager];
    NSString *matchString = [NSString stringWithFormat:@"%@ %d - %d %@",[[gd getMatchTeam:TEAM1] teamName],
                             [gd team1score], [gd team2score],[[gd getMatchTeam:TEAM2] teamName] ];
    
    [info1Label setString:matchString];
    //[continueLabel setString:@"RESTART / GO TO MAIN MENU"];
    
    titleLabel.visible=true;
    [self showInfoLabels:true];
    [self showSmallBackground];
    [self setAfterMatchLabels];
    [self showReplayLabels:false];
}


//
-(void) setupReplay
{
    [[GameModel sharedGameModel] setManagerMode:false];
    
    [[GameModel sharedGameModel] setGameState:matchStarted];
    [[SceneManager sharedSceneManager] gameInfoLayer].visible=false;
    [[SceneManager sharedSceneManager] hudLayer].visible=false;
    [[[SceneManager sharedSceneManager] hudLayer] turnHudControlsOff];
    
    [[HudModel sharedHudModel] showReplayControls: true];
    [[HudModel sharedHudModel] hideMatchInfoSprites];
    [[[SceneManager sharedSceneManager] gameLayer] attachPlayersAndBall];
    
    //
    [[GameModel sharedGameModel] setMatchState: replay];
    [[GameModel sharedGameModel] setReplayState: noReplay];
    [[GameModel sharedGameModel] showFirstReplayFrame];
    
    [[GameModel sharedGameModel] showScanner:false];
    
    //ADDED
    //[[GameModel sharedGameModel] setReplayState: replayPlay];
}


//
- (BOOL) isWithinArea:(CGPoint)touchPos :(CGPoint)spritePos :(float)width
{
    
    if (touchPos.x > spritePos.x - width &&
        touchPos.x < spritePos.x + width &&
        touchPos.y > spritePos.y - width &&
        touchPos.y < spritePos.y + width  )
        return true;
    else
        return false;
}

//
-(void) doLeftButton:(id)sender {
    
    [MenuLayer playMenuButtonSound];
 
    CCLOG(@">>>>DO LEFT BIG BUTTON");
    CCLOG(@">>>> Match State = %d",[[GameModel sharedGameModel] getMatchState]);
    
    if ([[GameModel sharedGameModel] getMatchState] == postGame) {
        CCLOG(@">>>>GO Main Menu");
        [[GameModel sharedGameModel] setGameState: mainMenu];
        [SceneManager goMenu];
    }
    else if ([[GameModel sharedGameModel] getMatchState] == postGameReplay)
    {
        CCLOG(@">> REPLAY FULL GAME");
        [self setupReplay];
        [[GameModel sharedGameModel] replayFullMatch];
    }
    else if ([[GameModel sharedGameModel] getGameState] == matchInfo)
    {
        
        NSLog(@"TOUCH BEGAN INFO LAYER - match info ");
        //[[[SceneManager sharedSceneManager] gameLayer] setMatchState:kickOff];
        
        
        if ([[GameModel sharedGameModel] matchMode] == matchModeManager ||
            [[GameModel sharedGameModel] matchType] == matchDemo )
        {
            
                CCLOG(@">>MANAGER MODE : Watch Match");
                [[SceneManager sharedSceneManager]gameInfoLayer].visible=false;
                [[GameModel sharedGameModel] setMatchState:kickOff];
                [[GameModel sharedGameModel] setMatchState:preKickOffRunout];
                [[GameModel sharedGameModel] setManagerMode:false];
                
                //todo check if not attached first
                [[[SceneManager sharedSceneManager] gameLayer] attachPlayersAndBall];
        }
    }
}

-(void) doSmallCenterButton:(id)sender {
    [MenuLayer playMenuButtonSound];

//    CCLOG(@">>* Game State : %d" , [[GameModel sharedGameModel] getGameState]);
//    CCLOG(@">>* Match state : %d" , [[GameModel sharedGameModel] getMatchState]);
//    CCLOG(@">>* Match mode : %d" , [[GameModel sharedGameModel] matchMode]);
    
    if ([[GameModel sharedGameModel] getMatchState] == halfTimeInfo) {
        [[GameModel sharedGameModel] changeStateHalfTimeToKickOff];
        
        [Util playSoundEffect:EXCITING_CROWD];

    }
    
    else if ([[GameModel sharedGameModel] getGameState] == matchInfo)
    {
        if ([[GameModel sharedGameModel] matchMode] == matchModeHuman )
        {
            CCLOG(@">>HUMAN MODE");
            //[[GameModel sharedGameModel] setMatchState:kickOff];
            [[GameModel sharedGameModel] setMatchState:preKickOffRunout];
            [[GameModel sharedGameModel] setManagerMode:false];
            
            //todo check if not attached first
            [[[SceneManager sharedSceneManager] gameLayer] attachPlayersAndBall];
            [[SceneManager sharedSceneManager]gameInfoLayer].visible=false;
            [self showFooterButtons:false];
            
            //
            [[[SceneManager sharedSceneManager] hudLayer] turnHudControlsOn];
        }
        else  if ([[GameModel sharedGameModel] matchType] == matchDemo )
        {
            
            CCLOG(@">>MANAGER MODE : Watch Match");
            [[SceneManager sharedSceneManager]gameInfoLayer].visible=false;
            [[GameModel sharedGameModel] setMatchState:kickOff];
            [[GameModel sharedGameModel] setMatchState:preKickOffRunout];
            [[GameModel sharedGameModel] setManagerMode:false];
            
            //todo check if not attached first
            [[[SceneManager sharedSceneManager] gameLayer] attachPlayersAndBall];
            
        }
        
    }
    else if ([[GameModel sharedGameModel] getMatchState] == postGame) {
        CCLOG(@">> REMATCH ** ");
        
        [[GameModel sharedGameModel] resetGame];//
        [[[SceneManager sharedSceneManager] hudLayer] turnHudControlsOff];        
    }
    else if ([[GameModel sharedGameModel] getMatchState] == postGameReplay) {
        
         CCLOG(@">>> Go to post game replay / fullTimeInfo*");
        [self setFullTimeInfo];
        
        [[GameModel sharedGameModel] setMatchState: postGame];
        [[[SceneManager sharedSceneManager] gameLayer] detachPlayersAndBall];
    }
}


-(void) doCenterButton:(id)sender {
    [MenuLayer playMenuButtonSound];

    CCLOG(@">>Center Button...do nothing yet");
    
    if ([[GameModel sharedGameModel] getMatchState] == postGameReplay)
    {
        CCLOG(@">> REPLAY HIGHLIGHTS ONLY");
        [self setupReplay];
        [[GameModel sharedGameModel] replayHighlights];
    }

}

-(void) doRightButton:(id)sender {
    [MenuLayer playMenuButtonSound];

    if ([[GameModel sharedGameModel] getGameState] == matchInfo)
    {

        if ([[GameModel sharedGameModel] matchMode] == matchModeManager ||
            [[GameModel sharedGameModel] matchType] == matchDemo )
        {
      
            CCLOG(@">>MANAGER MODE : Get result");
            
            // don't let player press it twice
            if ([[GameModel sharedGameModel] getMatchState] != startManagerMode) {
            
                [[[SceneManager sharedSceneManager] gameInfoLayer] setMatchInProgressInfo];
                [[SceneManager sharedSceneManager] gameInfoLayer].visible=true;
                [[[SceneManager sharedSceneManager] gameLayer] detachPlayersAndBall];
                [[SceneManager sharedSceneManager] hudLayer].visible=false;
                [[[SceneManager sharedSceneManager] hudLayer] turnHudControlsOff];
                [[GameModel sharedGameModel] setMatchState:startManagerMode];
                [self showFooterButtons:false];
            }
        }
    }
    else if ([[GameModel sharedGameModel] getMatchState] == postGame)
    {
            CCLOG(@">>Set Replay Labels");
            [[HudModel sharedHudModel] showReplayControls: true];
            [[GameModel sharedGameModel] setMatchState: postGameReplay];
            [self showBackgroundTitle];
            [self setReplayLabels];
        
    } else if ([[GameModel sharedGameModel] getMatchState] == postGameReplay)
    {
        CCLOG(@">> REPLAY GOALS ONLY");
        
        [self setupReplay];
        [[GameModel sharedGameModel] replayGoals];
    }
}


@end

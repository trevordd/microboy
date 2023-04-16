//
//  GameLayerData.m
//  mySoccer
//
//  Created by Trevor Delves on 18/12/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameModel.h"
#import "SceneManager.h"
#import "LineNode.h"

@implementation GameModel

@synthesize topCrowd;
@synthesize bottomCrowd;
@synthesize pitch;
@synthesize stadium;
@synthesize stadiumLevels;
@synthesize goalTop;
@synthesize goalBottom;
@synthesize goalTopMask;
@synthesize goalBottomMask;
@synthesize topAdvert1b;
@synthesize topAdvert1;
@synthesize topAdvert2;
@synthesize topAdvert2b;
@synthesize activePlayerSprite;
@synthesize activeTargetSprite;
@synthesize playerArrowSprite;
@synthesize kickOffSpr;
@synthesize testBall;
@synthesize testRightGoal;
@synthesize testLeftGoal;
@synthesize testActivePlayer1;
@synthesize testActivePlayer2;
@synthesize testKeeperTeam1;
@synthesize testKeeperTeam2;
@synthesize fovSprites;
@synthesize matchData;
@synthesize numTicks;
@synthesize tickTaskTime;

//@synthesize replayState;
@synthesize replaySpeed;
@synthesize kickOffTeamId;
@synthesize matchMode;
@synthesize matchType;
@synthesize noControlsAfterPassCounter;
@synthesize controlsPassJustMade;
@synthesize swipeTimer;
@synthesize microboybanner;
@synthesize stairs;
@synthesize topHoarding;
@synthesize bottomHoarding;
@synthesize topHoardingBlank;
@synthesize bottomHoardingBlank;
@synthesize micropitchlogo1;
@synthesize micropitchlogo2;
@synthesize microboysolopitchlogo1;
@synthesize microboysolopitchlogo2;
@synthesize microboypitchlogo1;
@synthesize microboypitchlogo2;
@synthesize leftAdvert;
@synthesize rightAdvert;
@synthesize leftAdvertBlank;
@synthesize rightAdvertBlank;
@synthesize leftAdvertLogo;
@synthesize rightAdvertTwitter;
@synthesize leftAdvertTwitter;
@synthesize rightAdvertEmail;
@synthesize leftAdvertEmail;
@synthesize rightAdvertLogo;
@synthesize leftAdvertMicroLogo;
@synthesize rightAdvertMicroLogo;
@synthesize pitchFrames;
@synthesize pitchPatterns;
@synthesize scannerObjects;
@synthesize leftHoardingBorderTop;
@synthesize leftHoardingBorderBottom;
@synthesize rightHoardingBorderTop;
@synthesize rightHoardingBorderBottom;
@synthesize topHoardingBorder;
@synthesize bottomHoardingBorder;
@synthesize topAdvertLogo;
@synthesize bottomAdvertLogo;
@synthesize topAdvertMicroLogo;
@synthesize bottomAdvertMicroLogo;
@synthesize pitchPattern;
@synthesize teamBadge;


//@synthesize tutorialBackground1;
//@synthesize tutorialBackground2;


static GameModel *gameModel = nil;


+ (GameModel*)sharedGameModel
{
    if (gameModel == nil) {
        gameModel = [[super alloc] init];
    }
    return gameModel;
}


-(id) init
{
    if( (self=[super init] ))
    {
        //        team1 = [[Team alloc] initNoSprite :1];
        //        team2 = [[Team alloc] initNoSprite :2];
        //        ball = [[Ball alloc] initNoSprite];
        //        [ball setPositionX:PITCH_X_CENTER Y:PITCH_Y_CENTER];
        [super onEnter];
    }
	return self;
    
    
}

//
//-(id) initSimple
//{
//    if( (self=[super init] ))
//    {
//        team1 = [[Team alloc] initNoSprite :1];
//        team2 = [[Team alloc] initNoSprite :2];
//        ball = [[Ball alloc] initNoSprite];
//        [ball setPositionX:PITCH_X_CENTER Y:PITCH_Y_CENTER];
//    }
//	return self;
//}

// on "init" you need to initialize your instance
-(void) createGameObjects
{
    
    //hudLayer = hud;
    //hudLayer = [[SceneManager sharedSceneManager] hudLayer];
    //        UPDATE_INTERVAL = 1.0f/60.0f;
    //        MAX_CYCLES_PER_FRAME = 5;
    timeAccumulator = 0;
    frameRate=0;
    
    CGSize viewSize = [[CCDirector sharedDirector] viewSize];

    NSLog(@">>>> View Width : %f" ,viewSize.width);
    // TODO create pitch class for pitch /goals
    //self.pitch = [CCSprite spriteWithImageNamed: @"Football_Pitch10.png"];
    self.stadium = [CCSprite spriteWithImageNamed: @"stadium.png"];
    //self.stadium = [CCSprite spriteWithImageNamed: @"sansiroNew.png"];
    
    self.stadium.position = ccp( PITCH_X_CENTER-3, PITCH_Y_CENTER-5); //ITCH_Y_CENTER + 5
    self.stadium.scale=0.9;
    self.stadium.scaleY=1.0; // 0.975;
    self.stadium.scaleX=0.99;
    
    self.stadiumLevels = [CCSprite spriteWithImageNamed: @"stadiumLevelsLayer.png"];
    self.stadiumLevels.position = ccp( PITCH_X_CENTER+5, PITCH_Y_CENTER-5); //ITCH_Y_CENTER + 5
    self.stadiumLevels.opacity=0.95f;
    self.stadiumLevels.scaleX=1.2;
    self.stadiumLevels.scaleY=1.28;

    self.teamBadge = [CCSprite spriteWithImageNamed: @"interbadge.png"];
    self.teamBadge.position = ccp( PITCH_X_CENTER, PITCH_Y_CENTER); //ITCH_Y_CENTER + 5
    self.teamBadge.opacity=0.75f; //0.15f;
    self.teamBadge.scale=0.1f;
    
    
    self.pitch = [CCSprite spriteWithImageNamed: @"PITCH-hd.png"];
   // self.pitch.scaleY=0.70;
    //self.pitch.scaleX=1.1;
    
    self.pitch.position = CGPointMake( PITCH_X_CENTER, PITCH_Y_CENTER); //ITCH_Y_CENTER + 5
    //CGPoint pitchCenter = CGPointMake(PITCH_X_CENTER,PITCH_Y_CENTER);
    
    //
    self.pitchFrames = [[NSMutableArray alloc] init];
    
//    CCSpriteFrame *darkPitchFrame = [CCSpriteFrame frameWithImageNamed:@"PITCH-dark-hd.png"];
//    CCSpriteFrame *lightPitchFrame = [CCSpriteFrame frameWithImageNamed:@"PITCH-light-hd.png"];
//    CCSpriteFrame *normalPitchFrame = [CCSpriteFrame frameWithImageNamed:@"PITCH-hd.png"];
//    CCSpriteFrame *extraDarkPitchFrame = [CCSpriteFrame frameWithImageNamed:@"PITCH-extra-dark-hd.png"];
    
    CCSpriteFrame *darkPitchFrame = [CCSpriteFrame frameWithImageNamed:@"pitchFullSize.png"];
    CCSpriteFrame *lightPitchFrame = [CCSpriteFrame frameWithImageNamed:@"pitchFullSize.png"];
    CCSpriteFrame *normalPitchFrame = [CCSpriteFrame frameWithImageNamed:@"pitchFullSize.png"];
    CCSpriteFrame *extraDarkPitchFrame = [CCSpriteFrame frameWithImageNamed:@"pitchFullSize.png"];
    
    [self.pitchFrames addObject:normalPitchFrame];
    [self.pitchFrames addObject:lightPitchFrame];
    [self.pitchFrames addObject:darkPitchFrame];
    [self.pitchFrames addObject:extraDarkPitchFrame];
    
    //
    self.scannerObjects = [[NSMutableArray alloc] init];
    
    CCSpriteFrame *scannerObject0 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject1 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject2 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject3 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject4 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject5 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject6 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject7 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject8 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject9 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject10 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];

    
    CCSpriteFrame *scannerObject11 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject12 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject13 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject14 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject15 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject16 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject17 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject18 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject19 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject20 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    CCSpriteFrame *scannerObject21 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    
    
    // active and target player sprite
    CCSpriteFrame *scannerObject22 = [CCSprite spriteWithImageNamed: @"player_hollow.png"];
    CCSpriteFrame *scannerObject23 = [CCSprite spriteWithImageNamed: @"player_hollow.png"];
    
    // border
    CCSpriteFrame *scannerObject24 = [CCSprite spriteWithImageNamed: @"scanneredge.png"];
    
    // border
    CCSpriteFrame *scannerObject25 = [CCSprite spriteWithImageNamed: @"activePlayer2.png"];
    

    // team 1
    [self.scannerObjects addObject:scannerObject0];
    [self.scannerObjects addObject:scannerObject1];
    [self.scannerObjects addObject:scannerObject2];
    [self.scannerObjects addObject:scannerObject3];
    [self.scannerObjects addObject:scannerObject4];
    [self.scannerObjects addObject:scannerObject5];
    [self.scannerObjects addObject:scannerObject6];
    [self.scannerObjects addObject:scannerObject7];
    [self.scannerObjects addObject:scannerObject8];
    [self.scannerObjects addObject:scannerObject9];
    [self.scannerObjects addObject:scannerObject10];
    
    // team 2
    [self.scannerObjects addObject:scannerObject11];
    [self.scannerObjects addObject:scannerObject12];
    [self.scannerObjects addObject:scannerObject13];
    [self.scannerObjects addObject:scannerObject14];
    [self.scannerObjects addObject:scannerObject15];
    [self.scannerObjects addObject:scannerObject16];
    [self.scannerObjects addObject:scannerObject17];
    [self.scannerObjects addObject:scannerObject18];
    [self.scannerObjects addObject:scannerObject19];
    [self.scannerObjects addObject:scannerObject20];
    [self.scannerObjects addObject:scannerObject21];
    
    
    // active and target players
    [self.scannerObjects addObject:scannerObject22];
    [self.scannerObjects addObject:scannerObject23];
    
    // border
    [self.scannerObjects addObject:scannerObject24];
    
    // ball
    [self.scannerObjects addObject:scannerObject25];
    
    
    //
    self.pitchPatterns = [[NSMutableArray alloc] init];
    
    CCSpriteFrame *pitchPattern1 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern1.png"];
    CCSpriteFrame *pitchPattern2 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern2.png"];
    CCSpriteFrame *pitchPattern3 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern3.png"];
    CCSpriteFrame *pitchPattern4 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern4.png"];
    CCSpriteFrame *pitchPattern5 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern5.png"];
    CCSpriteFrame *pitchPattern6 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern6.png"];
    CCSpriteFrame *pitchPattern7 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern7.png"];
    CCSpriteFrame *pitchPattern8 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern8.png"];
    CCSpriteFrame *pitchPattern9 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern9.png"];
    CCSpriteFrame *pitchPattern10 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern10.png"];
    CCSpriteFrame *pitchPattern11 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern11.png"];
    CCSpriteFrame *pitchPattern12 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern12.png"];
    CCSpriteFrame *pitchPattern13 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern13.png"];
    CCSpriteFrame *pitchPattern14 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern14.png"];
    CCSpriteFrame *pitchPattern15 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern15.png"];
    CCSpriteFrame *pitchPattern16 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern16.png"];
    CCSpriteFrame *pitchPattern17 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern17.png"];
    CCSpriteFrame *pitchPattern18 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern18.png"];
    CCSpriteFrame *pitchPattern19 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern19.png"];
    CCSpriteFrame *pitchPattern20 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern20.png"];
    CCSpriteFrame *pitchPattern21 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern21.png"];
    CCSpriteFrame *pitchPattern22 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern22.png"];
    CCSpriteFrame *pitchPattern23 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern23.png"];
    CCSpriteFrame *pitchPattern24 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern24.png"];
    CCSpriteFrame *pitchPattern25 = [CCSpriteFrame frameWithImageNamed:@"pitchPattern25.png"];
    
    
    [self.pitchPatterns addObject:pitchPattern1];
    [self.pitchPatterns addObject:pitchPattern2];
    [self.pitchPatterns addObject:pitchPattern3];
    [self.pitchPatterns addObject:pitchPattern4];
    [self.pitchPatterns addObject:pitchPattern5];
    [self.pitchPatterns addObject:pitchPattern6];
    [self.pitchPatterns addObject:pitchPattern7];
    [self.pitchPatterns addObject:pitchPattern8];
    [self.pitchPatterns addObject:pitchPattern9];
    [self.pitchPatterns addObject:pitchPattern10];
    [self.pitchPatterns addObject:pitchPattern11];
    [self.pitchPatterns addObject:pitchPattern12];
    [self.pitchPatterns addObject:pitchPattern13];
    [self.pitchPatterns addObject:pitchPattern14];
    [self.pitchPatterns addObject:pitchPattern15];
    [self.pitchPatterns addObject:pitchPattern16];
    [self.pitchPatterns addObject:pitchPattern17];
    [self.pitchPatterns addObject:pitchPattern18];
    [self.pitchPatterns addObject:pitchPattern19];
    [self.pitchPatterns addObject:pitchPattern20];
    [self.pitchPatterns addObject:pitchPattern21];
    [self.pitchPatterns addObject:pitchPattern22];
    [self.pitchPatterns addObject:pitchPattern23];
    [self.pitchPatterns addObject:pitchPattern24];
    [self.pitchPatterns addObject:pitchPattern25];
    
    
    self.pitchPattern = [CCSprite spriteWithImageNamed: @"pitchPattern10.png"];
    self.pitchPattern.position = ccp( PITCH_X_CENTER, PITCH_Y_CENTER); //ITCH_Y_CENTER + 5
    self.pitchPattern.opacity=0.10;
    self.pitchPattern.scale=1.6;
    
    int sideAdvertOffset = 45;
    //
    self.topAdvert1 = [CCSprite spriteWithImageNamed: @"crowd_side.png"];
    self.topAdvert1.position = ccp( PITCH_LEFT-61-sideAdvertOffset, PITCH_Y_CENTER ); //PITCH_TOP+50
    self.topAdvert1.visible=true;
    self.topAdvert1.scaleX=1.1;
    self.topAdvert1.scaleY=1.3;
    self.topAdvert1.opacity=0.9;
    
    //self.topAdvert1.scaleY=0.8;
    
    //
    self.topAdvert1b = [CCSprite spriteWithImageNamed: @"crowd_side.png"];
    self.topAdvert1b.position = ccp( PITCH_RIGHT+68+sideAdvertOffset, PITCH_Y_CENTER ); //PITCH_TOP+50
    self.topAdvert1b.visible=true;
    self.topAdvert1b.rotation=180;
    self.topAdvert1b.scaleX=1.1;
    self.topAdvert1b.scaleY=1.3;
    //self.topAdvert1b.opacity=0.9;
    
    
    //self.topAdvert1.scaleY=0.8;
    
    //
    self.topAdvert2 = [CCSprite spriteWithImageNamed: @"crowd_base2.png"];
    self.topAdvert2.position = ccp( PITCH_X_CENTER, PITCH_BOTTOM-64 ); //+175
    self.topAdvert2.visible=true;
   // self.topAdvert2.color=[CCColor magentaColor];
    
    //self.topAdvert2.rotation=180;
    self.topAdvert2.scaleX=1.2;
    //self.topAdvert2.scaleY=bannerYScale;
    //self.topAdvert2.opacity=0.9;
    
    
    //
    self.topAdvert2b = [CCSprite spriteWithImageNamed: @"crowd_base2.png"];
    self.topAdvert2b.position = ccp( PITCH_X_CENTER, PITCH_TOP+64 ); //+175
    self.topAdvert2b.visible=true;
    self.topAdvert2b.rotation=180;
 //   self.topAdvert2b.color=[CCColor orangeColor];
    
    self.topAdvert2b.scaleX=1.2;
//    self.topAdvert2b.scaleY=bannerYScale;
    //self.topAdvert2b.opacity=0.9;
    
    //
//    self.topAdvert1.color =  greyColour;
//    self.topAdvert2.color = greyColour;
//    self.topAdvert1b.color =  greyColour;
//    self.topAdvert2b.color = greyColour;
    
    //
    self.topHoarding = [CCSprite spriteWithImageNamed: @"hoardings_base.png"];
    self.topHoarding.position = ccp( PITCH_X_CENTER-6, PITCH_TOP+17 ); //+175
    self.topHoarding.visible=true;
    self.topHoarding.rotation=180;
    self.topHoarding.color=[CCColor orangeColor];
    
    self.bottomHoarding = [CCSprite spriteWithImageNamed: @"hoardings_base.png"];
    self.bottomHoarding.position = ccp( PITCH_X_CENTER+6, PITCH_BOTTOM-17 ); //+175
    self.bottomHoarding.visible=true;
    // self.bottomHoarding.rotation=180;
    self.bottomHoarding.color=[CCColor orangeColor];
    
    //
    self.topHoardingBlank = [CCSprite spriteWithImageNamed: @"hoardings_baseBlankTop.png"];
    self.topHoardingBlank.position = ccp( PITCH_X_CENTER+6, PITCH_TOP+17 ); //+175
    self.topHoardingBlank.visible=SHOW_HOARDINGS;
    //self.topHoardingBlank.rotation=180;
    self.topHoardingBlank.color=[Team getColour:BRAZIL_YELLOW];
    
    self.bottomHoardingBlank = [CCSprite spriteWithImageNamed: @"hoardings_baseBlank.png"];
    self.bottomHoardingBlank.position = ccp( PITCH_X_CENTER+6, PITCH_BOTTOM-17 ); //+175
    self.bottomHoardingBlank.visible=SHOW_HOARDINGS;
    // self.bottomHoarding.rotation=180;
    self.bottomHoardingBlank.color=[Team getColour:BRAZIL_YELLOW];

    
    //
    self.leftAdvert = [CCSprite spriteWithImageNamed: @"hoarding_side.png"];
    self.leftAdvert.position = ccp( PITCH_LEFT-23, PITCH_Y_CENTER); //-26
    self.leftAdvert.visible=SHOW_HOARDINGS;
    self.leftAdvert.scaleX=0.90;
    self.leftAdvert.opacity=0.9;
    //self.leftAdvert.color=[CCColor yellowColor];
    
    self.rightAdvert = [CCSprite spriteWithImageNamed: @"hoarding_side.png"]; //whufcbanner1a.png"
    self.rightAdvert.position = ccp( PITCH_RIGHT+23, PITCH_Y_CENTER); //+25
    self.rightAdvert.visible=SHOW_HOARDINGS;;
    self.rightAdvert.rotation=180;
    self.rightAdvert.scaleX=0.90;
    self.rightAdvert.opacity=0.9;
    //self.rightAdvert.color=[CCColor yellowColor];
    
    //
    self.leftAdvertBlank = [CCSprite spriteWithImageNamed: @"hoarding_sideBlank.png"];
    self.leftAdvertBlank.position = ccp( PITCH_LEFT-23, PITCH_Y_CENTER); //-26
    self.leftAdvertBlank.visible=SHOW_HOARDINGS;
    self.leftAdvertBlank.scaleX=0.90;
    self.leftAdvertBlank.opacity=0.99;
    //self.leftAdvertBlank.color= [CCColor redColor]; //[Team getColour:BRAZIL_YELLOW];
    
    
    self.rightAdvertBlank = [CCSprite spriteWithImageNamed: @"hoarding_sideBlank.png"]; //whufcbanner1a.png"
    self.rightAdvertBlank.position = ccp( PITCH_RIGHT+23, PITCH_Y_CENTER); //+25
    self.rightAdvertBlank.visible=SHOW_HOARDINGS;;
    self.rightAdvertBlank.rotation=180;
    self.rightAdvertBlank.scaleX=0.90;
    self.rightAdvertBlank.opacity=0.99;
   // self.rightAdvertBlank.color= [CCColor yellowColor];//[Team getColour:BRAZIL_YELLOW];
    
    // microboy logo and image
    self.leftAdvertLogo = [CCSprite spriteWithImageNamed: @"hoarding_logosBlank.png"];
    self.leftAdvertLogo.position = ccp( PITCH_LEFT-19, PITCH_Y_CENTER); //-26
    self.leftAdvertLogo.visible=SHOW_HOARDINGS;
    self.leftAdvertLogo.scale=0.70;
    self.leftAdvertLogo.opacity=1.0;
    //self.leftAdvertLogo.color=[CCColor yellowColor];
    
    self.rightAdvertLogo = [CCSprite spriteWithImageNamed: @"hoarding_logosBlank.png"]; //whufcbanner1a.png"
    self.rightAdvertLogo.position = ccp( PITCH_RIGHT+16, PITCH_Y_CENTER); //+25
    self.rightAdvertLogo.visible=SHOW_HOARDINGS;
    self.rightAdvertLogo.rotation=180;
    self.rightAdvertLogo.scale=0.70;
    self.rightAdvertLogo.opacity=1.0;
   // self.rightAdvertLogo.color=[Team getColour:BRAZIL_YELLOW];
    
    //
    self.bottomAdvertLogo = [CCSprite spriteWithImageNamed: @"hoarding_base_logo_blank.png"];
    self.bottomAdvertLogo.position = ccp( PITCH_X_CENTER-6, PITCH_TOP+13 ); //+175
    self.bottomAdvertLogo.visible=SHOW_HOARDINGS;
    self.bottomAdvertLogo.rotation=180;
    //sself.bottomAdvertLogo.color=[CCColor orangeColor];
    
    self.topAdvertLogo = [CCSprite spriteWithImageNamed: @"hoarding_base_logo_blank.png"];
    self.topAdvertLogo.position = ccp( PITCH_X_CENTER+3, PITCH_BOTTOM-15 ); //+175
    self.topAdvertLogo.visible=SHOW_HOARDINGS;
 

    // only the micro boy image
    self.leftAdvertMicroLogo = [CCSprite spriteWithImageNamed: @"hoarding_micro_only.png"];
    self.leftAdvertMicroLogo.position = ccp( PITCH_LEFT-17, PITCH_Y_CENTER); //-26
    self.leftAdvertMicroLogo.visible=SHOW_HOARDINGS;
    self.leftAdvertMicroLogo.scale=0.80;
    self.leftAdvertMicroLogo.opacity=1.0;
    //self.leftAdvertLogo.color=[CCColor yellowColor];
    
    self.rightAdvertMicroLogo = [CCSprite spriteWithImageNamed: @"hoarding_micro_only.png"]; //whufcbanner1a.png"
    self.rightAdvertMicroLogo.position = ccp( PITCH_RIGHT+13, PITCH_Y_CENTER); //+25
    self.rightAdvertMicroLogo.visible=SHOW_HOARDINGS;;
    self.rightAdvertMicroLogo.rotation=180;
    self.rightAdvertMicroLogo.scale=0.80;
    //self.rightAdvertMicroLogo.scaleY=0.90;
    self.rightAdvertMicroLogo.opacity=1.0;
   // self.rightAdvertMicroLogo.color=[Team getColour:BRAZIL_YELLOW];

    self.bottomAdvertMicroLogo = [CCSprite spriteWithImageNamed: @"hoarding_base_micro_blank.png"];
    self.bottomAdvertMicroLogo.position = ccp( PITCH_X_CENTER+30, PITCH_TOP+13 ); //+175
    self.bottomAdvertMicroLogo.visible=SHOW_HOARDINGS;
    self.bottomAdvertMicroLogo.rotation=180;
    //sself.bottomAdvertLogo.color=[CCColor orangeColor];
    
    self.topAdvertMicroLogo = [CCSprite spriteWithImageNamed: @"hoarding_base_micro_blank.png"];
    self.topAdvertMicroLogo.position = ccp( PITCH_X_CENTER-30, PITCH_BOTTOM-15 ); //+175
    self.topAdvertMicroLogo.visible=SHOW_HOARDINGS;

    // only the twitter image
    self.leftAdvertTwitter = [CCSprite spriteWithImageNamed: @"twitter.png"];
    self.leftAdvertTwitter.position = ccp( PITCH_LEFT-17, PITCH_Y_CENTER); //-26
    self.leftAdvertTwitter.visible=SHOW_HOARDINGS;
    self.leftAdvertTwitter.scale=0.60;
    self.leftAdvertTwitter.opacity=1.0;
    
    self.rightAdvertTwitter = [CCSprite spriteWithImageNamed: @"twitter.png"]; //whufcbanner1a.png"
    self.rightAdvertTwitter.position = ccp( PITCH_RIGHT+15, PITCH_Y_CENTER); //+25
    self.rightAdvertTwitter.visible=SHOW_HOARDINGS;;
    self.rightAdvertTwitter.rotation=180;
    self.rightAdvertTwitter.scale=0.60;
    self.rightAdvertTwitter.opacity=1.0;
 
    // only the email image
    self.leftAdvertEmail = [CCSprite spriteWithImageNamed: @"email.png"];
    self.leftAdvertEmail.position = ccp( PITCH_LEFT-17, PITCH_Y_CENTER); //-26
    self.leftAdvertEmail.visible=SHOW_HOARDINGS;
    self.leftAdvertEmail.scale=0.60;
    self.leftAdvertEmail.opacity=1.0;
    
    self.rightAdvertEmail = [CCSprite spriteWithImageNamed: @"email.png"]; //whufcbanner1a.png"
    self.rightAdvertEmail.position = ccp( PITCH_RIGHT+15, PITCH_Y_CENTER); //+25
    self.rightAdvertEmail.visible=SHOW_HOARDINGS;;
    self.rightAdvertEmail.rotation=180;
    self.rightAdvertEmail.scale=0.60;
    self.rightAdvertEmail.opacity=1.0;

    
    // hoardings borders
    self.leftHoardingBorderTop = [CCSprite spriteWithImageNamed: @"hoarding-top-boarder.png"];
    self.leftHoardingBorderTop.position = ccp( PITCH_LEFT-31, PITCH_Y_CENTER); //-26
    self.leftHoardingBorderTop.visible=SHOW_HOARDINGS;
    self.leftHoardingBorderTop.scaleX=0.99;
    self.leftHoardingBorderTop.opacity=0.99;
   
    self.leftHoardingBorderBottom = [CCSprite spriteWithImageNamed: @"hoarding-top-boarder.png"];
    self.leftHoardingBorderBottom.position = ccp( PITCH_LEFT-5, PITCH_Y_CENTER+2); //-26
    self.leftHoardingBorderBottom.visible=SHOW_HOARDINGS;
    self.leftHoardingBorderBottom.scaleX=0.99;
    self.leftHoardingBorderBottom.scaleY=1.01;
    self.leftHoardingBorderBottom.opacity=0.99;
    

    self.rightHoardingBorderTop = [CCSprite spriteWithImageNamed: @"hoarding-top-boarder.png"];
    self.rightHoardingBorderTop.position = ccp( PITCH_RIGHT+2, PITCH_Y_CENTER); //-26
    self.rightHoardingBorderTop.visible=SHOW_HOARDINGS;
    self.rightHoardingBorderTop.scaleX=0.99;
    self.rightHoardingBorderTop.opacity=0.99;
    
    self.rightHoardingBorderBottom = [CCSprite spriteWithImageNamed: @"hoarding-top-boarder.png"];
    self.rightHoardingBorderBottom.position = ccp( PITCH_RIGHT+30, PITCH_Y_CENTER+2); //-26 //24
    self.rightHoardingBorderBottom.visible=SHOW_HOARDINGS;
    self.rightHoardingBorderBottom.scaleX=0.99;
    self.rightHoardingBorderBottom.scaleY=1.01;
    
    self.rightHoardingBorderBottom.opacity=0.99;

    self.topHoardingBorder = [CCSprite spriteWithImageNamed: @"hoarding-border.png"];
    self.topHoardingBorder.position = ccp( PITCH_X_CENTER-5, PITCH_TOP+5); //-26
    self.topHoardingBorder.visible=SHOW_HOARDINGS;
    self.topHoardingBorder.scaleX=0.988;
    self.topHoardingBorder.opacity=0.95;

    self.bottomHoardingBorder = [CCSprite spriteWithImageNamed: @"hoarding-border.png"];
    self.bottomHoardingBorder.position = ccp( PITCH_X_CENTER-4, PITCH_BOTTOM-5); //-26
    self.bottomHoardingBorder.visible=SHOW_HOARDINGS;
    self.bottomHoardingBorder.scaleX=0.99;
    self.bottomHoardingBorder.opacity=0.99;

    
    
     //self.topAdvert2.scale=1.9;
    self.microboybanner = [CCSprite spriteWithImageNamed: @"logo_light.png"];
    self.microboybanner.position = ccp( PITCH_X_CENTER, PITCH_Y_CENTER ); //PITCH_TOP+12
    self.microboybanner.scaleY=1.2;
    //  self.bottomCrowd.scaleX=1.2;
    //  self.bottomCrowd.scaleY=1.3;
    self.microboybanner.opacity=0.10;
    self.microboybanner.visible=true;
    
    // pitch markings
    self.micropitchlogo1 = [CCSprite spriteWithImageNamed: @"logo.png"];
    self.micropitchlogo1.position = ccp( PITCH_X_CENTER-145, PITCH_Y_CENTER-110 ); //PITCH_TOP+12
    self.micropitchlogo1.scale=0.25;  //1.2
    self.micropitchlogo1.rotation=-90;
    self.micropitchlogo1.opacity=0.10;
    self.micropitchlogo1.visible=true;
    
    self.micropitchlogo2 = [CCSprite spriteWithImageNamed: @"logo.png"];
    self.micropitchlogo2.position = ccp( PITCH_X_CENTER+145, PITCH_Y_CENTER+110 ); //PITCH_TOP+12
    self.micropitchlogo2.scale=0.25;  //1.2
    self.micropitchlogo2.rotation=90;
    self.micropitchlogo2.opacity=0.10;
    self.micropitchlogo2.visible=true;
    
    // pitch markings
    self.microboypitchlogo1 = [CCSprite spriteWithImageNamed: @"logo_light.png"];
    self.microboypitchlogo1.position = ccp( PITCH_X_CENTER-145, PITCH_Y_CENTER-110 ); //PITCH_TOP+12
    self.microboypitchlogo1.scale=0.55;  //1.2
    self.microboypitchlogo1.rotation=-90;
    self.microboypitchlogo1.opacity=0.10;
    self.microboypitchlogo1.visible=true;
    
    self.microboypitchlogo2 = [CCSprite spriteWithImageNamed: @"logo_light.png"];
    self.microboypitchlogo2.position = ccp( PITCH_X_CENTER+145, PITCH_Y_CENTER+110 ); //PITCH_TOP+12
    self.microboypitchlogo2.scale=0.55;  //1.2
    self.microboypitchlogo2.rotation=90;
    self.microboypitchlogo2.opacity=0.10;
    self.microboypitchlogo2.visible=true;
    
    // pitch markings
    self.microboysolopitchlogo1 = [CCSprite spriteWithImageNamed: @"microBoySolo.png"];
    self.microboysolopitchlogo1.position = ccp( PITCH_X_CENTER-145, PITCH_Y_CENTER-110 ); //PITCH_TOP+12
    self.microboysolopitchlogo1.scale=0.55;  //1.2
    self.microboysolopitchlogo1.rotation=-90;
    self.microboysolopitchlogo1.opacity=0.90;
    self.microboysolopitchlogo1.visible=true;
    
    self.microboysolopitchlogo2 = [CCSprite spriteWithImageNamed: @"microBoySolo.png"];
    self.microboysolopitchlogo2.position = ccp( PITCH_X_CENTER+145, PITCH_Y_CENTER+110 ); //PITCH_TOP+12
    self.microboysolopitchlogo2.scale=0.55;  //1.2
    self.microboysolopitchlogo2.rotation=90;
    self.microboysolopitchlogo2.opacity=0.90;
    self.microboysolopitchlogo2.visible=true;

    
    
    
    //
    self.bottomCrowd = [CCSprite spriteWithImageNamed: @"hoarding_side.png"];
    self.bottomCrowd.position = ccp( PITCH_LEFT-13, PITCH_Y_CENTER); //-26
    self.bottomCrowd.scale=0.3;
    self.bottomCrowd.rotation=270;
    self.bottomCrowd.skewX=50;
    self.bottomCrowd.visible=false;
    //self.microboybanner.skewY=10;
    
    //
    self.stairs = [CCSprite spriteWithImageNamed: @"pitchstairs.png"];
    self.stairs.position = ccp( PITCH_RIGHT+33, PITCH_Y_CENTER ); //PITCH_TOP+12
    self.stairs.scaleY=1.2;
    //  self.bottomCrowd.scaleX=1.2;
    self.stairs.scaleY=1.3;
    self.stairs.opacity=0.99;
    self.stairs.visible=true;

    
    int goalDepth = 39;
    
    CCLOG(@">> Pitch created");
    
    //self.goalTop = [CCSprite spriteWithImageNamed: @"goalTop-hd.png"];
    self.goalTop = [CCSprite spriteWithImageNamed: @"GOAL_up-hd.png"];
    self.goalTop.position = ccp( PITCH_X_CENTER, PITCH_TOP + goalDepth ); //PITCH_TOP+12
    self.goalTop.scale=0.90;
    self.goalTop.visible=true;
    
    self.goalTopMask = [CCSprite spriteWithImageNamed: @"GOAL_up-mask-hd.png"];
    self.goalTopMask.position = ccp( PITCH_X_CENTER, PITCH_TOP + goalDepth ); //PITCH_TOP+12
    self.goalTopMask.scale=0.90;
    self.goalTopMask.visible=true;

    
    //self.goalBottom = [CCSprite spriteWithImageNamed: @"goalBottom-hd.png"];
    self.goalBottom = [CCSprite spriteWithImageNamed: @"GOAL_down-hd.png"];
    self.goalBottom.position = ccp( PITCH_X_CENTER, PITCH_BOTTOM - goalDepth ); //PITCH_TOP-12
    self.goalBottom.scale=0.90;
    self.goalBottom.visible=true;
    
    self.goalBottomMask = [CCSprite spriteWithImageNamed: @"GOAL_down-mask-hd.png"];
    self.goalBottomMask.position = ccp( PITCH_X_CENTER, PITCH_BOTTOM - goalDepth ); //PITCH_TOP-12
    self.goalBottomMask.scale=0.90;
    self.goalBottomMask.visible=true;

    
    self.activePlayerSprite= [CCSprite spriteWithImageNamed: @"player_hollow.png"];
    self.activePlayerSprite.position = ccp( 150, 70 );
    self.activePlayerSprite.opacity=ACTIVE_PLAYER_ORIGINAL_OPACITY;
    self.activePlayerSprite.scale=ACTIVE_PLAYER_ORIGINAL_SCALE;
    self.activePlayerSprite.color=[CCColor colorWithRed:(43.0/255.0) green:(243.0/255.0) blue:(244.0/255.0)];
  
    
    self.activeTargetSprite= [CCSprite spriteWithImageNamed: @"player_hollow.png"];
    self.activeTargetSprite.position = ccp( 250, 70 );
    self.activeTargetSprite.opacity=TARGET_PLAYER_ORIGINAL_OPACITY;
    self.activeTargetSprite.scale=TARGET_PLAYER_ORIGINAL_SCALE;
    self.activeTargetSprite.color=[CCColor colorWithRed:(251.0/255.0) green:(85.0/255.0) blue:(249.0/255.0)];
    
    
    self.playerArrowSprite= [CCSprite spriteWithImageNamed: @"playerarrow.png"];
    self.playerArrowSprite.position = ccp( 250, 70 );
    //self.playerArrowSprite.opacity=TARGET_PLAYER_ORIGINAL_OPACITY;
    self.playerArrowSprite.scale=0.3;
    //self.playerArrowSprite.color=[CCColor colorWithRed:(251.0/255.0) green:(85.0/255.0) blue:(249.0/255.0)];
    
    //
    
    
    
    //
    self.testBall = [CCSprite spriteWithImageNamed: @"ball1.png"];
    self.testBall.scale=2.0;
    self.testActivePlayer1 = [CCSprite spriteWithImageNamed: @"testRedPlayer-hd.png"];
    self.testActivePlayer1.scale=0.5;
    self.testActivePlayer2 = [CCSprite spriteWithImageNamed: @"testBluePlayer-hd.png"];
    self.testActivePlayer2.scale=0.5;
    self.testActivePlayer1.opacity=90;
    self.testKeeperTeam1 = [CCSprite spriteWithImageNamed: @"testBluePlayer-hd.png"];
    self.testKeeperTeam1.scale=0.5;
    self.testKeeperTeam2 = [CCSprite spriteWithImageNamed: @"testRedPlayer-hd.png"];
    self.testKeeperTeam2.scale=0.5;
    self.testKeeperTeam1.opacity=90;
    self.testRightGoal = [CCSprite spriteWithImageNamed: @"goalRight-hd.png"];
    self.testLeftGoal = [CCSprite spriteWithImageNamed: @"goalLeft-hd.png"];
    self.testLeftGoal.position = ccp( PITCH_RIGHT, PITCH_BOTTOM-4); //PITCH_RIGHT-22
    self.testLeftGoal.visible=true;
    self.testRightGoal.position = ccp( PITCH_RIGHT, PITCH_TOP+4); //-22
    self.testRightGoal.visible=true;
    
    #ifdef SHOW_TEST_PLAYERS_SIDE_ANGLE
        self.testBall.visible=true;
        self.testActivePlayer1.visible=true;
        self.testActivePlayer2 .visible=true;
        self.testKeeperTeam1.visible=true;
        self.testKeeperTeam2.visible=true;
        self.testLeftGoal.visible=true;
        self.testRightGoal.visible=true;
    #else
        self.testBall.visible=false;
        self.testActivePlayer1.visible=false;
        self.testActivePlayer2 .visible=false;
        self.testKeeperTeam1.visible=false;
        self.testKeeperTeam2.visible=false;
        self.testLeftGoal.visible=false;
        self.testRightGoal.visible=false;
    #endif
    
    //
    self.matchData = [[MatchData alloc] init];
    
//    fovSprites = [[NSMutableArray alloc] init];
//    for (int i=0; i<11; i++)
//    {
//        CCSprite *fovSprite = [CCSprite spriteWithImageNamed: @"activePlayer.png"];
//        
//        fovSprite.opacity=80;
//        [fovSprites addObject: fovSprite];
//    }
    
    // test
    weatherShadow = [CCSprite spriteWithImageNamed: @"ballShadow.png"];
    weatherShadow.opacity=50;
    weatherShadow.scale=60.75;
    weatherShadow.position = ccp(40,120);
    
    //        //
    //        [self addChild:pitch];
    //        [self addChild:goalTop z:80];
    //        [self addChild:goalBottom z:80];
    //        [self addChild:activePlayerSprite];
    //        [self addChild:activeTargetSprite];
    //        [self addChild:weatherShadow];
    
    
    /*-----------*/
    
   
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"playerSlides.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"bothteams2_default.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"bothteams2Keeper_default.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"ballsNew_default.plist"];
  //  [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"keeperSprites.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"players.plist"];
 //   [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"keeperNew.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"keepersV2.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"keepersBlkV2.plist"];
    
    
    
    //spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"bothteams2_default.png" capacity:50];
    //ballSpriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"ballsNew_default.png" capacity:50];
    
    // TODO pass in gameLayer or access singleton and add ball sprite in there
    ball = [[Ball alloc] initWithSpriteNoLayer:@"ball9.png"];
    [ball setPositionX:PITCH_X_CENTER Y:PITCH_Y_CENTER];
    
    
    //[self addChild : [ball sprite] z:1];
    //[self addChild:ballSpriteSheet];
    
    //
    team1 = [[Team alloc] initWithId: @"blueN1.png" myTeamId:TEAM1];
    team2 = [[Team alloc] initWithId: @"blueN1.png" myTeamId:TEAM2];
    
   // NSLog(@"%@", object);
    
    //[team1 setLineupPositions];
    //[team2 setLineupPositions];
    
    [team1 setupRunoutStartPositions];
    [team2 setupRunoutStartPositions];
    
    
    //[team1 setGameLayer: gameLayer];
    //[team2 setGameLayer: gameLayer];
    
    //        [team1 setTeamName:[[[GameData sharedGameDataManager] getMatchTeam:TEAM1] getShortTeamName]];
    //        [team2 setTeamName:[[[GameData sharedGameDataManager] getMatchTeam:TEAM2] getShortTeamName]];
    //
    //        [team1 setPlayerNames: [[[GameData sharedGameDataManager] getMatchTeam:TEAM1]getPlayerNames]];
    //        [team2 setPlayerNames: [[[GameData sharedGameDataManager] getMatchTeam:TEAM2]getPlayerNames]];
    
    [team1 setActivePlayerSprite:activePlayerSprite];
    [team1 setActiveTargetSprite:activeTargetSprite];
    [team1 setPlayerArrowSprite:playerArrowSprite];
    
    [team1 setOppTeam:team2];
    [team2 setOppTeam:team1];
    
    [[GameModel sharedGameModel] showScanner:false];
    
    // [Team setSpriteSheet:spriteSheet team1: [team1 getPlayers] team2: [team2 getPlayers]];
    
    
    //
    //        if ([GameData isHumanTeam])
    //        {
    //            [team1 setHumanPlayer:true];
    //            activePlayerSprite.visible=true;
    //            activeTargetSprite.visible=true;
    //            [[HudModel sharedHudModel] showControls];
    //        }
    //        else
    //        {
    //            activePlayerSprite.visible=false;
    //            activeTargetSprite.visible=false;
    //            [[HudModel sharedHudModel] hideControls];;
    //        }
    
    //
    cameraPos = ccp(PITCH_X_CENTER,PITCH_Y_CENTER);
    cameraVec = ccp(0,0);
    
    
    //        //
           // [self drawPitch];
    //
    //        // schedule a repeating callback on every frame
    //        [self schedule:@selector(tick:)];
    //        [self setMatchState: preKickOff];
    //        [self setViewpointCenter : ccp(PITCH_X_CENTER,PITCH_Y_CENTER)];
    //
    //		// register to receive targeted touch events
    //        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self
    //                                                         priority:0
    //                                                  swallowsTouches:YES];
    //	}
    //	return self;
    CCLOG(@">>> END of INIT >>>");
}

//
-(void) startGameTick
{
    //COMMENTED
    //[self schedule:@selector(tick:)];
}

-(CCSprite *)getPitch
{
    return pitch;
}

-(Ball *)getBall
{
    return ball;
}

-(Team *)getTeam1
{
    return team1;
}

-(Team *)getTeam2
{
    return team2;
}

// on "dealloc" you need to release all your retained objects


//
-(void) setScene:(CCScene *) newScene
{
    scene=newScene;
}

//
-(void) setGameInfoLayer:(GameInfoLayer *)giLayer
{
    gameInfoLayer=giLayer;
}

//
-(void) setGameLayer:(GameLayer *)gLayer
{
    gameLayer= gLayer;
    //    [gameLayer addChild:pitch];
    //    [gameLayer addChild:goalTop z:80];
    //    [gameLayer addChild:goalBottom z:80];
    //    [gameLayer addChild:activePlayerSprite];
    //    [gameLayer addChild:activeTargetSprite];
    //    [gameLayer addChild:weatherShadow];
    //    test
}


-(CCNode *) getGameLayer
{
    return gameLayer;
}

//
-(void) addSprites
{
    [gameLayer addChild:pitch];
    [gameLayer addChild:goalTop z:GOAL_Z_ORDER_LEVEL]; //80
    [gameLayer addChild:goalBottom z:GOAL_Z_ORDER_LEVEL]; //80
    [gameLayer addChild:goalTopMask z:425]; //80
    [gameLayer addChild:goalBottomMask z:425]; //80
    [gameLayer addChild:activePlayerSprite];
    [gameLayer addChild:activeTargetSprite];
    [gameLayer addChild:playerArrowSprite];
    [gameLayer addChild:weatherShadow];
}


//
-(void) setHudLayer:(HUDLayer *)hLayer
{
    hudLayer = hLayer;
}



//
-(void) initMatchTeamData
{
    // decide who kicks off
    if ([Util random5050])
    {
        [team1 setPlayingDirection:PLAYING_UP];
        [team2 setPlayingDirection:PLAYING_DOWN];
    }
    else
    {
        [team1 setPlayingDirection:PLAYING_DOWN];
        [team2 setPlayingDirection:PLAYING_UP];
    }
    
    
   //
    if ([Util random5050] || [GameData isPracticeMatch])
    {
        CCLOG(@">> TEAM 1 Kick Off");
        [self setKickOffTeamId:TEAM1];
        [team1 setKickingOff:true];
        [team2 setKickingOff:false];
    }
    else
    {
         CCLOG(@">> TEAM 2 Kick Off");
        [self setKickOffTeamId:TEAM2];
        [team1 setKickingOff:false];
        [team2 setKickingOff:true];
    }
    
    // Set Team Data
    // TODO - set player names, stats when we set the team Data?
    // OR seperate ethpd
    [team1 setTeamData:[[GameData sharedGameDataManager] getMatchTeam:TEAM1]];
    [team1 assignTeamAndPlayerData];
    
    [team2 setTeamData:[[GameData sharedGameDataManager] getMatchTeam:TEAM2]];
    [team2 assignTeamAndPlayerData];
    
    //
    [team1 setupRunoutStartPositions];
    [team2 setupRunoutStartPositions];
    
    // set team colors
    [team1 setTeamColour];
    [team2 setTeamColour];
    
    
    // set skin/hair colour
    [team1 setPlayerSkinHair];
    [team2 setPlayerSkinHair];
    
    //    [ball setPositionX:PITCH_X_CENTER Y:PITCH_Y_CENTER];
    //    [ball setVector:(ccp(0,0))];
}

-(void) showScanner:(bool)status {
        for (int i =0 ; i < 26 ; i++) {
            [[[self scannerObjects] objectAtIndex:i] setVisible:status];
            
            //[[[self scannerObjects] objectAtIndex:i] setOpacity:0.5];
        }
}


-(float) getRandomPitchPatternOpacity {
    int base=1;
    int range=15;
    int randomOpacity=base+[Util random:range];
    float opacity=randomOpacity/(float)100;;
    NSLog(@">>Random Pitch Pattern Opacity = %f",opacity);
    return opacity;
}

-(void) chooseRandomPitchPattern {
    
    // have blank pitches on occasion
    if ([Util random1inX:4]) {
        return;
    }
    CCSpriteFrame *patternFrame;
    int randPattern = [Util random:25];
    patternFrame = [self.pitchPatterns objectAtIndex:randPattern];
    self.pitchPattern.spriteFrame = patternFrame;
    self.pitchPattern.opacity=[self getRandomPitchPatternOpacity];
    self.pitchPattern.color=[CCColor darkGrayColor];
}

-(void) chooseRandomPitchTone {
    
    int randToneIdx = [Util random:5];
    
    switch (randToneIdx) {
        
        case 0:
            self.pitchPattern.color=[CCColor darkGrayColor];
            break;
    
        case 1:
            self.pitchPattern.color=[CCColor lightGrayColor];
            break;
            
        case 2:
            self.pitchPattern.color=[CCColor darkGrayColor];
            break;
    
        case 3:
            self.pitchPattern.color=[CCColor blackColor];
            break;
            
        case 4:
            self.pitchPattern.color=[CCColor whiteColor];
            break;
        
        default :
            break;
    }
    
}

-(void) setPitchFrame:(int)frameIndex {
    
    //int frameIndexTest = EXTRA_DARK_PITCH;
    switch(frameIndex) {
   //switch(frameIndexTest) {
            
        case NORMAL_PITCH:
            self.pitch.spriteFrame=[ self.pitchFrames objectAtIndex:NORMAL_PITCH];
            self.pitchPattern.visible=false;
            break;
            
        case LIGHT_PITCH:
        case 4:
        case 5:
            
            self.pitchPattern.visible=true;
            self.pitch.spriteFrame=[ self.pitchFrames objectAtIndex:LIGHT_PITCH];
            [self chooseRandomPitchPattern];
            [self chooseRandomPitchTone];
            break;
        
        case DARK_PITCH:
        case 6:
        case 7:
            
            self.pitchPattern.visible=true;
            self.pitch.spriteFrame=[ self.pitchFrames objectAtIndex:DARK_PITCH];
            [self chooseRandomPitchPattern];
            [self chooseRandomPitchTone];
            break;
            
        case EXTRA_DARK_PITCH:
        case 8:
        case 9:
            
            self.pitchPattern.visible=true;
            self.pitch.spriteFrame=[ self.pitchFrames objectAtIndex:EXTRA_DARK_PITCH];
            [self chooseRandomPitchPattern];
            [self chooseRandomPitchTone];
            break;

        default:
            self.pitch.spriteFrame=[ self.pitchFrames objectAtIndex:NORMAL_PITCH];
            
            break;
    }
}


//
-(void) hideAllPitchMarkings {
    self.microboybanner.visible=false;;
    self.micropitchlogo1.visible=false;
    self.micropitchlogo2.visible=false;
    self.microboypitchlogo1.visible=false;
    self.microboypitchlogo2.visible=false;
    self.microboysolopitchlogo1.visible=false;
    self.microboysolopitchlogo2.visible=false;
    
}

//microboy
-(void) setRandomishMicroBoyPosition {
    self.micropitchlogo1.scale=0.55;  //1.2
    self.micropitchlogo2.scale=0.55;  //1.2
    
    
    
    int randPosIdx = [Util random:3];
    switch(randPosIdx)  {
            
        case  0:
            self.microboypitchlogo1.position = ccp( PITCH_X_CENTER-145, PITCH_Y_CENTER-110 ); //PITCH_TOP+12
            self.microboypitchlogo1.rotation=-90;
            self.microboypitchlogo2.position = ccp( PITCH_X_CENTER+145, PITCH_Y_CENTER+110 ); //PITCH_TOP+12
            self.microboypitchlogo2.rotation=90;
            break;
            
        case 1:
            self.microboypitchlogo1.position = ccp( PITCH_X_CENTER+145, PITCH_Y_CENTER-110 ); //PITCH_TOP+12
            self.microboypitchlogo1.rotation=90;
            self.microboypitchlogo2.position = ccp( PITCH_X_CENTER-145, PITCH_Y_CENTER+110 ); //PITCH_TOP+12
            self.microboypitchlogo2.rotation=-90;
            break;
            
        case 2:
            self.microboypitchlogo1.position = ccp( PITCH_X_CENTER, PITCH_Y_CENTER-130 ); //PITCH_TOP+12
            self.microboypitchlogo1.scale=0.65;  //1.2
            self.microboypitchlogo1.rotation=180;
            
            self.microboypitchlogo2.position = ccp( PITCH_X_CENTER, PITCH_Y_CENTER+130 ); //PITCH_TOP+12
            self.microboypitchlogo2.scale=0.65;  //1.2
            self.microboypitchlogo2.rotation=0;
            break;
            
        default:
            break;
    }
    
    
    int randAngleIdx = [Util random:4];
    
    switch(randAngleIdx) {
        case 0:
            self.microboypitchlogo1.rotation=-90;
            self.microboypitchlogo2.rotation=90;
            break;
            
        case 1:
            self.microboypitchlogo1.rotation=90;
            self.microboypitchlogo2.rotation=-90;
            break;
            
        case 2:
            self.microboypitchlogo1.rotation=180;
            self.microboypitchlogo2.rotation=0;
            break;
            
        case 3:
            self.microboypitchlogo1.rotation=0;
            self.microboypitchlogo2.rotation=180;
            break;
            
        default:
            self.microboypitchlogo1.rotation=180;
            self.microboypitchlogo2.rotation=0;
            
            break;
    }
}


//setVerticalLogoPosition
-(void) setRandomishLogoPosition {
    self.micropitchlogo1.scale=0.25;  //1.2
    self.micropitchlogo2.scale=0.25;  //1.2

    
    
    int randPosIdx = [Util random:3];
    switch(randPosIdx)  {
            
        case  0:
            self.micropitchlogo1.position = ccp( PITCH_X_CENTER-145, PITCH_Y_CENTER-110 ); //PITCH_TOP+12
            self.micropitchlogo1.rotation=-90;
            self.micropitchlogo2.position = ccp( PITCH_X_CENTER+145, PITCH_Y_CENTER+110 ); //PITCH_TOP+12
            self.micropitchlogo2.rotation=90;
            break;
            
        case 1:
            self.micropitchlogo1.position = ccp( PITCH_X_CENTER+145, PITCH_Y_CENTER-110 ); //PITCH_TOP+12
            self.micropitchlogo1.rotation=90;
            self.micropitchlogo2.position = ccp( PITCH_X_CENTER-145, PITCH_Y_CENTER+110 ); //PITCH_TOP+12
            self.micropitchlogo2.rotation=-90;
            break;
            
        case 2:
            self.micropitchlogo1.position = ccp( PITCH_X_CENTER-5, PITCH_Y_CENTER-128 ); //PITCH_TOP+12
            self.micropitchlogo1.scale=0.25;  //1.2
            self.micropitchlogo1.rotation=180;
            
            self.micropitchlogo2.position = ccp( PITCH_X_CENTER-5, PITCH_Y_CENTER+128 ); //PITCH_TOP+12
            self.micropitchlogo2.scale=0.25;  //1.2
            self.micropitchlogo2.rotation=0;
            break;
            
        default:
            break;
    }
    
    
    int randAngleIdx = [Util random:4];
    
    switch(randAngleIdx) {
        case 0:
            self.micropitchlogo1.rotation=-90;
            self.micropitchlogo2.rotation=90;
            break;
            
        case 1:
            self.micropitchlogo1.rotation=90;
            self.micropitchlogo2.rotation=-90;
            break;
            
        case 2:
            self.micropitchlogo1.rotation=180;
            self.micropitchlogo2.rotation=0;
            break;
            
        case 3:
            self.micropitchlogo1.rotation=0;
            self.micropitchlogo2.rotation=180;
            break;
            
        default:
            self.micropitchlogo1.rotation=180;
            self.micropitchlogo2.rotation=0;
            
            break;
    }
}


-(void) setRandomishMicroBoySoloPosition {
    self.microboysolopitchlogo1.scale=0.55;  //1.2
    self.microboysolopitchlogo2.scale=0.55;  //1.2
    
    
    int randPosIdx = [Util random:3];
    switch(randPosIdx)  {
        
        case  0:
            self.microboysolopitchlogo1.position = ccp( PITCH_X_CENTER-145, PITCH_Y_CENTER-110 ); //PITCH_TOP+12
            self.microboysolopitchlogo1.rotation=-90;
            self.microboysolopitchlogo2.position = ccp( PITCH_X_CENTER+145, PITCH_Y_CENTER+110 ); //PITCH_TOP+12
            self.microboysolopitchlogo2.rotation=90;
            break;
            
        case 1:
            self.microboysolopitchlogo1.position = ccp( PITCH_X_CENTER+145, PITCH_Y_CENTER-110 ); //PITCH_TOP+12
            self.microboysolopitchlogo1.rotation=90;
            self.microboysolopitchlogo2.position = ccp( PITCH_X_CENTER-145, PITCH_Y_CENTER+110 ); //PITCH_TOP+12
            self.microboysolopitchlogo2.rotation=-90;
            break;
            
        case 2:
            self.microboysolopitchlogo1.position = ccp( PITCH_X_CENTER, PITCH_Y_CENTER-130 ); //PITCH_TOP+12
            self.microboysolopitchlogo1.scale=0.65;  //1.2
            self.microboysolopitchlogo1.rotation=180;
            
            self.microboysolopitchlogo2.position = ccp( PITCH_X_CENTER, PITCH_Y_CENTER+130 ); //PITCH_TOP+12
            self.microboysolopitchlogo2.scale=0.65;  //1.2
            self.microboysolopitchlogo2.rotation=0;
            break;
            
        default:
            break;
    }
    
    
    int randAngleIdx = [Util random:4];
    
    switch(randAngleIdx) {
        case 0:
            self.microboysolopitchlogo1.rotation=-90;
            self.microboysolopitchlogo2.rotation=90;
        break;

        case 1:
            self.microboysolopitchlogo1.rotation=90;
            self.microboysolopitchlogo2.rotation=-90;
            break;

        case 2:
            self.microboysolopitchlogo1.rotation=180;
            self.microboysolopitchlogo2.rotation=0;
            break;
        
        case 3:
            self.microboysolopitchlogo1.rotation=0;
            self.microboysolopitchlogo2.rotation=180;
            break;
        
        default:
            self.microboysolopitchlogo1.rotation=180;
            self.microboysolopitchlogo2.rotation=0;
        
            break;
    }
    
    
}

-(void) setHorizontallMicroBoySoloPosition {
    self.microboysolopitchlogo1.position = ccp( PITCH_X_CENTER, PITCH_Y_CENTER-130 ); //PITCH_TOP+12
    self.microboysolopitchlogo1.scale=0.65;  //1.2
    self.microboysolopitchlogo1.rotation=180;
    
    self.microboysolopitchlogo2.position = ccp( PITCH_X_CENTER, PITCH_Y_CENTER+130 ); //PITCH_TOP+12
    self.microboysolopitchlogo2.scale=0.65;  //1.2
    self.microboysolopitchlogo2.rotation=0;
}

-(void) setVerticalMicroBoyPosition {
    self.microboypitchlogo1.scale=0.55;  //1.2
    self.microboypitchlogo2.scale=0.55;  //1.2
    
    if ([Util random5050]) {
        self.microboypitchlogo1.position = ccp( PITCH_X_CENTER-145, PITCH_Y_CENTER-110 ); //PITCH_TOP+12
        self.microboypitchlogo1.rotation=-90;
        self.microboypitchlogo2.position = ccp( PITCH_X_CENTER+145, PITCH_Y_CENTER+110 ); //PITCH_TOP+12
        self.microboypitchlogo2.rotation=90;
    } else {
        self.microboypitchlogo1.position = ccp( PITCH_X_CENTER+145, PITCH_Y_CENTER-110 ); //PITCH_TOP+12
        self.microboypitchlogo1.rotation=90;
        self.microboypitchlogo2.position = ccp( PITCH_X_CENTER-145, PITCH_Y_CENTER+110 ); //PITCH_TOP+12
        self.microboypitchlogo2.rotation=-90;
    }
}

-(void) setHorizontallMicroBoyPosition {
    self.microboypitchlogo1.position = ccp( PITCH_X_CENTER, PITCH_Y_CENTER-130 ); //PITCH_TOP+12
    self.microboypitchlogo1.scale=0.65;  //1.2
    self.microboypitchlogo1.rotation=180;
    
    self.microboypitchlogo2.position = ccp( PITCH_X_CENTER, PITCH_Y_CENTER+130 ); //PITCH_TOP+12
    self.microboypitchlogo2.scale=0.65;  //1.2
    self.microboypitchlogo2.rotation=0;
}

-(void) setVerticalLogoPosition {
    
    self.micropitchlogo1.scale=0.25;  //1.2
    self.micropitchlogo2.scale=0.25;  //1.2
    
    
    if ([Util random5050]) {
        self.micropitchlogo1.position = ccp( PITCH_X_CENTER-145, PITCH_Y_CENTER-110 ); //PITCH_TOP+12
        self.micropitchlogo1.rotation=-90;
        self.micropitchlogo2.position = ccp( PITCH_X_CENTER+145, PITCH_Y_CENTER+110 ); //PITCH_TOP+12
        self.micropitchlogo2.rotation=90;
    } else {
        self.micropitchlogo1.position = ccp( PITCH_X_CENTER+145, PITCH_Y_CENTER-110 ); //PITCH_TOP+12
        self.micropitchlogo1.rotation=90;
        self.micropitchlogo2.position = ccp( PITCH_X_CENTER-145, PITCH_Y_CENTER+110 ); //PITCH_TOP+12
        self.micropitchlogo2.rotation=-90;
    }
    
}

-(void) setHorizontalLogoPosition {
    
    self.micropitchlogo1.position = ccp( PITCH_X_CENTER-5, PITCH_Y_CENTER-128 ); //PITCH_TOP+12
    self.micropitchlogo1.scale=0.25;  //1.2
    self.micropitchlogo1.rotation=-180;
    
    self.micropitchlogo2.position = ccp( PITCH_X_CENTER-5, PITCH_Y_CENTER+128 ); //PITCH_TOP+12
    self.micropitchlogo2.scale=0.25;  //1.2
    self.micropitchlogo2.rotation=0;
}

-(void) setCentralLogoPosition {
    self.micropitchlogo1.position = ccp( PITCH_X_CENTER-8, PITCH_Y_CENTER+1 ); //PITCH_TOP+12
    self.micropitchlogo1.scaleY=0.35;  //1.2
    self.micropitchlogo1.scaleX=0.45;
    self.micropitchlogo1.rotation=-0;
}

-(float) getRandomOpacity {
    int base=5;
    int range=6;
    int randomOpacity=base+[Util random:range];
    float opacity=randomOpacity/(float)100;;
    NSLog(@">>Random Opacity = %f",opacity);
    return opacity;
}

-(float) getRandomOpacity :(int)base :(int)range {
    int randomOpacity=base+[Util random:range];
    float opacity=randomOpacity/(float)100;;
    NSLog(@">>Random Opacity = %f",opacity);
    return opacity;
}



-(float) getRandomScaleBooster {
    int range=10;
    int randomBoost=1+[Util random:range];
    float scaleBoost=randomBoost/(float)100;;
    NSLog(@">>Random Scale Boost = %f",scaleBoost);
    return scaleBoost;
}


-(float) getRandomScaleBooster :(int)base :(int)range {
    int randomBoost=base+[Util random:range];
    float scaleBoost=randomBoost/(float)100;;
    NSLog(@">>Random Scale Boost = %f",scaleBoost);
    return scaleBoost;
}

//
-(void) chooseRandomPitch {
    int pitchIdx = [Util random:10];
    [self setPitchFrame:pitchIdx];
}

-(void) showNormalHoardings {
    self.topHoarding.visible=SHOW_HOARDINGS;
    self.bottomHoarding.visible=SHOW_HOARDINGS;
    self.leftAdvert.visible=SHOW_HOARDINGS;
    self.rightAdvert.visible=SHOW_HOARDINGS;
}

-(void) showColourHoardings {
    self.topHoardingBlank.visible=SHOW_HOARDINGS;
    self.bottomHoardingBlank.visible=SHOW_HOARDINGS;
    self.leftAdvertBlank.visible=SHOW_HOARDINGS;
    self.rightAdvertBlank.visible=SHOW_HOARDINGS;
}

-(void) showFullLogoSides {
    self.leftAdvertLogo.visible=SHOW_HOARDINGS;
    self.rightAdvertLogo.visible=SHOW_HOARDINGS;
}

-(void) showFullLogoBases {
    self.topAdvertLogo.visible=SHOW_HOARDINGS;
    self.bottomAdvertLogo.visible=SHOW_HOARDINGS;
  }


-(void) showMicroBoyLogoBases {
    self.topAdvertMicroLogo.visible=SHOW_HOARDINGS;
    self.bottomAdvertMicroLogo.visible=SHOW_HOARDINGS;
}

-(void) showMicroBoyLogoSides {
    self.leftAdvertMicroLogo.visible=SHOW_HOARDINGS;
    self.rightAdvertMicroLogo.visible=SHOW_HOARDINGS;
}


-(void) showTwitterSides {
    self.leftAdvertTwitter.visible=SHOW_HOARDINGS;
    self.rightAdvertTwitter.visible=SHOW_HOARDINGS;
}

-(void) showEmailSides {
    self.leftAdvertEmail.visible=SHOW_HOARDINGS;
    self.rightAdvertEmail.visible=SHOW_HOARDINGS;
}

-(void) hideAllHoardings {
    self.topHoarding.visible=false;
    self.bottomHoarding.visible=false;
    self.leftAdvert.visible=false;
    self.rightAdvert.visible=false;
    
    self.topHoardingBlank.visible=false;
    self.bottomHoardingBlank.visible=false;
    self.leftAdvertBlank.visible=false;
    self.rightAdvertBlank.visible=false;
    
    self.topAdvertLogo.visible=false;
    self.bottomAdvertLogo.visible=false;
    self.leftAdvertLogo.visible=false;
    self.rightAdvertLogo.visible=false;
    
    self.leftAdvertMicroLogo.visible=false;
    self.rightAdvertMicroLogo.visible=false;
    self.topAdvertMicroLogo.visible=false;
    self.bottomAdvertMicroLogo.visible=false;
    
    self.leftAdvertTwitter.visible=false;
    self.rightAdvertTwitter.visible=false;
    self.leftAdvertEmail.visible=false;
    self.rightAdvertEmail.visible=false;
}

-(void) chooseHoaringType {
    // Normal or COloured
    
   // int type = [Util random:2];
    //
    [self hideAllHoardings];
    
}

-(CCColor *) getRandomColor {
    int colorIdx = [Util random:15];
    return [Team getHoardingColour:(colorIdx)];
}


-(void) setBothBlankHoardingsColour {
    CCColor *col=[self getRandomColor];
    self.leftAdvertBlank.color=col;
    self.rightAdvertBlank.color=col;
    self.topHoardingBlank.color=col;
    self.bottomHoardingBlank.color=col;
}

-(void) setSideBlankHoardingColour {
    CCColor *col=[self getRandomColor];
    self.leftAdvertBlank.color=col;
    self.rightAdvertBlank.color=col;
}

-(void) setBaseBlankHoardingColour {
    CCColor *col=[self getRandomColor];
    self.topHoardingBlank.color=col;
    self.bottomHoardingBlank.color=col;
}

-(void) setSideMicroBoyHoardingColour {
    CCColor *col=[self getRandomColor];
    self.leftAdvert.color=col;
    self.rightAdvert.color=col;
}

-(void) setBaseMicroBoyHoardingColour {
    CCColor *col=[self getRandomColor];
    self.topHoarding.color=col;
    self.bottomHoarding.color=col;
}


-(void) chooseRandomHoardings {
    
    [self hideAllHoardings];
    
    /*if([Util random5050])*/
    if (1>0) {
        [self showNormalHoardings];
        [self setSideMicroBoyHoardingColour];
        [self setBaseMicroBoyHoardingColour];
    } else {
        [self showColourHoardings];
        
        if ([Util random5050]) {
            [self setSideBlankHoardingColour];
            [self setBaseBlankHoardingColour];
        } else {
            [self setBothBlankHoardingsColour];
        }
        
        // base logos
        if ([Util random5050]) {
            [self showFullLogoBases];
        } else {
            [self showMicroBoyLogoBases];
        }
        
        // side logos
        
        int randomHoarding = [Util random:4];
        switch(randomHoarding) {
            case 0:
                [self showFullLogoSides];
                break;

            case 1:
                [self showMicroBoyLogoSides];
                break;

            case 2:
                [self showEmailSides];
                break;

            case 3:
                [self showTwitterSides];
                break;
        }
    }
    
    
    //[self showFullLogoSides];
//    [self showFullLogoBases];
//    
//    
//    [self showMicroBoyLogoSides];
    //[self showMicroBoyLogoBases];
    
    // either normal hoardings or coloured
    
   /*
    1) Normal borders
    
    - What colour logo
    
    
    
    
    
    2) Coloured
    
    
    what colour
    
    2a)
    
        2a - 1) Side colour
        2a - 2) Base colour
    
    
    
    2b) What logo
        2b - 1) Side Logo - Full or Icon
        2b - 2) Base Logo - Full or Icon
    
    */
    
    
}


//
-(void) doRandomPitchMarkings {
    int chosen = [Util random:50];
    [self hideAllPitchMarkings];
    float opacity=[self getRandomOpacity];
    float scaleBoost=[self getRandomScaleBooster];
  
    // opacity=0.85;
    //chosen=4;
    switch(chosen) {
        case 0:
            self.microboybanner.visible=false;;
            self.micropitchlogo1.visible=false;
            self.micropitchlogo2.visible=false;
            break;
        
        case 1:
            self.microboybanner.visible=true;
            self.microboybanner.opacity=opacity;
            break;
        
        case 2:
            //[self setVerticalLogoPosition];
            scaleBoost=[self getRandomScaleBooster:1 :5];
            [self setRandomishLogoPosition];

            self.micropitchlogo1.visible=true;
            self.micropitchlogo2.visible=true;
            self.micropitchlogo1.opacity=opacity;
            self.micropitchlogo2.opacity=opacity;
            self.micropitchlogo1.scale+=scaleBoost;
            self.micropitchlogo2.scale+=scaleBoost;
            break;
        
        case 3:
            //[self setHorizontalLogoPosition];
            scaleBoost=[self getRandomScaleBooster:1 :5];
            [self setRandomishLogoPosition];

            self.micropitchlogo1.visible=true;
            self.micropitchlogo2.visible=true;
            self.micropitchlogo1.opacity=opacity;
            self.micropitchlogo2.opacity=opacity;
            self.micropitchlogo1.scale+=scaleBoost;
            self.micropitchlogo2.scale+=scaleBoost;
            break;
            
        case 4:
            //[self setHorizontallMicroBoyPosition];
            [self setRandomishMicroBoyPosition];
            self.microboypitchlogo1.visible=true;
            self.microboypitchlogo2.visible=true;
            self.microboypitchlogo1.opacity=opacity;
            self.microboypitchlogo2.opacity=opacity;
            self.microboypitchlogo1.scale+=scaleBoost;
            self.microboypitchlogo2.scale+=scaleBoost;
            break;
            
        case 5:
            opacity=[self getRandomOpacity:15 : 20];
            [self setRandomishMicroBoySoloPosition];
            self.microboysolopitchlogo1.visible=true;
            self.microboysolopitchlogo2.visible=true;
            self.microboysolopitchlogo1.opacity=opacity;
            self.microboysolopitchlogo2.opacity=opacity;
            self.microboysolopitchlogo1.scale+=scaleBoost;
            self.microboysolopitchlogo2.scale+=scaleBoost;
            
            break;
        
        case 6:
            opacity=[self getRandomOpacity:15 : 20];
            [self setRandomishMicroBoySoloPosition];
            self.microboysolopitchlogo1.visible=true;
            self.microboysolopitchlogo2.visible=true;
            self.microboysolopitchlogo1.opacity=opacity;
            self.microboysolopitchlogo2.opacity=opacity;
            self.microboysolopitchlogo1.scale+=scaleBoost;
            self.microboysolopitchlogo2.scale+=scaleBoost;
            break;
            
        case 7:
            //[self setVerticalMicroBoyPosition];
            [self setRandomishMicroBoyPosition];
            self.microboypitchlogo1.visible=true;
            self.microboypitchlogo2.visible=true;
            self.microboypitchlogo1.opacity=opacity;
            self.microboypitchlogo2.opacity=opacity;
            self.microboypitchlogo1.scale+=scaleBoost;
            self.microboypitchlogo2.scale+=scaleBoost;
            
            break;

            
        case 8:
            [self setCentralLogoPosition];
            self.micropitchlogo1.visible=true;
            self.micropitchlogo2.visible=false;
            self.micropitchlogo1.opacity=opacity;
            break;
        
        case 9:
            self.microboybanner.visible=false;;
            self.micropitchlogo1.visible=false;
            self.micropitchlogo2.visible=false;
            break;
            
        default:
            self.microboybanner.visible=false;;
            self.micropitchlogo1.visible=false;
            self.micropitchlogo2.visible=false;
            break;
    }
    
}

//-(void) getRandomBallColour {
//    
//    // give more chance of white ball
//    int ballIdx = [Util random:RANDOM_BALL_COLOUR_RANGE];
//    
//    switch (ballIdx) {
//            
//        case BALL_COL_RANDOM:
//        case BALL_COL_WHITE:
//            if ([Util random5050]) {
//                [[ball sprite] setColor: [CCColor whiteColor]];
//            } else {
//                [[ball sprite] setColor: [Team getColour:IVORY_WHITE]];
//            }
//            break;
//            
//        case BALL_COL_YELLOW:
//            if ([Util random5050]) {
//                [[ball sprite] setColor: [CCColor yellowColor]];
//            } else {
//                [[ball sprite] setColor: [Team getColour:BRAZIL_YELLOW]];
//            }
//            break;
//            
//        case BALL_COL_ORANGE:
//            if ([Util random5050]) {
//
//                [[ball sprite] setColor: [CCColor orangeColor]];
//            } else {
//                [[ball sprite] setColor: [Team getColour:DUTCH_ORANGE]];
//            }
//            break;
//            
//        case BALL_COL_BLUE:
//            if ([Util random5050]) {
//
//                [[ball sprite] setColor: [CCColor cyanColor]];
//            } else {
//                [[ball sprite] setColor: [Team getColour:ITALIAN_BLUE]];
//            }
//            break;
//            
//        case BALL_COL_MAGENTA:
//            if ([Util random5050]) {
//                [[ball sprite] setColor: [CCColor magentaColor]]; //55,105,180)
//            } else {
//                CCColor *pinkColor = [CCColor colorWithRed:(255.0/255.0) green:(105.0/255.0) blue:(180.0/255.0) alpha:(1.0f)];
//
//                [[ball sprite] setColor: pinkColor];
//            }
//            break;
//            
//        default:
//            if ([Util random5050]) {
//                [[ball sprite] setColor: [CCColor whiteColor]];
//            } else {
//                [[ball sprite] setColor: [Team getColour:IVORY_WHITE]];
//            }
//
//            break;
//    }
//    
//}



-(void) setBallColour:(bool) doRandom {
    
    int ballColourIdx;
    if (doRandom) {
        ballColourIdx = 1+[Util random:RANDOM_BALL_COLOUR_RANGE];
    } else {
        ballColourIdx=[GameData getBallColour];
    }
  
    switch (ballColourIdx) {
            
        case BALL_COL_RANDOM:
            //[self getRandomBallColour];
            [self setBallColour:true];
            break;
            
        case BALL_COL_WHITE:
            if ([Util random5050]) {
                [[ball sprite] setColor: [CCColor whiteColor]];
                
                //[[ball sprite] setColor: beigeColor];
            } else {
                CCColor *beigeColor = [CCColor colorWithRed:(240/255.0) green:(240/255.0) blue:(216/255.0) alpha:(1.0f)];
                [[ball sprite] setColor: beigeColor];
             }
            break;
            
        case BALL_COL_YELLOW:
            if ([Util random5050]) {
                [[ball sprite] setColor: [CCColor yellowColor]];
            } else {
                CCColor *lightYellow = [CCColor colorWithRed:(244/255.0) green:(200/255.0) blue:(117/255.0) alpha:(1.0f)];
                [[ball sprite] setColor: lightYellow];
            }
            break;
            
        case BALL_COL_ORANGE:
            if ([Util random5050]) {
                //CCColor *lightOrange = [CCColor colorWithRed:(255/255.0) green:(190/255.0) blue:(97/255.0) alpha:(1.0f)];
                [[ball sprite] setColor: [CCColor orangeColor]];
            } else {
                CCColor *lightOrange = [CCColor colorWithRed:(255/255.0) green:(190/255.0) blue:(97/255.0) alpha:(1.0f)];
                [[ball sprite] setColor: lightOrange];
            }
            break;
            
        case BALL_COL_BLUE:
            if ([Util random5050]) {
                
                [[ball sprite] setColor: [CCColor cyanColor]];
                
            } else {
                CCColor *lightBlue = [CCColor colorWithRed:(173/255.0) green:(230/255.0) blue:(235.0/255.0) alpha:(1.0f)];
                
                [[ball sprite] setColor: lightBlue];
            }
            break;
            
        case BALL_COL_MAGENTA:
            if ([Util random5050]) {
                [[ball sprite] setColor: [CCColor magentaColor]]; //55,105,180)
            } else {
                CCColor *pinkColor = [CCColor colorWithRed:(255.0/255.0) green:(105.0/255.0) blue:(180.0/255.0) alpha:(1.0f)];
                
                [[ball sprite] setColor: pinkColor];
            }
            break;
            
        default:
            if ([Util random5050]) {
                [[ball sprite] setColor: [CCColor whiteColor]];
                //[[ball sprite] setColor: beigeColor];

            } else {
                //[[ball sprite] setColor: [Team getColour:IVORY_WHITE]];
                CCColor *beigeColor = [CCColor colorWithRed:(240/255.0) green:(240/255.0) blue:(216/255.0) alpha:(1.0f)];
                [[ball sprite] setColor: beigeColor];

            }
            break;
    }
    
}


-(void) setStadiumBorderColour {
    int idx = [Util random:3];
    
    CCColor *mainKitColor = [Team getColour: [team1 teamData].stripMainColour];
    
    switch (idx) {
        case 0:
            self.stadiumLevels.color=[CCColor grayColor];
            break;
        
        case 1:
            self.stadiumLevels.color=[CCColor lightGrayColor];
            break;
            
        case 2:
            self.stadiumLevels.color=mainKitColor;
            break;
            
        default:
            self.stadiumLevels.color=mainKitColor;
            break;
        
    }
}


//
-(void) initMatch
{
    
    CCLOG(@">> initMatch");
    //[gameLayer centerPitch];
    
    HudModel *hm = [HudModel sharedHudModel];
    if ([GameData isHumanTeam])
    {
        CCLOG(@">> Human Team");
        [team1 setHumanPlayer:true];
        self.activePlayerSprite.visible=true;
        self.activeTargetSprite.visible=true;
        self.playerArrowSprite.visible=true;
//        self.activeTargetSprite.color=[CCColor yellowColor];
//        self.activePlayerSprite.color=[CCColor orangeColor];
        [hm showControls];
    }
    else
    {
        CCLOG(@">> Comp Team");
        [team1 setHumanPlayer:false];
        self.activePlayerSprite.visible=false;
        self.activeTargetSprite.visible=false;
        self.playerArrowSprite.visible=false;
        [hm hideControls];
    }
    
    //
    [ball setBallHeightSprite];
    [ball setPositionX:PITCH_X_CENTER Y:PITCH_Y_CENTER];
    [ball updateSpritePos:UPDATE_INTERVAL];
   
    
    //CCColor *pinkColor = [CCColor colorWithRed:(255.0/255.0) green:(105.0/255.0) blue:(180.0/255.0) alpha:(1.0f)];
    //CCColor *pinkColor = [CCColor colorWithRed:(255.0/255.0) green:(20.0/255.0) blue:(147.0/255.0) alpha:(1.0f)];
    //CCColor *offWhiteColor = [CCColor colorWithRed:(238.0/255.0) green:(232.0/255.0) blue:(170.0/255.0) alpha:(1.0f)];
   
    //
    [self doRandomPitchMarkings];
    [self chooseRandomPitch];
    [self chooseRandomHoardings];
    [self setStadiumBorderColour];
    
    //
    [self setBallColour:false];
    
    //
    cameraPos = ccp(PITCH_X_CENTER,PITCH_Y_CENTER);
    cameraVec = ccp(0,0);
}


//
-(void) resetGame
{
    CCLOG(@">> Reset Game");
    matchSecs=0;
    //[self setMatchState:preKickOffRunout];
    [self setMatchState:preKickOff];
    [self setGameState:matchInfo];
    
    //
    [[GameData sharedGameDataManager] setMatchInProgress:false];
    [[GameData sharedGameDataManager] setTeam1score:0];
    [[GameData sharedGameDataManager] setTeam2score:0];
    
    //
    NSLog(@">> Match Type : %d",[[GameModel sharedGameModel] matchType] == matchDemo);
    if ([[GameModel sharedGameModel] matchType] == matchDemo) {
        [[[GameModel sharedGameModel] getTeam1] pickRandomFormation];
    }
    
    [[[GameModel sharedGameModel] getTeam2] pickRandomFormation];
    
    //
    [team1 setupRunoutStartPositions];
    [team2 setupRunoutStartPositions];
    
    //
    [[SceneManager sharedSceneManager] hudLayer].visible=true;
    
    
    //
    [[[HudModel sharedHudModel] timelabel] setString: [NSString stringWithFormat:@"0:00"]];
    

    //
    [ball resetBall];
    [ball setBallHeightSprite];
    [ball setPositionX:PITCH_X_CENTER Y:PITCH_Y_CENTER];
    [ball updateSpritePos:UPDATE_INTERVAL];

    //
    cameraPos = ccp(PITCH_X_CENTER,PITCH_Y_CENTER);
    cameraVec = ccp(0,0);
    
    //
    [matchData clearReplay];
    
    //
    goalSprShown=false;
    halfTimeSprShown=false;
    kickOffDone=false;
    keeperHasBallDone=false;
    ballOutOfBoundsDone=false;
    showPremMatchInfoDone=false;
    goToFullTimeInfoDone=false;
    preKickOffRunoutDone=false;
    isSecondHalf=false;
    managerModedGameOver=false;
    self.numTicks=0;
    self.tickTaskTime=0;
    
//    //
//    [team1 setTeamPassRate];
//    [team2 setTeamPassRate];
//    
    
}

//
//-(void) setGameInfoLayer:(GameInfoLayer *)layer
//{
//    gameInfoLayer=layer;
//}

//
-(CGPoint) normalise:(CGPoint)origVec
{
    CGPoint normVector = ccp(0,0);
    float length = sqrtf(origVec.x*origVec.x + origVec.y*origVec.y);
    
    normVector.x = origVec.x / length;
    normVector.y = origVec.y / length;
    return normVector;
    
}


-(void) doFullTimeCelebrations:(CCTime)dt :(Ball *) theBall {
    if ([team1 getScore] == [team2 getScore]) {
        [team1 movePlayersFullTimeHalfSpeed:dt];
        [team2 movePlayersFullTimeHalfSpeed:dt];
        
    } else if ([team1 getScore] > [team2 getScore]) {
        // team 1 won
        [team1 movePlayersGoalScored:dt :theBall];
        [team2 movePlayersFullTimeHalfSpeed:dt];

    } else {
        // team 2 won
        [team2 movePlayersGoalScored:dt :theBall];
        [team1 movePlayersFullTimeHalfSpeed:dt];
     
    }
}


// TODO: move to team
-(Team *) getTeamWhoScored
{
    CGPoint ballPos = [ball position];
    if (ballPos.y > PITCH_Y_CENTER) {
        if ([team1 getPlayingDirection] == SHOOTING_UP)
            return team1;
        else
            return team2;
    }
    else {
        if ([team1 getPlayingDirection] == SHOOTING_DOWN)
            return team1;
        else
            return team2;
    }
}

// TODO: move to team
-(Team *) getNonScoringTeam
{
    if ([[self getTeamWhoScored] getTeamId] == TEAM1)
        return team2;
    else
        return team1;
}

-(void) updateScoreInfo
{
    
    HudModel *hm = [HudModel sharedHudModel];
    NSString *score = [NSString stringWithFormat:@"%@ %d-%d %@",
                       [team1 getTeamName], [team1 getScore], [team2 getScore], [team2 getTeamName]];
    
    //    [[hm scoreLabel] setString: [NSString stringWithFormat:@"%@ %d - %d %@",
    //                                      [team1 getTeamName], [team1 getScore], [team2 getScore], [team2 getTeamName]]];
    [hm setScorelabelString:score];
    
    [[GameData sharedGameDataManager] setTeam1score:[team1 getScore]];
    [[GameData sharedGameDataManager] setTeam2score:[team2 getScore]];
    
    
    if (managerMode)
    {
        //CCLOG(@">>UPDATE SCORE INFO - MANAGER MODE");
        [[[SceneManager sharedSceneManager] gameInfoLayer] updateScore:[team1 getScore] :[team2 getScore]];
        
        NSString *scorer = [[[self getTeamWhoScored] getMainPlayer] playerName];
        //CCLOG(@">>Scorer = %@", scorer);
        
        if (scorer != nil)
        {
            [[[SceneManager sharedSceneManager] gameInfoLayer] updateScorerInfo:
            [[self getTeamWhoScored] getTeamId] : scorer];
            [self setMatchState: managerModeResumed];
        }
    }
    
}

-(void) updateWeather
{
    //    if (weatherShadow.opacity < 1)
    //        weatherShadow.opacity+=0.01;
    //    else if (weatherShadow.opacity > 99)
    //        weatherShadow.opacity-=0.01;
    //weatherShadow.opacity+=0.1;
}

-(CGPoint) getCameraPos
{
    return cameraPos;
}



//
-(void)moveCamera:(CCTime)dt
{
    // dont scroll if screen is big enough to display full pitch length
    if ([CCDirector sharedDirector].viewSize.height > (PITCH_TOP-PITCH_BOTTOM) ) {
        return;
    }
    
//    cameraPos=ball.position;
//    
//    return;
 
    CGPoint playerVec;
    CGPoint newCamPos;
    CGPoint moveCamPos;
    
    
    // only do player cam move for human player when he has the ball
    // also dont do for human keeper
    
//    if ([ball isBallAlmostStill]) {
//        moveCamPos=ball.position;
//    }
//
//    else
    
    
    if (![ball attached] || ![team1 isHumanTeam] || ([ball attached] && [self doesHumanKeeperHaveBall]
                                                     && [[GameModel sharedGameModel] getMatchState] != keeperHasBall)) {
        moveCamPos=[ball position];
    } else {
        Player *p;
        
        //TODO - set this for players speed
        if ([ball teamWithBallId] == TEAM1)
        {
            if ([self doesAnyKeeperHaveBall]) {
                p =[team1 getKeeper];
            } else {
                p = [team1 getMainPlayer];
            }
        }
        else
        {
            if ([self doesAnyKeeperHaveBall]) {
                p =[team2 getKeeper];
            } else {
                p = [team2 getMainPlayer];
            }
        }
        
        playerVec = ccpMult([p vector], ADVANCE_PLAYER_CAMERA_DISTANCE);
        newCamPos =  ccpAdd([p position], playerVec);
        moveCamPos=newCamPos;
       // moveCamPos=ccp(moveCamPos.x,newCamPos.y);
    }
    

    //
    if (ccpDistance(cameraPos, moveCamPos) > 5)
    {
        
        
        cameraVec = ccpSub(moveCamPos, cameraPos);
        cameraVec = ccpNormalize(cameraVec);
        
//        if([ball isBallAlmostStill]) {
//            cameraVec = ccpMult(cameraVec, ccpLength([ball vector])*15.0f);   //1.25
//        }
//        else
        if ([ball attached] )
        {
            //Player *p = [
            Player *p;
            
            //TODO - set this for players speed
            if ([ball teamWithBallId] == TEAM1)
            {
                if ([self doesAnyKeeperHaveBall]) {
                    p =[team1 getKeeper];
                } else {
                    p = [team1 getMainPlayer];
                }
            }
            else
            {
                if ([self doesAnyKeeperHaveBall]) {
                    p =[team2 getKeeper];
                } else {
                    p = [team2 getMainPlayer];
                }
            }

            cameraVec = ccpMult(cameraVec, ccpLength([p vector])* 2.10 /*2.25//ADVANCE_PLAYER_HAS_BALL_CAMERA_SPEED*/);   //1.25
            
        }
        else
        {
            cameraVec = ccpMult(cameraVec, ccpLength([ball vector])*0.85 /*ADVANCE_BALL_CAMERA_SPEED*/);   //0.75
        }
        // ccp
        cameraVec = ccpMult(cameraVec, dt);
        cameraPos = ccpAdd(cameraPos, cameraVec);
    }
    else
    {
        //CCLOG(@"** Cam distance = %f. Cam pos = %f,%f",ccpDistance(cameraPos, [ball sprite].position), cameraPos.x, cameraPos.y);
        
        // ball has changed direction
        if ((cameraVec.y > 0 && [ball vector].y < 0))
        {
            ////printf("\n ** -> ball changed direction");
            cameraVec = ccpMult([ball vector], 0.85);
            cameraVec = ccpMult(cameraVec, dt);
            cameraPos = ccpAdd(cameraPos, cameraVec);
        }
        else if ((cameraVec.y < 0 && [ball vector].y > 0))
        {
            ////printf("\n ** -> ball changed direction 2");
            cameraVec = ccpMult([ball vector], 0.85);
            cameraVec = ccpMult(cameraVec, dt);
            cameraPos = ccpAdd(cameraPos, cameraVec);
        }
        else
        {
            if (ccpDistance(cameraPos, [ball position]) < 3 )
            {
                // //printf("\n ** -> cam equals ball pos");
                cameraPos.x = [ball getX];
                cameraPos.y = [ball getY];
            }
        }
    }
   
    self.testBall.position=cameraPos;

    // NSLog(@">>>BALL Vec %f,%f", ball.vector.x, ball.vector.y);
    // [self setViewpointCenter:cameraPos];
}

//
-(void)moveCameraNew2:(CCTime)dt
{
    // dont scroll if screen is big enough to hold full pitch length
    if ([CCDirector sharedDirector].viewSize.height > (PITCH_TOP-PITCH_BOTTOM) ) {
        return;
   }
//    NSLog(@"Camera Pos = %f", cameraPos.y);
//    if ([[[SceneManager sharedSceneManager] gameLayer] scale] < 1.0) {
//        if (cameraPos.y >= PITCH_TOP-100) {
//            cameraPos.y=PITCH_TOP-100;
//            NSLog(@"Camera STOP - TOP BOUNDARY");
//            return;
//        } else if (cameraPos.y <= PITCH_BOTTOM+50) {
//            cameraPos.y=PITCH_BOTTOM+50;
//            NSLog(@"Camera STOP - BOTTOM BOUNDARY");
//
//            return;
//        }
//        
//        
//    }
    
    //if camera isnt at ball position, move camera to ball
    //if (ccpDistance(cameraPos, [ball getSprite].position) > 15 ){
    if (ccpDistance(cameraPos, [ball position]) > 15)
    {
        
        //CCLOG(@"** Cam not at ball pos.. distance = %f. Cam pos = %f,%f",ccpDistance(cameraPos, [ball sprite].position), cameraPos.x, cameraPos.y);
        // cameraVec = ccpMult(*[ball vector], 0.75);
        cameraVec = ccpSub([ball position], cameraPos);
        cameraVec = ccpNormalize(cameraVec);
        
        if ([ball attached])
        {
            //Player *p = [
            Player *p;
            
            //TODO - set this for players speed
            if ([ball teamWithBallId] == TEAM1)
            {
                p = [team1 getMainPlayer];
            }
            else
            {
                p = [team2 getMainPlayer];
            }
            cameraVec = ccpMult(cameraVec, ccpLength([p vector])*1.25);
        }
        else
        {
            cameraVec = ccpMult(cameraVec, ccpLength([ball vector])*0.75);
        }
        // ccp
        cameraVec = ccpMult(cameraVec, dt);
        cameraPos = ccpAdd(cameraPos, cameraVec);
    }
    else
    {
        //CCLOG(@"** Cam distance = %f. Cam pos = %f,%f",ccpDistance(cameraPos, [ball sprite].position), cameraPos.x, cameraPos.y);
        
        // ball has changed direction
        if ((cameraVec.y > 0 && [ball vector].y < 0))
        {
            ////printf("\n ** -> ball changed direction");
            cameraVec = ccpMult([ball vector], 0.85);
            cameraVec = ccpMult(cameraVec, dt);
            cameraPos = ccpAdd(cameraPos, cameraVec);
        }
        else if ((cameraVec.y < 0 && [ball vector].y > 0))
        {
            ////printf("\n ** -> ball changed direction 2");
            cameraVec = ccpMult([ball vector], 0.85);
            cameraVec = ccpMult(cameraVec, dt);
            cameraPos = ccpAdd(cameraPos, cameraVec);
        }
        else
        {
            if (ccpDistance(cameraPos, [ball position]) < 3 )
            {
                // //printf("\n ** -> cam equals ball pos");
                cameraPos.x = [ball getX];
                cameraPos.y = [ball getY];
            }
        }
    }
    
    // [self setViewpointCenter:cameraPos];
}


//
-(void)moveCameraOriginal:(CCTime)dt
{
    // dont scroll if screen is big enough to hold full pitch length
    if ([CCDirector sharedDirector].viewSize.height > (PITCH_TOP-PITCH_BOTTOM) ) {
        return;
    }
    
    //if camera isnt at ball position, move camera to ball
    //if (ccpDistance(cameraPos, [ball getSprite].position) > 15 ){
    if (ccpDistance(cameraPos, [ball position]) > 15)
    {
        
        //CCLOG(@"** Cam not at ball pos.. distance = %f. Cam pos = %f,%f",ccpDistance(cameraPos, [ball sprite].position), cameraPos.x, cameraPos.y);
        // cameraVec = ccpMult(*[ball vector], 0.75);
        cameraVec = ccpSub([ball position], cameraPos);
        cameraVec = ccpNormalize(cameraVec);
        
        if ([ball attached])
        {
            //Player *p = [
            Player *p;
            
            //TODO - set this for players speed
            if ([ball teamWithBallId] == TEAM1)
            {
                p = [team1 getMainPlayer];
            }
            else
            {
                p = [team2 getMainPlayer];
            }
            cameraVec = ccpMult(cameraVec, ccpLength([p vector])*1.25);
        }
        else
        {
            cameraVec = ccpMult(cameraVec, ccpLength([ball vector])*0.75);
        }
        // ccp
        cameraVec = ccpMult(cameraVec, dt);
        cameraPos = ccpAdd(cameraPos, cameraVec);
    }
    else
    {
        //CCLOG(@"** Cam distance = %f. Cam pos = %f,%f",ccpDistance(cameraPos, [ball sprite].position), cameraPos.x, cameraPos.y);
        
        // ball has changed direction
        if ((cameraVec.y > 0 && [ball vector].y < 0))
        {
            ////printf("\n ** -> ball changed direction");
            cameraVec = ccpMult([ball vector], 0.85);
            cameraVec = ccpMult(cameraVec, dt);
            cameraPos = ccpAdd(cameraPos, cameraVec);
        }
        else if ((cameraVec.y < 0 && [ball vector].y > 0))
        {
            ////printf("\n ** -> ball changed direction 2");
            cameraVec = ccpMult([ball vector], 0.85);
            cameraVec = ccpMult(cameraVec, dt);
            cameraPos = ccpAdd(cameraPos, cameraVec);
        }
        else
        {
            if (ccpDistance(cameraPos, [ball position]) < 3 )
            {
                // //printf("\n ** -> cam equals ball pos");
                cameraPos.x = [ball getX];
                cameraPos.y = [ball getY];
            }
        }
    }
    
    self.testBall.position=cameraPos;
    // [self setViewpointCenter:cameraPos];
}

// TODO  : check if we need this method in this class as well as GameLayer class
//-(void)setViewpointCenter:(CGPoint) position
//{
//
//    CGSize winSize = [[CCDirector sharedDirector] winSize];
//
//    int x = MAX(position.x, winSize.width / 2);
//    int y = MAX(position.y, winSize.height / 2);
//
//    if (position.y< 530 && position.y >160)
//    {
//        x=PITCH_X_CENTER;
//        y=position.y;
//        CGPoint actualPosition = ccp(x, y);
//
//        CGPoint centerOfView = ccp(winSize.width/2, winSize.height/2);
//        CGPoint viewPoint = ccpSub(centerOfView, actualPosition);
//
//        // //printf("\n* Viewpoint y = %f",position.y);
//
//        self.position = viewPoint;
//    }
//}

-(enum gameState)getGameState
{
    return gameState;
}

-(enum matchState)getMatchState
{
    return matchState;
}

-(void) setGameState:(enum gameState)newGameState;
{
    prevGameState = gameState;
    gameState = newGameState;
}

-(void) setMatchState:(enum matchState)newMatchState
{
    prevMatchState = matchState;
    matchState = newMatchState;
}


-(void) drawLine :(CGPoint) p1 : (CGPoint) p2 :(int) colour
{
    return;
//        LineNode * myLine = [[LineNode alloc] init:p1 :p2 :colour];
//        [self addChild:myLine z:899];
}


//
-(void) drawPitch
{
    int top = 640;
    int bottom = 50;
    int left = 30;
    int right = 455;
    
    int pitchCenter = SCREEN_X_CENTER;
    int goalWidth = 90;
    int goalDepth = 30;
    
    //Pitch
    [self drawLine:ccp(left,top) : ccp(right,top) :1 ];
    [self drawLine:ccp(left,bottom) : ccp(left,top) :0];
    [self drawLine:ccp(right,bottom) : ccp(right,top) :3];
    [self drawLine:ccp(left,bottom) : ccp(right,bottom) :4];
    
    //Top Goal
    [self drawLine: ccp(pitchCenter-goalWidth/2 , top+goalDepth) :ccp(pitchCenter+goalWidth/2 , top+goalDepth) :0] ;
    [self drawLine: ccp(pitchCenter-goalWidth/2 , top) :ccp(pitchCenter-goalWidth/2 , top+goalDepth) :0] ;
    [self drawLine: ccp(pitchCenter+goalWidth/2 , top) :ccp(pitchCenter+goalWidth/2 , top+goalDepth) :0] ;
    [self drawLine: ccp(pitchCenter-goalWidth/2 , top) :ccp(pitchCenter+goalWidth/2 , top) :1] ;
    
    
    //Bottom Goal
    [self drawLine: ccp(pitchCenter-goalWidth/2 , bottom-goalDepth) :ccp(pitchCenter+goalWidth/2 , bottom-goalDepth ) :0] ;
    [self drawLine: ccp(pitchCenter-goalWidth/2 , bottom) :ccp(pitchCenter-goalWidth/2 , bottom-goalDepth) :0] ;
    [self drawLine: ccp(pitchCenter+goalWidth/2 , bottom) :ccp(pitchCenter+goalWidth/2 , bottom-goalDepth) :0] ;
    [self drawLine: ccp(pitchCenter-goalWidth/2 , bottom) :ccp(pitchCenter+goalWidth/2 , bottom) :1] ;
}

-(void) restartTickTaskTimer
{
    //CCLOG(@">>restart tick task timer");
    tickTaskActive=true;
    tickTaskTime=0;
}

-(void) deactivateTickTaskTimer
{
    tickTaskActive=false;
    tickTaskTime=0;
}

//
-(void) doKickOff {
    
    if (!kickOffDone)
    {
        NSLog(@">>Do Kick off done");
        kickOffDone=true;
        
        if (managerMode)
        {
            //CCLOG(@">> MANAGER MODE - restart tick timer");
            [self restartTickTaskTimer];
            [self setCurrentTask: taskKickOff];
            // [self restartTickTimer];
        }
        else
        {
         
                      //[self changeStateToGamePlaying];
            //CCLOG(@">> NON MANAGER MODE - schedule");
            //COMMENTED
            [self runAction:[CCActionSequence actions:
                             [CCActionDelay actionWithDuration: KICKOFF_TIME],
                             [CCActionCallFunc actionWithTarget:self selector:@selector(changeStateToGamePlaying)],nil]];
            
        }
        
        [[HudModel sharedHudModel] kickOffSpr].visible =true;
        
        //[hudLayer getKickOffSpr].visible =true;
        [ball resetBall];
        [team1 setPlayersFaceBall:ball];
        [team2 setPlayersFaceBall:ball];
        
        // set random pass rates for each team - of human team it won't be used.
        [team1 setTeamPassRate];
        [team2 setTeamPassRate];
        
        // [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"Large_Stadium-stephan_schutze-2122836113.wav"];
        if (!managerMode)
        {
            //[Util playSoundMusic:@"Large_Stadium-stephan_schutze-2122836113.wav" loop:true];
            //[self playSoundEffect:@"whistle2_rs.wav"];
            [self playSoundEffect:WHISTLE_KICK_OFF];
        }
        
       // [[[SceneManager sharedSceneManager] gameLayer] centerPitch];
      //  [[[SceneManager sharedSceneManager] gameLayer] setViewpointCenter: ccp(-100,155)];
        
        //[[[SceneManager sharedSceneManager] gameLayer] setViewpointCenter: ccp(-100,755)];
       // [self resetHalfTimePlayerLineups];
        
        //
        //CGPoint layerPos = [[[SceneManager sharedSceneManager] gameLayer] position];
        //NSLog(@">>Do Kick off done - reset center - pos : %f,%f", layerPos.x, layerPos.y);
        //cameraPos = ccp(PITCH_X_CENTER*self.scale,PITCH_Y_CENTER*self.scale);
        cameraPos = ccp(cameraPos.x,PITCH_Y_CENTER*self.scale);
        
        cameraVec = ccp(0,0);


    }
}

//
-(void) playSoundEffect:(NSString *)sndName
{
    if (![[GameModel sharedGameModel] isManagerMode])
    {
        [Util playSoundEffect:sndName];
    }
}

-(void) stopMatchClock
{
    [self unschedule: @selector(matchClock:)];
}


-(void) startMatchClock
{
    [self schedule: @selector(matchClock:) interval:1.0];
}


//
-(void) updateMatchClockManagerMode
{
    if ([self getTickTimeInSecs] != matchSecs)
    {
        //CCLOG(@">> Updating match clock : %d ", matchSecs);
        matchSecs++;
        
        //CCLOG(@">>UPDATE SCORE INFO - MANAGER MODE");
//        if (([self getTickTimeInSecs]+1) % 4 == 0) {
//            [[[SceneManager sharedSceneManager] gameInfoLayer] updateMatchEggTimer:matchSecs];
//        }
        
        //[[[HudModel sharedHudModel] timelabel] setString: [NSString stringWithFormat:@"0:%d",matchSecs]];
        
        //if (!isSecondHalf && matchSecs >= getTickTimeInSecs)
        if (!isSecondHalf && [self getTickTimeInMins] > (([GameData getMatchLength]/2)/60))
        {
            //[[[HudModel sharedHudModel] timelabel] setString: [NSString stringWithFormat:@"0:%d",matchSecs]];
            [self setMatchState:halfTime];
            isSecondHalf=true;
            
        }
        else if (isSecondHalf && [self getTickTimeInMins] > ([GameData getMatchLength]/60) && !managerModedGameOver)
        {
            //[[[HudModel sharedHudModel] timelabel] setString: [NSString stringWithFormat:@"0:%d",matchSecs]];
            //CCLOG(@">> GO TO FULL TIME......");
            [[[HudModel sharedHudModel] timelabel] setString: [NSString stringWithFormat:@"90:00"]];

            [self setMatchState:postGame];
            pauseManagerMode=true;
            managerModedGameOver=true;
        }
//        else if (isSecondHalf && [self getTickTimeInMins] > ([GameData getMatchLength]/60) && managerModedGameOver) {
//            // shouldnt get here but a bug occurs
//            // where managerModeGameOver is true
//            if ([self getMatchState] == gamePlaying) {
//                NSLog(@"** Overriding manager mode.. (HACK to fix bug)");
//            }
//            [self setMatchState:postGame];
//            pauseManagerMode=true;
//        }
    }
}

-(Boolean) doesHumanKeeperHaveBall {
    
    return  [[GameModel sharedGameModel] getMatchState] == keeperHasBall && [[GameModel sharedGameModel] isKeeperWithBallHumanPlayer];
}

-(Boolean) doesAnyKeeperHaveBall {
    
    return  [[GameModel sharedGameModel] getMatchState] == keeperHasBall;
}

-(int) getMatchSecs {
    return matchSecs;
}

//
-(void) matchClock: (CCTime)dt
{
    if ([self doesHumanKeeperHaveBall]) {
        return;
    }
    
    matchSecs++;
    
    
    [self playRandomGameSoundFx];
    
   // [[[HudModel sharedHudModel] timelabel] setString: [NSString stringWithFormat:@"0:%d :%d fps",matchSecs, frameRate]];
    
    int displayMins = (int)(((float)matchSecs/(float)[GameData getMatchLength])*90);
    
    [[[HudModel sharedHudModel] timelabel] setString: [NSString stringWithFormat:@"%d:00",displayMins]];
    

    #ifdef DO_TEST_FINISH_QUICK_MATCH

    if (matchSecs > 5) {
        [self setMatchState:fullTime];
        if ([Util random5050]) {
            [GameData setFulltimeZoom:true];
        } else {
            [GameData setFulltimeZoom:false];
        }

    }
    #endif

    if ([GameData isPracticeMatch]) {
        // set MAX PRACTICE TIME
        
        if (matchSecs >= MINS_7) {
            [self setMatchState:fullTime];
            
        }
        
        return;
    }
    
        
    if (!isSecondHalf && matchSecs >= [GameData getMatchLength]/2) {
        [self setMatchState:halfTime];
        isSecondHalf=true;
        [self playSoundEffect:SOFT_APPLAUSE];
        [self playSoundEffect:WHISTLE_FINAL2];
    }
    else if (isSecondHalf && matchSecs >= [GameData getMatchLength]) {
        [self setMatchState:fullTime];
        
        if ([Util random5050]) {
            [GameData setFulltimeZoom:true];
        } else {
            [GameData setFulltimeZoom:false];
        }
        
        [self playSoundEffect:STRONG_APPLAUSE];
        [self playSoundEffect:WHISTLE_FINAL1];
        
        [[self getTeam1] setStandOff:false];
        [[self getTeam2] setStandOff:false];

    }
    
    // play whistle sound slightly early
//    if (!isSecondHalf && matchSecs == ([GameData getMatchLength]/2)-1) {
//        [self playSoundEffect:WHISTLE_FINAL2];
//    }
//    else if (isSecondHalf && matchSecs == ([GameData getMatchLength])-1) {
//        [self playSoundEffect:WHISTLE_FINAL1];
//    }
    
    
    frameRate=0;
}

//
-(void) doHalfTime
{
    [[[HudModel sharedHudModel] exitButton] setVisible:false];
    
    if (!halfTimeSprShown)
    {
        halfTimeSprShown=true;
        [[[SceneManager sharedSceneManager] hudModel] showZoomButtons:false];

        // set random pass rates for each team - of human team it won't be used.
//        [team1 setTeamPassRate];
//        [team2 setTeamPassRate];
        
        
        //
        if (!managerMode) {
            //[self playSoundEffect:@"whistle2_rs.wav"];
            //[self playSoundEffect:WHISTLE_FINAL1];
        }
        
        if (managerMode)
        {
            [self restartTickTaskTimer];
            [self setCurrentTask: taskHalfTime];
            [self pauseTickTimer];
        }
        else
        {
            [[HudModel sharedHudModel] halftimeSpr].visible=true;
            [self unschedule: @selector(matchClock:)];
            //COMMENTED

            [self runAction:[CCActionSequence actions:
                             [CCActionDelay actionWithDuration:HALFTIME_INFO_TIME],
                             [CCActionCallFunc actionWithTarget:self selector:@selector(showHalfTimeInfo)],
                             nil]];
            
            
            
//            [self runAction:[CCActionSequence actions:
//                             [CCActionDelay actionWithDuration:HALFTIME_TIME],
//                             [CCActionCallFunc actionWithTarget:self selector:@selector(changeStateHalfTimeToKickOff)],
//                             nil]];
            
        }
        
        // swap who kicks off for second half
        if([self kickOffTeamId] == TEAM1)
        {
            [team1 setKickingOff:false];
            [team2 setKickingOff:true];
        }
        else
        {
            [team1 setKickingOff:true];
            [team2 setKickingOff:false];
        }
        
        //
        if ([team1 getPlayingDirection] == PLAYING_UP)
        {
            [team1 setPlayingDirection:PLAYING_DOWN];
            [team2 setPlayingDirection:PLAYING_UP];
        }
        else
        {
            [team1 setPlayingDirection:PLAYING_UP];
            [team2 setPlayingDirection:PLAYING_DOWN];
        }
        
        if ([GameData isPracticeMatch] || [GameData isHumanTeam]) {
            [[self getTeam1] showActivePlayerSprite:false];
            [[self getTeam1] showActiveTargetSprite:false];
        }
        
        [[self getTeam1] setStandOff:false];
        [[self getTeam2] setStandOff:false];
        
    }
}

-(void) setCameraPos:(CGPoint)camPos {
    cameraPos=ccp(camPos.x,camPos.y);
}

//
-(void) showHalfTimeInfo
{
    [[HudModel sharedHudModel]  halftimeSpr].visible=false;
    [self resetHalfTimePlayerLineups];
    [self goToHalfTime];
}

-(void) resetHalfTimePlayerLineups
{
    NSLog(@">>Reset half time player lineups...");
    [ball setPositionX:PITCH_X_CENTER Y:PITCH_Y_CENTER];
    [ball setVector:(ccp(0,0))];
    
    cameraPos = ccp(PITCH_X_CENTER,PITCH_Y_CENTER);
    cameraVec = ccp(0,0);
    [gameLayer setViewpointCenter : [ball position]];
}

//
-(void) doFullTime
{
    [[HudModel sharedHudModel]  fulltimeSpr].visible=true;
    [[[HudModel sharedHudModel] exitButton] setVisible:false];
    [[[SceneManager sharedSceneManager] hudModel] showZoomButtons:false];

    
    if ([GameData isPracticeMatch] || [GameData isHumanTeam]) {
        [[self getTeam1] showActivePlayerSprite:false];
        [[self getTeam1] showActiveTargetSprite:false];
    }
    
    [self unschedule: @selector(matchClock:)];
}


//
-(void) setKickOffTeamGoalScored
{
    if ([[self getTeamWhoScored] getTeamId] == TEAM1)
    {
        [team1 setKickingOff:false];
        [team2 setKickingOff:true];
    }
    else
    {
        [team1 setKickingOff:true];
        [team2 setKickingOff:false];
    }
}


//
-(void) doGoal
{
    //CCLOG(@">> GameLayer : doGoal");
    
    if (managerMode)
    {
        [self pauseTickTimer];
    }
    else
    {
        [self unschedule: @selector(matchClock:)];
    }
    
    [self setMatchState:goal];
    
    if (!goalSprShown)
    {
        //CCLOG(@">> GameLayer : display goal sprite");
        
        if (managerMode)
        {
            [self restartTickTaskTimer];
            [self setCurrentTask: taskGoal];
            [self pauseTickTimer];
        }
        else
        {
            [[HudModel sharedHudModel] goalSpr].visible=true;
            //COMMENTED

            int celebTime =0;
            if ([GameData isPracticeMatch]) {
                celebTime=GOAL_PRACTICE_CELEB_TIME;
            }
            else {
                celebTime=GOAL_CELEB_TIME;
            }
            
            [self runAction:[CCActionSequence actions:
                             [CCActionDelay actionWithDuration:celebTime],
                             [CCActionCallFunc actionWithTarget:self selector:@selector(changeStatetoKickOffAfterGoal)],
                             nil]];
        }
        goalSprShown=true;
        
        [[self getTeamWhoScored] updateScore];
        [self updateScoreInfo];
        [self setKickOffTeamGoalScored];
        [matchData addGoalMarker];
        [matchData addHighlightMarker];
        
        if ([GameData isPracticeMatch] || [GameData isHumanTeam]) {
            [[self getTeam1] showActivePlayerSprite:false];
            [[self getTeam1] showActiveTargetSprite:false];
        }

        
        pauseManagerMode=true;
    }
}

-(void) addHightlightMarker
{
    [matchData addHighlightMarker];
}

-(void) goalSriteCleanup
{
    
    
}

//
-(void) changeStateHalfTimeToKickOff
{
    [team1 setLineupPositions];
    [team2 setLineupPositions];

    [team1 setPlayersFaceBall:ball];
    [team2 setPlayersFaceBall:ball];
    
    [self doKickOff];
    [self setMatchState:halfTimePreKickoff];
    
    [[SceneManager sharedSceneManager]hudLayer].visible=true;
    [[SceneManager sharedSceneManager]gameInfoLayer].visible=false;
    
    [team1 showAllPlayers:true];
    [team2 showAllPlayers:true];

}


//
-(void) changeStatetoKickOffAfterGoal
{
    // allow to handle situation where human player has already continued after the goal
    if (matchState != goal) {
        return;
    }
    
    [[HudModel sharedHudModel] goalSpr].visible=false;
    [self doKickOff];
    [self setMatchState:halfTimePreKickoff]; // creat new temp state
    
    [[self getTeamWhoScored] setCelebPositionSet:false];
    //[ball setPositionX:PITCH_X_CENTER Y:PITCH_Y_CENTER];
    [ball resetBall];
    [ball moveBall:deltaTime];
    
    cameraPos = ccp(PITCH_X_CENTER,PITCH_Y_CENTER);
    cameraVec = ccp(0,0);
    [gameLayer setViewpointCenter : [ball position]];
    
    [team1 setLineupPositions];
    [team2 setLineupPositions];

    [team1 setPlayersFaceBall:ball];
    [team2 setPlayersFaceBall:ball];
    
}

//
-(void) changeStateToGamePlaying
{
    CCLOG(@">>>>> changeStateToGamePlaying");
    [ball resetBall];
//    [[[SceneManager sharedSceneManager] gameLayer] centerPitch];
//    
    if (managerMode)
    {
        //        [self resetTickTimer];
        [self restartTickTimer];
    }
    else
    {
        [self schedule: @selector(matchClock:) interval:1.0];
        [[[HudModel sharedHudModel] exitButton] setVisible:true];
        [[GameModel sharedGameModel] showScanner:true];

    }
    
    [self setMatchState:gamePlaying];
    
    [team1 setLineupPositions];
    [team2 setLineupPositions];
    
    HudModel *hl = [HudModel sharedHudModel];
    [hl goalSpr].visible=false;
    [hl halftimeSpr].visible=false;
    [hl kickOffSpr].visible =false;
    
    goalSprShown=false;
    halfTimeSprShown=false;
    kickOffDone=false;
    keeperHasBallDone=false;
    ballOutOfBoundsDone=false;
    
    if ([GameData isPracticeMatch] || [GameData isHumanTeam]) {
        [[self getTeam1] showActivePlayerSprite:true];
        [[self getTeam1] showActiveTargetSprite:true];
        
    }

    
    [[GameModel sharedGameModel] setGameState:matchStarted];
    [[GameData sharedGameDataManager] setMatchInProgress:true];
    [[[SceneManager sharedSceneManager] hudModel] showZoomButtons:true];
  //  [[[SceneManager sharedSceneManager] hudModel] showInGamePlayButton:false];
    
    
  //  NSLog(@">>>> Game Layer after state playing : %f",[gameLayer position].y);
    //[self updateScoreInfo];
}

//
-(void)setStateKeeperHasBall
{
    [self setMatchState:keeperHasBall];
}


//
-(void) doBallOutOfBounds: (CCTime)dt {
    
    //NSLog(@"....doBallOutOfBounds...");
    
    if (!ballOutOfBoundsDone) {
         //NSLog(@"....doBallOutOfBoundsDone is false...");
        ballOutOfBoundsDone=true;
        [team1 resetTargetPositionsForGoalKick];
        [team2 resetTargetPositionsForGoalKick];

        [self setMatchState:ballOutOfBounds];
        
        if (managerMode)
        {
            [self restartTickTaskTimer];
            [self setCurrentTask: taskBallOutOfBounds];
           // [self pauseTickTimer];
        }
        else
        {
            //COMMENTED
            NSLog(@"....set BallOutOfBoundsDone timer...");

            [self runAction:[CCActionSequence actions:
                             [CCActionDelay actionWithDuration:BALL_OUT_OF_BOUNDS_TIME],
                             [CCActionCallFunc actionWithTarget:self selector:@selector(changeStatetoGoalKickFromOutOfBounds)], nil]];
        }
       

    }
}

//
-(void) doBallOutOfBoundsCornerKick: (CCTime)dt {
    
    //NSLog(@"....doBallOutOfBounds...");
    
    if (!ballOutOfBoundsDone) {
        //NSLog(@"....doBallOutOfBoundsDone is false...");
        ballOutOfBoundsDone=true;
        [team1 resetTargetPositionsForGoalKick];
        [team2 resetTargetPositionsForGoalKick];
        
        [self setMatchState:ballOutOfBounds];
        
        if (managerMode)
        {
            [self restartTickTaskTimer];
            [self setCurrentTask: taskBallOutOfBounds];
            // [self pauseTickTimer];
        }
        else
        {
            //COMMENTED
            NSLog(@"....set BallOutOfBoundsDone timer...");
            
            [self runAction:[CCActionSequence actions:
                             [CCActionDelay actionWithDuration:BALL_OUT_OF_BOUNDS_TIME],
                             [CCActionCallFunc actionWithTarget:self selector:@selector(changeStatetoCornerKickFromOutOfBounds)], nil]];
        }
    }
}


//
-(void) doBallOutOfBoundsThrowIn: (CCTime)dt  :(CGPoint)pos {
    
    //NSLog(@"....doBallOutOfBounds...");
    
    if (!ballOutOfBoundsDone) {
        //NSLog(@"....doBallOutOfBoundsDone is false...");
        ballOutOfBoundsDone=true;
       // [team1 resetTargetPositionsForGoalKick];
        //[team2 resetTargetPositionsForGoalKick];
        
        [self setMatchState:ballOutOfBoundsThrowIn];
        
        if (managerMode)
        {
            [self restartTickTaskTimer];
            [self setCurrentTask: taskBallOutOfBounds];
            // [self pauseTickTimer];
        }
        else
        {
            //COMMENTED
            NSLog(@"....set BallOutOfBoundsDone timer...");
            
            [self runAction:[CCActionSequence actions:
                             [CCActionDelay actionWithDuration:BALL_OUT_OF_BOUNDS_TIME],
                             [CCActionCallFunc actionWithTarget:self selector:@selector(changeStatetoThrowninFromOutOfBounds)], nil]];
        }
    }
}


-(double) getRandomKeeperBallTime {
    
    double time =0;
    int randTime = RANDOM_KEEPER_HAS_BALL_TIME_BASE + [Util random:RANDOM_KEEPER_HAS_BALL_TIME_RANGE];
    time  = (double)randTime/(double)100;
    NSLog(@"* Random keeper time : %f",time);
    return time;
}

//
-(void) doKeeperHasBall: (CCTime)dt
{
    //NSLog(@">>KeeperHasBallDOne... : %d", keeperHasBallDone );
    if (!keeperHasBallDone)
    {
        //NSLog(@">>KeeperHasBallDOne...");
        
        [self setMatchState:keeperHasBall];
        [team1 resetTargetPositionsForGoalKick];
        [team2 resetTargetPositionsForGoalKick];
        //TODO
        [[[HudModel sharedHudModel] exitButton] setVisible:true];
        
        
        
        keeperHasBallDone=true;
        
        if (![self isKeeperWithBallHumanPlayer])
        {
            //NSLog(@">>Ball With Comp Keeper...");

            if (managerMode)
            {
                [self restartTickTaskTimer];
                [self setCurrentTask: taskKeeperHasBall];
                [self pauseTickTimer];
            }
            else
            {
                //COMMENTED
                double ballTime=0;
                
                if ([GameData isPracticeMatch]) {
                    // ballTime=KEEPER_PRACTICE_HAS_BALL_TIME;
                    ballTime=[self getRandomKeeperBallTime];
                } else {
                    //ballTime=KEEPER_HAS_BALL_TIME;
                    ballTime=[self getRandomKeeperBallTime];
                }

                //NSLog(@">>Start change game to playing timer");

                [self runAction:[CCActionSequence actions:
                                 [CCActionDelay actionWithDuration:ballTime],
                                 [CCActionCallFunc actionWithTarget:self selector:@selector(changeStatetoGamePlayingFromGoalKick)], nil]];
            }
        } else {
             //NSLog(@">>Ball With Human Keeper...");
        }
        
        //[matchData addHighlightMarker];
    }
    
    [[team1 getKeeper] moveKeeper:dt :ball];
    [[team2 getKeeper] moveKeeper:dt :ball];
    
    [team1 updatePlayersGoalKick:dt :ball];
    [team2 updatePlayersGoalKick:dt :ball];
   
    //CHANGED - temp
    //[ball moveBall:dt];
    [ball moveBallKeeperPossesion:dt];
    
    //
    CGPoint ballPos = [ball position];
    CGPoint testBallPos = ccp ( PITCH_RIGHT -[ball z], ballPos.y);
    [testBall setPosition:testBallPos];
    
    CGPoint team1KeeperPos = [[team1 getKeeper] position];
    CGPoint team2KeeperPos = [[team2 getKeeper] position];
    [testKeeperTeam1 setPosition: ccp (PITCH_RIGHT -[[team1 getKeeper] z], team1KeeperPos.y)];
    [testKeeperTeam2 setPosition: ccp (PITCH_RIGHT -[[team2 getKeeper] z], team2KeeperPos.y)];
    
    cameraPos = ccp(cameraPos.x,ballPos.y*self.scale);
    cameraVec = ccp(0,0);
  //  NSLog(@">>Finished...Ball With Human Keeper...");


}

//
-(void) startMainMenuTimer
{
    if (!goToMainMenuDone)
    {
        goToMainMenuDone=true;
        //COMMENTED

        [self runAction:[CCActionSequence actions:
                         [CCActionDelay actionWithDuration:5],
                         [CCActionCallFunc actionWithTarget:self selector:@selector(goToMainMenu)], nil]];
    }
}

//
-(void) startFullTimeInfoTimer
{
    if (!goToFullTimeInfoDone)
    {
        goToFullTimeInfoDone=true;
        //COMMENTED

        [self runAction:[CCActionSequence actions:
                         [CCActionDelay actionWithDuration:5],
                         [CCActionCallFunc actionWithTarget:self selector:@selector(goToFullTime)], nil]];
 
    }
}

//
-(void) startHalfTimeInfoTimer
{
    if (!goToHalfTimeInfoDone)
    {
        goToHalfTimeInfoDone=true;
        //COMMENTED

        [self runAction:[CCActionSequence actions:
                         [CCActionDelay actionWithDuration:5],
                         [CCActionCallFunc actionWithTarget:self selector:@selector(goToHalfTime)], nil]];
    }
}


//
-(void) showPreMatchInfo
{
    //CCLOG(@">>>*****show Pre match info..>");
    if (!showPremMatchInfoDone)
    {
        [[[SceneManager sharedSceneManager] gameInfoLayer] setPreMatchInfo];
        showPremMatchInfoDone=true;
    }
}

-(void) goToMainMenu
{
    [SceneManager goMenu];
    goToMainMenuDone=false;
}

-(void) goToFullTime
{
    //CCLOG(@">> GO TO FULL TIME....");
    [self setMatchState:postGame];
    [self setGameState:matchInfoFullTime];
    [[HudModel sharedHudModel] fulltimeSpr].visible=false;
    [[SceneManager sharedSceneManager] hudLayer].visible=false;
    [[SceneManager sharedSceneManager] gameInfoLayer].visible=true;
    [[[SceneManager sharedSceneManager] gameInfoLayer] setFullTimeInfo];
}

-(void) goToHalfTime
{
    [self setMatchState:halfTimeInfo];
    [[HudModel sharedHudModel] halftimeSpr].visible=false;
    [[SceneManager sharedSceneManager] hudLayer].visible=false;
    [[SceneManager sharedSceneManager] gameInfoLayer].visible=true;
    [[[SceneManager sharedSceneManager] gameInfoLayer]setHalfTimeInfo];
}


//
-(bool) isKeeperWithBallHumanPlayerOriginal
{
    NSLog(@">> KeeperWithBall Team : %d", [[[self getKeeperWithBall] team] getTeamId]);
    NSLog(@">> KeeperWithBall Team - isHuman : %d", [[[self getKeeperWithBall] team] isHumanTeam]);
    
    return [[[self getKeeperWithBall] team] isHumanTeam];
    
}

//
-(Player *) getKeeperWithBall
{
   // NSLog(@">>Team with ball : %d", [ball teamWithBallId]);
    return ([ball teamWithBallId] == TEAM1 ? [team1 getKeeper] : [team2 getKeeper]);
}

//
-(bool) isKeeperWithBallHumanPlayer

{
    //NSLog(@">>Team with ball : %d", [ball teamWithBallId]);
    if ([ball position].y < PITCH_Y_CENTER) {
        if ([team1 getPlayingDirection] == PLAYING_UP) {
            return [team1 isHumanTeam];
        } else {
            return false;
        }
    } else {
        if ([team1 getPlayingDirection] == PLAYING_DOWN) {
            return [team1 isHumanTeam];
        } else {
            return false;
        }
    }
}


//
-(bool) isHalfOrFullTime
{
    if (matchState == goal || matchState == halfTime || matchState == fullTime || matchState == halfTimeInfo)
        return true;
    
    return false;
}


//
-(void) changeStatetoGamePlayingFromCornerKick
{
    //NSLog(@"**>> changeStatetoGamePlayingFromGoalKick");
    
    if (![[GameModel sharedGameModel] isHalfOrFullTime])
    {
        if (managerMode)
        {
            [self restartTickTimer];
        }
        
        [self setMatchState:gamePlaying];
       // keeperHasBallDone=false;
        
       // Player *keeper = [self getKeeperWithBall];
        
        //TODO - kickball should be done in the player class
        //[keeper doGoalKick:ball];
        
       // [ball moveBall:deltaTime];
        [[[HudModel sharedHudModel] exitButton] setVisible:true];
    }
}
//
-(void) changeStatetoGamePlayingFromGoalKick
{
    //NSLog(@"**>> changeStatetoGamePlayingFromGoalKick");

    if (![[GameModel sharedGameModel] isHalfOrFullTime])
    {
        if (managerMode)
        {
            [self restartTickTimer];
        }
        
        [self setMatchState:gamePlaying];
        keeperHasBallDone=false;
        
        Player *keeper = [self getKeeperWithBall];
        
        //TODO - kickball should be done in the player class
        [keeper doGoalKick:ball];
        
        [ball moveBall:deltaTime];
        [[[HudModel sharedHudModel] exitButton] setVisible:true];
    }
}


//
-(void) changeStatetoThrownInFromOutOfBounds
{
    //NSLog(@"**>> changeStatetoGamePlayingFromGoalKick");
    
    if (![[GameModel sharedGameModel] isHalfOrFullTime])
    {
        if (managerMode)
        {
            [self restartTickTimer];
        }
        
        [self setMatchState:gamePlaying];
       
        //keeperHasBallDone=false;
        
        // Player *keeper = [self getKeeperWithBall];
        
        //TODO - kickball should be done in the player class
        //[keeper doGoalKick:ball];
        
        [ball moveBall:deltaTime];
        [[[HudModel sharedHudModel] exitButton] setVisible:true];
    }
}

-(void) changeStatetoGamePlayingFromGoalKickHuman
{
    if (![[GameModel sharedGameModel] isHalfOrFullTime])
    {
        [self setMatchState:gamePlaying];
        keeperHasBallDone=false;
        [ball moveBall:deltaTime];
        [[[HudModel sharedHudModel] exitButton] setVisible:true];
    }
}

-(Player *) getKeeperPositionForGoalKick {
    if ([ball position].y < PITCH_Y_CENTER) {
        // ball is at top half of the pitch
        
        if ([team1 isPlayingUpPitch]) {
            return [team1 getKeeper];
        }
        else {
            return [team2 getKeeper];
        }
    }
    else
    {
        if ([team1 isPlayingUpPitch]) {
            return [team2 getKeeper];
        }
        else {
            return [team1 getKeeper];
        }

    }
}


-(CGPoint) getBallGoalKickPosition {
    if ([ball position].y < PITCH_Y_CENTER) {
        return CGPointMake(PITCH_X_CENTER, PITCH_BOTTOM+30);
    }
    else
    {
        return CGPointMake(PITCH_X_CENTER, PITCH_TOP-30);
    }

}

-(void) changeStatetoGoalKickFromOutOfBounds
{
    if (![[GameModel sharedGameModel] isHalfOrFullTime])
    {
        NSLog(@"....changeStatetoGoalKickFromOutOfBounds - set state to keeper has ball now");

        CGPoint ballPos = [self getBallGoalKickPosition];
        [ball setPositionX:ballPos.x Y:ballPos.y];
        
        [self setStateKeeperHasBall];
        
        ballOutOfBoundsDone=false;
        keeperHasBallDone=false;

        [ball setZ:0.0f];
        [ball setVector:CGPointMake(0.0, 0.0)];
        [ball moveBall:deltaTime];
        [ball setAttached:false];
        
        //
        [matchData addHighlightMarker];
    }
}

-(Team *) getTeamTakingCorner{
    
    if ([ball position].y > PITCH_Y_CENTER) {
        if ([[[GameModel sharedGameModel] getTeam1] isPlayingUpPitch]) {
            return [[GameModel sharedGameModel] getTeam1];
        }
        else {
            return [[GameModel sharedGameModel] getTeam2];
        }
    } else {
        if ([[[GameModel sharedGameModel] getTeam1] isPlayingUpPitch]) {
            return [[GameModel sharedGameModel] getTeam2];
        }
        else {
            return [[GameModel sharedGameModel] getTeam1];
        }
    }
    
}

-(void) changeStatetoCornerKickFromOutOfBounds
{
    if (![[GameModel sharedGameModel] isHalfOrFullTime])
    {
        NSLog(@"....changeStatetoCornerKickFromOutOfBounds");
        
        //CGPoint ballPos = [self getBallGoalKickPosition];
        
        int ballX=0;
        int ballY=0;
        int playerX=0;
        int playerY=0;
        
        if ([ball position].x < PITCH_X_CENTER) {
            ballX=PITCH_LEFT+5;
            playerX=PITCH_LEFT;
        } else {
            ballX=PITCH_RIGHT-5;
            playerX=PITCH_RIGHT;
        }
        
        if ([ball position].y < PITCH_Y_CENTER) {
            ballY=PITCH_BOTTOM+5;
            playerY=PITCH_BOTTOM;
        } else {
            ballY=PITCH_TOP-5;
            playerY=PITCH_TOP;
        }

        
        [ball setPositionX:ballX Y:ballY];

        
        //[self setStateKeeperHasBall];
        [self setMatchState:cornerKick];
        
        ballOutOfBoundsDone=false;
        keeperHasBallDone=false;
        
        [ball setZ:0.0f];
        [ball setVector:CGPointMake(0.0, 0.0)];
        [ball moveBall:deltaTime];
        [ball setAttached:false];
        
        //
       // [matchData addHighlightMarker];
        Team* cornerTeam = [self getTeamTakingCorner];
        //[[team2 getMainPlayer] setPosition:ccp(playerX,playerY)];
        [[cornerTeam getPlayer:PLAYER8_ID] setPosition:ccp(playerX,playerY)];
        [self runAction:[CCActionSequence actions:
                         [CCActionDelay actionWithDuration:2],
                         [CCActionCallFunc actionWithTarget:self selector:@selector(changeStatetoGamePlayingFromGoalKick)], nil]];
        
    }
}


-(void) changeStatetoThrowninFromOutOfBounds
{
    if (![[GameModel sharedGameModel] isHalfOrFullTime])
    {
        NSLog(@"....changeStateToThrowInFromOutOfBounds");
        
        [self setMatchState:throwIn];
        
        ballOutOfBoundsDone=false;
        //keeperHasBallDone=false;
        
        if ([ball position].x < PITCH_X_CENTER) {
            [ball setPositionX:PITCH_LEFT+15 Y:[ball position].y];
        } else {
            [ball setPositionX:PITCH_RIGHT-15 Y:[ball position].y];
        }
        
        [ball setZ:0.0f];
        [ball setVector:CGPointMake(0.0, 0.0)];
        [ball moveBall:deltaTime];
        [ball setAttached:false];
        
        //
        // [matchData addHighlightMarker];
        
        Team* throwInTeam;
        
        if ([ball teamWithBallId] == TEAM1) {
            [[GameModel sharedGameModel] getTeam2];
        } else {
            [[GameModel sharedGameModel] getTeam1];
        }
      
        int ballY = [ball position].y;
  
        if ([ball position].x < PITCH_X_CENTER) {
            [[throwInTeam getMainPlayer] setPosition:ccp( [ball position].x, ballY)];
        } else {
            [[throwInTeam getMainPlayer] setPosition:ccp( [ball position].x, ballY)];
        }

        
        [self runAction:[CCActionSequence actions:
                         [CCActionDelay actionWithDuration:2],
                         [CCActionCallFunc actionWithTarget:self selector:@selector(changeStatetoThrownInFromOutOfBounds)], nil]];
        
    }
}


//
-(void) setReplayState:(enum replayState) newReplayState
{
    CCLOG(@">> setReplayState : %d", newReplayState);
    enum replayState prevReplayState = replayState;
    replayState = newReplayState;
    
    //new state
    if (prevReplayState != replayState)
    {
        replayTimer=0;
    }
    
    if ((prevReplayState == replayForward && newReplayState == replayForward) ||
        (prevReplayState == replayRewind && newReplayState == replayRewind))
    {
        if (replaySpeed++ > 10)
        {
            replaySpeed = 10;
        }
    }
    
    if ((prevReplayState != replayForward && newReplayState == replayForward) ||
        (prevReplayState != replayRewind && newReplayState == replayRewind))
    {
        replaySpeed=1;
    }
    
    
    if (replayState == replayPlay)
    {
        replaySpeed=1;
    }
    
}

//
-(void) showFirstReplayFrame
{
    [self replayFrame : [matchData getCurrentFrame]];
}

//
-(void) replayMatch
{
    //CCLOG(@">> Replay Match - state : %d",replayState);
    replayTimer++;
    //replaySpeed=1;
    //replayState=replayForward;
    // replaySpeed=2;
    int replayCount = 1;
    //CCLOG(@">> Replay match, frame = %d", [matchData getCurrentFrameId]);
    
    switch (replayState)
    {
        case noReplay:
            
            break;
            
        case replayPlay:
            //CCLOG(@">>>ReplayPlay...");
            if (replaySpeed==1)
            {
                if (replayTimer%2==0)
                {
                    [self replayFrame : [matchData getCurrentFrame]];
                }
            }
            else
            {
                [self replayFrame : [matchData getCurrentFrame]];
            }
            break;
            
        case replayPause:
            [self replayFrame : [matchData getPausedFrame]];
            break;
            
        case replayStop:
            [self replayFrame : [matchData getPausedFrame]];
            break;
            
        case replayForward:
            
            while (replayCount <= replaySpeed)
            {
                [self replayFrame : [matchData getCurrentFrame]];
                replayCount++;
            }
            break;
            
        case replayRewind:
            //[self replayFrame : [matchData getPrevFrame]];
            while (replayCount <= replaySpeed)
            {
                [self replayFrame : [matchData getPrevFrame]];
                replayCount++;
            }
            break;
            
        case replayFastForward:
            
            break;
            
        case replayFastRewind:
            while (replayCount < replaySpeed)
            {
                [self replayFrame : [matchData getPrevFrame]];
                replayCount++;
            }
            
            break;
            
            
            
        default:
            break;
    }
    replayCount=0;
    //[self replayFrame : [matchData getCurrentFrame]];
}

//
-(void) replayFrame:(ReplayFrame *)replayFrame
{
    if (replayFrame == nil) {
        return;
    }
    
    //[ball updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:0] position]];
    // ball
    ReplayItem *ballReplayItem = [replayFrame getReplayItemAtIndex:0];
    
    //CCLOG(@">> zOrder = %d scale =%f", [ballReplayItem zOrder],[ballReplayItem scale]);
    [ball updateReplaySpritePositionPlus : [ballReplayItem position] :[ballReplayItem height] :[ballReplayItem zOrder] :[ballReplayItem scale]];
    
    
    
    //team 1
    
    //
    [[team1 getPlayer:0] setZ: [[replayFrame getReplayItemAtIndex:1] height]];
    [[team1 getPlayer:1] setZ: [[replayFrame getReplayItemAtIndex:2] height]];
    [[team1 getPlayer:2] setZ: [[replayFrame getReplayItemAtIndex:3] height]];
    [[team1 getPlayer:3] setZ: [[replayFrame getReplayItemAtIndex:4] height]];
    [[team1 getPlayer:4] setZ: [[replayFrame getReplayItemAtIndex:5] height]];
    [[team1 getPlayer:5] setZ: [[replayFrame getReplayItemAtIndex:6] height]];
    [[team1 getPlayer:6] setZ: [[replayFrame getReplayItemAtIndex:7] height]];
    [[team1 getPlayer:7] setZ: [[replayFrame getReplayItemAtIndex:8] height]];
    [[team1 getPlayer:8] setZ: [[replayFrame getReplayItemAtIndex:9] height]];
    [[team1 getPlayer:9] setZ: [[replayFrame getReplayItemAtIndex:10] height]];
    [[team1 getPlayer:10] setZ: [[replayFrame getReplayItemAtIndex:11] height]];
    

    //
    [[team1 getPlayer:0] updateReplayKeeperSpritePosition : [[replayFrame getReplayItemAtIndex:1] position]];
    [[team1 getPlayer:1] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:2] position]];
    [[team1 getPlayer:2] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:3] position]];
    [[team1 getPlayer:3] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:4] position]];
    [[team1 getPlayer:4] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:5] position]];
    [[team1 getPlayer:5] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:6] position]];
    [[team1 getPlayer:6] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:7] position]];
    [[team1 getPlayer:7] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:8] position]];
    [[team1 getPlayer:8] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:9] position]];
    [[team1 getPlayer:9] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:10] position]];
    [[team1 getPlayer:10] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:11] position]];

    
    //
    [[team1 getPlayer:0] setSpriteRotation : [[replayFrame getReplayItemAtIndex:1] spriteRotation]];
    [[team1 getPlayer:1] setSpriteRotation : [[replayFrame getReplayItemAtIndex:2] spriteRotation]];
    [[team1 getPlayer:2] setSpriteRotation : [[replayFrame getReplayItemAtIndex:3] spriteRotation]];
    [[team1 getPlayer:3] setSpriteRotation : [[replayFrame getReplayItemAtIndex:4] spriteRotation]];
    [[team1 getPlayer:4] setSpriteRotation : [[replayFrame getReplayItemAtIndex:5] spriteRotation]];
    [[team1 getPlayer:5] setSpriteRotation : [[replayFrame getReplayItemAtIndex:6] spriteRotation]];
    [[team1 getPlayer:6] setSpriteRotation : [[replayFrame getReplayItemAtIndex:7] spriteRotation]];
    [[team1 getPlayer:7] setSpriteRotation : [[replayFrame getReplayItemAtIndex:8] spriteRotation]];
    [[team1 getPlayer:8] setSpriteRotation : [[replayFrame getReplayItemAtIndex:9] spriteRotation]];
    [[team1 getPlayer:9] setSpriteRotation : [[replayFrame getReplayItemAtIndex:10] spriteRotation]];
    [[team1 getPlayer:10] setSpriteRotation : [[replayFrame getReplayItemAtIndex:11] spriteRotation]];

    //
    [[team1 getPlayer:0] setAnimFrame : [[replayFrame getReplayItemAtIndex:1] frame]];
    [[team1 getPlayer:1] setAnimFrame : [[replayFrame getReplayItemAtIndex:2] frame]];
    [[team1 getPlayer:2] setAnimFrame : [[replayFrame getReplayItemAtIndex:3] frame]];
    [[team1 getPlayer:3] setAnimFrame : [[replayFrame getReplayItemAtIndex:4] frame]];
    [[team1 getPlayer:4] setAnimFrame : [[replayFrame getReplayItemAtIndex:5] frame]];
    [[team1 getPlayer:5] setAnimFrame : [[replayFrame getReplayItemAtIndex:6] frame]];
    [[team1 getPlayer:6] setAnimFrame : [[replayFrame getReplayItemAtIndex:7] frame]];
    [[team1 getPlayer:7] setAnimFrame : [[replayFrame getReplayItemAtIndex:8] frame]];
    [[team1 getPlayer:8] setAnimFrame : [[replayFrame getReplayItemAtIndex:9] frame]];
    [[team1 getPlayer:9] setAnimFrame : [[replayFrame getReplayItemAtIndex:10] frame]];
    [[team1 getPlayer:10] setAnimFrame : [[replayFrame getReplayItemAtIndex:11] frame]];

    //
    [[team1 getPlayer:0] setFrameName : [[replayFrame getReplayItemAtIndex:1] frameName]];
    [[team1 getPlayer:1] setFrameName : [[replayFrame getReplayItemAtIndex:2] frameName]];
    [[team1 getPlayer:2] setFrameName : [[replayFrame getReplayItemAtIndex:3] frameName]];
    [[team1 getPlayer:3] setFrameName : [[replayFrame getReplayItemAtIndex:4] frameName]];
    [[team1 getPlayer:4] setFrameName : [[replayFrame getReplayItemAtIndex:5] frameName]];
    [[team1 getPlayer:5] setFrameName : [[replayFrame getReplayItemAtIndex:6] frameName]];
    [[team1 getPlayer:6] setFrameName : [[replayFrame getReplayItemAtIndex:7] frameName]];
    [[team1 getPlayer:7] setFrameName : [[replayFrame getReplayItemAtIndex:8] frameName]];
    [[team1 getPlayer:8] setFrameName : [[replayFrame getReplayItemAtIndex:9] frameName]];
    [[team1 getPlayer:9] setFrameName : [[replayFrame getReplayItemAtIndex:10] frameName]];
    [[team1 getPlayer:10] setFrameName : [[replayFrame getReplayItemAtIndex:11] frameName]];

    
    //anim
    [[team1 getPlayer:0] doKeeperReplayAnim];
    [[team1 getPlayer:1] doPlayerReplayAnim];
    [[team1 getPlayer:2] doPlayerReplayAnim];
    [[team1 getPlayer:3] doPlayerReplayAnim];
    [[team1 getPlayer:4] doPlayerReplayAnim];
    [[team1 getPlayer:5] doPlayerReplayAnim];
    [[team1 getPlayer:6] doPlayerReplayAnim];
    [[team1 getPlayer:7] doPlayerReplayAnim];
    [[team1 getPlayer:8] doPlayerReplayAnim];
    [[team1 getPlayer:9] doPlayerReplayAnim];
    [[team1 getPlayer:10] doPlayerReplayAnim];

    
    //team 2
    
    //
    [[team2 getPlayer:0] setZ: [[replayFrame getReplayItemAtIndex:12] height]];
    [[team2 getPlayer:1] setZ: [[replayFrame getReplayItemAtIndex:13] height]];
    [[team2 getPlayer:2] setZ: [[replayFrame getReplayItemAtIndex:14] height]];
    [[team2 getPlayer:3] setZ: [[replayFrame getReplayItemAtIndex:15] height]];
    [[team2 getPlayer:4] setZ: [[replayFrame getReplayItemAtIndex:16] height]];
    [[team2 getPlayer:5] setZ: [[replayFrame getReplayItemAtIndex:17] height]];
    [[team2 getPlayer:6] setZ: [[replayFrame getReplayItemAtIndex:18] height]];
    [[team2 getPlayer:7] setZ: [[replayFrame getReplayItemAtIndex:19] height]];
    [[team2 getPlayer:8] setZ: [[replayFrame getReplayItemAtIndex:20] height]];
    [[team2 getPlayer:9] setZ: [[replayFrame getReplayItemAtIndex:21] height]];
    [[team2 getPlayer:10] setZ: [[replayFrame getReplayItemAtIndex:22] height]];

    
    //
    [[team2 getPlayer:0] updateReplayKeeperSpritePosition : [[replayFrame getReplayItemAtIndex:12] position]];
    [[team2 getPlayer:1] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:13] position]];
    [[team2 getPlayer:2] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:14] position]];
    [[team2 getPlayer:3] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:15] position]];
    [[team2 getPlayer:4] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:16] position]];
    [[team2 getPlayer:5] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:17] position]];
    [[team2 getPlayer:6] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:18] position]];
    [[team2 getPlayer:7] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:19] position]];
    [[team2 getPlayer:8] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:20] position]];
    [[team2 getPlayer:9] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:21] position]];
    [[team2 getPlayer:10] updateReplaySpritePosition : [[replayFrame getReplayItemAtIndex:22] position]];

    
    //
    [[team2 getPlayer:0] setSpriteRotation : [[replayFrame getReplayItemAtIndex:12] spriteRotation]];
    [[team2 getPlayer:1] setSpriteRotation : [[replayFrame getReplayItemAtIndex:13] spriteRotation]];
    [[team2 getPlayer:2] setSpriteRotation : [[replayFrame getReplayItemAtIndex:14] spriteRotation]];
    [[team2 getPlayer:3] setSpriteRotation : [[replayFrame getReplayItemAtIndex:15] spriteRotation]];
    [[team2 getPlayer:4] setSpriteRotation : [[replayFrame getReplayItemAtIndex:16] spriteRotation]];
    [[team2 getPlayer:5] setSpriteRotation : [[replayFrame getReplayItemAtIndex:17] spriteRotation]];
    [[team2 getPlayer:6] setSpriteRotation : [[replayFrame getReplayItemAtIndex:18] spriteRotation]];
    [[team2 getPlayer:7] setSpriteRotation : [[replayFrame getReplayItemAtIndex:19] spriteRotation]];
    [[team2 getPlayer:8] setSpriteRotation : [[replayFrame getReplayItemAtIndex:20] spriteRotation]];
    [[team2 getPlayer:9] setSpriteRotation : [[replayFrame getReplayItemAtIndex:21] spriteRotation]];
    [[team2 getPlayer:10] setSpriteRotation : [[replayFrame getReplayItemAtIndex:22] spriteRotation]];

    //
    [[team2 getPlayer:0] setAnimFrame : [[replayFrame getReplayItemAtIndex:12] frame]];
    [[team2 getPlayer:1] setAnimFrame : [[replayFrame getReplayItemAtIndex:13] frame]];
    [[team2 getPlayer:2] setAnimFrame : [[replayFrame getReplayItemAtIndex:14] frame]];
    [[team2 getPlayer:3] setAnimFrame : [[replayFrame getReplayItemAtIndex:15] frame]];
    [[team2 getPlayer:4] setAnimFrame : [[replayFrame getReplayItemAtIndex:16] frame]];
    [[team2 getPlayer:5] setAnimFrame : [[replayFrame getReplayItemAtIndex:17] frame]];
    [[team2 getPlayer:6] setAnimFrame : [[replayFrame getReplayItemAtIndex:18] frame]];
    [[team2 getPlayer:7] setAnimFrame : [[replayFrame getReplayItemAtIndex:19] frame]];
    [[team2 getPlayer:8] setAnimFrame : [[replayFrame getReplayItemAtIndex:20] frame]];
    [[team2 getPlayer:9] setAnimFrame : [[replayFrame getReplayItemAtIndex:21] frame]];
    [[team2 getPlayer:10] setAnimFrame : [[replayFrame getReplayItemAtIndex:22] frame]];
    
    
    //
    [[team2 getPlayer:0] setFrameName : [[replayFrame getReplayItemAtIndex:12] frameName]];
    [[team2 getPlayer:1] setFrameName : [[replayFrame getReplayItemAtIndex:13] frameName]];
    [[team2 getPlayer:2] setFrameName : [[replayFrame getReplayItemAtIndex:14] frameName]];
    [[team2 getPlayer:3] setFrameName : [[replayFrame getReplayItemAtIndex:15] frameName]];
    [[team2 getPlayer:4] setFrameName : [[replayFrame getReplayItemAtIndex:16] frameName]];
    [[team2 getPlayer:5] setFrameName : [[replayFrame getReplayItemAtIndex:17] frameName]];
    [[team2 getPlayer:6] setFrameName : [[replayFrame getReplayItemAtIndex:18] frameName]];
    [[team2 getPlayer:7] setFrameName : [[replayFrame getReplayItemAtIndex:19] frameName]];
    [[team2 getPlayer:8] setFrameName : [[replayFrame getReplayItemAtIndex:20] frameName]];
    [[team2 getPlayer:9] setFrameName : [[replayFrame getReplayItemAtIndex:21] frameName]];
    [[team2 getPlayer:10] setFrameName : [[replayFrame getReplayItemAtIndex:22] frameName]];

    
    //anim
    [[team2 getPlayer:0] doKeeperReplayAnim];
    [[team2 getPlayer:1] doPlayerReplayAnim];
    [[team2 getPlayer:2] doPlayerReplayAnim];
    [[team2 getPlayer:3] doPlayerReplayAnim];
    [[team2 getPlayer:4] doPlayerReplayAnim];
    [[team2 getPlayer:5] doPlayerReplayAnim];
    [[team2 getPlayer:6] doPlayerReplayAnim];
    [[team2 getPlayer:7] doPlayerReplayAnim];
    [[team2 getPlayer:8] doPlayerReplayAnim];
    [[team2 getPlayer:9] doPlayerReplayAnim];
    [[team2 getPlayer:10] doPlayerReplayAnim];
    
    
    //    [[team2 getPlayer:0] setSpritePosition: [[replayFrame getReplayItemAtIndex:11] position]];
    //    [[team2 getPlayer:1] setSpritePosition: [[replayFrame getReplayItemAtIndex:12] position]];
    //    [[team2 getPlayer:2] setSpritePosition: [[replayFrame getReplayItemAtIndex:13] position]];
    //    [[team2 getPlayer:3] setSpritePosition: [[replayFrame getReplayItemAtIndex:14] position]];
    //    [[team2 getPlayer:4] setSpritePosition: [[replayFrame getReplayItemAtIndex:15] position]];
    //    [[team2 getPlayer:5] setSpritePosition: [[replayFrame getReplayItemAtIndex:16] position]];
    //    [[team2 getPlayer:6] setSpritePosition: [[replayFrame getReplayItemAtIndex:17] position]];
    //    [[team2 getPlayer:7] setSpritePosition: [[replayFrame getReplayItemAtIndex:18] position]];
    //    [[team2 getPlayer:8] setSpritePosition: [[replayFrame getReplayItemAtIndex:19] position]];
    //    [[team2 getPlayer:9] setSpritePosition: [[replayFrame getReplayItemAtIndex:20] position]];
    
    //[self setViewpointCenter : [[replayFrame getReplayItemAtIndex:21] position]];
    CGPoint camPos = [[replayFrame getReplayItemAtIndex:23] position];
   // cameraPos = camPos;
    //NSLog(@">>Scale %f",self.scale);
    //NSLog(@">Cam Pos Y : %f",camPos.y);
    float replayScale=[[[SceneManager sharedSceneManager] gameLayer] scale];
    
    if (replayScale>=1.0) {
        cameraPos = camPos;
        //cameraPos = ccp(PITCH_X_CENTER,camPos.y);

    } else {
        //NSLog(@">>Scale less than 0.7..");
        if (replayScale<0.5) {
// /           cameraPos = ccp(PITCH_X_CENTER, PITCH_Y_CENTER*replayScale);
            cameraPos = ccp(PITCH_X_CENTER,155);
            
        } else {
            //cameraPos = ccp(camPos.x, camPos.y*replayScale);
            cameraPos = ccp(PITCH_X_CENTER,camPos.y*replayScale);
            
        }
        //[gameLayer setViewpointCenter : camPos];

    }
    //cameraPos = ccp(camPos.x*0.5, camPos.y*0.5);
   // cameraPos = ccp(PITCH_X_CENTER, PITCH_Y_CENTER/2);
    //cameraPos = ccp(PITCH_X_CENTER+400, camPos.y*self.scale);
    //
    
    [gameLayer setViewpointCenter : camPos];
    
}

//
-(void) saveMatchData
{
    ReplayFrame *replayFrame = [[ReplayFrame alloc] init];
    
    ReplayItem *ballData = [[ReplayItem alloc] init];
    ReplayItem *team1P1 = [[ReplayItem alloc] init];
    ReplayItem *team1P2 = [[ReplayItem alloc] init];
    ReplayItem *team1P3 = [[ReplayItem alloc] init];
    ReplayItem *team1P4 = [[ReplayItem alloc] init];
    ReplayItem *team1P5 = [[ReplayItem alloc] init];
    ReplayItem *team1P6 = [[ReplayItem alloc] init];
    ReplayItem *team1P7 = [[ReplayItem alloc] init];
    ReplayItem *team1P8 = [[ReplayItem alloc] init];
    ReplayItem *team1P9 = [[ReplayItem alloc] init];
    ReplayItem *team1P10 = [[ReplayItem alloc] init];
    ReplayItem *team1P11 = [[ReplayItem alloc] init];
    
    //ReplayItem *team1P10 = [[ReplayItem alloc] init];
    
    ReplayItem *team2P1 = [[ReplayItem alloc] init];
    ReplayItem *team2P2 = [[ReplayItem alloc] init];
    ReplayItem *team2P3 = [[ReplayItem alloc] init];
    ReplayItem *team2P4 = [[ReplayItem alloc] init];
    ReplayItem *team2P5 = [[ReplayItem alloc] init];
    ReplayItem *team2P6 = [[ReplayItem alloc] init];
    ReplayItem *team2P7 = [[ReplayItem alloc] init];
    ReplayItem *team2P8 = [[ReplayItem alloc] init];
    ReplayItem *team2P9 = [[ReplayItem alloc] init];
    ReplayItem *team2P10 = [[ReplayItem alloc] init];
    ReplayItem *team2P11 = [[ReplayItem alloc] init];
    
    //ReplayItem *team2P10 = [[ReplayItem alloc] init];
    
    ReplayItem *camera = [[ReplayItem alloc] init];
    
    
    
    //ball
    [ballData setPosition: [[[GameModel sharedGameModel] getBall] getSpritePosition]];
    [ballData setZOrder: [ball sprite].zOrder];
    [ballData setScale: [ball sprite].scale];
    [ballData setHeight: [ball z]];
    
    
    //CCLOG(@">> ZOrder,Scale %d,%f", ball.sprite.zOrder, ball.sprite.scale);
    
    //team1
    //CCLOG(@">>>> Save match data...start");
    
    // position
    [team1P1 setPosition: [[team1 getPlayer:0] getSpritePosition]];
    [team1P2 setPosition: [[team1 getPlayer:1] getSpritePosition]];
    [team1P3 setPosition: [[team1 getPlayer:2] getSpritePosition]];
    [team1P4 setPosition: [[team1 getPlayer:3] getSpritePosition]];
    [team1P5 setPosition: [[team1 getPlayer:4] getSpritePosition]];
    [team1P6 setPosition: [[team1 getPlayer:5] getSpritePosition]];
    [team1P7 setPosition: [[team1 getPlayer:6] getSpritePosition]];
    [team1P8 setPosition: [[team1 getPlayer:7] getSpritePosition]];
    [team1P9 setPosition: [[team1 getPlayer:8] getSpritePosition]];
    [team1P10 setPosition: [[team1 getPlayer:9] getSpritePosition]];
    [team1P11 setPosition: [[team1 getPlayer:10] getSpritePosition]];
    
    
    // height
    [team1P1 setHeight: [[team1 getPlayer:0] z]];
    [team1P2 setHeight: [[team1 getPlayer:1] z]];
    [team1P3 setHeight: [[team1 getPlayer:2] z]];
    [team1P4 setHeight: [[team1 getPlayer:3] z]];
    [team1P5 setHeight: [[team1 getPlayer:4] z]];
    [team1P6 setHeight: [[team1 getPlayer:5] z]];
    [team1P7 setHeight: [[team1 getPlayer:6] z]];
    [team1P8 setHeight: [[team1 getPlayer:7] z]];
    [team1P9 setHeight: [[team1 getPlayer:8] z]];
    [team1P10 setHeight: [[team1 getPlayer:9] z]];
    [team1P11 setHeight: [[team1 getPlayer:10] z]];
    
    
    // anim frame
    [team1P1 setFrame: [[team1 getPlayer:0] getAnimFrame]];
    [team1P2 setFrame: [[team1 getPlayer:1] getAnimFrame]];
    [team1P3 setFrame: [[team1 getPlayer:2] getAnimFrame]];
    [team1P4 setFrame: [[team1 getPlayer:3] getAnimFrame]];
    [team1P5 setFrame: [[team1 getPlayer:4] getAnimFrame]];
    [team1P6 setFrame: [[team1 getPlayer:5] getAnimFrame]];
    [team1P7 setFrame: [[team1 getPlayer:6] getAnimFrame]];
    [team1P8 setFrame: [[team1 getPlayer:7] getAnimFrame]];
    [team1P9 setFrame: [[team1 getPlayer:8] getAnimFrame]];
    [team1P10 setFrame: [[team1 getPlayer:9] getAnimFrame]];
    [team1P11 setFrame: [[team1 getPlayer:10] getAnimFrame]];
    
    
    // frame name
    [team1P1 setFrameName: [[team1 getPlayer:0] getFrameName]];
    [team1P2 setFrameName: [[team1 getPlayer:1] getFrameName]];
    [team1P3 setFrameName: [[team1 getPlayer:2] getFrameName]];
    [team1P4 setFrameName: [[team1 getPlayer:3] getFrameName]];
    [team1P5 setFrameName: [[team1 getPlayer:4] getFrameName]];
    [team1P6 setFrameName: [[team1 getPlayer:5] getFrameName]];
    [team1P7 setFrameName: [[team1 getPlayer:6] getFrameName]];
    [team1P8 setFrameName: [[team1 getPlayer:7] getFrameName]];
    [team1P9 setFrameName: [[team1 getPlayer:8] getFrameName]];
    [team1P10 setFrameName: [[team1 getPlayer:9] getFrameName]];
    [team1P11 setFrameName: [[team1 getPlayer:10] getFrameName]];
    
    // rotation
    [team1P1 setSpriteRotation: [[team1 getPlayer:0] getSpriteRotation]];
    [team1P2 setSpriteRotation: [[team1 getPlayer:1] getSpriteRotation]];
    [team1P3 setSpriteRotation: [[team1 getPlayer:2] getSpriteRotation]];
    [team1P4 setSpriteRotation: [[team1 getPlayer:3] getSpriteRotation]];
    [team1P5 setSpriteRotation: [[team1 getPlayer:4] getSpriteRotation]];
    [team1P6 setSpriteRotation: [[team1 getPlayer:5] getSpriteRotation]];
    [team1P7 setSpriteRotation: [[team1 getPlayer:6] getSpriteRotation]];
    [team1P8 setSpriteRotation: [[team1 getPlayer:7] getSpriteRotation]];
    [team1P9 setSpriteRotation: [[team1 getPlayer:8] getSpriteRotation]];
    [team1P10 setSpriteRotation: [[team1 getPlayer:9] getSpriteRotation]];
    [team1P11 setSpriteRotation: [[team1 getPlayer:10] getSpriteRotation]];
    
    
    // Team2
    
    // position
    [team2P1 setPosition: [[team2 getPlayer:0] getSpritePosition]];
    [team2P2 setPosition: [[team2 getPlayer:1] getSpritePosition]];
    [team2P3 setPosition: [[team2 getPlayer:2] getSpritePosition]];
    [team2P4 setPosition: [[team2 getPlayer:3] getSpritePosition]];
    [team2P5 setPosition: [[team2 getPlayer:4] getSpritePosition]];
    [team2P6 setPosition: [[team2 getPlayer:5] getSpritePosition]];
    [team2P7 setPosition: [[team2 getPlayer:6] getSpritePosition]];
    [team2P8 setPosition: [[team2 getPlayer:7] getSpritePosition]];
    [team2P9 setPosition: [[team2 getPlayer:8] getSpritePosition]];
    [team2P10 setPosition: [[team2 getPlayer:9] getSpritePosition]];
    [team2P11 setPosition: [[team2 getPlayer:10] getSpritePosition]];

    
    // height
    [team2P1 setHeight: [[team2 getPlayer:0] z]];
    [team2P2 setHeight: [[team2 getPlayer:1] z]];
    [team2P3 setHeight: [[team2 getPlayer:2] z]];
    [team2P4 setHeight: [[team2 getPlayer:3] z]];
    [team2P5 setHeight: [[team2 getPlayer:4] z]];
    [team2P6 setHeight: [[team2 getPlayer:5] z]];
    [team2P7 setHeight: [[team2 getPlayer:6] z]];
    [team2P8 setHeight: [[team2 getPlayer:7] z]];
    [team2P9 setHeight: [[team2 getPlayer:8] z]];
    [team2P10 setHeight: [[team2 getPlayer:9] z]];
    [team2P11 setHeight: [[team2 getPlayer:10] z]];
    

    //anim frame
    [team2P1 setFrame: [[team2 getPlayer:0] getAnimFrame]];
    [team2P2 setFrame: [[team2 getPlayer:1] getAnimFrame]];
    [team2P3 setFrame: [[team2 getPlayer:2] getAnimFrame]];
    [team2P4 setFrame: [[team2 getPlayer:3] getAnimFrame]];
    [team2P5 setFrame: [[team2 getPlayer:4] getAnimFrame]];
    [team2P6 setFrame: [[team2 getPlayer:5] getAnimFrame]];
    [team2P7 setFrame: [[team2 getPlayer:6] getAnimFrame]];
    [team2P8 setFrame: [[team2 getPlayer:7] getAnimFrame]];
    [team2P9 setFrame: [[team2 getPlayer:8] getAnimFrame]];
    [team2P10 setFrame: [[team2 getPlayer:9] getAnimFrame]];
    [team2P11 setFrame: [[team2 getPlayer:10] getAnimFrame]];

    
    // frame name
    [team2P1 setFrameName: [[team2 getPlayer:0] getFrameName]];
    [team2P2 setFrameName: [[team2 getPlayer:1] getFrameName]];
    [team2P3 setFrameName: [[team2 getPlayer:2] getFrameName]];
    [team2P4 setFrameName: [[team2 getPlayer:3] getFrameName]];
    [team2P5 setFrameName: [[team2 getPlayer:4] getFrameName]];
    [team2P6 setFrameName: [[team2 getPlayer:5] getFrameName]];
    [team2P7 setFrameName: [[team2 getPlayer:6] getFrameName]];
    [team2P8 setFrameName: [[team2 getPlayer:7] getFrameName]];
    [team2P9 setFrameName: [[team2 getPlayer:8] getFrameName]];
    [team2P10 setFrameName: [[team2 getPlayer:9] getFrameName]];
    [team2P11 setFrameName: [[team2 getPlayer:10] getFrameName]];

    
    // sprite rotation
    [team2P1 setSpriteRotation: [[team2 getPlayer:0] getSpriteRotation]];
    [team2P2 setSpriteRotation: [[team2 getPlayer:1] getSpriteRotation]];
    [team2P3 setSpriteRotation: [[team2 getPlayer:2] getSpriteRotation]];
    [team2P4 setSpriteRotation: [[team2 getPlayer:3] getSpriteRotation]];
    [team2P5 setSpriteRotation: [[team2 getPlayer:4] getSpriteRotation]];
    [team2P6 setSpriteRotation: [[team2 getPlayer:5] getSpriteRotation]];
    [team2P7 setSpriteRotation: [[team2 getPlayer:6] getSpriteRotation]];
    [team2P8 setSpriteRotation: [[team2 getPlayer:7] getSpriteRotation]];
    [team2P9 setSpriteRotation: [[team2 getPlayer:8] getSpriteRotation]];
    [team2P10 setSpriteRotation: [[team2 getPlayer:9] getSpriteRotation]];
    [team2P11 setSpriteRotation: [[team2 getPlayer:10] getSpriteRotation]];

    
    [camera setPosition : cameraPos];
    
    
    //[ballData setFrame: [[[GameModel sharedGameModel] getBall] getAnimFrame]];
    //[ballData setPosition: [[[GameModel sharedGameModel] getBall] getSpritePosition]];
    
    [replayFrame addReplayItem: ballData];
    [replayFrame addReplayItem: team1P1];
    [replayFrame addReplayItem: team1P2];
    [replayFrame addReplayItem: team1P3];
    [replayFrame addReplayItem: team1P4];
    [replayFrame addReplayItem: team1P5];
    [replayFrame addReplayItem: team1P6];
    [replayFrame addReplayItem: team1P7];
    [replayFrame addReplayItem: team1P8];
    [replayFrame addReplayItem: team1P9];
    [replayFrame addReplayItem: team1P10];
    [replayFrame addReplayItem: team1P11];
    
    //
    [replayFrame addReplayItem: team2P1];
    [replayFrame addReplayItem: team2P2];
    [replayFrame addReplayItem: team2P3];
    [replayFrame addReplayItem: team2P4];
    [replayFrame addReplayItem: team2P5];
    [replayFrame addReplayItem: team2P6];
    [replayFrame addReplayItem: team2P7];
    [replayFrame addReplayItem: team2P8];
    [replayFrame addReplayItem: team2P9];
    [replayFrame addReplayItem: team2P10];
    [replayFrame addReplayItem: team2P11];

    
    [replayFrame addReplayItem : camera];
    
    
    
    [matchData addReplayFrame: replayFrame];
    
    //CCLOG(@">>>> Save match data...end");

    
    //[frame addReplayItem : ballData];
    
    // [ReplayItem setFrame
}

//
-(void) moveAdverts: (CCTime)dt
{
    int endX = -200;
    int startX = 580;
    int adSpeed = 30;
    
    //CCLOG(@">> advert x,y = %f,%f", self.topAdvert1.position.x, self.topAdvert1.position.y);
    
    self.topAdvert1.position = ccp(self.topAdvert1.position.x-adSpeed*dt,self.topAdvert1.position.y);
    if (self.topAdvert1.position.x<endX)
    {
        self.topAdvert1.position = ccp(startX,self.topAdvert1.position.y);
    }
    
    self.topAdvert2.position = ccp(self.topAdvert2.position.x-adSpeed*dt,self.topAdvert2.position.y);
    if (self.topAdvert2.position.x<endX)
    {
        self.topAdvert2.position = ccp(startX,self.topAdvert2.position.y);
    }
    //CCLOG(@">> advert (After) x,y = %f,%f", self.topAdvert1.position.x, self.topAdvert1.position.y);
    
}

//
-(void) checkControlsPause
{
    if (matchMode == matchModeHuman)
    {
        if (controlsPassJustMade)
        {
            noControlsAfterPassCounter++;
            if (noControlsAfterPassCounter >= CONTROLS_STAY_STILL_AFTER_PASS_TIME)
            {
                controlsPassJustMade=false;
                noControlsAfterPassCounter=0;
            }
        }
    }
}


-(void) playRandomSoundFx {
    
    int randSound = [Util random:5];
    
    NSString *sound;
    
    switch(randSound) {
            
        case 0:
            sound=HORN1;
            break;
            
        case 1:
            sound=HORN2;
            break;
            
        case 2:
            sound=BASSDRUM;
            break;
            
        case 3:
            sound=BASSDRUM;
            break;

        case 4:
            sound=BASSDRUM;
            break;

            
        default :
            sound=HORN1;
            break;
    }
    
    [self playSoundEffect:sound];
}


-(void) playRandomChantFx {
    
    int randSound = [Util random:5];
    
    NSString *sound;
    
    switch(randSound) {
        

        case 0:
            sound=JEER1;
            break;
    
        case 1:
            sound=CHANTS1;
            break;
    
        case 2:
            sound=CHANTS2;
            break;
            
        case 3:
            sound=CHANTS3;
            break;
    
        case 4:
            sound=CHANTS3;
            break;
            
        default :
            sound=CHANTS1;
        break;
    }
    
    [self playSoundEffect:sound];
}


-(void) playRandomGameSoundFx {
    
#define CHANT_RATIO  10
#define HORN_RATIO   5
    
    if ([Util random1inX:CHANT_RATIO]) {
        [self playRandomChantFx];
    }
    
    if ([Util random1inX:HORN_RATIO]) {
        [self playRandomSoundFx];
    }
}

//
-(void) doGamePlaying: (CCTime)dt
{
    //CCLOG(@">>Do game playing");
  //  NSLog(@">> *1...");

    [team1 updatePlayers:dt Ball:ball];
    //[team1 showSecondClosestPlayerTest :ball];
    
  //  NSLog(@">> *2...");

#ifdef TURN_OFF_TEAM2
    // dont move players
#else
    if (![GameData isPracticeMatch]) {
        [team2 updatePlayers:dt Ball:ball];
    }
#endif
    
  //  NSLog(@">> *3...");

    //CCLOG(@">>Do game playing1");
    
    //TODO _ move keeper save functionality to team update method (or other method)
    [[team1 getKeeper] performKeeperSaveIfRequired:ball :dt];
    [[team2 getKeeper] performKeeperSaveIfRequired:ball :dt];
    
    [[team1 getKeeper] moveKeeper:dt :ball];
    [[team2 getKeeper] moveKeeper:dt :ball];
    
 //   NSLog(@">> *4...");

    [ball moveBall:dt];
    
 //   NSLog(@">> *5...");

    
    // DO test/side angle player movement
 #ifdef SHOW_TEST_PLAYERS_SIDE_ANGLE
    CGPoint ballPos = [ball position];
    CGPoint testBallPos = ccp ( PITCH_RIGHT -[ball z], ballPos.y);
    [testBall setPosition:testBallPos];
    CGPoint team1PlayerPos = [[team1 getMainPlayer] position];
    CGPoint team2PlayerPos = [[team2 getMainPlayer] position];
    [testActivePlayer1 setPosition: ccp (PITCH_RIGHT -[[team1 getMainPlayer] z]-17, team1PlayerPos.y)];
    [testActivePlayer2 setPosition: ccp (PITCH_RIGHT -[[team2 getMainPlayer] z]-17, team2PlayerPos.y)];
    CGPoint team1KeeperPos = [[team1 getKeeper] position];
    CGPoint team2KeeperPos = [[team2 getKeeper] position];
    [testKeeperTeam1 setPosition: ccp (PITCH_RIGHT -[[team1 getKeeper] z]-17, team1KeeperPos.y)];
    [testKeeperTeam2 setPosition: ccp (PITCH_RIGHT -[[team2 getKeeper] z]-17, team2KeeperPos.y)];
#endif
    
    //
    
 //   FormationPosition *fPos = [[FormationPosition alloc] initWithDetails:50 :50 :0.0 :0.0 :0.0 :0.0];

    
//    FormationPosition *fPos = [[FormationPosition alloc] init];
//    [fPos setStartPositionPercentage:CGPointMake(50, 60)];
//    [fPos setHorizontalPercAhead:0.5];
//    [fPos setHorizontalPercBehind:0.5];
//    [fPos setVerticalPercAhead:0.75];
//    [fPos setVerticalPercBehind:0.30];
    
    
//    CGPoint pitchPosPerc = [FormationUtil getPitchPositionPercentage: CGPointMake([ball position].x, [ball position].y)];
//    CGPoint testBallPos = [FormationUtil getPlayerPitchPosition: pitchPosPerc :fPos];
//    
   // [teamBadge setPosition:testBallPos];
    /////
    
    
    [ball checkGoalCollision:dt];
    
//    NSLog(@">> *6...");

    //[ball checkBoundary];
    
    //
    //[self moveAdverts:dt];
    
    //[self updateWeather];
    [self moveCamera:dt];
    
//    NSLog(@">> *7...");

    
    //
    [self saveMatchData];
    
 //   NSLog(@">> *8...");

    
    
    //printf("/n ** DT = %f *** \n",dt);
}

-(void) tick:(CCTime)dt
{
    // CCLOG(@" >>> GAME MODEL : tick");
    timeAccumulator += dt;
    if (timeAccumulator > (MAX_CYCLES_PER_FRAME * UPDATE_INTERVAL)) {
        timeAccumulator = UPDATE_INTERVAL;
    }
    
    while (timeAccumulator >= UPDATE_INTERVAL) {
        timeAccumulator -= UPDATE_INTERVAL;
        [self nextFrame: UPDATE_INTERVAL];
    }
}

-(int) getTickTimeInMins
{
    return (int)self.numTicks/(60*60);
}

-(int) getTickTimeInSecs
{
    return (int)(self.numTicks/60) - [self getTickTimeInMins]*60;
}

-(void) updateTickTime
{
    self.numTicks++;
}


-(void) updateSwipeTime
{
    self.swipeTimer++;
}


-(void) resetSwipeTime
{
    self.swipeTimer=0;
}

-(long) getTickTimeSecs:(long)tickTime
{
    return tickTime/60;
}

-(long) getTickTimeMins:(long)tickTime
{
    return tickTime/(60*60);
}

-(void) setCurrentTask:(enum taskName) task
{
    taskName = task;
}

-(void) pauseTickTimer
{
    tickTimePaused=true;
}

-(void) resetTickTimer
{
    self.numTicks=0;
}

-(void) restartTickTimer
{
    tickTimePaused=false;
}

-(void) checkTimerTasks
{
    //CCLOG(@">> Tick Task Time : %d, Task Name : %d", tickTaskTime, taskName);
    switch (taskName)
    {
        case none:
            
            break;
            
        case taskKickOff:
            if ([self getTickTimeSecs:tickTaskTime] >= KICKOFF_TIME )
            {
                [self changeStateToGamePlaying];
                [self deactivateTickTaskTimer];
                [self restartTickTimer];
            }
            break;
            
        case taskKeeperHasBall:
            if ([self getTickTimeSecs:tickTaskTime] >= KEEPER_HAS_BALL_TIME )
            {
                [self changeStatetoGamePlayingFromGoalKick];
                [self deactivateTickTaskTimer];
                
            }
            break;
            
            
        case taskBallOutOfBounds:
            if ([self getTickTimeSecs:tickTaskTime] >= BALL_OUT_OF_BOUNDS_TIME )
            {
                [self changeStatetoGoalKickFromOutOfBounds];
                [self deactivateTickTaskTimer];
                
            }
            break;
            
        case taskHalfTime:
            if ([self getTickTimeSecs:tickTaskTime] >= 1 )
            {
                [self resetHalfTimePlayerLineups ];
                [self changeStateHalfTimeToKickOff];
                
                //[self deactivateTickTaskTimer];
                //[self restartTickTimer];
                //                [self changeStateToGamePlaying];
                //                [self deactivateTickTaskTimer];
                //                [self restartTickTimer];
            }
            break;
            
        case taskFullTime:
            if ([self getTickTimeSecs:tickTaskTime] >= 1 )
            {
                //[self changeStatetoGamePlayingFromGoalKick];
                //[self deactivateTickTaskTimer];
                
            }
            break;
            
        case taskGoal:
            if ([self getTickTimeSecs:tickTaskTime] >= GOAL_CELEB_TIME )
            {
                [self changeStatetoKickOffAfterGoal];
                //[self deactivateTickTaskTimer];
            }
            break;
            
        default:
            break;
    }
    
}

//
-(void) setManagerMode:(bool)mState
{
    managerMode=mState;
}

//
-(bool) isManagerMode
{
    return managerMode;
}

-(void) playReplaySoundsOld {
//    if ([Util random5050]) {
//        [Util playSoundMusic:STADIUM_CROWD1 loop:true];
//    } else {
//        [Util playSoundMusic:STADIUM_CROWD2 loop:true];
//    }
    
    //[Util playSoundMusic:STADIUM_CROWD1 loop:true];
    
    if ([Util random5050]) {
        [Util playSoundMusic:CHOOSE_TEAM loop:true]; // ROAD_TO_BRAZIL
    }
    else {
        [Util playSoundMusic:CHOOSE_TEAM loop:true];
    }
    
}

-(void) playReplaySounds {
    int tune = [Util random:5];
    NSString *song;
    
    switch(tune) {
        case 0:
            song=STADIUM_CROWD1;
            break;
            
        case 1:
            song=STADIUM_CROWD1;
            break;
            
        case 2:
            song=STADIUM_CROWD1;
            break;
            
        case 3:
            song=STADIUM_CROWD1;
            break;
            
        case 4:
            song=STADIUM_CROWD1;
            break;
            
        case 5:
            song=STADIUM_CROWD1;
            break;
            
        default:
            song=STADIUM_CROWD1;
            break;
    }
    [Util playSoundMusic:song loop: true];
    //[GameData setMenuSong:song];
}



//
-(void) replayFullMatch
{
    // [[HudModel sharedHudModel] hudLayer].visible=true;
    [[SceneManager sharedSceneManager] hudLayer].visible=true;
    [[HudModel sharedHudModel] showReplayControls: true];
    [[GameModel sharedGameModel] setMatchState: replay];
    [self setReplayState: noReplay];
    //[matchData setupGoalsHighlights];
    //[matchData setGoalHighlightsMode:true];
    [matchData setGoalHighlightsMode:false];
    [matchData setGeneralHighlightsMode:false];
    [self playReplaySounds];
    [[GameModel sharedGameModel] setReplayState: replayForward];
    
}

//
-(void) replayGoals
{
    // [[HudModel sharedHudModel] hudLayer].visible=true;
    [[SceneManager sharedSceneManager] hudLayer].visible=true;
    [[HudModel sharedHudModel] showReplayControls: true];
    [[GameModel sharedGameModel] setMatchState: replay];
    [self setReplayState: noReplay];
    [matchData setupGoalsHighlights];
    [matchData setGoalHighlightsMode:true];
    [matchData setGeneralHighlightsMode:false];
    [self playReplaySounds];
    [[GameModel sharedGameModel] setReplayState: replayForward];
    

}

//
-(void) replayHighlights
{
    // [[HudModel sharedHudModel] hudLayer].visible=true;
    [[SceneManager sharedSceneManager] hudLayer].visible=true;
    [[HudModel sharedHudModel] showReplayControls: true];
    [[GameModel sharedGameModel] setMatchState: replay];
    [self setReplayState: noReplay];
    [matchData setupGeneralHighlights];
    [matchData setGeneralHighlightsMode:true];
    [matchData setGoalHighlightsMode:false];
    [self playReplaySounds];
    [[GameModel sharedGameModel] setReplayState: replayForward];
    

}

//
-(void) playMatchManagerMode
{
    //    managerMode=true;
    //    [self setMatchState:kickOff];
    
    
    while (!pauseManagerMode /*&& [self getTickTimeInMins] < 10*/)
    {
        [self nextFrame: UPDATE_INTERVAL];
    }
    
    if ([self getMatchState] == postGame)
    {
        //[self setMatchState:fullTime];
        [self goToFullTime];
    }
    // [self setMatchState:fullTime];
    // [self goToFullTime];
    //    [[HudModel sharedHudModel] showReplayControls: true];
    //    [[GameModel sharedGameModel] setMatchState: replay];
    //    [self setReplayState: noReplay];
    
}

-(void) doTeamRunout
{
    
}

-(void) clearMatchData
{
}

-(void) setMatchStateShowTutorial {
    
    [self setMatchState:showTutorial];
    //[[[SceneManager sharedSceneManager] swipeInfoLayer] turnSwipeInfoOn];
    [[HudModel sharedHudModel] showTutorial : true];

}

//
-(void) nextFrame:(CCTime)dt
{
    //    managerMode=true;
     //CCLOG(@">>GAME MODEL :NEXT FRAME");
    ////printf("*** CCTIme = %f", dt);
    deltaTime=dt;
    frameRate++;
    // CCLOG(@">>Match State : %d", matchState);
    //    CCLOG(@">>Game State : %d", gameState);
    
    //int matchState=1;
    if (managerMode && !tickTimePaused)
    {
        [self updateTickTime];
        [self updateMatchClockManagerMode];
    }
    
    if (tickTaskActive)
    {
        tickTaskTime++;
        [self checkTimerTasks];
    }
    else
    {
        // CCLOG(@">>>TIck task not active");
    }
    
    // CCLOG(@">>> Ticks time %d ticks : %d secs, %d mins", self.numTicks, [self getTickTimeInSecs], [self getTickTimeInMins]);
    
    float glScale ;
    switch (matchState)
    {
        case showTutorial:
            
            break;
            
        case inGamePaused
            :
            break;
            
        case (preKickOffRunout):
            [[[SceneManager sharedSceneManager] hudModel] showZoomButtons:false];

            //gameLayer.scale+=gameLayer.scale*2;
            
            //gameLayer.scale=1.0;;
            
            glScale=[[[SceneManager sharedSceneManager] gameLayer] scale];
            if (glScale < [GameData getLastGameScale]) { // 1.0
                //NSLog(@" Scale : %f | Position : %f,%f", glScale, [[SceneManager sharedSceneManager] gameLayer].position.x,
                //      [[SceneManager sharedSceneManager] gameLayer].position.y);
                
               // [[[SceneManager sharedSceneManager] gameLayer] setPosition:ccp(PITCH_X_CENTER-250,PITCH_Y_CENTER-460)];
                [[[SceneManager sharedSceneManager] gameLayer] setScale:glScale*1.0032]; //1.00160]
            }
           // [[[SceneManager sharedSceneManager] gameLayer] setScale:0.5];
            
            self.stairs.visible=true;
            
            [team1 showAllPlayers:true];
            [team2 showAllPlayers:true];

            if ([GameData isPracticeMatch] || [GameData isHumanTeam]) {
                [[self getTeam1] showActivePlayerSprite:true];
                [[self getTeam1] showActiveTargetSprite:false];
            }
            //TODO
            [[[HudModel sharedHudModel] exitButton] setVisible:true];
            [team1 movePlayersOntoPitch:dt :ball];
            
            if ([GameData isPracticeMatch]) {
                [team2 showPlayers:false];
            } else {
                [team2 showPlayers:true];
            }
            
            [team2 movePlayersOntoPitch:dt :ball];
            
            if ([team1 isReadyForKickOff] && [team2 isReadyForKickOff])
            {
                self.stairs.visible=false;

                // if comp team or demo mode
                // ensure one of the strikers touches/goes to the ball
                // for now just do it for both teams TODO fix this
                [team1 activateClosestXPlayersRestricted : 1:[ball position]];
                [team2 activateClosestXPlayersRestricted : 1:[ball position]];
                
            
                //CCLOG(@"Set Kick Off");
                //[self setMatchState:kickOff];
                
                if (([GameData isPracticeMatch] || [GameData isHumanTeam]) ) {
                    
                    if ([GameData isPracticeMatch]) {
                        if (![[GameData sharedGameDataManager] tutorialShownPractice]) {
                            [self setMatchStateShowTutorial];
                        } else {
                            [self setMatchState:kickOff];
                        }
                    }
                    else if ([GameData isHumanTeam]) {
                        if (![[GameData sharedGameDataManager] tutorialShown]) {
                            [self setMatchStateShowTutorial];
                        }
                        else {
                            [self setMatchState:kickOff];
                        }
                    }
                    else {
                        [self setMatchState:kickOff];
                    }
//                    
//                    if (![[GameData sharedGameDataManager] tutorialShown]) {
//                        [self setMatchStateShowTutorial];
//                    } else {
//                        [self setMatchState:kickOff];
//                    }
                } else {
                    [self setMatchState:kickOff];
                }

                
            }
            if (!preKickOffRunoutDone)
            {
                if (!managerMode)
                {
                    // [Util playSoundMusic:@"Large_Stadium-stephan_schutze-2122836113.wav" loop:true];
                    
                    if ([GameData isPracticeMatch]) {
                        [self playRandomSoundFx];
                        [Util stopMusic];
                    } else {
                        if ([Util random5050]) {
                            [[OALSimpleAudio sharedInstance] preloadBg:STADIUM_CROWD1];
                            [Util playSoundMusic:STADIUM_CROWD1 loop:true];
                        } else {
                            [[OALSimpleAudio sharedInstance] preloadBg:STADIUM_CROWD2];
                            [Util playSoundMusic:STADIUM_CROWD2 loop:true];
                        }
                        [self playSoundEffect:EXCITING_CROWD];
                    }
                }
                preKickOffRunoutDone=true;
                [[HudModel sharedHudModel]  showExitButton:true];
                
            }
            
            
            break;
            
        case (preKickOff):
            [[[SceneManager sharedSceneManager] gameLayer] setViewpointPitchCenter];

            CCLOG(@"PRE KICKOFF");
            [self showPreMatchInfo];
            
            //managerMode=true;
            [self pauseTickTimer];
            [self resetTickTimer];
            
            // so manager mode replays show after a practice match was used earlier
//            if ([GameData isPracticeMatch]) {
//                [team2 showPlayers:false];
//            } else {
//                [team2 showPlayers:true];
//            }
            
            [team1 showAllPlayers:false];
            [team2 showAllPlayers:false];
            
            
            [[[HudModel sharedHudModel] p1Namelabel] setString:@""];
            [[[HudModel sharedHudModel] p2Namelabel] setString:@""];
            
            
//            CCLOG(@">>>> Match State = %d",[[GameModel sharedGameModel] getMatchState]);
//            CCLOG(@">>>> Game State = %d",[[GameModel sharedGameModel] getGameState]);
            
            break;
            
        case (kickOff):
            //CCLOG(@"KICKOFF");
            
            //[team1 setVisible:true];
            //[team2 setVisible:true];
            //[[[SceneManager sharedSceneManager]hudLayer] hideControls];
            [self doKickOff];
                break;
            
        case (gamePlaying):
            [self doGamePlaying:dt];
            break;
            
        case halfTime:
            [self doHalfTime];
            [team1 movePlayersOffFieldHalfSpeed:dt];
            [team2 movePlayersOffFieldHalfSpeed:dt];
            [ball moveBall:dt];
            //[self startHalfTimeInfoTimer];
            break;
            
        case halfTimeInfo:
            [team1 showAllPlayers:false];
            [team2 showAllPlayers:false];
            
            [ball resetBall];
            //[ball moveBall:dt];
            [team1 movePlayersOffField:dt];
            [team2 movePlayersOffField:dt];
            break;
            
        case halfTimePreKickoff:
          //  [self saveMatchData];
//            [team1 updatePlayers:dt Ball:ball];
//            
//            if (![GameData isPracticeMatch]) {
//                [team2 updatePlayers:dt Ball:ball];
//            }

        
            break;
            
        case fullTime:
            //CCLOG(@">>> FULL TIME");
            self.stairs.visible=true;

            [self doFullTime];
            //[team1 movePlayersFullTimeHalfSpeed:dt];
            //[team2 movePlayersFullTimeHalfSpeed:dt];
            
            [self doFullTimeCelebrations :dt :ball ];

            
            [ball moveBall:dt];
            [ball checkBoundary:dt];

            //[self startMainMenuTimer];
            [self startFullTimeInfoTimer];
            
            if ([GameData getFulltimeZoom]) {
                glScale=[[[SceneManager sharedSceneManager] gameLayer] scale];
                if (glScale > 0.45) {
                     [[[SceneManager sharedSceneManager] gameLayer] setScale: glScale-0.002]; //1.00160]
                }
            }
            
            
            break;
            
        case postGame:
            //CCLOG(@"POST GAME");
            if (!managerMode)
            {
                [team1 movePlayersOffField:dt];
                [team2 movePlayersOffField:dt];
                
                [[HudModel sharedHudModel] fulltimeSpr].visible=false;
            } else
            {
                //CCLOG(@">>POSTGAME...");
                [team1 moveAllPlayersOffScreen];
                [team2 moveAllPlayersOffScreen];
                [ball moveOffScreen];
                [[SceneManager sharedSceneManager] gameInfoLayer].visible=true;
                [[[SceneManager sharedSceneManager] gameInfoLayer] setFullTimeInfo];
            }
            
            [team1 showAllPlayers:false];
            [team2 showAllPlayers:false];
            [Util stopMusic];
            
//            if (!managerMode) {
//                glScale=[[[SceneManager sharedSceneManager] gameLayer] scale];
//                if (glScale > 0.45) {
//                    [[[SceneManager sharedSceneManager] gameLayer] setScale: glScale-0.002]; //1.00160]
//                }
//            }
            
            break;
            
        case postGameReplay:
            //[self replayMatch];
            //CCLOG(@">>postgamereplay");
            [[[SceneManager sharedSceneManager] gameInfoLayer] setReplayLabels];
            self.stairs.visible=false;
            //[[[SceneManager sharedSceneManager] gameLayer] setScale: 1.0]; //1.00160]
            
            [[[SceneManager sharedSceneManager] gameLayer] setScale :[GameData getLastReplayScale]];
            
            break;
            
        case throwIn:
            [[team1 getKeeper] moveKeeper:dt :ball];
            [[team2 getKeeper] moveKeeper:dt :ball];
            
            [team1 updatePlayersThrowIn:dt :ball];
            [team2 updatePlayersThrowIn:dt :ball];

            break;
            
        case cornerKick:
            [[team1 getKeeper] moveKeeper:dt :ball];
            [[team2 getKeeper] moveKeeper:dt :ball];
            
            [team1 updatePlayersCornerKick:dt :ball];
            [team2 updatePlayersCornerKick:dt :ball];

            break;
        
        case ballOutOfBoundsThrowIn:
            [team1 updatePlayersThrowIn:dt :ball];
            [team2 updatePlayersThrowIn:dt :ball];
            
            break;
            
            
        case ballOutOfBounds:
//            NSLog(@"..State : Ball out of Bounds");
//            
            [ball moveBall:dt];
            [ball doExternalGoalCollision:dt];

//            [team1 resetTargetPositionsForGoalKick];
//            [team2 resetTargetPositionsForGoalKick];

            [[team1 getKeeper] performKeeperSaveIfRequired:ball :dt];
            [[team2 getKeeper] performKeeperSaveIfRequired:ball :dt];
            [[team1 getKeeper] moveKeeper:dt :ball];
            [[team2 getKeeper] moveKeeper:dt :ball];
            
            [team1 updatePlayersGoalKick:dt :ball];
            [team2 updatePlayersGoalKick:dt :ball];
            
//            [team1 updatePlayersBallOutOfBounds:dt];
//            [team2 updatePlayersBallOutOfBounds:dt];
            [self saveMatchData];
            break;
            
        case goal:
            [[[HudModel sharedHudModel] exitButton] setVisible:false];
            [[self getTeamWhoScored] movePlayersGoalScored:dt :ball];
            [[self getNonScoringTeam] movePlayersGoalNotScored : dt];
            
            [ball moveBall:dt];
            //[testBallShadow setPosition: [ball position]];
            [ball doGoalCollision:dt];
            [[team1 getKeeper] performKeeperSaveIfRequired:ball :dt];
            [[team2 getKeeper] performKeeperSaveIfRequired:ball :dt];
            [[team1 getKeeper] moveKeeper:dt :ball];
            [[team2 getKeeper] moveKeeper:dt :ball];
            [self saveMatchData];
            //TODO move keeper but turn off stickyball
            break;
            
        case keeperHasBall:
            //NSLog(@">>>>Keeper has ball...");
            [self doKeeperHasBall:dt];
            [gameLayer setViewpointCenter : [ball position]];
            [self moveCamera:dt];
            [self saveMatchData];

            break;
            
        case paused:
            
            break;
            
        case replay:
            
            
            //CCLOG(@">>REPLAY");
            [self replayMatch];
            [team1 showAllPlayers:true];
            [team2 showAllPlayers:true];

            //[self replayMatch];
            //[self replayMatch];
            //[self replayMatch];
            //[[[SceneManager sharedSceneManager] gameLayer] setViewpointPitchCenter];
            //[[[SceneManager sharedSceneManager] gameLayer] setPosition: ccp(PITCH_X_CENTER,155)];
            
            //[[[SceneManager sharedSceneManager] gameLayer] setPosition: ccp(PITCH_X_CENTER,155)];
           // [[[SceneManager sharedSceneManager] gameLayer] setScale: 1.0]; //1.00160]
            
            break;
            
        case startManagerMode:
        
            [[SceneManager sharedSceneManager] gameInfoLayer].visible=true;
            [[[SceneManager sharedSceneManager] gameInfoLayer] setMatchInProgressInfo];
            [[GameModel sharedGameModel] setManagerMode:true];
            [self setMatchState: managerModeStarted];
            break;
            
        case managerModeStarted:
            [self setMatchState:kickOff];
            pauseManagerMode=false;
            [[GameModel sharedGameModel] playMatchManagerMode];
            break;
            
        case managerModeResumed:
            //CCLOG(@">>> Manager mode resumed");
            [self setMatchState:prevMatchState];
            managerMode=true;
            pauseManagerMode=false;
            [[GameModel sharedGameModel] playMatchManagerMode];
            break;
            
        default:
            break;
    }
}

//
- (BOOL) isWithinArea:(CGPoint)touchPos :(CGPoint)spritePos :(float)width {
    //NSLog(@"TouchPos% f,%f",touchPos.x,touchPos.y);
    //NSLog(@"SpritePos% f,%f",spritePos.x,spritePos.y);
    
    
    if (touchPos.x > spritePos.x - width &&
        touchPos.x < spritePos.x + width &&
        touchPos.y > spritePos.y - width &&
        touchPos.y < spritePos.y + width  )
        return true;
    else
        return false;
}

- (BOOL) isWithinAreaNotDeadzone:(CGPoint)touchPos :(CGPoint)spritePos :(float)width :(int)deadZoneWidth
{
    //NSLog(@"TouchPos% f,%f",touchPos.x,touchPos.y);
    //NSLog(@"SpritePos% f,%f",spritePos.x,spritePos.y);
    
    
    if (touchPos.x > spritePos.x - width &&
        touchPos.x < spritePos.x + width &&
        touchPos.y > spritePos.y - width &&
        touchPos.y < spritePos.y + width  )
    {
        return true;
    }
    else
        return false;
}

//
//COMMENTED-REMOVED

- (void)touchBegan:(CCTouch*) touch withEvent:(CCTouchEvent*) event {
//- (BOOL)ccTouchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
    //[[team1 getMainPlayer] jump];
    // [[team2 getMainPlayer] jump];
    CCLOG(@"** TOUCH BEGAN - Game Model");
    // [[[GameModel sharedGameModel] team1 getMainPlayer] testRotate];
    //[[team1 getMainPlayer] testRotate]
    
    //[Player doTest];
    //int direction = [player getPlayerDirection];
    
    //  [[team getMainPlayer]  setSpeed: 50 ];
    //  //  int direction = [[team getMainPlayer]  getPlayerDirection];
    //    SneakyJoystick *joy = [hudLayer getSneakyJoystick];
    //
    //
    //    CCLOG(@"** Sneaky Joystick Velocity = %f ",[joy velocity].x);
    //    CCLOG(@"** Sneaky Joystick Y Velocity = %f ",[joy velocity].y);
    //    CCLOG(@"** Sneaky Joystick Degrees = %f ",[joy degrees]);
    //
    //     [[hudLayer getScoreLabel] setString: [NSString stringWithFormat:@"%@ %d",[joy degrees]]];
    //
    //    NSLog(@"Touch Pos = %f %f", convertedLocation.x, convertedLocation.y);
    
    float width = 30.0;
    //    if ([self isWithinArea: convertedLocation: leftDPadPos: width]) {
    //        NSLog(@"Left");
    //        direction=7;
    //    } else
    
    
    
    //if ([self isWithinArea: convertedLocation: rightDPadPos: width]) {
    if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyPassButton].position : width]
        || [self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyPassButtonLabel].position : width]) {
        NSLog(@"**Pass");
        //[[team getMainPlayer]  kickBall:ball] ;
        
        [[team1 getMainPlayer] passToClosestPlayer:ball] ;
        
        // [p kickBall:ball];
        // direction=3;
    }
    
    if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyShootButton].position : width]
        || [self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joyShootButtonLabel].position : width]) {
        NSLog(@"Shoot");
        //[[team getMainPlayer]  kickBall:ball] ;
        
        //        CGPoint myActivePlayer = ccp(100,100);
        //        CGPoint targetPlayer = ccp(105,49);
        //
        //        [[team getMainPlayer] isPlayerAhead:myActivePlayer P:targetPlayer];
        //
        [[team1 getMainPlayer] shootBall:ball] ;
        
        // [ball setZVec:20.0];
        [[team1 getMainPlayer] kickBall:ball] ;
        
        Player *testP = [team1 getMainPlayer];
        
        //CGPoint originalVector = ccpForAngle(CC_DEGREES_TO_RADIANS(0));
        //printf("\n ***** ---> Original Vec = %f,%f, Angle =%f", originalVector.x, originalVector.y, CC_RADIANS_TO_DEGREES(ccpToAngle(originalVector)));
        
        
        //CGPoint newVec = [testP rotateVector:originalVector Angle:0];
        
        CGPoint newVec = [testP doRotate:0 Angle:270];
        
        newVec = ccpNormalize(newVec);
        
        //CGFloat newVecRadians = ccpToAngle(newVec);
        //CGPoint newVecRadiansVec = ccpForAngle(newVecRadians);
        
        //CGPoint newVec = ccp(0.0,1.0);
        //printf("\n ***** ---> new Vec = %f,%f, Angle =%f", newVec.x, newVec.y, CC_RADIANS_TO_DEGREES(ccpToAngle(newVecRadiansVec)));
        
        // [p kickBall:ball];
        // direction=3;
    }
    //    } else  if ([self isWithinArea: convertedLocation: upDPadPos: width]) {
    //        NSLog(@"Up");
    //        direction=1;
    //    } else  if ([self isWithinArea: convertedLocation: downDPadPos: width]) {
    //        NSLog(@"Down");
    //        direction=5;
    //    } else
    
    // if ([self isWithinArea: convertedLocation: [hudLayer getJoypadShootButton].position : width ]) {
    
    // if ([self isWithinArea: convertedLocation: [hudLayer getJoypadBasesPosition]: width])
    if ([self isWithinArea: convertedLocation: [[HudModel sharedHudModel] joypad].position: width])
        
    {
        NSLog(@"Center");
        direction=0;
        
        if ([self isWithinArea: [[HudModel sharedHudModel] joypad].position:
             [[HudModel sharedHudModel] joyStick].position: 10])
        {
            CCLOG(@">>** Inside Deadzone **");
            centerTouchBegan=true;
            outsideDeadzone=false;
        }
        else
        {
            CCLOG(@">>** Outside Deadzone **");
            //centerTouchBegan=true;
            outsideDeadzone=true;
            centerTouchBegan=true;
            CGPoint targetVec = ccp(0,10);
            
            
            #ifdef IGNORE_USER_CONTROLS
            // only move player if either team has the ball directly under control
            // otherwise let the AI moe the player
                if ([ball doesTeamActuallyHaveBall:team1] || [ball doesTeamActuallyHaveBall:team2] ) {
                    [[team1 getMainPlayer] setVector:targetVec];
                }
            #else
                [[team1 getMainPlayer] setVector:targetVec];
            #endif
            
        }
        
    }
    
    // [SceneManager goTeamMenu];
    // [[GameData sharedGameDataManager] setMatchInProgress:true];
    // [[GameData sharedGameDataManager] setSavedGameLayer:self];
    // [[GameData sharedGameDataManager]setSavedGameScene:[[CCDirector sharedDirector] runningScene]];
    
    // [[[[CCDirector sharedDirector] pushScene: [SceneManager getTeamOptionsScene]];
    
    //    if ([self isWithinArea: convertedLocation: [hudLayer getp1NameLabel].position: [hudLayer getp1NameLabel].textureRect.size.width])
    //    {
    //        [SceneManager goMenu];
    //    }
    
    //[[team getMainPlayer] setPlayerDirection:direction];
    
	//return true;
}
 

//
- (void)ccTouchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
    //NSLog(@"Touch Moved Pos = %f %f", convertedLocation.x, convertedLocation.y);
    
    // check touch position is within circle radius
    if (centerTouchBegan)
        
    {
        CGPoint controlVector = ccpSub(convertedLocation, [[HudModel sharedHudModel] joypad].position);
        
       // [[[SceneManager sharedSceneManager] hudLayer] setJoyStickPosition:&joyStickPos];
        
        
        if (! [self isWithinArea: [[HudModel sharedHudModel] joypad].position:
               [[HudModel sharedHudModel] joyStick].position: 10]) {
            //if (outsideDeadzone)
            //{
            CCLOG(@"** Outside Deadzone 22222 **");
            CGFloat rotationRadians = ccpToAngle(controlVector);
            CGFloat rotationDegrees = -CC_RADIANS_TO_DEGREES(rotationRadians);
            
            rotationDegrees += 90.0f;
            ////printf("\n * Control angle = %f", rotationDegrees);
            
            #ifdef IGNORE_USER_CONTROLS
                // only move player if either team has the ball directly under control
                // otherwise let the AI moe the player
                if ([ball doesTeamActuallyHaveBall:team1] || [ball doesTeamActuallyHaveBall:team2] ) {
                    Player *p = [team1 getMainPlayer];
                    [p setSpriteRotation:rotationDegrees];
                    [Team setControlsActive:true];
                }
            
            #else
                //TODO - addded
                Player *p = [team1 getMainPlayer];
                //Player *p = [team1 getPlayer:PLAYER8_ID];
                [p setSpriteRotation:rotationDegrees];
                [Team setControlsActive:true];
            #endif
        }
        
        
    }
    
}

//
- (void)ccTouchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CGPoint targetVec = ccp(0,0);
    
    #ifdef IGNORE_USER_CONTROLS
        // only move player if either team has the ball directly under control
        // otherwise let the AI moe the player
        if ([ball doesTeamActuallyHaveBall:team1] || [ball doesTeamActuallyHaveBall:team2] ) {
            [[team1 getMainPlayer] setVector:targetVec];
            [Team setControlsActive:false];
        }
    #else
        [[team1 getMainPlayer] setVector:targetVec];
        [Team setControlsActive:false];
    
    #endif
    
    outsideDeadzone=false;
 }


@end

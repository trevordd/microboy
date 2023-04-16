//
//  GameData.m
//  mySoccer
//
//  Created by Trevor Delves on 07/05/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameData.h"
#import "GameModel.h"
#import "PlayerData.h"

#import "PlayerStats.h"
#import "England.h"
#import "TeamsInfo.h"


@implementation GameData

@synthesize gameModel;
@synthesize matchInProgress;
@synthesize savedGameScene;
@synthesize team1score;
@synthesize team2score;
@synthesize timesTutorialShown;
@synthesize tutorialShown;
@synthesize tutorialShownPractice;
@synthesize matchLength;



static GameData *gameDataManager = nil;
static int testNum = 5;
static bool humanTeam = false;
static bool practiceMatch = false;
static int matchLength = MINS_3;
static int ballColour = BALL_COL_RANDOM;
static int difficulty = MEDIUM;
static int screenWidth;
static int screenHeight;
static bool buttonControlsOn=true;
static bool swipeControlsOn=true;
static bool moveAssistOn=true;
static bool partialMoveAssistOn=false;
static bool crowdSoundsOn=true;
static bool menuSoundsOn=true;
static bool fxSoundsOn=true;
static NSString *menuSong;
static bool doResetMenuMusic;
static bool microSoccerStarted;
static bool doFulltimeZoom = false;
static float lastReplayScale=1.0f;
static float lastGameScale=1.0f;


+ (GameData*)sharedGameDataManager
{
    if (gameDataManager == nil) {
        gameDataManager = [[super alloc] init];
    }
    return gameDataManager;
}

-(id) init
{    
    if( (self=[super init] )) {
        NSLog(@"Initialising GameData");
        teams = [[NSMutableArray alloc] init];
        originalTeams = [[NSMutableArray alloc] init];
        
        [self initTeams];
    }
    
	return self;
}


+ (id)alloc
{
    return [self sharedGameDataManager];
}


- (void) initTeams
{
 
    NSLog(@"INIT TEAMS...");


    
    NSMutableArray *englandPlayerStats = [TeamsInfo getEnglandPlayers];
    NSMutableArray *englandTeamInfo = [TeamsInfo getEnglandTeamInfo];
    
    NSMutableArray *francePlayerStats = [TeamsInfo getFrancePlayers];
    NSMutableArray *franceTeamInfo = [TeamsInfo getFranceTeamInfo];
    
    NSMutableArray *italyPlayerStats = [TeamsInfo getItalyPlayers];
    NSMutableArray *italyTeamInfo = [TeamsInfo getItalyTeamInfo];
    
    NSMutableArray *spainPlayerStats = [TeamsInfo getSpainPlayers];
    NSMutableArray *spainTeamInfo = [TeamsInfo getSpainTeamInfo];
    
    NSMutableArray *brazilPlayerStats = [TeamsInfo getBrazilPlayers];
    NSMutableArray *brazilTeamInfo = [TeamsInfo getBrazilTeamInfo];
    
    NSMutableArray *hollandPlayerStats = [TeamsInfo getHollandPlayers];
    NSMutableArray *hollandTeamInfo = [TeamsInfo getHollandTeamInfo];
    
    NSMutableArray *argentinaPlayerStats = [TeamsInfo getArgentinaPlayers];
    NSMutableArray *argentinaTeamInfo = [TeamsInfo getArgentinaTeamInfo];
    
    NSMutableArray *germanyPlayerStats = [TeamsInfo getGermanyPlayers];
    NSMutableArray *germanyTeamInfo = [TeamsInfo getGermanyTeamInfo];
    
    NSMutableArray *ghanaPlayerStats = [TeamsInfo getGhanaPlayers];
    NSMutableArray *ghanaTeamInfo = [TeamsInfo getGhanaTeamInfo];
    
    NSMutableArray *portugalPlayerStats = [TeamsInfo getPortugalPlayers];
    NSMutableArray *portugalTeamInfo = [TeamsInfo getPortugalTeamInfo];
    
    NSMutableArray *belgiumPlayerStats = [TeamsInfo getBelgiumPlayers];
    NSMutableArray *belgiumTeamInfo = [TeamsInfo getBelgiumTeamInfo];
    
    NSMutableArray *usaPlayerStats = [TeamsInfo getUsaPlayers];
    NSMutableArray *usaTeamInfo = [TeamsInfo getUsaTeamInfo];
    
    NSMutableArray *japanPlayerStats = [TeamsInfo getJapanPlayers];
    NSMutableArray *japanTeamInfo = [TeamsInfo getJapanTeamInfo];
    
    NSMutableArray *ivorycoastPlayerStats = [TeamsInfo getIvoryCoastPlayers];
    NSMutableArray *ivorycoastTeamInfo = [TeamsInfo getIvoryCoastTeamInfo];
    
    NSMutableArray *walesPlayerStats = [TeamsInfo getWalesPlayers];
    NSMutableArray *walesTeamInfo = [TeamsInfo getWalesTeamInfo];
    
    /* TeamInfo (NSMutableArray
    - Team Name
    - Team Abrv Name
    - Kit Main Colour
    - Kit Second Colour
    - Kit Sleeve Colour
     */
    
    
    //PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    
    //
    TeamData *team1 = [[TeamData alloc ] initWithTeaminfoAndStats   :englandTeamInfo   :englandPlayerStats];
    TeamData *team2 = [[TeamData alloc ] initWithTeaminfoAndStats   :franceTeamInfo    :francePlayerStats];
    TeamData *team3 = [[TeamData alloc ] initWithTeaminfoAndStats   :italyTeamInfo     :italyPlayerStats];
    TeamData *team4 = [[TeamData alloc ] initWithTeaminfoAndStats   :spainTeamInfo     :spainPlayerStats];
    TeamData *team5 = [[TeamData alloc ] initWithTeaminfoAndStats   :brazilTeamInfo    :brazilPlayerStats];
    TeamData *team6 = [[TeamData alloc ] initWithTeaminfoAndStats   :hollandTeamInfo   :hollandPlayerStats];
    TeamData *team7 = [[TeamData alloc ] initWithTeaminfoAndStats   :argentinaTeamInfo :argentinaPlayerStats];
    TeamData *team8 = [[TeamData alloc ] initWithTeaminfoAndStats   :ivorycoastTeamInfo :ivorycoastPlayerStats];
    TeamData *team9 = [[TeamData alloc ] initWithTeaminfoAndStats   :germanyTeamInfo   :germanyPlayerStats];
    TeamData *team10 = [[TeamData alloc ] initWithTeaminfoAndStats  :portugalTeamInfo  :portugalPlayerStats];
    TeamData *team11 = [[TeamData alloc ] initWithTeaminfoAndStats  :usaTeamInfo        :usaPlayerStats];
    TeamData *team12 = [[TeamData alloc ] initWithTeaminfoAndStats  :japanTeamInfo      :japanPlayerStats];
    TeamData *team13 = [[TeamData alloc ] initWithTeaminfoAndStats  :belgiumTeamInfo   :belgiumPlayerStats];
    TeamData *team14 = [[TeamData alloc ] initWithTeaminfoAndStats  :ghanaTeamInfo      :ghanaPlayerStats];
    TeamData *team15 = [[TeamData alloc ] initWithTeaminfoAndStats  :walesTeamInfo      :walesPlayerStats];
    
    
    [teams addObject:team1];
    [teams addObject:team2];
    [teams addObject:team3];
    [teams addObject:team4];
    [teams addObject:team5];
    [teams addObject:team6];
    [teams addObject:team7];
    [teams addObject:team8];
    [teams addObject:team9];
    [teams addObject:team10];
    [teams addObject:team11];
    [teams addObject:team12];
    [teams addObject:team13];
    [teams addObject:team14];
    [teams addObject:team15];
    
    
    //
    TeamData *originalTeam1 = [[TeamData alloc ] initWithTeaminfoAndStats   :englandTeamInfo   :englandPlayerStats];
    TeamData *originalTeam2 = [[TeamData alloc ] initWithTeaminfoAndStats   :franceTeamInfo    :francePlayerStats];
    TeamData *originalTeam3 = [[TeamData alloc ] initWithTeaminfoAndStats   :italyTeamInfo     :italyPlayerStats];
    TeamData *originalTeam4 = [[TeamData alloc ] initWithTeaminfoAndStats   :spainTeamInfo     :spainPlayerStats];
    TeamData *originalTeam5 = [[TeamData alloc ] initWithTeaminfoAndStats   :brazilTeamInfo    :brazilPlayerStats];
    TeamData *originalTeam6 = [[TeamData alloc ] initWithTeaminfoAndStats   :hollandTeamInfo   :hollandPlayerStats];
    TeamData *originalTeam7 = [[TeamData alloc ] initWithTeaminfoAndStats   :argentinaTeamInfo :argentinaPlayerStats];
    TeamData *originalTeam8 = [[TeamData alloc ] initWithTeaminfoAndStats   :ivorycoastTeamInfo :ivorycoastPlayerStats];
    TeamData *originalTeam9 = [[TeamData alloc ] initWithTeaminfoAndStats   :germanyTeamInfo   :germanyPlayerStats];
    TeamData *originalTeam10 = [[TeamData alloc ] initWithTeaminfoAndStats   :portugalTeamInfo :portugalPlayerStats];
    TeamData *originalTeam11 = [[TeamData alloc ] initWithTeaminfoAndStats   :usaTeamInfo       :usaPlayerStats];
    TeamData *originalTeam12 = [[TeamData alloc ] initWithTeaminfoAndStats   :japanTeamInfo     :japanPlayerStats];
    TeamData *originalTeam13 = [[TeamData alloc ] initWithTeaminfoAndStats   :belgiumTeamInfo   :belgiumPlayerStats];
    TeamData *originalTeam14 = [[TeamData alloc ] initWithTeaminfoAndStats   :ghanaTeamInfo     :ghanaPlayerStats];
    TeamData *originalTeam15 = [[TeamData alloc ] initWithTeaminfoAndStats   :walesTeamInfo     :walesPlayerStats];
    
    
    [originalTeams addObject:originalTeam1];
    [originalTeams addObject:originalTeam2];
    [originalTeams addObject:originalTeam3];
    [originalTeams addObject:originalTeam4];
    [originalTeams addObject:originalTeam5];
    [originalTeams addObject:originalTeam6];
    [originalTeams addObject:originalTeam7];
    [originalTeams addObject:originalTeam8];
    [originalTeams addObject:originalTeam9];
    [originalTeams addObject:originalTeam10];
    [originalTeams addObject:originalTeam11];
    [originalTeams addObject:originalTeam12];
    [originalTeams addObject:originalTeam13];
    [originalTeams addObject:originalTeam14];
    [originalTeams addObject:originalTeam15];

    
    //
    matchTeams = [[NSMutableArray alloc] init];
    
    //
    currentTeams = [NSMutableArray arrayWithArray:teams];
}



//
-(TeamData *)getTeam:(int)teamId;
{
    return [teams objectAtIndex:teamId];
}

//
-(TeamData *)getOriginalTeam:(int)teamId;
{
    return [originalTeams objectAtIndex:teamId];
}

//
-(NSMutableArray *)getTeams;
{
    return teams;
}

//
-(TeamData *)getCurrentTeam:(int)teamId;
{
    return [currentTeams objectAtIndex:teamId];
}

//
-(TeamData *)getMatchTeam:(int)teamId;
{
    return [matchTeams objectAtIndex:teamId];
}

-(void) addMatchTeam:(TeamData *)team
{
    [matchTeams addObject:team];
}

-(void) clearMatchTeams
{
    [matchTeams removeAllObjects];
}

-(long) getNumberOfTeams
{
    return [teams count];
}
//
-(void)addTeam:(TeamData *)team {
    [teams addObject:team];
}

//
+ (void) setTestNum:(int)num
{
    testNum = num;
}

//
+ (int) getTestNum
{
    return testNum;
}

//
+ (void) setHumanTeam:(bool)human
{
    humanTeam = human;
    //printf("/n **-> (GameData) Set human team = %d/n", humanTeam);
}

//
+ (bool) isHumanTeam
{
    return humanTeam;
}

//
+ (void) setMatchLength:(int)length
{
    matchLength = length;
}

+ (int) getMatchLength
{
    return matchLength;
}


//
+ (void) setBallColour:(int)colour
{
    ballColour = colour;
}

+ (int) getBallColour
{
    return ballColour;
}
//
+ (void) setDifficulty:(int)level
{
    difficulty = level;
}

+ (int) getDifficulty
{
    return difficulty;
}

//
+ (void) setScreenWidth:(int)width
{
    screenWidth = width;
}

+ (int) getScreenWidth
{
    return screenWidth;
}

//
+ (void) setScreenHeight:(int)height
{
    screenHeight = height;
}

+ (int) getScreenHeight
{
    return screenHeight;
}


//
+(void) setButtonControls:(bool)status {
    buttonControlsOn=status;
}

+ (bool) isButtonControlsOn {
    return buttonControlsOn;
}


+(void) setSwipeControls:(bool)status {
    swipeControlsOn=status;
}

+ (bool) isSwipeControlsOn {
    return swipeControlsOn;
}

+(void) setMoveAssist:(bool)status {
    moveAssistOn=status;
}

+ (bool) isMoveAssistOn {
    return moveAssistOn;
}

+(void) setPartialMoveAssist:(bool)status {
    partialMoveAssistOn=status;
}

+ (bool) isPartialMoveAssistOn {
    return partialMoveAssistOn;
}

//
+(void) setCrowdSounds:(bool)status {
    crowdSoundsOn=status;
}

+ (bool) isCrowdSoundsOn {
    return crowdSoundsOn;
}

//
+(void) setMenuSounds:(bool)status {
    menuSoundsOn=status;
}

+ (bool) isMenuSoundsOn {
    return menuSoundsOn;
}


+(void) setFxSounds:(bool)status {
    fxSoundsOn=status;
}

+ (bool) isFxSoundsOn {
    return fxSoundsOn;
}


+ (void) setDoResetMenuMusic:(bool)status {
    doResetMenuMusic=status;
}

+ (bool) getDoResetMenuMusic {
    return doResetMenuMusic;
}


+ (void) setMicroSoccerStarted:(bool)status {
    microSoccerStarted=status;
}

+ (bool) getMicroSoccerStarted {
    return microSoccerStarted;
}

+ (void) setLastReplayScale:(float)scale {
    lastReplayScale=scale;
}

+ (float) getLastReplayScale {
    return lastReplayScale;
}

+ (void) setLastGameScale:(float)scale {
    lastGameScale=scale;
}

+ (float) getLastGameScale {
    return lastGameScale;
}

//
+ (void) setPracticeMatch:(bool)practice
{
    practiceMatch = practice;
    //printf("/n **-> (GameData) Set human team = %d/n", humanTeam);
}

//
+ (bool) isPracticeMatch
{
    //printf("/n **-> (GameData) is human team = %d/n", humanTeam);
    return practiceMatch;
}

+ (void) setMenuSong:(NSString *)song {
    menuSong=song;
}

+ (NSString *) getMenuSong {
    return menuSong;
}



-(void) setSavedGameLayer:(CCNode *)layer;
{
    savedGameLayer=layer;
}

-(CCNode *) getSavedGameLayer
{
    return savedGameLayer;
}

// FUll time zoom
+ (void) setFulltimeZoom:(bool)doZoom {
    if(doZoom==true) {
        
        NSLog(@">>>Set Full time zoom TRUE");
    } else {
        NSLog(@">>>Set Full time zoom FALSE");

    }
    doFulltimeZoom=doZoom;
}

+ (bool) getFulltimeZoom {
    return doFulltimeZoom;
}


@end

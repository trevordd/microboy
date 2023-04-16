//
//  Team.m
//  mySoccer
//
//  Created by Trevor Delves on 14/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "Team.h"
#import "Player.h"
//#import "HudLayer.h"


@implementation Team

@synthesize kickingOff;
@synthesize overrideActivePlayer;
@synthesize overrideActivePlayerCounter;
@synthesize humanControlTimer;
@synthesize teamData;
@synthesize passRate;

@synthesize activeTargetPlayerId;
@synthesize activePlayerId;

bool controlsActive;

//
-(id) init
{
	NSAssert(NO, @"Team: Init not supported.");
	return nil;
}


// on "init" you need to initialize your in
-(id) initWithId:(NSString *)spriteId myTeamId:(int)tId
{
    // always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
        printf("Team init");
        
        formations = [[Formation alloc] init];
        //[formations setPositions];
        
        //
        [formations setLineupPositionsFacingUp];
        [formations setLineupPositionsFacingDown];
        
        [self setPlayerLineupPositionsFacingUp:[formations getLineupPositionsFacingUp]];
        [self setPlayerLineupPositionsFacingDown:[formations getLineupPositionsFacingDown]];
        
        teamId=tId;
        players = [[NSMutableArray alloc] init];
        outfieldPlayers = [[NSMutableArray alloc] init];
        activePlayersIds = [[NSMutableArray alloc] init];
        
        Player *p1 = [[Player alloc] initWithSprite:@"keeperGlovesN1.png"];
        [p1 setPlayerId:1];
        [p1 setTeamId:tId];
        [p1 setTeam: self];
       // [p1 setPlayerFormationPositions:[formations getDefenseRightPosition]]; // keeper has no formation - temp
        
        
        Player *p2 = [[Player alloc] initWithSprite:spriteId];
        [p2 setPlayerId:2];
        [p2 setTeamId:tId];
        [p2 setTeam: self];
        //[p2 setPlayerFormationPositions:[formations getDefenseRightPosition]];
        
        
        
        Player *p3 = [[Player alloc] initWithSprite:spriteId];
        [p3 setPlayerId:3];
        [p3 setTeamId:tId];
        [p3 setTeam: self];
        //[p3 setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
        
        
        Player *p4 = [[Player alloc] initWithSprite:spriteId];
        [p4 setPlayerId:4];
        [p4 setTeamId:tId];
        [p4 setTeam: self];
       // [p4 setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
        
        
        Player *p5 = [[Player alloc] initWithSprite:spriteId];
        [p5 setPlayerId:5];
        [p5 setTeamId:tId];
        [p5 setTeam: self];
       // [p5 setPlayerFormationPositions:[formations getDefenseLeftPosition]];
        
        
        Player *p6 = [[Player alloc] initWithSprite:spriteId];
        [p6 setPlayerId:6];
        [p6 setTeamId:tId];
        [p6 setTeam: self];
       // [p6 setPlayerFormationPositions:[formations getMidfieldRightPosition]];
        
        Player *p7 = [[Player alloc] initWithSprite:spriteId];
        [p7 setPlayerId:7];
        [p7 setTeamId:tId];
        [p7 setTeam: self];
      //  [p7 setPlayerFormationPositions:[formations getMidfieldCenterPosition]];
        
        
        Player *p8 = [[Player alloc] initWithSprite:spriteId];
        [p8 setPlayerId:8];
        [p8 setTeamId:tId];
        [p8 setTeam: self];
      //  [p8 setPlayerFormationPositions:[formations getMidfieldRightPosition]];
        
        
        Player *p9 = [[Player alloc] initWithSprite:spriteId];
        [p9 setPlayerId:9];
        [p9 setTeamId:tId];
        [p9 setTeam: self];
      //  [p9 setPlayerFormationPositions:[formations getStrikerRightPosition]];
   
        Player *p10 = [[Player alloc] initWithSprite:spriteId];
        [p10 setPlayerId:10];
        [p10 setTeamId:tId];
        [p10 setTeam: self];
     //   [p10 setPlayerFormationPositions:[formations getStrikerCenterPosition]];
  
        Player *p11 = [[Player alloc] initWithSprite:spriteId];
        [p11 setPlayerId:11];
        [p11 setTeamId:tId];
        [p11 setTeam: self];
      //  [p11 setPlayerFormationPositions:[formations getStrikerLeftPosition]];
        
        
        //        Player *p10 = [[Player alloc] initWithSprite:spriteId];
        //        [p10 setPlayerId:10];
        //        [p10 setTeamId:tId];
        //        [p10 setTeam: self];
        //        [p10 setPlayerFormationPositions:[formations getStrikerLeftPosition]];
        //
        
        //        //keeper = [[Player alloc] initWithSprite:@"p3_a.png"];
        //        Player *myKeeper = [[Player alloc] initWithSprite:spriteId];
        //        [myKeeper  setPlayerId:111];
        //        [myKeeper  setTeamId:tId];
        //        [myKeeper  setTeam: self];
        //        [keeper setPlayerFormationPositions:[formations getStrikerLeftPosition]];
        
        //        Player *p10 = [[Player alloc] initWithSprite:spriteId];
        //        [p10 setPlayerId:10];
        //        [p10 setTeamId:tId];
        //        [p10 setTeam: self];
        
        
        //
        [players addObject: p1];
        [players addObject: p2];
        [players addObject: p3];
        [players addObject: p4];
        [players addObject: p5];
        [players addObject: p6];
        [players addObject: p7];
        [players addObject: p8];
        [players addObject: p9];
        [players addObject: p10];
        [players addObject: p11];
        
        
        [outfieldPlayers addObject: p2];
        [outfieldPlayers addObject: p3];
        [outfieldPlayers addObject: p4];
        [outfieldPlayers addObject: p5];
        [outfieldPlayers addObject: p6];
        [outfieldPlayers addObject: p7];
        [outfieldPlayers addObject: p8];
        [outfieldPlayers addObject: p9];
        [outfieldPlayers addObject: p10];
        [outfieldPlayers addObject: p11];
        
        for (Player * myPlayer in players) {
            //[myPlayer setTeamId:teamId];
            if (teamId == 1)
            {
                [myPlayer setStrength:1.8];
            }
            else
            {
                [myPlayer setStrength:1.3];
            }
        }
        activePlayer=p1;
    }
    
    return self;
}



//
-(int)getPlayingDirection
{
    return playingDirection;
}

-(void) setPlayingDirection:(int)dir;
{
    playingDirection=dir;
}

//
-(Player *) getPlayer:(int)index
{
    // TODO : check if it exists first
    return [players objectAtIndex:index];
}

-(Player *) getMainPlayer
{
    //return [players objectAtIndex:5];
    return activePlayer;
}

//
-(void) setVisible:(BOOL)status
{
    for (Player * myPlayer in players )
    {
        myPlayer.visible=status;
        [myPlayer shadow].visible=status;
        //[myPlayer nameLabel].visible=status;
        [myPlayer nameLabel].visible=false;
        
    }
}


-(void) setLineup433 {
    [formations setLineupPositionsFacingUp433];
    [formations setLineupPositionsFacingDown433];
    
    [self setPlayerLineupPositionsFacingUp:[formations getLineupPositionsFacingUp]];
    [self setPlayerLineupPositionsFacingDown:[formations getLineupPositionsFacingDown]];
}

-(void) setLineup424 {
    [formations setLineupPositionsFacingUp424];
    [formations setLineupPositionsFacingDown424];
    
    [self setPlayerLineupPositionsFacingUp:[formations getLineupPositionsFacingUp]];
    [self setPlayerLineupPositionsFacingDown:[formations getLineupPositionsFacingDown]];
}

-(void) setLineup343 {
    [formations setLineupPositionsFacingUp343];
    [formations setLineupPositionsFacingDown343];
    
    [self setPlayerLineupPositionsFacingUp:[formations getLineupPositionsFacingUp]];
    [self setPlayerLineupPositionsFacingDown:[formations getLineupPositionsFacingDown]];
}

-(void) setLineup451 {
    [formations setLineupPositionsFacingUp451];
    [formations setLineupPositionsFacingDown451];
    
    [self setPlayerLineupPositionsFacingUp:[formations getLineupPositionsFacingUp]];
    [self setPlayerLineupPositionsFacingDown:[formations getLineupPositionsFacingDown]];
}

-(void) setLineup442 {
    [formations setLineupPositionsFacingUp];
    [formations setLineupPositionsFacingDown];
    
    [self setPlayerLineupPositionsFacingUp:[formations getLineupPositionsFacingUp]];
    [self setPlayerLineupPositionsFacingDown:[formations getLineupPositionsFacingDown]];
}

//
-(void) moveAllPlayersOffScreen
{
    CGPoint pos = ccp(0,0);
    for (Player * myPlayer in players)
    {
        [myPlayer setSpritePosition:pos];
        [myPlayer setShadowPosition:pos];
        [myPlayer setNameLabelPosition:pos];
        
    }
}

//
-(void) setStartPositions
{
    int x=10;
    for (Player * myPlayer in outfieldPlayers) {
        printf("\n player id = %d \n", [myPlayer playerId]);
        if (teamId == 1)
        {
            [myPlayer setPositionX:100+x Y:300];
            //CGPoint targetPos = ccp(110+x,300);
            //[myPlayer setTargetPos:targetPos];
            
            [myPlayer setTargetPos: [myPlayer position]];
        }
        else
        {
            [myPlayer setPositionX:100+x Y:380];
            // CGPoint targetPos = ccp(110+x,380);
            // [myPlayer setTargetPos:targetPos];
            
            [myPlayer setTargetPos: [myPlayer position]];
            
        }
        x+=30;
    }
    
    
    
}

-(Player *) getKeeper
{
    return [players objectAtIndex:0];
}

//
-(NSString *) getTeamName
{
    return teamName;
}

//
-(void) setTeamName:(NSString *)name;
{
    teamName=name;
}

-(void) setScore:(int)goals
{
    score=goals;
}

-(int) getScore
{
    return score;
}

-(void) updateScore
{
    score++;
}

//
-(void) setGameLayer:(GameLayer *)gameLayer
{
    for (Player * myPlayer in players)
    {
        [myPlayer setGameLayer:gameLayer];
    }
}


-(int) getPassRateStartRangeByDifficulty {
    switch([GameData getDifficulty]) {
            
        case EASY:
            return LOWEST_PASS_RATE_BASE + [Util random:EASY_PASS_RATE_RANGE];
            break;
            
        case MEDIUM:
            return MEDIUM_PASS_RATE_BASE + [Util random:MEDIUM_PASS_RATE_RANGE];
            break;
            
        case HARD:
            return HIGHEST_PASS_RATE_BASE + [Util random:HARD_PASS_RATE_RANGE];
            break;
            
        default:
            return MEDIUM_PASS_RATE_BASE;
            break;
    }
}


-(void) setTeamPassRate {
    int randomPassRate;
    randomPassRate = [self getPassRateStartRangeByDifficulty];
   // NSLog(@">> Team : %d - Pass Rate : %d", self.getTeamId, randomPassRate);
    
    [self setPassRate:randomPassRate];
    //[self setPassRate:2];
    
}


//
-(void)setPlayerNames:(NSMutableArray *)playerData
{
    for (Player * myPlayer in players)
    {
        int playerId = [myPlayer playerId];
        
        NSString *pName = [[playerData objectAtIndex:playerId-1] playerName];
        CCLOG(@">> *** SET NAME : %@", pName);
        
        [myPlayer setPlayerName:pName];
    }
}


//
-(void)setPlayerNamesOld:(NSMutableArray *)names
{
    for (Player * myPlayer in players)
    {
        int playerId = [myPlayer playerId];
        
        NSString *pName = [names objectAtIndex:playerId-1];
        CCLOG(@">> *** SET NAME : %@", pName);
        
        //CCLOG(@"/n **** SET NAME = %@", pName);
        //printf("/n *** SET NAME : %@/n",testName);
        
        // [myPlayer setPlayerName:[names objectAtIndex:playerId-1]];
        [myPlayer setPlayerName:pName];
        //[[myPlayer nameLabel] setString:pName];
        
    }
    
    //  [keeper setPlayerName:@"TrevorD"];
}

//
-(NSMutableArray *)getLineupPositionsFaceUp
{
    // CCLOG(@"*Lineup Up* Team %d : Kicking Off : %d", teamId, kickingOff);
    
//    if (kickingOff)
//    {
//        NSValue *strikerPos1 = [NSValue valueWithCGPoint:KICKOFF_LINEUP_STRIKER_POS1];
//        [lineupPositionsFaceUp replaceObjectAtIndex:PLAYER7_ID-2  withObject:strikerPos1];
//        
//        NSValue *strikerPos2= [NSValue valueWithCGPoint:KICKOFF_LINEUP_STRIKER_POS2];
//        [lineupPositionsFaceUp replaceObjectAtIndex:PLAYER8_ID-2  withObject:strikerPos2];
//    }

    return lineupPositionsFaceUp;
}

//
-(NSMutableArray *)getLineupPositionsFaceDown
{
    //CCLOG(@"*Lineup Down* Team %d : Kicking Off : %d", teamId, kickingOff);
    
//    if (kickingOff)
//    {
//        NSValue *strikerPos1 = [NSValue valueWithCGPoint:KICKOFF_LINEUP_STRIKER_POS1];
//        [lineupPositionsFaceDown replaceObjectAtIndex:PLAYER7_ID-2  withObject:strikerPos1];
//        
//        NSValue *strikerPos2= [NSValue valueWithCGPoint:KICKOFF_LINEUP_STRIKER_POS2];
//        [lineupPositionsFaceDown replaceObjectAtIndex:PLAYER8_ID-2  withObject:strikerPos2];
//    }
   
    return lineupPositionsFaceDown;
}

//
-(void) setLineupPositionsOriginal
{
    NSValue *val;
    CGPoint p;
    
    //Team * currentTeam
    //CCLOG(@">>> SET LINEUP POSITIONS ***\n");
    
    //NSMutableArray *oPlayers = outfieldPlayers;
    for (Player * myPlayer in outfieldPlayers)
    {
        int playerId = [myPlayer playerId];
        //if (teamId == 1)
        if ([[myPlayer team] getPlayingDirection] == 0)
            val = [lineupPositionsFaceUp objectAtIndex:playerId-2];
        else
            val = [lineupPositionsFaceDown objectAtIndex:playerId-2];
        
        //printf("** Val = %s", val);
        p = [val CGPointValue];
        [myPlayer setPositionX:p.x Y:p.y];
        [myPlayer setTargetPos:p];
        [myPlayer updateSpritePos];
        //            [myPlayer setTargetPos:ccp(p.x,p.y)];
        
    }
    
    if ([self isPlayingUpPitch])
        [[self getKeeper] setPositionX:PITCH_X_CENTER Y:KEEPER_BOTTOM_LINE];
    else
        [[self getKeeper] setPositionX:PITCH_X_CENTER Y:KEEPER_TOP_LINE];
}


-(CGPoint) getKickOffStriker1Position
{
    return ccp(PITCH_X_CENTER, PITCH_Y_CENTER-5);
}

-(CGPoint) getKickOffStriker2Position
{
    return ccp(PITCH_X_CENTER+10, PITCH_Y_CENTER+1);
}

-(bool) isHumanTeamPlaying {
    return ([self getTeamId] == TEAM1 && [self isHumanTeam]);
}


-(void) setLineupPositions
{
    NSValue *val;
    CGPoint p;
    
    //Team * currentTeam
    //CCLOG(@">>> SET LINEUP POSITIONS ***\n");
    
    //NSMutableArray *oPlayers = outfieldPlayers;
    for (Player * myPlayer in outfieldPlayers)
    {
        int playerId = [myPlayer playerId];

        if ([[myPlayer team] getPlayingDirection] == SHOOTING_UP)
        {
            val = [[self getLineupPositionsFaceUp] objectAtIndex:playerId-2];
            // val = [lineupPositionsFaceUp objectAtIndex:playerId-2];
        }
        else
        {
            val = [[self getLineupPositionsFaceDown] objectAtIndex:playerId-2];
            //val = [lineupPositionsFaceDown objectAtIndex:playerId-2];
        }
        p = [val CGPointValue];
        
        
        // override striker positions for kicking off team
        if ((kickingOff || [GameData isPracticeMatch]) && (playerId == PLAYER9_ID || playerId == PLAYER10_ID)) {
            if (playerId == PLAYER9_ID ) {
                //[self setTargetPos: KICKOFF_LINEUP_STRIKER_POS1];
                p = KICKOFF_LINEUP_STRIKER_POS1;
                
                if ([self isHumanTeamPlaying] ) {
                    //[self setActivePlayerSpritePosition:p];
                    activePlayer = [self getPlayerById:playerId];
                    NSLog(@"..Active Player 1 : %@",activePlayer);
                }
                
            } else if (playerId == PLAYER10_ID) {
                p= KICKOFF_LINEUP_STRIKER_POS2;
            }
        }

        // set positions
        [myPlayer setPositionX:p.x Y:p.y];
        [myPlayer setTargetPos:p];
        [myPlayer setMoveVector];
        [myPlayer updateSpritePos];
        
    }
    
    if ([self isPlayingUpPitch])
        [[self getKeeper] setPositionX:PITCH_X_CENTER Y:KEEPER_BOTTOM_LINE];
    else
        [[self getKeeper] setPositionX:PITCH_X_CENTER Y:KEEPER_TOP_LINE];
}




//
-(void) setLineupPositionsDodgy
{
    NSValue *val;
    
    //Team * currentTeam
    //CCLOG(@">>> SET LINEUP POSITIONS ***\n");
    
    //NSMutableArray *oPlayers = outfieldPlayers;
    for (Player * myPlayer in outfieldPlayers)
    {
        int playerId = [myPlayer playerId];

        // set main positions
        if ([[myPlayer team] getPlayingDirection] == PLAYING_UP) {
            val = [lineupPositionsFaceUp objectAtIndex:playerId-2];
        }
        else {
            val = [lineupPositionsFaceDown objectAtIndex:playerId-2];
        }
        
        NSValue *val = [[myPlayer getPlayerFormationPositions] objectAtIndex:11];
        CGPoint p = [val CGPointValue];
       
        // set positions
        [myPlayer setPositionX:p.x Y:p.y];
        [myPlayer setTargetPos:p];
        [myPlayer updateSpritePos];
    }
    
    if ([self isPlayingUpPitch])
        [[self getKeeper] setPositionX:PITCH_X_CENTER Y:KEEPER_BOTTOM_LINE];
    else
        [[self getKeeper] setPositionX:PITCH_X_CENTER Y:KEEPER_TOP_LINE];
}


-(void)setPlayerLineupPositions:(NSMutableArray *)positions
{
    lineupPositions=positions;
}

-(void)setPlayerLineupPositionsFacingUp:(NSMutableArray *)positions
{
    lineupPositionsFaceUp=positions;
}

-(void)setPlayerLineupPositionsFacingDown:(NSMutableArray *)positions
{
    lineupPositionsFaceDown=positions;
}

//
-(void) setupRunoutStartPositions
{
    if ([self isPlayingUpPitch])
    {
        int i=0;
        for (Player * myPlayer in players)
        {
            [myPlayer setRunoutState:runoutStairs];
            [myPlayer setPosition: ccp( RUNOUT_START_X+i*RUNOUT_X_GAP, RUNOUT_START_Y-RUNOUT_Y_GAP-5)];
            
            if ([myPlayer z] > 0) {
                NSLog(@"**** Player Z was higher than 0 : %f, continuing...",[myPlayer z]);
            }
            [myPlayer setZ:0.0];
            [myPlayer setZVector:0.0];
            i++;
        }
    }
    else
    {
        int i=0;
        for (Player * myPlayer in players)
        {
            [myPlayer setRunoutState:runoutStairs];
            [myPlayer setPosition: ccp( RUNOUT_START_X+i*RUNOUT_X_GAP, RUNOUT_START_Y+RUNOUT_Y_GAP-5)];
            
            if ([myPlayer z] > 0) {
                NSLog(@"**** Player Z was higher than 0 : %f, continuing...",[myPlayer z]);
            }
            [myPlayer setZ:0.0];
            [myPlayer setZVector:0.0];
            i++;
        }
    }
}



-(float) getSpeed:(Player *) myPlayer {
    float speed = [[myPlayer playerData] speed];
    //NSLog(@">>>Speed before : %f", speed);
    
    if ([[myPlayer team] getTeamId] == TEAM2) {
        
        switch([GameData getDifficulty]) {
                
            case EASY:
                //NSLog(@">>Speed easy... : %f", speed*(EASY_SPEED_PERC/PERCENT_100));
                speed-=(float)(speed*(EASY_SPEED_PERC/PERCENT_100));
                break;
                
            case MEDIUM:
                //NSLog(@">>Speed medium...");

                // opp speed remains the same
                break;
        
            case HARD:
                //NSLog(@">>Speed hard... %f",speed*(HARD_SPEED_PERC/PERCENT_100));
                speed+=(speed*(HARD_SPEED_PERC/PERCENT_100));
                break;
                
            default:
                break;
        }
    }
    //NSLog(@">>>Speed after : %f", speed);
    
    speed+=(speed*(OVERALL_SPEED_INCREASE_PERC/PERCENT_100));
    return speed;
}

-(void) showPlayerArrowSprite :(bool) status
{
    if (status && ([GameData isPracticeMatch] || [self isHumanTeamPlaying])) {
        if ([[GameModel sharedGameModel] getMatchSecs] < DISPLAY_PLAYER_ARROW_TIME_IN_SECS) {
            playerArrowSprite.visible=status;
        } else {
            playerArrowSprite.visible=false;
        }
    } else {
        playerArrowSprite.visible=false;
    }
}


-(void) assignStats {
    for (Player * myPlayer in players)
    {
        [myPlayer setSpeed:[self getSpeed:myPlayer]];
        //[myPlayer setSpeed: speed];
    }
}


-(void) assignTeamAndPlayerData {
    
    [self setTeamName: [[self teamData]shortTeamName]];
    
    int i=0;
    for (Player * myPlayer in players)
    {
        PlayerData *pData = [[[self teamData] playersData] objectAtIndex:i];
        [myPlayer setPlayerData: pData];
        [myPlayer setPlayerName: [pData playerName]];
        
        i++;
    }
    
    [self assignStats];
}







//
-(void) setPlayerSkinHairOld {
    
//    CCColor *claretColor = [CCColor colorWithRed:(105/255.0) green:(25/255.0) blue:(9/255.0) alpha:(1.0f)];
//    CCColor *lightBlueColor = [CCColor colorWithRed:(113/255.0) green:(186/255.0) blue:(235.0/255.0) alpha:(1.0f)];
    
    CCColor *lightBrownColor = [CCColor colorWithRed:(189/255.0) green:(151/255.0) blue:(120.0/255.0) alpha:(1.0f)];
    CCColor *darkBrownColor = [CCColor colorWithRed:(102/255.0) green:(79/255.0) blue:(60.0/255.0) alpha:(1.0f)];
    //CCColor *blondeColor = [CCColor colorWithRed:(238/255.0) green:(221.0/255.0) blue:(130/255.0) alpha:(1.0f)];
    CCColor *gingerColor = [CCColor colorWithRed:(176.0/255.0) green:(101.0/255.0) blue:(0.1/255.0) alpha:(1.0f)];

    
    
    
    for (Player * myPlayer in players)
    {
        
        if ([Util random5050]) {
            [[myPlayer skinSprite] setColor: [CCColor brownColor]];
            [[myPlayer skinSprite2] setColor: [CCColor brownColor]];
            [[myPlayer skinSlideSprite] setColor: [CCColor brownColor]];
        }
        else {
            [[myPlayer skinSprite] setColor: lightBrownColor];
            [[myPlayer skinSprite2] setColor: lightBrownColor];
            [[myPlayer skinSlideSprite] setColor: lightBrownColor];
        }
        
        int randomHairColour = [Util random:5];
        CCColor *hairColour=nil;
        
        NSLog(@">>> Random hair id : %d", randomHairColour);
        
        switch (randomHairColour) {
            
        case 0:
            hairColour=[CCColor blackColor];
            break;
                
        case 1:
            hairColour=[CCColor blackColor];
            break;
                
        case 2:
            hairColour=darkBrownColor;
            break;
        
        case 3:
            hairColour=darkBrownColor;
            break;
                
        case 4:
            hairColour=gingerColor;
            break;
            
        default:
            hairColour=[CCColor blackColor];

            break;
        }
        
        [[myPlayer hairSprite] setColor: hairColour];
        [[myPlayer hairSprite2] setColor: hairColour];
        [[myPlayer hairSlideSprite] setColor: hairColour];

        
        
//        if ([Util random5050]) {
//            [[myPlayer hairSprite] setColor: [CCColor blackColor]];
//            [[myPlayer hairSprite2] setColor: [CCColor blackColor]];
//            [[myPlayer hairSlideSprite] setColor: [CCColor blackColor]];
//        }
//        else {
//            [[myPlayer hairSprite] setColor: darkBrownColor];
//            [[myPlayer hairSprite2] setColor: darkBrownColor];
//            [[myPlayer hairSlideSprite] setColor: darkBrownColor];
//        }
    }
}

//
+(CCColor *) getHoardingColour : (int) colourIndex {
    
    CCColor *claretColor = [CCColor colorWithRed:(105/255.0) green:(25/255.0) blue:(9/255.0) alpha:(1.0f)];
    CCColor *lightBlueColor = [CCColor colorWithRed:(113/255.0) green:(186/255.0) blue:(235.0/255.0) alpha:(1.0f)];
    CCColor *brazilYellowColor = [CCColor colorWithRed:(255/255.0) green:(204/255.0) blue:(41.0/255.0) alpha:(1.0f)];
    CCColor *gingerColor = [CCColor colorWithRed:(176.0/255.0) green:(101.0/255.0) blue:(0.1/255.0) alpha:(1.0f)];
    CCColor *italianBlueColor = [CCColor colorWithRed:(0.1/255.0) green:(127.0/255.0) blue:(225.0/255.0) alpha:(1.0f)];
    CCColor *ivoryWhiteColor = [CCColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(240.0/255.0) alpha:(1.0f)];
    CCColor *dutchOrangeColor = [CCColor colorWithRed:(255.0/255.0) green:(79.0/255.0) blue:(0.0/255.0) alpha:(1.0f)];
    CCColor *spanishRedColor = [CCColor colorWithRed:(230.0/255.0) green:(0.1/255.0) blue:(38.0/255.0) alpha:(1.0f)];
    CCColor *englandBlueColor = [CCColor colorWithRed:(127.0/255.0) green:(161.0/255.0) blue:(192.0/255.0) alpha:(1.0f)];
    CCColor *belgianBlueColor = [CCColor colorWithRed:(207.0/255.0) green:(222.0/255.0) blue:(227.0/255.0) alpha:(1.0f)];
    
    //
    CCColor *colour;
    
    switch(colourIndex) {
            
        case 0:
            colour=[CCColor whiteColor];
            break;
            
        case 1:
            colour=lightBlueColor;
            break;
            
        case 2:
            colour=[CCColor blackColor];
            break;
            
        case 3:
            colour=claretColor;
            break;
            
        case 4:
            colour=[CCColor grayColor];
            break;
            
        case 5:
            colour=[CCColor lightGrayColor];
            break;
            
        case 6 :
            colour=brazilYellowColor;
            break;
            
        case 7 :
            colour=gingerColor;
            break;
            
        case 8 :
            colour=italianBlueColor;
            break;
            
        case 9 :
            colour=ivoryWhiteColor;
            break;
            
        case 10 :
            colour=dutchOrangeColor;
            break;
            
        case 11 :
            colour=spanishRedColor;
            break;
            
        case 12:
            colour=englandBlueColor;
            break;
    
        case 13:
            colour=belgianBlueColor;
            break;
         
        case 14 :
            colour=brazilYellowColor;
            break;
            
        default:
            colour = [CCColor grayColor];
            break;
    }
    
    return colour;
}

//
+(CCColor *) getColour : (int) colourIndex {
    
    CCColor *claretColor = [CCColor colorWithRed:(105/255.0) green:(25/255.0) blue:(9/255.0) alpha:(1.0f)];
    CCColor *lightBlueColor = [CCColor colorWithRed:(113/255.0) green:(186/255.0) blue:(235.0/255.0) alpha:(1.0f)];
    CCColor *lightBrownColor = [CCColor colorWithRed:(210/255.0) green:(190/255.0) blue:(150/255.0) alpha:(1.0f)];
    CCColor *darkBrownColor = [CCColor colorWithRed:(102/255.0) green:(79/255.0) blue:(60.0/255.0) alpha:(1.0f)];
    CCColor *keeperGreenColor = [CCColor colorWithRed:(87/255.0) green:(254/255.0) blue:(83.0/255.0) alpha:(1.0f)];
    CCColor *brazilYellowColor = [CCColor colorWithRed:(255/255.0) green:(204/255.0) blue:(41.0/255.0) alpha:(1.0f)];
    CCColor *brazilGreenColor = [CCColor colorWithRed:(1/255.0) green:(168/255.0) blue:(69.0/255.0) alpha:(1.0f)];
    CCColor *gingerColor = [CCColor colorWithRed:(176.0/255.0) green:(101.0/255.0) blue:(0.1/255.0) alpha:(1.0f)];
    CCColor *skinWhiteColor = [CCColor colorWithRed:(215.0/255.0) green:(172.0/255.0) blue:(115.0/255.0) alpha:(1.0f)];
    CCColor *italianBlueColor = [CCColor colorWithRed:(0.1/255.0) green:(127.0/255.0) blue:(225.0/255.0) alpha:(1.0f)];
    CCColor *ivoryWhiteColor = [CCColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(240.0/255.0) alpha:(1.0f)];
    CCColor *dutchOrangeColor = [CCColor colorWithRed:(255.0/255.0) green:(79.0/255.0) blue:(0.0/255.0) alpha:(1.0f)];
    CCColor *spanishRedColor = [CCColor colorWithRed:(230.0/255.0) green:(0.1/255.0) blue:(38.0/255.0) alpha:(1.0f)];
    CCColor *extraDarkBrownColor = [CCColor colorWithRed:(78.0/255.0) green:(45.0/255.0) blue:(3.0/255.0) alpha:(1.0f)];
    CCColor *englandBlueColor = [CCColor colorWithRed:(127.0/255.0) green:(161.0/255.0) blue:(192.0/255.0) alpha:(1.0f)];
    CCColor *portugalLightGreenColor = [CCColor colorWithRed:(127.0/255.0) green:(161.0/255.0) blue:(192.0/255.0) alpha:(1.0f)];
    CCColor *portugalDarkGreenColor = [CCColor colorWithRed:(125.0/255.0) green:(223.0/255.0) blue:(205.0/255.0) alpha:(1.0f)];
    CCColor *germanyGreenColor = [CCColor colorWithRed:(100.0/255.0) green:(107.0/255.0) blue:(90.0/255.0) alpha:(1.0f)];
    CCColor *keeperBrownHairColor = [CCColor colorWithRed:(106.0/255.0) green:(62.0/255.0) blue:(10.0/255.0) alpha:(1.0f)];
    CCColor *belgianBlueColor = [CCColor colorWithRed:(207.0/255.0) green:(222.0/255.0) blue:(227.0/255.0) alpha:(1.0f)];
    CCColor *japanYellowColor = [CCColor colorWithRed:(207.0/255.0) green:(234.0/255.0) blue:(115.0/255.0) alpha:(1.0f)];
    CCColor *ivoryCoastGreenColor = [CCColor colorWithRed:(50.0/255.0) green:(145.0/255.0) blue:(123.0/255.0) alpha:(1.0f)];
   
    //
    CCColor *colour;
    
    switch(colourIndex) {
        
        case WHITE:
            colour=[CCColor whiteColor];
            break;
            
        case BLUE:
            colour=[CCColor blueColor];
            break;
            
        case RED:
            colour=[CCColor redColor];
            break;
            
        case LIGHT_BLUE:
            colour=lightBlueColor;
            break;
            
        case YELLOW:
            colour=[CCColor yellowColor];
            break;
            
        case GREEN:
            colour=keeperGreenColor;
            break;
            
        case BLACK:
            colour=[CCColor blackColor];
            break;
            
        case ORANGE:
            colour=[CCColor orangeColor];
            break;
    
        case LIGHT_BROWN:
            colour=lightBrownColor;
            break;
        
        case DARK_BROWN:
            colour=darkBrownColor;
            break;
    
        case CLARET:
            colour=claretColor;
            break;
            
        case GRAY:
            colour=[CCColor grayColor];
            break;
            
        case LIGHT_GRAY:
            colour=[CCColor lightGrayColor];
            break;
        
        case DARK_GRAY:
            colour=[CCColor darkGrayColor];
            break;
            
        case BRAZIL_YELLOW :
            colour=brazilYellowColor;
            break;
            
        case BRAZIL_GREEN :
            colour=brazilGreenColor;
            break;
            
        case GINGER :
            colour=gingerColor;
            break;
            
        case SKIN_WHITE :
            colour=skinWhiteColor;
            break;
            
        case ITALIAN_BLUE :
            colour=italianBlueColor;
            break;
            
        case IVORY_WHITE :
            colour=ivoryWhiteColor;
            break;
            
        case DUTCH_ORANGE :
            colour=dutchOrangeColor;
            break;
            
        case SPANISH_RED :
            colour=spanishRedColor;
            break;
            
        case EXTRA_DARK_BROWN:
            colour=extraDarkBrownColor;
            break;
            
        case ENGLAND_BLUE:
            colour=englandBlueColor;
            break;
      
        case PORTUGAL_LIGHT_GREEN:
            colour=portugalLightGreenColor;
            break;
            
        case PORTUGAL_DARK_GREEN:
            colour=portugalDarkGreenColor;
            break;
       
        case GERMANY_GREEN:
            colour=germanyGreenColor;
            break;
            
        case KEEPER_BROWN_HAIR:
            colour=keeperBrownHairColor;
            break;
            
        case BELGIAN_BLUE:
            colour=belgianBlueColor;
            break;
        
        case JAPAN_YELLOW:
            colour=japanYellowColor;
            break;
        
        case IVORY_COAST_GREEN:
            colour=ivoryCoastGreenColor;
            break;
            
        default:
            colour = [CCColor grayColor];
        break;
    }
    
    return colour;
}

//
//
//
-(void) setPlayerSkinHair {
    
    for (Player * myPlayer in players)
    {
        
        CCColor *skinColour = [Team getColour: myPlayer.playerData.skinColour];
        CCColor *hairColour = [Team getColour: myPlayer.playerData.hairColour];
        
        //
        [[myPlayer skinSprite] setColor: skinColour];
        [[myPlayer skinSprite2] setColor: skinColour];
        [[myPlayer skinSlideSprite] setColor: skinColour];
        
        [[myPlayer hairSprite] setColor: hairColour];
        [[myPlayer hairSprite2] setColor: hairColour];
        [[myPlayer hairSlideSprite] setColor: hairColour];
    }
}




//
-(void) setTeamColour
{
    CCColor *keeperGreenColor = [CCColor colorWithRed:(87/255.0) green:(254/255.0) blue:(83.0/255.0) alpha:(1.0f)];

    //
    CCColor *mainColor = [Team getColour: self.teamData.stripMainColour];
    CCColor *mainStripeColor = [Team getColour: self.teamData.stripSecondColour];
    CCColor *sleeveColor = [Team getColour: self.teamData.stripSleevesColour];
    
    CCLOG(@">>>>>> TEAM NAME : %@", [self getTeamName]);
    
    for (Player * myPlayer in players)
    {
        if ([myPlayer playerId] == KEEPER_ID)
        {
            [[myPlayer kitSprite] setColor: keeperGreenColor];
            [[myPlayer kitSprite2] setColor: keeperGreenColor];
            
            [[myPlayer kitCentreStripSprite] setColor: keeperGreenColor];
            [[myPlayer kitCentreStripSprite2] setColor: keeperGreenColor];
            [[myPlayer kitCentreStripSlideSprite] setColor:keeperGreenColor];
            
            [[myPlayer kitArmsSprite] setColor: keeperGreenColor];
            [[myPlayer kitArmsSprite2] setColor: keeperGreenColor];
            [[myPlayer kitSleeveSlideSprite] setColor: keeperGreenColor];
        }
        else
        {
            [[myPlayer kitSprite] setColor: mainColor];
            [[myPlayer kitSprite2] setColor: mainColor];
            [[myPlayer kitSlideSprite] setColor: mainColor];
            
            [[myPlayer kitCentreStripSprite] setColor:mainStripeColor];
            [[myPlayer kitCentreStripSprite2] setColor:mainStripeColor];
            [[myPlayer kitCentreStripSlideSprite] setColor:mainStripeColor];
            
            [[myPlayer kitArmsSprite] setColor: sleeveColor];
            [[myPlayer kitArmsSprite2] setColor: sleeveColor];
            [[myPlayer kitSleeveSlideSprite] setColor: sleeveColor];
        }
    }
}




//
-(void) movePlayersOntoPitch:(CCTime)dt :(Ball *)ball
{
    for (Player * myPlayer in players)
    {
        [myPlayer movePlayersOntoPitch:dt :ball];
    }
    
    if ([self isHumanTeamPlaying]) {
        
        int kickOffPlayerId;
        
        if (kickingOff) {
            kickOffPlayerId=PLAYER9_ID;
        } else {
            kickOffPlayerId=PLAYER10_ID;
        }
        
        [self setActivePlayerSpritePosition:[self getPlayerById:kickOffPlayerId].position];
    }
}

//
-(bool) isReadyForKickOff
{
    for (Player * myPlayer in players)
    {
        if (![myPlayer readyForKickOff])
        {
            return false;
        }
    }
    
    
    // reset for next time
    for (Player * myPlayer in players)
    {
        [myPlayer setReadyForKickOff:false];
    }
    return true;
}


-(void) setPlayersStanding {
    for (Player * myPlayer in players) {
        [myPlayer setPlayerStanding];
    }
}


//
-(void) movePlayersOffField:(CCTime)dt
{
    CGPoint offFieldPos = ccp(550,300);
    for (Player * myPlayer in players)
    {
        [myPlayer setTargetPos:offFieldPos];
        [myPlayer movePlayerOffField:dt];
    }
}


//
-(void) movePlayersOffFieldHalfSpeed:(CCTime)dt
{
    CGPoint offFieldPos = ccp(550,300);
    for (Player * myPlayer in players)
    {
        [myPlayer setTargetPos:offFieldPos];
        [myPlayer movePlayerOffFieldHalfSpeed:dt];
    }
}

//
-(void) movePlayersFullTimeHalfSpeed:(CCTime)dt
{
    CGPoint fieldPos = ccp(PITCH_RIGHT,PITCH_Y_CENTER);
    for (Player * myPlayer in players)
    {
        [myPlayer setTargetPos:fieldPos];
        [myPlayer movePlayerOffFieldHalfSpeed:dt];
    }
}


//
-(void) movePlayersGoalScoredOld:(CCTime)dt
{
    //CGPoint offFieldPos = ccp(20 + arc4random() % 300,10 + arc4random() % 400);
    CGPoint offFieldPos = ccp(500,300);
    
    for (Player * myPlayer in outfieldPlayers)
    {
        //printf("\n player id = %d \n", [myPlayer playerId]);
        // CGPoint offFieldPos = ccp(340,300);
        [myPlayer setTargetPos:offFieldPos];
        [myPlayer movePlayerOffField:dt];
    }
}

//
-(void) setPlayersFaceBall :(Ball *)ball
{
    for (Player * myPlayer in outfieldPlayers)
    {
        [myPlayer setPlayerFaceBall:ball];
    }
}

//
-(void) setGoalScorerCelebPosition:(CCTime)dt :(Ball *)ball
{
    CGPoint celebPosition;
    int randX=0;
    int randY=0;
    
    //randX = 20 + arc4random() % 300;
    
    //randX = 20 + arc4random() % (PITCH_WIDTH/2);
    randX = 20 + [Util random : (PITCH_WIDTH/2)];
    int boundaryBuffer =100;
    
    //CGPoint offFieldPos = ccp(20 + arc4random() % 300,10 + arc4random() % 400);
    if ([ball isBallUpField])
    {
        // get scorer /active player
        //randY = 340 + arc4random() % 320;
        randY = PITCH_Y_CENTER + ([Util random : PITCH_HEIGHT/2] -boundaryBuffer);
    }
    else
    {
        //randY = 340 - arc4random() % 320;
        randY = PITCH_Y_CENTER - ([Util random : PITCH_HEIGHT/2]-boundaryBuffer);
    }
    
    celebPosition = ccp(randX,randY);
    [[self getMainPlayer] setTargetPos:celebPosition];
    
}

//
-(void) setCelebPositionSet:(bool)status
{
    celebPositionSet=status;
}

//
-(Formation *)getFormations
{
    return formations;
}

//
-(void) setActivePlayerSpritePosition:(CGPoint) pos
{
    activePlayerSprite.position = pos;
    playerArrowSprite.position = ccp(pos.x, pos.y+25);

    
}

-(void) setActiveTargetSpritePosition:(CGPoint) pos
{
    activeTargetSprite.position = pos;
}




//
-(void) movePlayersGoalScoredOld:(CCTime)dt :(Ball *)ball
{
    CGPoint celebPosition;
    int randX=0;
    int randY=0;
    
    randX = 20 + arc4random() % 300;
    //CGPoint offFieldPos = ccp(20 + arc4random() % 300,10 + arc4random() % 400);
    if ([ball isBallUpField])
    {
        // get scorer /active player
        randY = 340 + arc4random() % 320;
    }
    else
    {
        randY = 340 - arc4random() % 320;
    }
    
    celebPosition = ccp(randX,randY);
    [[self getMainPlayer] setTargetPos:celebPosition];
    
    for (Player * myPlayer in outfieldPlayers)
    {
        //printf("\n player id = %d \n", [myPlayer playerId]);
        //        // CGPoint offFieldPos = ccp(340,300);
        if ([[self getMainPlayer] playerId] != [myPlayer playerId])
        {
            [myPlayer setTargetPos:[[self getMainPlayer] position]];
            //[myPlayer movePlayerOffField:dt];
        }
        [myPlayer movePlayerOffField:dt];
    }
}

-(void) displayPlayersDirectionInfo
{
    for (Player * myPlayer in players)
    {
        if ([myPlayer isTeamShootingUp])
        {
            CCLOG(@">>PLAYER Name: %@ - ID :  %d - Team id %d - FACING DIRECTION UP",[myPlayer playerName], [myPlayer playerId],[myPlayer  getTeamId]);
        }
        else
        {
            CCLOG(@">>PLAYER Name: %@ - ID :  %d - Team id %d - FACING DIRECTION DOWN",[myPlayer playerName], [myPlayer playerId],[myPlayer  getTeamId]);
        }
    }
}

//
-(bool) isPlayingUpPitch
{
    if ([self getPlayingDirection] == PLAYING_UP)
        return true;
    else
        return false;
}


//
-(void) movePlayerToLineupPosition :(Player *)player :(CCTime)dt{
    
    NSValue *val;
    CGPoint p;
    
    if ([self isPlayingUpPitch])
    {
        val = [[self getLineupPositionsFaceUp]objectAtIndex:[player playerId]-2];
    }
    else
    {
        val = [[self getLineupPositionsFaceDown]objectAtIndex:[player playerId]-2];
    }
    
    p = [val CGPointValue];
    [player setTargetPos:p];
    [player movePlayerGoalScoredAgainst:dt];
    
}

//
-(void) movePlayersGoalNotScored:(CCTime)dt
{
    // move back to startup positions
    
    NSMutableArray *lineup;
    
    // do init once
    if (!celebPositionSet)
    {
        lineup = ( [self isPlayingUpPitch] ? [self getLineupPositionsFaceUp] : [self getLineupPositionsFaceDown]);
        celebPositionSet=true; //celebPositions is wrong name - using it now but need to rename
    }
    
    
    for (Player * myPlayer in outfieldPlayers)
    {
        [self movePlayerToLineupPosition :myPlayer : dt];
    }
}


//
-(void) movePlayersGoalScored:(CCTime)dt :(Ball *)ball
{
    if (!celebPositionSet)
    {
        [self setGoalScorerCelebPosition:dt :ball];
        celebPositionSet=true;
    }
    
    for (Player * myPlayer in outfieldPlayers)
    {
        if ([[self getMainPlayer] playerId] != [myPlayer playerId])
        {
            
            if (ccpDistance([myPlayer position], [[self getMainPlayer] position]) < 50) {
                
                if ([Util random1inX:10]) {
                    CGPoint celebPos = [[self getMainPlayer] position];
                    int xPos = celebPos.x + [Util random:20] - 10;
                    int yPos = celebPos.y + [Util random:20] - 10;
                    
                    //[myPlayer setTargetPos:[[self getMainPlayer] position]];
                    [myPlayer setTargetPos:ccp(xPos,yPos)];
                }
            } else {
                [myPlayer setTargetPos:[[self getMainPlayer] position]];
            }
        }
        
        [myPlayer movePlayerOffField:dt];
    }
}



-(void) setHumanPlayer:(bool)isHuman
{
    humanTeam=isHuman;
    //printf("/n*** (TEAM) Setting Human Team is %d, %d", humanTeam, human);
}



//
-(void) updateActivePlayerverrideTimer {
    self.overrideActivePlayerCounter++;
    if (overrideActivePlayerCounter >= OVERRIDE_ACTIVE_PLAYER_TIME) {
        self.overrideActivePlayer=false;
        self.overrideActivePlayerCounter=0;
    }
}


//
-(void) resetActivePlayerverrideTimer {
    if (overrideActivePlayer) {
        self.overrideActivePlayerCounter=0;
    }
}


//
-(void) updateTimers
{
    [self updateActivePlayerverrideTimer];
}

-(bool) isHumanTeam
{
    // printf("/n*** (TEAM) Human Team is %d", humanTeam);
    return humanTeam;
}

// for goal kicks - instantly set new target position so players
// dont continue on their current path
-(void) resetTargetPositionsForGoalKick
{
    for (Player * myPlayer in outfieldPlayers)
    {
        [myPlayer setTargetPosToCurrentPos];
    }
}


//
-(void) updatePlayersBallOutOfBounds:(CCTime)dt
{
    
    Ball *dummyBall = [[Ball alloc] initNoSprite];
    [dummyBall setPositionX:PITCH_X_CENTER Y:PITCH_Y_CENTER];

    
    //CCLOG(@">>Update players goal kick");
    CGPoint goalKickZonePos = ccp( PITCH_X_CENTER, PITCH_Y_CENTER );
    for (Player * myPlayer in outfieldPlayers)
    {
        // todo - are these required
        [myPlayer updatePassCompletedTime];
        [myPlayer updateTimers];
        [myPlayer checkTimers];
        [myPlayer updatePlayerGoalKick : dt :goalKickZonePos: dummyBall];
        
        if([self getTeamId] == TEAM1 && [self isHumanTeam] && [self isActivePlayer:myPlayer])
        {
            [self setActivePlayerSpritePosition:[myPlayer position]];
        }
    }
}





//
-(void) updatePlayersXKick:(CCTime)dt :(Ball *)ball :(CGPoint)zonePos
{
    //NSLog(@">>Update players goal kick 1");
//    CGPoint goalKickZonePos = ccp( PITCH_X_CENTER, PITCH_Y_CENTER );
    
    for (Player * myPlayer in outfieldPlayers)
    {
        // todo - are these required
        [myPlayer updatePassCompletedTime];
        [myPlayer updateTimers];
        [myPlayer checkTimers];
        [myPlayer updatePlayerGoalKick : dt :zonePos: ball];
        
        if([self getTeamId] == TEAM1 && [self isHumanTeam] && [self isActivePlayer:myPlayer])
        {
            [self setActivePlayerSpritePosition:[myPlayer position]];
        }
    }
    
    if ([[self getKeeper] playerHasBall:ball])
    {
        [self highlightClosestPlayerinFov:[self getKeeper]];
        
        if (isnan([[self getKeeper] position].x) || isnan([[self getKeeper] position].y)) {
            NSLog(@"updatePlayersXKick...NaN");
        }
        
        if ([self isHumanTeamPlaying]) {
            [[self getKeeper] doKeeperStickyBall:ball];
            [self setActivePlayerSpritePosition:[self getKeeper].position];
            [[[SceneManager sharedSceneManager] hudModel] showHumanInPossessionLabels];
        }
    }
    
    [[self getKeeper] updatePassCompletedTime];
   // NSLog(@">>Update players goal kick 2");

}


//
-(void) updatePlayersThrowIn:(CCTime)dt :(Ball *)ball
{
    [self updatePlayersXKick:dt :ball :[ball position]];
}

//
-(void) updatePlayersGoalKick:(CCTime)dt :(Ball *)ball
{
    CGPoint goalKickZonePos = ccp( PITCH_X_CENTER, PITCH_Y_CENTER );
    [self updatePlayersXKick:dt :ball :goalKickZonePos];
}

//
-(void) updatePlayersCornerKick:(CCTime)dt :(Ball *)ball
{
    CGPoint cornerKickZonePos;
    
    if (ball.position.y > PITCH_Y_CENTER) {
        cornerKickZonePos = ccp( PITCH_X_CENTER, PITCH_TOP );
    } else {
        cornerKickZonePos = ccp( PITCH_X_CENTER, PITCH_BOTTOM );
    }
    
    [self updatePlayersXKick:dt :ball :cornerKickZonePos];
 
}


// This also include if teh team has passed the ball ? confirm
-(bool) doesTeamHaveBall:(Ball *)ball
{
    return [ball teamWithBallId] == teamId;
}

//
-(bool) doesTeamCurrentlyHaveBall:(Ball *)ball
{
    return [ball teamWithBallId] == teamId;
}


-(bool) isOverridenActivePlayer {
    return ([self getTeamId] == TEAM1 && [self isHumanTeam] && [self overrideActivePlayer] == true);
}


-(bool) areActivePlayersSameDistance : (Ball *)ball {
    
    NSArray *playersOrderedByDistance = [self getPlayersOrderedByDistance:[ball position]];
    NSNumber *player1IdVal = [playersOrderedByDistance objectAtIndex:0];
    NSNumber *player2IdVal = [playersOrderedByDistance objectAtIndex:1];
    
    Player *player1 = [self getPlayerById: (int)[player1IdVal integerValue] ];
    Player *player2 = [self getPlayerById: (int)[player2IdVal integerValue] ];
    
    float p1Distance = ccpDistance([player1 position], [ball position]);
    float p2Distance = ccpDistance([player2 position], [ball position]);
    
    float distanceDiff = fabsf(p1Distance-p2Distance);
    //CCLOG(@">> (Abs) Active Player Distance Diff : %f", distanceDiff);
    
    //
    return (distanceDiff <= ACTIVE_PLAYER_SAME_DISTANCE_THRESHOLD);
}


-(void) showAllPlayers:(bool) show {
    for (Player * myPlayer in players)
    {
        [[myPlayer sprite] setVisible:show];
        [[myPlayer shadow] setVisible:show];
    }
}


-(void) showPlayers:(bool) show {
    for (Player * myPlayer in outfieldPlayers)
    {
        [[myPlayer sprite] setVisible:show];
        [[myPlayer shadow] setVisible:show];

    }
}

//
-(void) updatePlayers:(CCTime)dt Ball:(Ball *)ball
{
    gameClock++;
    //CCLOG(@">>Team update players : gameClock %d, %d" , gameClock, (gameClock % 2));
    
//    NSLog(@">>A");

    //[self activateClosestPlayer:ball];
    
    // if the other team has the ball - only activate goal and non goal side players
    // else activate closest
    
    if ([self isHumanTeam] ) {
        
        // currently only team timer is for active button override
        [self updateTimers];
        
//        if ([ball isBallLoose]) {
//            [[[SceneManager sharedSceneManager] hudModel] showHumanInPossessionLabels];
//        } else {
        
        if (gameClock % 4 == 0)
        {

            // TODO - changed
            if ([ball doesTeamActuallyHaveBallTeamId:[self getTeamId]] /*&& ([ball isBallLoose])*/)
            {
                [[[SceneManager sharedSceneManager] hudModel] showHumanInPossessionLabels];
                if ([ball attached]) {
                    activePlayerSprite.scale=ACTIVE_PLAYER_POSSESION_SCALE;
                    activePlayerSprite.opacity=ACTIVE_PLAYER_POSSESION_OPACITY;
                }
                else {
                    activePlayerSprite.scale=ACTIVE_PLAYER_ORIGINAL_SCALE;
                    activePlayerSprite.opacity=ACTIVE_PLAYER_ORIGINAL_OPACITY;
                }
            }
            else {
                [[[SceneManager sharedSceneManager] hudModel] showHumanOutOfPossessionLabels];
                activePlayerSprite.scale=ACTIVE_PLAYER_ORIGINAL_SCALE;
                activePlayerSprite.opacity=ACTIVE_PLAYER_ORIGINAL_OPACITY;
            }
        }
    }

//    NSLog(@">>B");
//
    
    if ([ball doesTeamActuallyHaveBallTeamId:[ self getTeamId] || [ball isBallLoose]])
    {
        
        if (gameClock % 4 == 0)
        {
            // override active player for human player if they have switched active player
            if ([self isOverridenActivePlayer] || [self areActivePlayersSameDistance:ball]) {
                // don't activate players as normal
            } else {
                
                int numberToActivate = 0;
                
                if ([ball isBallLoose]) {
                    numberToActivate=2; //CHANGED 2
                } else {
                    numberToActivate=1; //CHANGED 1
                }
                [self activateClosestXPlayersRestricted : numberToActivate:[ball position]];
            }
        }
    }
    else
    {
        if (gameClock % 4 == 0)
        {
            // override active player for human player if they have switched active player
            
            if ([self isOverridenActivePlayer] || [self areActivePlayersSameDistance:ball]) {
                // don't activate players as normal
                // otherwise we get glitch where control switches between two players quickly
            } else {
                [self activateClosestXPlayersGoalNonGoalSide:1:1:[ball position]]; // 1 : 1 | 2: 1
                //[self activateClosestXPlayers:1:[ball position]];
            }
        }
    }
    
//    NSLog(@">>C");

    
    for (Player * myPlayer in outfieldPlayers)
    {
        //printf("\n player id = %d \n", [myPlayer playerId]);
        [myPlayer updatePassCompletedTime];
        
        [myPlayer updateTimers];
        [myPlayer checkTimers];
        
        //TODO added
        
        //if ([[myPlayer team] isHumanTeam] && [myPlayer playerId] == 8)
        if ([[myPlayer team] isHumanTeam])
        {
            // printf("\n Team id = %d, player id = %d \n",[myPlayer teamId], [myPlayer playerId]);
            
            if ([self doesTeamHaveBall:ball])
            {
                activeTargetSprite.visible=true;
                //playerArrowSprite.visible=true;
                [self showPlayerArrowSprite:true];
            }
            else
            {
                activeTargetSprite.visible=false;
                //playerArrowSprite.visible=false;
                //[self showPlayerArrowSprite:false];
            }
            
            //if ([self isAnActivePlayer:myPlayer])
            
            if ([self isPrimeActivePlayer:myPlayer])
            {
                [myPlayer checkBoundary];
                
                [myPlayer updatePlayer:dt Ball:ball];
                activePlayerSprite.position = [myPlayer position];
                playerArrowSprite.position=ccp(activePlayerSprite.position.x, activePlayerSprite.position.y+25);
                activePlayerId=[myPlayer playerId];

                
                if ([myPlayer teamId] == TEAM1) {
                    [[[HudModel sharedHudModel] p1Namelabel] setString:[myPlayer playerName]];
                } else {
                    [[[HudModel sharedHudModel] p2Namelabel] setString:[myPlayer playerName]];
                }

            }
            else
            {
                //[myPlayer updatePlayer:dt Ball:ball];

                //
//                activePlayerSprite.position = [myPlayer position];
//                playerArrowSprite.position=ccp(activePlayerSprite.position.x, activePlayerSprite.position.y+25);
                //TODO changed
                [myPlayer updateNonActiveCompPlayer:dt theBall:ball];
            }
            
        }
        else
        {
            if ([self isAnActivePlayer:myPlayer])
            {
                [myPlayer checkBoundary];

                [myPlayer updateActiveCompPlayer:dt theBall:ball];
            }
            else
            {
                [myPlayer updateNonActiveCompPlayer:dt theBall:ball];
            }
            
            if (![[GameModel sharedGameModel] isManagerMode])
            {
                if ([self isPrimeActivePlayer:myPlayer])
                {
                    if ([myPlayer teamId] == TEAM1) {
                        [[[HudModel sharedHudModel] p1Namelabel] setString:[myPlayer playerName]];
                    } else {
                        [[[HudModel sharedHudModel] p2Namelabel] setString:[myPlayer playerName]];
                    }
                }
                
            }
        }
        
        #ifdef DO_PLAYERS_COLLISION
            [myPlayer checkPlayerCollision];
        #endif
    }
    
//    NSLog(@">>D");
    // CHANGED
    //[self highlightClosestPlayerinFov:activePlayer];
    if (isnan([activePlayer position].x) || isnan([activePlayer position].y)) {
        NSLog(@"updatePlayers...NaN");

        NSLog(@"updatePlayers...activePlayer %@",activePlayer);
        
       // NSLog(@"updatePlayers...activePlayer Position %@f",[activePlayer position]);
        
          } else {
       [self highlightClosestPlayerinFov:activePlayer]; 
    }
//    NSLog(@">>E");
    
}

//
-(void) updatePlayersOriginal:(CCTime)dt Ball:(Ball *)ball
{
    gameClock++;
    //CCLOG(@">>Team update players : gameClock %d, %d" , gameClock, (gameClock % 2));
    
    
    //[self activateClosestPlayer:ball];
    
    // if the other team has the ball - only activate goal and non goal side players
    // else activate closest
    
    if ([self isHumanTeam]) {
        
        // currently only team timer is for active button override
        [self updateTimers];
        
        //        if ([ball isBallLoose]) {
        //            [[[SceneManager sharedSceneManager] hudModel] showHumanInPossessionLabels];
        //        } else {
        
        if (gameClock % 4 == 0)
        {
            
            if ([ball doesTeamActuallyHaveBallTeamId:[ self getTeamId]] )
            {
                [[[SceneManager sharedSceneManager] hudModel] showHumanInPossessionLabels];
                if ([ball attached]) {
                    activePlayerSprite.scale=ACTIVE_PLAYER_POSSESION_SCALE;
                    activePlayerSprite.opacity=ACTIVE_PLAYER_POSSESION_OPACITY;
                }
                else {
                    activePlayerSprite.scale=ACTIVE_PLAYER_ORIGINAL_SCALE;
                    activePlayerSprite.opacity=ACTIVE_PLAYER_ORIGINAL_OPACITY;
                }
            }
            else {
                [[[SceneManager sharedSceneManager] hudModel] showHumanOutOfPossessionLabels];
                activePlayerSprite.scale=ACTIVE_PLAYER_ORIGINAL_SCALE;
                activePlayerSprite.opacity=ACTIVE_PLAYER_ORIGINAL_OPACITY;
            }
        }
    }
    
    
    
    if ([ball doesTeamActuallyHaveBallTeamId:[ self getTeamId] || [ball isBallLoose]])
    {
        
        if (gameClock % 4 == 0)
        {
            // override active player for human player if they have switched active player
            if ([self isOverridenActivePlayer] || [self areActivePlayersSameDistance:ball]) {
                // don't activate players as normal
            } else {
                
                int numberToActivate = 0;
                
                if ([ball isBallLoose]) {
                    numberToActivate=2; //CHANGED 2
                } else {
                    numberToActivate=1; //CHANGED 1
                }
                [self activateClosestXPlayersRestricted : numberToActivate:[ball position]];
            }
        }
    }
    else
    {
        if (gameClock % 4 == 0)
        {
            // override active player for human player if they have switched active player
            
            if ([self isOverridenActivePlayer] || [self areActivePlayersSameDistance:ball]) {
                // don't activate players as normal
                // otherwise we get glitch where control switches between two players quickly
            } else {
                [self activateClosestXPlayersGoalNonGoalSide:1:1:[ball position]]; // 1 : 1 | 2: 1
                //[self activateClosestXPlayers:1:[ball position]];
            }
        }
    }
    
    
    for (Player * myPlayer in outfieldPlayers)
    {
        //printf("\n player id = %d \n", [myPlayer playerId]);
        [myPlayer updatePassCompletedTime];
        
        [myPlayer updateTimers];
        [myPlayer checkTimers];
        
        
        if ([[myPlayer team] isHumanTeam])
        {
            // printf("\n Team id = %d, player id = %d \n",[myPlayer teamId], [myPlayer playerId]);
            
            if ([self doesTeamHaveBall:ball])
            {
                activeTargetSprite.visible=true;
                //playerArrowSprite.visible=true;
                [self showPlayerArrowSprite:true];
            }
            else
            {
                activeTargetSprite.visible=false;
                //playerArrowSprite.visible=false;
                //[self showPlayerArrowSprite:false];
            }
            
            //if ([self isAnActivePlayer:myPlayer])
            if ([self isPrimeActivePlayer:myPlayer])
            {
                [myPlayer checkBoundary];
                
                [myPlayer updatePlayer:dt Ball:ball];
                activePlayerSprite.position = [myPlayer position];
                playerArrowSprite.position=ccp(activePlayerSprite.position.x, activePlayerSprite.position.y+25);
                activePlayerId=[myPlayer playerId];
                NSLog(@"**>>> Active Player Id : %d",[myPlayer playerId]);
                
                
                if ([myPlayer teamId] == TEAM1) {
                    [[[HudModel sharedHudModel] p1Namelabel] setString:[myPlayer playerName]];
                } else {
                    [[[HudModel sharedHudModel] p2Namelabel] setString:[myPlayer playerName]];
                }
                
            }
            else
            {
                [myPlayer updateNonActiveCompPlayer:dt theBall:ball];
            }
            
        }
        else
        {
            if ([self isAnActivePlayer:myPlayer])
            {
                [myPlayer checkBoundary];
                
                [myPlayer updateActiveCompPlayer:dt theBall:ball];
            }
            else
            {
                [myPlayer updateNonActiveCompPlayer:dt theBall:ball];
            }
            
            if (![[GameModel sharedGameModel] isManagerMode])
            {
                if ([self isPrimeActivePlayer:myPlayer])
                {
                    if ([myPlayer teamId] == TEAM1) {
                        [[[HudModel sharedHudModel] p1Namelabel] setString:[myPlayer playerName]];
                    } else {
                        [[[HudModel sharedHudModel] p2Namelabel] setString:[myPlayer playerName]];
                    }
                }
                
            }
        }
        
#ifdef DO_PLAYERS_COLLISION
        [myPlayer checkPlayerCollision];
#endif
    }
    
    [self highlightClosestPlayerinFov:activePlayer];
    if (isnan([activePlayer position].x) || isnan([activePlayer position].y)) {
        NSLog(@"updatePlayers 2...NaN");
    }
}

-(void) checkBoundary
{
    for (Player * myPlayer in outfieldPlayers)
    {
        [myPlayer checkBoundary];
        
    }
}

-(NSMutableArray *) getOutfieldPlayers
{
    //    printf("/n *** 1.get outfield players --->/n");
    //   // NSMutableArray *outfieldPlayers = [[NSMutableArray alloc] init];
    //
    //    for (Player * myPlayer in players)
    //    {
    //        if ([myPlayer isOutfieldPlayer])
    //        {
    //            printf("/n ** outfield player added - id = %d", [myPlayer getPlayerId
    //            [outfieldPlayers addObject:myPlayer];
    //        }
    //    }
    //
    //    printf("/n ** get outfield players .....");
    return outfieldPlayers;
}


//
-(bool) isActivePlayer:(Player *)player
{
    if ([player playerId] == [activePlayer playerId])
        return true;
    
    return false;
}

//
-(bool) isPrimeActivePlayer:(Player *)player
{
    if([activePlayersIds count] == 0)
    {
        return false;
    }
    
    id pId = [activePlayersIds objectAtIndex:0 ];
    
    if ([player playerId] == [pId floatValue])
        return true;
    
    return false;
}

//
-(bool) isAnActivePlayer:(Player *)player
{
    if([activePlayersIds count] == 0)
    {
        return false;
    }
    
    for (NSNumber *val in activePlayersIds)
    {
        float pId = [val floatValue];
        if ([player playerId] == pId)
        {
            return true;
        }
        
    }
    
    return false;
}

//
-(Player *) getPlayerById:(int)id
{
    return [players objectAtIndex:id-1];
}


//
-(NSArray *) getPlayersOrderedByDistance :(CGPoint)position
{
    NSMutableDictionary *playersDistanceMap = [[NSMutableDictionary alloc] init];
   
    for (Player * player in outfieldPlayers)
    {
        CGFloat dist = ccpDistance([player position], position);
        [playersDistanceMap setObject: [NSNumber numberWithFloat:dist] forKey: [NSNumber numberWithInteger: [player playerId]] ];
    }
    
    NSArray *sortedKeysArray = [playersDistanceMap keysSortedByValueUsingSelector:@selector(compare:)];
    
    return sortedKeysArray;
}


/*
 
 When under human control, they may wish to switch to the next closet player,
 especially in defensive situations
 
 */
-(Player *) getSecondClosestPlayer :(Ball *)ball {
    NSArray *playersOrderedByDistance = [self getPlayersOrderedByDistance:[ball position]];
    NSNumber *playerIdVal = [playersOrderedByDistance objectAtIndex:1];
    Player *player = [self getPlayerById: (int)[playerIdVal integerValue] ];
    return player;
}


//
-(void) activateSecondClosestPlayer :(Ball *) ball {
    Player *player = [self getSecondClosestPlayer :ball];
    
    [activePlayersIds removeAllObjects];;
    id playerIdVal = [NSNumber numberWithInt:[player playerId]];
    [activePlayersIds addObject: playerIdVal];
    
}


// Test Method
-(void) showSecondClosestPlayerTest :(Ball *)ball {
    NSArray *playersOrderedByDistance = [self getPlayersOrderedByDistance:[ball position]];
    CCLOG(@">>> Number of players :  %lu", (unsigned long)[playersOrderedByDistance count]);
    NSNumber *player1IdVal = [playersOrderedByDistance objectAtIndex:0];
    NSNumber *player2IdVal = [playersOrderedByDistance objectAtIndex:1];
    NSNumber *player3IdVal = [playersOrderedByDistance objectAtIndex:2];
    NSNumber *player4IdVal = [playersOrderedByDistance objectAtIndex:3];
    NSNumber *player5IdVal = [playersOrderedByDistance objectAtIndex:4];

    
    //int playerIdNumber = (int)[playersOrderedByDistance objectAtIndex:1];
    CCLOG(@">>> Player Id 1 %ld", (long)[player1IdVal integerValue] );
    CCLOG(@">>> Player Id 1 %ld", (long)[player2IdVal integerValue] );
    CCLOG(@">>> Player Id 1 %ld", (long)[player3IdVal integerValue] );
    CCLOG(@">>> Player Id 1 %ld", (long)[player4IdVal integerValue] );
    CCLOG(@">>> Player Id 1 %ld", (long)[player5IdVal integerValue] );

//    CCLOG(@">>> Player Id 4 %@", [playersOrderedByDistance objectAtIndex:3]);
//    CCLOG(@">>> Player Id 5 %@", [playersOrderedByDistance objectAtIndex:4]);
//    CCLOG(@">>> Player Id 6 %@", [playersOrderedByDistance objectAtIndex:5]);
//    CCLOG(@">>> Player Id 7 %@", [playersOrderedByDistance objectAtIndex:6]);
//    CCLOG(@">>> Player Id 8 %@", [playersOrderedByDistance objectAtIndex:7]);
    
    int i = 0;
    for (  NSNumber *idVal in  playersOrderedByDistance) {
        int playerId = (int)[idVal integerValue];
        
        Player *player = [self getPlayerById: playerId];

        //get second player in list
        if (i == 1) {
            player.sprite.scale=1.5;
        }
        else {
            player.sprite.scale=PLAYER_SPRITE_SCALE;
        }
        i++;
    }
    
//    Player *player = [self getPlayerById: (int)[player2IdVal integerValue] ];
//    player.sprite.scale=1.5;
}


//
-(void) activateClosestXPlayersGoalNonGoalSide:(int) numGoalSide :(int) numNonGoalSide :(CGPoint)position
{
    NSMutableDictionary *playersDistanceMap = [[NSMutableDictionary alloc] init];
    NSMutableArray *activePlayersByDistance = [[NSMutableArray alloc] init];
    
    int numGoalSideMatched = 0;
    int numNonGoalSideMatched = 0;
    bool activePlayerSet=false;
    
    
    for (Player * player in outfieldPlayers)
    {
        CGFloat dist = ccpDistance([player position], position);
       // CCLOG(@">>>Distance b4 : %f", dist);
       // dist += [Util randomFloat];
       // CCLOG(@">>> Random Dist  = %f", ((float) (arc4random() % 100)/100));
       // CCLOG(@">>>Distance after : %f", dist);

        [playersDistanceMap setObject: [NSNumber numberWithFloat:dist] forKey: [NSNumber numberWithFloat: [player playerId]] ];
    }
    
    NSArray *sortedKeysArray = [playersDistanceMap keysSortedByValueUsingSelector:@selector(compare:)];
    
    int i = 1;
    for (NSNumber *val in sortedKeysArray)
    {
        
        Player *currentPlayer = [self getPlayerById: [val floatValue]];
        
        //        if (i==1)
        //        {
        //            activePlayer = [self getPlayerById: [val floatValue]];
        //        }
        
        if ([currentPlayer isPlayerGoalSide:position])
        {
            if (!activePlayerSet)
            {
                activePlayer = currentPlayer;
                activePlayerSet=true;
//                NSLog(@"..Active Player 2a : %@",activePlayer);
//                NSLog(@"..Active Player - Position: %f,%f",[activePlayer position].x,[activePlayer position].y);

            }
            
            if (numGoalSideMatched < numGoalSide )
            {
                numGoalSideMatched++;
                [activePlayersByDistance addObject:val];
                // CCLOG(@">> Adding Active Goal side player : %@ Id : %d", [currentPlayer playerName] , [currentPlayer playerId]);
            }
        }
        else
        {
            if (!activePlayerSet)
            {
                activePlayer = currentPlayer;
                activePlayerSet=true;
//                NSLog(@"..Active Player 2b : %@",activePlayer);
//                NSLog(@"..Active Player - Position: %f,%f",[activePlayer position].x,[activePlayer position].y);

            }
            
            if (numNonGoalSideMatched < numNonGoalSide )
            {
                numNonGoalSideMatched++;
                [activePlayersByDistance addObject:val];
                //CCLOG(@">> Adding NON Active Goal side player : %@ Id : %d Team id %d", [currentPlayer playerName]);
                //CCLOG(@">> Adding NON Active Goal side player : %@ Id : %d", [currentPlayer playerName] , [currentPlayer playerId]);
            }
        }
        
        if (numGoalSideMatched==numGoalSide && numNonGoalSideMatched == numNonGoalSide)
        {
            break;
        }
        i++;
    }
    
//    NSLog(@"..Active Player 2 : %@",activePlayer);
//    NSLog(@"..Active Player - Position: %f,%f",[activePlayer position].x,[activePlayer position].y);

    activePlayersIds = activePlayersByDistance;
}


//
-(void) activateClosestXPlayers:(int) numberToActivate :(CGPoint)position
{
    NSMutableDictionary *playersDistanceMap = [[NSMutableDictionary alloc] init];
    NSMutableArray *activePlayersByDistance = [[NSMutableArray alloc] init];
    
    for (Player * player in outfieldPlayers)
    {
        float dist = ccpDistance([player position], position);
        
        [playersDistanceMap setObject: [NSNumber numberWithFloat:dist] forKey: [NSNumber numberWithFloat: [player playerId]] ];
    }
    
    NSArray *sortedKeysArray = [playersDistanceMap keysSortedByValueUsingSelector:@selector(compare:)];
    
    int i = 1;
    //CCLOG(@"-------------------");
    for (NSNumber *val in sortedKeysArray)
    {
        
        //CCLOG(@">> Players distance :  %@", [playersDistanceMap objectForKey:val]);
        
        if (i==1)
        {
            activePlayer = [self getPlayerById: [val floatValue]];
//            NSLog(@"..Active Player 3 : %@",activePlayer);
//            NSLog(@"..Active Player - Position: %f,%f",[activePlayer position].x,[activePlayer position].y);

        }
        
        [activePlayersByDistance addObject:val];
        if (i >= numberToActivate)
        {
            break;
        }
        
        i++;
    }
//    NSLog(@"..Active Player 3b : %@",activePlayer);
//    NSLog(@"..Active Player - Position: %f,%f",[activePlayer position].x,[activePlayer position].y);
//
    
    //CCLOG(@">>> No. Active Players : %d", [activePlayersByDistance count]);
//    for (NSString *val in activePlayersByDistance)
//    {
//        CCLOG(@"Active Player Id's :Team '%d' Id : %f", [self getTeamId],[val floatValue]);
//    }
    //CCLOG(@">>>>>>>>");
    
//    if ((int)[playersDistanceMap objectForKey:[sortedKeysArray objectAtIndex:0]] == (int)[playersDistanceMap objectForKey:[sortedKeysArray objectAtIndex:1]] )
//    {
//        CCLOG(@">> Players equal distance from ball");
//    }
    
    activePlayersIds = activePlayersByDistance;
}

//
-(void) activateClosestXPlayersRestricted:(int) numberToActivate :(CGPoint)position
{
    NSMutableDictionary *playersDistanceMap = [[NSMutableDictionary alloc] init];
    NSMutableArray *activePlayersByDistance = [[NSMutableArray alloc] init];
    
    for (Player * player in outfieldPlayers)
    {
        float dist = ccpDistance([player position], position);
        
        [playersDistanceMap setObject: [NSNumber numberWithFloat:dist] forKey: [NSNumber numberWithFloat: [player playerId]] ];
    }
    
    NSArray *sortedKeysArray = [playersDistanceMap keysSortedByValueUsingSelector:@selector(compare:)];
    
    int i = 1;
    //CCLOG(@"-------------------");
    for (NSNumber *val in sortedKeysArray)
    {
        
        //CCLOG(@">> Players distance :  %@", [playersDistanceMap objectForKey:val]);
        
        if (i==1)
        {
            activePlayer = [self getPlayerById: [val floatValue]];
            [activePlayersByDistance addObject:val];
//            NSLog(@"..Active Player 4a : %@",activePlayer);
//            NSLog(@"..Active Player - Position: %f,%f",[activePlayer position].x,[activePlayer position].y);
            if (isnan([activePlayer position].x)) {
                
                NSLog(@"..Active Player - Nan");
                
            }
            
        }
        else
        {
        
        //[activePlayersByDistance addObject:val];
        
        
        //  we only want to activate any additional players if they aren't too close
        // otherwise we get a trail of players like a snake
#ifdef RESTRICT_ACTIVATION_DISTANCE_OF_SECOND_PLAYERS
            if (i > 1) {
                CGPoint playerPos = [self getPlayerById: [val floatValue]].position;
                float dist = ccpDistance(playerPos, position);
                if (dist > RESTRICT_ACTIVATION_DISTANCE) {
                    [activePlayersByDistance addObject:val];
                }
            }
#else
         [activePlayersByDistance addObject:val];
#endif
//            NSLog(@"..Active Player 4b : %@",activePlayer);
//            NSLog(@"..Active Player - Position: %f,%f",[activePlayer position].x,[activePlayer position].y);

        }
        
        if (i >= numberToActivate)
        {
            break;
        }
        
        i++;
    }
//    NSLog(@"..Active Player 4c : %@",activePlayer);
//    NSLog(@"..Active Player - Position: %f,%f",[activePlayer position].x,[activePlayer position].y);

    activePlayersIds = activePlayersByDistance;
}



//
-(void) resetTargetPosClosestPlayersWithinDistance:(int)range :(CGPoint)position :(Ball *)ball
{
    NSMutableDictionary *playersDistanceMap = [[NSMutableDictionary alloc] init];
    
    for (Player * player in outfieldPlayers)
    {
        float dist = ccpDistance([player position], position);
        
        [playersDistanceMap setObject: [NSNumber numberWithFloat:dist] forKey: [NSNumber numberWithFloat: [player playerId]] ];
    }
    
    NSArray *sortedKeysArray = [playersDistanceMap keysSortedByValueUsingSelector:@selector(compare:)];
 
    Player * currentPlayer;
    for (NSNumber *val in sortedKeysArray)
    {
        currentPlayer = [self getPlayerById: [val floatValue]];
        
        if (![self isAnActivePlayer:currentPlayer])
        {
            CGFloat distance = [val floatValue];
            
            if (distance < range )
            {
                [currentPlayer resetTargetPos:ball];
            }
        }
    }
}


//
-(void) doMySort:(Ball *) ball
{
    
    NSMutableDictionary *playersDistanceMap = [[NSMutableDictionary alloc] init];
    
    for (Player * player in outfieldPlayers)
    {
        // bad - temp for now - store player and distance in NSMutableDictionary
        CGFloat dist = ccpDistance([player position], [ball position]);
        
        [playersDistanceMap setObject: [NSNumber numberWithFloat:dist] forKey: [NSNumber numberWithFloat: [player playerId]] ];
        // [playerDistanceMap   setObject: player forKey: [[NSNumber numberWithFloat:32.445]  )];
        CCLOG(@">>>>Player add to map...");
        
    }
    
    //     for (NSString *key in playersDistanceMap)
    //     {
    //         id value = [playersDistanceMap objectForKey:key];
    //         CCLOG(@"Player : %d Distance : %f", key, [value floatValue]);
    //
    //     }
    
    NSArray *sortedKeysArray = [playersDistanceMap keysSortedByValueUsingSelector:@selector(compare:)];
    for (NSString *val in sortedKeysArray)
    {
        id pDist = [playersDistanceMap objectForKey:val];
        CCLOG(@" Key Sorted : Id : %f - %f", [val floatValue], [pDist floatValue]);
        
    }
    
    
    if(1.0 == 1)
    {
        CCLOG(@">>> EQUALS");
    }
    else
    {
        CCLOG(@">>> NON EQUALS");
    }
    //NSArray* values = [playersDistanceMap allValues];
    NSMutableArray *values = [NSMutableArray arrayWithArray:[playersDistanceMap allValues]];
    
    //    NSMutableArray * values = [[NSMutableArray alloc] init];
    //    [values addObject: [NSNumber numberWithFloat:452.5]];
    //    [values addObject: [NSNumber numberWithFloat:521.5]];
    //    [values addObject: [NSNumber numberWithFloat:322.5]];
    //    [values addObject: [NSNumber numberWithFloat:752.5]];
    
    //NSArray* sortedValues = [values sortedArrayUsingSelector:@selector(comparator)];
    
    //    NSSortDescriptor *highestToLowest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    //    [values sortUsingDescriptors:[NSArray arrayWithObject:highestToLowest]];
    
    
    //[values sortUsingSelector:@selector(compare:)];
    for (NSNumber *val in values)
    {
        CCLOG(@"PSorted : Distance : %f", [val floatValue]);
        
    }
}

//
-(void) doMySortPlayerName:(Ball *) ball
{
    NSMutableDictionary *playersDistanceMap = [[NSMutableDictionary alloc] init];
    
    for (Player * player in outfieldPlayers)
    {
        // bad - temp for now - store player and distance in NSMutableDictionary
        CGFloat dist = ccpDistance([player position], [ball position]);
        
        [playersDistanceMap setObject: [NSNumber numberWithFloat:dist] forKey: [player playerName] ];
        // [playerDistanceMap   setObject: player forKey: [[NSNumber numberWithFloat:32.445]  )];
        CCLOG(@">>>>Player add to map...");
        
    }
    
    for (NSString *key in playersDistanceMap)
    {
        id value = [playersDistanceMap objectForKey:key];
        CCLOG(@"Player : %@ Distance : %f", key, [value floatValue]);
        
    }
    
    NSArray *sortedKeysArray = [playersDistanceMap keysSortedByValueUsingSelector:@selector(compare:)];
    for (NSString *val in sortedKeysArray)
    {
        id pDist = [playersDistanceMap objectForKey:val];
        CCLOG(@" Key Sorted : Name : %@ - %f", val, [pDist floatValue]);
        
    }
    
    
    
    //NSArray* values = [playersDistanceMap allValues];
    NSMutableArray *values = [NSMutableArray arrayWithArray:[playersDistanceMap allValues]];
    
    //    NSMutableArray * values = [[NSMutableArray alloc] init];
    //    [values addObject: [NSNumber numberWithFloat:452.5]];
    //    [values addObject: [NSNumber numberWithFloat:521.5]];
    //    [values addObject: [NSNumber numberWithFloat:322.5]];
    //    [values addObject: [NSNumber numberWithFloat:752.5]];
    
    //NSArray* sortedValues = [values sortedArrayUsingSelector:@selector(comparator)];
    
    //    NSSortDescriptor *highestToLowest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    //    [values sortUsingDescriptors:[NSArray arrayWithObject:highestToLowest]];
    
    
    [values sortUsingSelector:@selector(compare:)];
    for (NSNumber *val in values)
    {
        CCLOG(@"PSorted : Distance : %f", [val floatValue]);
        
    }
}


//
-(void) activateClosestPlayerDeprecated:(Ball *)ball
{
    
	int closestPlayerId = 0;
	float shortestDistance = 5000.0;
	float distance ;
    //   Player *currentActivePlayer;
    Player *newActivePlayer;
    
	//currentActivePlayer = activePlayer;
    
    newActivePlayer = activePlayer;
	//for (i=0; i < MAX_OUTFIELD_PLAYERS; i++) {
    for (Player * myPlayer in outfieldPlayers) {
        
		//player = team->team[i];
        //	distance = Vec2d_Dist(&ball->pos, &player->pos);
        distance = ccpDistance([ball position], [myPlayer position]);
		if (distance < shortestDistance) {
            
            // avoid jerk if 2 or more players are close
            if ((shortestDistance - distance) > 15)
            {
                //printf("* Distance = %f\n", shortestDistance - distance);
                shortestDistance = distance;
                closestPlayerId = [myPlayer playerId];
                newActivePlayer = myPlayer;
            }
		}
	}
    
    activePlayer = newActivePlayer;
    NSLog(@"..Active Player 5 : %@",activePlayer);
    NSLog(@"..Active Player - Position: %f,%f",[activePlayer position].x,[activePlayer position].y);

    activePlayerSprite.position = [activePlayer position];
    playerArrowSprite.position=ccp(activePlayerSprite.position.x, activePlayerSprite.position.y+25);
    //   printf("\n*** Active player id = %d", [activePlayer playerId]);
    //
    //	if (closestPlayerId !=0) {
    //		if (closestPlayerId != team->activePlayer->id) {
    //			team->activePlayer=team->team[closestPlayerId-1];
    //			team->activePlayer->vec.x=0;
    //			team->activePlayer->vec.y=0;
    //			team->activePlayer->state=0;
    //			team->activePlayer->facing=0;
    //		}
    //		else {
    //			team->activePlayer=team->team[closestPlayerId-1];
    //		}
    //	}
}


+(void) setControlsActive:(bool)active
{
    controlsActive=active;
}


+(bool) getControlsActive
{
    return controlsActive;
}

-(void) setActivePlayerSprite:(CCSprite *)sprite
{
    activePlayerSprite=sprite;
}
-(void) setActiveTargetSprite:(CCSprite *)sprite
{
    activeTargetSprite=sprite;
}

-(void) setPlayerArrowSprite:(CCSprite *)sprite
{
    playerArrowSprite=sprite;
}

-(void) showActivePlayerSprite:(bool)show {
    activePlayerSprite.visible=show;
    //playerArrowSprite.visible=show;
    [self showPlayerArrowSprite:show];

}

-(void) showActiveTargetSprite:(bool)show{
    activeTargetSprite.visible=show;
 }

//
-(Player *) getClosestPlayer:(Player *)player
{
    
    //	int closestPlayerId = 0;
	float shortestDistance = 5000.0;
	float distance ;
    Player *closestPlayer=nil;
    
    //printf("*** getClosestPlayerID - current player id = %d\n", [player playerId]);
    
	//currentActivePlayer = activePlayer;
    int numInFOV=0;
    //newActivePlayer = activePlayer;
	//for (i=0; i < MAX_OUTFIELD_PLAYERS; i++) {
    for (Player * myPlayer in outfieldPlayers) {
        CGPoint pos = ccpSub([myPlayer position],[player position]);
        
        if([myPlayer playerId] != [player playerId] && [player isInNarrowFOV: pos])
        {
            //                if ([player isInFOV: [myPlayer position]])
            //                     {
            //                         CCSpriteFrame *frame;
            //                         frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
            //                                  spriteFrameByName:@"p1_a.png"];
            //
            //                         [[myPlayer getSprite]  setSpriteFrame:frame];
            //                     }
            numInFOV++;
            //player = team->team[i];
            //	distance = Vec2d_Dist(&ball->pos, &player->pos);
            distance = ccpDistance([player position], [myPlayer position]);
            // printf("** distance = %f\n", distance);
            if (distance <= shortestDistance) {
                shortestDistance = distance;
                //closestPlayerId = [myPlayer playerId];
                closestPlayer = myPlayer;
                
            }
        }
	}
    // printf("\n **--> Num in FOV = %d", numInFOV);
    // printf("** shortest distance = %f\n", shortestDistance);
    if (closestPlayer != nil) {
        // printf("** Closest playyyer id = %d", [closestPlayer playerId]);
        // activeTargetSprite.position = [closestPlayer position];
    }
    else
    {
        //take it off screen
        //activeTargetSprite.position = ccp(-100,-100);
    }
    //TODO: could be null - fix
    return closestPlayer;
}

-(void) setStandOff:(bool) status {
    for (Player * myPlayer in outfieldPlayers) {
        myPlayer.standingOff=status;
    }
}

//
-(Player *) getClosestPlayerHuman:(Player *)player
{
    
    //	int closestPlayerId = 0;
	float shortestDistance = 5000.0;
	float distance ;
    Player *closestPlayer=nil;
    closestPlayer.vector=ccp(0,0); // ensure init to prevent nan bug
    
    //printf("*** getClosestPlayerID - current player id = %d\n", [player playerId]);
    
	//currentActivePlayer = activePlayer;
    int numInFOV=0;
    //newActivePlayer = activePlayer;
	//for (i=0; i < MAX_OUTFIELD_PLAYERS; i++) {
    for (Player * myPlayer in outfieldPlayers) {
        CGPoint pos = ccpSub([myPlayer position],[player position]);
        
        if([myPlayer playerId] != [player playerId] && [player isInHumanNarrowFOV: pos])
        {
            numInFOV++;
            //player = team->team[i];
            //	distance = Vec2d_Dist(&ball->pos, &player->pos);
            distance = ccpDistance([player position], [myPlayer position]);
            // printf("** distance = %f\n", distance);
            if (distance < shortestDistance) {
                shortestDistance = distance;
                //closestPlayerId = [myPlayer playerId];
                closestPlayer = myPlayer;
                
            }
        }
	}
    // printf("\n **--> Num in FOV = %d", numInFOV);
    // printf("** shortest distance = %f\n", shortestDistance);
    if (closestPlayer != nil) {
        // printf("** Closest playyyer id = %d", [closestPlayer playerId]);
        // activeTargetSprite.position = [closestPlayer position];
    }
    else
    {
        //CCLOG(@">> Closest player nil");
        //take it off screen
        //activeTargetSprite.position = ccp(-100,-100);
    }
    //TODO: could be null - fix
    //CCLOG(@">> Closest player : %f,%f", closestPlayer.vector.x, closestPlayer.vector.y);
    return closestPlayer;
}

//
-(Player *) getClosestPlayerNotTooClose:(Player *)player :(int)minimumDistance
{
    
    //	int closestPlayerId = 0;
	float shortestDistance = 5000.0;
	float distance ;
    Player *closestPlayer=nil;
    
    //printf("*** getClosestPlayerID - current player id = %d\n", [player playerId]);
    
	//currentActivePlayer = activePlayer;
    int numInFOV=0;
    //newActivePlayer = activePlayer;
	//for (i=0; i < MAX_OUTFIELD_PLAYERS; i++) {
    for (Player * myPlayer in outfieldPlayers) {
        CGPoint pos = ccpSub([myPlayer position],[player position]);
        
        if([myPlayer playerId] != [player playerId]
           && [player isInNarrowFOV: pos])
        {
            numInFOV++;
            //player = team->team[i];
            //	distance = Vec2d_Dist(&ball->pos, &player->pos);
            distance = ccpDistance([player position], [myPlayer position]);
            // printf("** distance = %f\n", distance);
            if (distance > minimumDistance && distance < shortestDistance) {
                shortestDistance = distance;
                //closestPlayerId = [myPlayer playerId];
                closestPlayer = myPlayer;
                
            }
        }
	}
    // printf("\n **--> Num in FOV = %d", numInFOV);
    // printf("** shortest distance = %f\n", shortestDistance);
    if (closestPlayer != nil) {
        // printf("** Closest playyyer id = %d", [closestPlayer playerId]);
        // activeTargetSprite.position = [closestPlayer position];
    }
    else
    {
        //take it off screen
        //activeTargetSprite.position = ccp(-100,-100);
    }
    //TODO: could be null - fix
    return closestPlayer;
}

-(Player *) getSecondClosestPlayerNotTooClose:(Player *)player :(int)minimumDistance
{
    
    //	int closestPlayerId = 0;
	float shortestDistance = 5000.0;
	float distance ;
    Player *closestPlayer=nil;
    Player *secondClosestPlayer=nil;
    
    
    //printf("*** getClosestPlayerID - current player id = %d\n", [player playerId]);
    
	//currentActivePlayer = activePlayer;
    int numInFOV=0;
    //newActivePlayer = activePlayer;
	//for (i=0; i < MAX_OUTFIELD_PLAYERS; i++) {
    for (Player * myPlayer in outfieldPlayers) {
        CGPoint pos = ccpSub([myPlayer position],[player position]);
        
        if([myPlayer playerId] != [player playerId] && [player isInNarrowFOV: pos])
        {
            numInFOV++;
            //player = team->team[i];
            //	distance = Vec2d_Dist(&ball->pos, &player->pos);
            distance = ccpDistance([player position], [myPlayer position]);
            // printf("** distance = %f\n", distance);
            if (distance > minimumDistance && distance < shortestDistance) {
                shortestDistance = distance;
                //closestPlayerId = [myPlayer playerId];
                secondClosestPlayer = closestPlayer;
                closestPlayer = myPlayer;
                
            }
        }
	}
    // printf("\n **--> Num in FOV = %d", numInFOV);
    //    // printf("** shortest distance = %f\n", shortestDistance);
    //    if (closestPlayer != nil) {
    //        // printf("** Closest playyyer id = %d", [closestPlayer playerId]);
    //        // activeTargetSprite.position = [closestPlayer position];
    //    }
    //    else
    //    {
    //        //take it off screen
    //        //activeTargetSprite.position = ccp(-100,-100);
    //    }
    //    //TODO: could be null - fix
    return secondClosestPlayer;
}

//
-(NSMutableArray *) getPlayersClosestFirstMinimumDistance:(Player *)player :(int)minimumDistance
{
    //	int closestPlayerId = 0;
    NSMutableArray* playersList = [[NSMutableArray alloc] init];
    float shortestDistance = 5000.0;
    float distance ;
    Player *closestPlayer=nil;
    Player *secondClosestPlayer=nil;
    
    //printf("*** getClosestPlayerID - current player id = %d\n", [player playerId]);
    
    //currentActivePlayer = activePlayer;
    int numInFOV=0;
    //newActivePlayer = activePlayer;
    //for (i=0; i < MAX_OUTFIELD_PLAYERS; i++) {
    for (Player * myPlayer in outfieldPlayers)
    {
        CGPoint pos = ccpSub([myPlayer position],[player position]);
        
        if([myPlayer playerId] != [player playerId] && [player isInNarrowFOV: pos])
        {
            numInFOV++;
            //player = team->team[i];
            //	distance = Vec2d_Dist(&ball->pos, &player->pos);
            distance = ccpDistance([player position], [myPlayer position]);
            // printf("** distance = %f\n", distance);
            if (distance > minimumDistance && distance < shortestDistance)
            {
                shortestDistance = distance;
                //closestPlayerId = [myPlayer playerId];
                secondClosestPlayer = closestPlayer;
                closestPlayer = myPlayer;
                [playersList addObject: myPlayer ];
            }
            else
            {
                // [playersList addObject: myPlayer];
            }
        }
    }
    return playersList;
}

//
-(Player *) getFurthestPlayer:(Player *)player
{
    
    //	int closestPlayerId = 0;
	float longestDistance = 0.0;
	float distance ;
    Player *furthestPlayer=nil;
    
    //currentActivePlayer = activePlayer;
    int numInFOV=0;
    //newActivePlayer = activePlayer;
	//for (i=0; i < MAX_OUTFIELD_PLAYERS; i++) {
    for (Player * myPlayer in outfieldPlayers) {
        CGPoint pos = ccpSub([myPlayer position],[player position]);
        
        if([myPlayer playerId] != [player playerId] && [player isInNarrowFOV: pos])
        {
            //                if ([player isInFOV: [myPlayer position]])
            //                     {
            //                         CCSpriteFrame *frame;
            //                         frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
            //                                  spriteFrameByName:@"p1_a.png"];
            //
            //                         [[myPlayer getSprite]  setSpriteFrame:frame];
            //                     }
            numInFOV++;
            //player = team->team[i];
            //	distance = Vec2d_Dist(&ball->pos, &player->pos);
            distance = ccpDistance([player position], [myPlayer position]);
            // printf("** distance = %f\n", distance);
            if (distance > longestDistance) {
                longestDistance = distance;
                //closestPlayerId = [myPlayer playerId];
                furthestPlayer = myPlayer;
                
            }
        }
	}
    // printf("\n **--> Num in FOV = %d", numInFOV);
    // printf("** shortest distance = %f\n", shortestDistance);
    if (furthestPlayer != nil) {
        // printf("** Closest playyyer id = %d", [closestPlayer playerId]);
        // activeTargetSprite.position = [closestPlayer position];
    }
    else
    {
        //take it off screen
        //activeTargetSprite.position = ccp(-100,-100);
    }
    //TODO: could be null - fix
    return furthestPlayer;
}



-(void) highlightClosestPlayerinFov:(Player *)player
{
    //NSLog(@"highlightClosestPlayerinFov 1");
    
    //TODO fix
    if (isnan([player position].x) || isnan([player position].y)) {
        NSLog(@"highlightClosestPlayerinFov Player is Nan..continuing");

        return;
    }


    //	int closestPlayerId = 0;
	float shortestDistance = 5000.0;
	float distance ;
    Player *closestPlayer=nil;
    
    //printf("*** getClosestPlayerID - current player id = %d\n", [player playerId]);
    
	//currentActivePlayer = activePlayer;
    int numInFOV=0;
    //newActivePlayer = activePlayer
	//for (i=0; i < MAX_OUTFIELD_PLAYERS; i++) {
    for (Player * myPlayer in outfieldPlayers) {
        
       // NSLog(@"highlightClosestPlayerinFov a");

        CGPoint pos = ccpSub([myPlayer position],[player position]);
        
        if (isnan(pos.x) || isnan(pos.y)) {
             NSLog(@"My Player Pos, %f,%f", [myPlayer position].x, [myPlayer position].y);
             NSLog(@"Player Pos, %f,%f", [player position].x, [player position].y);
            return;
        }
       
        if([myPlayer playerId] != [player playerId] && [player isInHumanNarrowFOV: pos])
        {
           // NSLog(@"highlightClosestPlayerinFov c");

            //                if ([player isInFOV: [myPlayer position]])
            //                     {
            //                         CCSpriteFrame *frame;
            //                         frame = [[CCSpriteFrameCache sharedSpriteFrameCache]
            //                                  spriteFrameByName:@"p1_a.png"];
            //
            //                         [[myPlayer getSprite]  setSpriteFrame:frame];
            //                     }
            numInFOV++;
            //player = team->team[i];
            //	distance = Vec2d_Dist(&ball->pos, &player->pos);
            distance = ccpDistance([player position], [myPlayer position]);
            //printf("** distance = %f\n", distance);
            if (distance < shortestDistance) {
                shortestDistance = distance;
                //closestPlayerId = [myPlayer playerId];
                closestPlayer = myPlayer;
                
            }
           // NSLog(@"highlightClosestPlayerinFov d");
        } 
	}
    
   // NSLog(@"highlightClosestPlayerinFov 2");

    //// printf("\n **--> Num in FOV = %d", numInFOV);
    // printf("** shortest distance = %f\n", shortestDistance);
    if (closestPlayer != nil) {
       // NSLog(@"highlightClosestPlayerinFov 3");

        // printf("** Closest playyyer id = %d", [closestPlayer playerId]);
        activeTargetSprite.position = [closestPlayer position];
        activeTargetPlayerId = [closestPlayer playerId];
    }
    else
    {
        //NSLog(@"highlightClosestPlayerinFov 4");

        //take it off screen
        activeTargetSprite.position = ccp(-1000,-100);
        activeTargetPlayerId=0;
        
        //activeTargetSprite.position = ccp(player.position.x+20,player.position.y);
    }
    
//    NSLog(@"Closet player : %@",closestPlayer);
//    NSLog(@"Active player sprite pos: %f,%f",activeTargetSprite.position.x, activeTargetSprite.position.y);
//    NSLog(@"Active player id: %d",activeTargetPlayerId);
//    
    
    //TODO: could be null - fix
    //return closestPlayer;
}


-(void) setTeamId:(int)_teamId
{
    teamId=_teamId;
}

//
-(int) getTeamId
{
    return teamId;
}

//
-(NSMutableArray *) getPlayers
{
    return players;
}

//
//-(void) setSpriteSheet:(CCSpriteBatchNode *)spriteSheet
//{
//    for (Player * myPlayer in outfieldPlayers)
//    {
//        [spriteSheet addChild: [myPlayer sprite] z:200];
//    }
//}


//
//+(void) setSpriteSheet:(CCSpriteBatchNode *)spriteSheet team1:(NSArray *)players team2:(NSArray *)players2
//{
//    for (Player * myPlayer in players)
//    {
//        // ensure keeper appears in front of goals
//        if ([myPlayer playerId] == 1 ) {
//            [[myPlayer getGameLayer] addChild: [myPlayer sprite] z:KEEPER_Z_ORDER_LEVEL];
//        } else {
//            [[myPlayer getGameLayer] addChild: [myPlayer sprite] z:5];
//        }
//        [[myPlayer getGameLayer] addChild: [myPlayer shadow] z:0];
//        [[myPlayer getGameLayer] addChild: [myPlayer nameLabel] z:1];
//    }
//    
//    for (Player * myPlayer in players2)
//    {
//        // ensure keeper appears in front of goals
//        if ([myPlayer playerId] == 1 ) {
//            [[myPlayer getGameLayer] addChild: [myPlayer sprite] z:KEEPER_Z_ORDER_LEVEL];
//        } else {
//            [[myPlayer getGameLayer] addChild: [myPlayer sprite] z:5];
//        }
//        [[myPlayer getGameLayer] addChild: [myPlayer shadow] z:0];
//        [[myPlayer getGameLayer] addChild: [myPlayer nameLabel] z:1];
//    }
//}


-(void)setOppTeam:(Team *)team
{
    oppTeam=team;
}

-(Team *)getOppTeam
{
    return oppTeam;
}

-(Player *) getOppTeamActivePlayer
{
    return [oppTeam getMainPlayer];
}

-(void) set442 {
    [[self getPlayerById:1] setFormationPosition: [formations leftBack]];

    [[self getPlayerById:2] setFormationPosition: [formations leftBack]];
    [[self getPlayerById:3] setFormationPosition: [formations leftCenterBack]];
    [[self getPlayerById:4] setFormationPosition: [formations rightCenterBack]];
    [[self getPlayerById:5] setFormationPosition: [formations rightBack]];
    
    [[self getPlayerById:6] setFormationPosition: [formations leftMidfied]];
    [[self getPlayerById:7] setFormationPosition: [formations leftCenterMidfield]];
    [[self getPlayerById:8] setFormationPosition: [formations rightCenterMidfield]];
    [[self getPlayerById:9] setFormationPosition: [formations rightMidfield]];
    
    [[self getPlayerById:10] setFormationPosition: [formations leftCenterStriker]];
    [[self getPlayerById:11] setFormationPosition: [formations rightCenterStriker]];
    [self setLineup442];

    
}

-(void) set343 {
    
    [[self getPlayerById:1] setFormationPosition: [formations leftBack]];
   
    [[self getPlayerById:2] setFormationPosition: [formations leftCenterBack]];
    [[self getPlayerById:3] setFormationPosition: [formations middleCenterBack]];
    [[self getPlayerById:4] setFormationPosition: [formations rightCenterBack]];
    
    [[self getPlayerById:5] setFormationPosition: [formations leftMidfied]];
    [[self getPlayerById:6] setFormationPosition: [formations leftCenterMidfield]];
    [[self getPlayerById:7] setFormationPosition: [formations rightCenterMidfield]];
    [[self getPlayerById:8] setFormationPosition: [formations rightMidfield]];
    
    [[self getPlayerById:9] setFormationPosition: [formations leftStriker]];
    [[self getPlayerById:10] setFormationPosition: [formations middleCenterStriker]];
    [[self getPlayerById:11] setFormationPosition: [formations rightStriker]];
    [self setLineup343];
}

-(void) set424 {
    [[self getPlayerById:1] setFormationPosition: [formations leftBack]];

    
    [[self getPlayerById:2] setFormationPosition: [formations leftBack]];
    [[self getPlayerById:3] setFormationPosition: [formations leftCenterBack]];
    [[self getPlayerById:4] setFormationPosition: [formations rightCenterBack]];
    [[self getPlayerById:5] setFormationPosition: [formations rightBack]];
    
    [[self getPlayerById:6] setFormationPosition: [formations leftCenterMidfield]];
    [[self getPlayerById:7] setFormationPosition: [formations rightCenterMidfield]];
    
    [[self getPlayerById:8] setFormationPosition: [formations leftStriker]];
    [[self getPlayerById:9] setFormationPosition: [formations leftCenterStriker]];
    [[self getPlayerById:10] setFormationPosition: [formations rightCenterStriker]];
    [[self getPlayerById:11] setFormationPosition: [formations rightStriker]];
    [self setLineup424];

    
}

-(void) set433 {
    [[self getPlayerById:1] setFormationPosition: [formations leftBack]];

    
    [[self getPlayerById:2] setFormationPosition: [formations leftBack]];
    [[self getPlayerById:3] setFormationPosition: [formations leftCenterBack]];
    [[self getPlayerById:4] setFormationPosition: [formations rightCenterBack]];
    [[self getPlayerById:5] setFormationPosition: [formations rightBack]];
    
    [[self getPlayerById:6] setFormationPosition: [formations leftMidfied]];
    [[self getPlayerById:7] setFormationPosition: [formations middleCenterMidfield]];
    [[self getPlayerById:8] setFormationPosition: [formations rightMidfield]];
    
    [[self getPlayerById:9] setFormationPosition: [formations leftStriker]];
    [[self getPlayerById:10] setFormationPosition: [formations middleCenterStriker]];
    [[self getPlayerById:11] setFormationPosition: [formations rightStriker]];
    
    [self setLineup433];
    
}

-(void) set451 {
    [[self getPlayerById:1] setFormationPosition: [formations leftBack]];

    
    [[self getPlayerById:2] setFormationPosition: [formations leftBack]];
    [[self getPlayerById:3] setFormationPosition: [formations leftCenterBack]];
    [[self getPlayerById:4] setFormationPosition: [formations rightCenterBack]];
    [[self getPlayerById:5] setFormationPosition: [formations rightBack]];
    
    [[self getPlayerById:6] setFormationPosition: [formations leftMidfied]];
    [[self getPlayerById:7] setFormationPosition: [formations leftCenterMidfield]];
    [[self getPlayerById:8] setFormationPosition: [formations middleCenterMidfield]];
    [[self getPlayerById:9] setFormationPosition: [formations rightCenterStriker]];
    [[self getPlayerById:10] setFormationPosition: [formations rightMidfield]];
    
    [[self getPlayerById:11] setFormationPosition: [formations middleCenterStriker]];
    [self setLineup451];
    
}



//
//-(void) setFormation323WideDefense
//{
//    NSLog(@"Team %d, Formation : 3-2-3 Wide Defsensive WIde",[self getTeamId]);
//    [[self getPlayerById:1] setPlayerFormationPositions:[formations getDefenseRightPosition]]; //tempformation for keeper so not null
//
//    [[self getPlayerById:2] setPlayerFormationPositions:[formations getDefenseRightPosition]];
//    [[self getPlayerById:3] setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
//    [[self getPlayerById:4] setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
//    [[self getPlayerById:5] setPlayerFormationPositions:[formations getDefenseLeftPosition]];
//    
//    [[self getPlayerById:6] setPlayerFormationPositions:[formations getMidfieldCenterRightPosition]];
//    [[self getPlayerById:7] setPlayerFormationPositions:[formations getMidfieldCenterLeftPosition]];
//    
//    [[self getPlayerById:8] setPlayerFormationPositions:[formations getStrikerAttackingRightPosition]];
//    [[self getPlayerById:9] setPlayerFormationPositions:[formations getStrikerAttackingCenterLeftPosition]];
//    [[self getPlayerById:10] setPlayerFormationPositions:[formations getStrikerAttackingCenterRightsPosition]];
//    [[self getPlayerById:11] setPlayerFormationPositions:[formations getStrikerAttackingLeftPosition]];
//    
//   // [self setNewFormationsTest];
//    
//}
//
////
//-(void) setFormation323
//{
//    NSLog(@"Team %d, Formation : 3-2-3 Attacking",[self getTeamId]);
//    [[self getPlayerById:1] setPlayerFormationPositions:[formations getDefenseRightPosition]]; //tempformation for keeper so not null
//
//    [[self getPlayerById:2] setPlayerFormationPositions:[formations getDefenseRightPosition]];
//    [[self getPlayerById:3] setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
//    [[self getPlayerById:4] setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
//    [[self getPlayerById:5] setPlayerFormationPositions:[formations getDefenseLeftPosition]];
//    
//    [[self getPlayerById:6] setPlayerFormationPositions:[formations getMidfieldCenterRightPosition]];
//    [[self getPlayerById:7] setPlayerFormationPositions:[formations getMidfieldCenterLeftPosition]];
//    
//    [[self getPlayerById:8] setPlayerFormationPositions:[formations getStrikerAttackingRightPosition]];
//    [[self getPlayerById:9] setPlayerFormationPositions:[formations getStrikerAttackingCenterRightsPosition]];
//    [[self getPlayerById:10] setPlayerFormationPositions:[formations getStrikerAttackingCenterLeftPosition]];
//    [[self getPlayerById:11] setPlayerFormationPositions:[formations getStrikerAttackingLeftPosition]];
//
//   // [self setNewFormationsTest];
//}
//
////
//-(void) setFormation332
//{
//    NSLog(@"Team %d, Formation : 3-3-2",[self getTeamId]);
//    [[self getPlayerById:1] setPlayerFormationPositions:[formations getDefenseRightPosition]]; //tempformation for keeper so not null
//
//    [[self getPlayerById:2] setPlayerFormationPositions:[formations getDefenseRightPosition]];
//    [[self getPlayerById:3] setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
//    [[self getPlayerById:4] setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
//    [[self getPlayerById:5] setPlayerFormationPositions:[formations getDefenseLeftPosition]];
//    
//    [[self getPlayerById:6] setPlayerFormationPositions:[formations getMidfieldRightPosition]];
//    [[self getPlayerById:7] setPlayerFormationPositions:[formations getMidfieldCenterRightPosition]];
//    [[self getPlayerById:8] setPlayerFormationPositions:[formations getMidfieldCenterLeftPosition]];
//    [[self getPlayerById:9] setPlayerFormationPositions:[formations getMidfieldLeftPosition]];
//    
//    [[self getPlayerById:10] setPlayerFormationPositions:[formations getStrikerAttackingCenterRightsPosition]];
//    [[self getPlayerById:11] setPlayerFormationPositions:[formations getStrikerAttackingCenterLeftPosition]];
//
//  //  [self setNewFormationsTest];
//
//}
//
//// 424
//-(void) setFormation323Attacking
//{
//    NSLog(@"Team %d, Formation : 3-2-3 Attacking",[self getTeamId]);
//    [[self getPlayerById:1] setPlayerFormationPositions:[formations getDefenseRightPosition]]; //tempformation for keeper so not null
//    
//    [[self getPlayerById:2] setPlayerFormationPositions:[formations getDefenseRightPosition]];
//    [[self getPlayerById:3] setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
//    [[self getPlayerById:4] setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
//    [[self getPlayerById:5] setPlayerFormationPositions:[formations getDefenseLeftPosition]];
//    
//    [[self getPlayerById:6] setPlayerFormationPositions:[formations getMidfieldCenterRightPosition]];
//    [[self getPlayerById:7] setPlayerFormationPositions:[formations getMidfieldCenterLeftPosition]];
//    
//    [[self getPlayerById:8] setPlayerFormationPositions:[formations getStrikerAttackingRightPosition]];
//    [[self getPlayerById:9] setPlayerFormationPositions:[formations getStrikerAttackingCenterRightsPosition]];
//    [[self getPlayerById:10] setPlayerFormationPositions:[formations getStrikerAttackingCenterLeftPosition]];
//    [[self getPlayerById:11] setPlayerFormationPositions:[formations getStrikerAttackingLeftPosition]];
//    
//  //  [self setNewFormationsTest];
//
//}
//
////4-4-2
//-(void) setFormation332Attacking
//{
//    NSLog(@"Team %d, Formation : 3-3-2 Attacking",[self getTeamId]);
//    [[self getPlayerById:1] setPlayerFormationPositions:[formations getDefenseRightPosition]]; //tempformation for keeper so not null
//    
//    [[self getPlayerById:2] setPlayerFormationPositions:[formations getDefenseRightPosition]];
//    [[self getPlayerById:3] setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
//    [[self getPlayerById:4] setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
//    [[self getPlayerById:5] setPlayerFormationPositions:[formations getDefenseLeftPosition]];
//    
//    [[self getPlayerById:6] setPlayerFormationPositions:[formations getMidfieldRightPosition]];
//    [[self getPlayerById:7] setPlayerFormationPositions:[formations getMidfieldCenterRightPosition]];
//    [[self getPlayerById:8] setPlayerFormationPositions:[formations getMidfieldCenterLeftPosition]];
//    [[self getPlayerById:9] setPlayerFormationPositions:[formations getMidfieldLeftPosition]];
//    
//    [[self getPlayerById:10] setPlayerFormationPositions:[formations getStrikerAttackingCenterRightsPosition]];
//    [[self getPlayerById:11] setPlayerFormationPositions:[formations getStrikerAttackingCenterLeftPosition]];
//
//    
//  //  [self setNewFormationsTest];
//
//}
//
////
//-(void) setFormation343
//{
//    NSLog(@"Team %d, Formation : 3-4-3",[self getTeamId]);
//    [[self getPlayerById:1] setPlayerFormationPositions:[formations getDefenseRightPosition]]; //tempformation for keeper so not null
//    
//    [[self getPlayerById:2] setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
//    [[self getPlayerById:3] setPlayerFormationPositions:[formations getDefenseCenterPosition]];
//    [[self getPlayerById:4] setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
//    
//    [[self getPlayerById:5] setPlayerFormationPositions:[formations getMidfieldRightPosition]];
//    [[self getPlayerById:6] setPlayerFormationPositions:[formations getMidfieldCenterRightPosition]];
//    [[self getPlayerById:7] setPlayerFormationPositions:[formations getMidfieldCenterLeftPosition]];
//    [[self getPlayerById:8] setPlayerFormationPositions:[formations getMidfieldLeftPosition]];
//    
//    [[self getPlayerById:9] setPlayerFormationPositions:[formations getStrikerRightPosition]];
//    [[self getPlayerById:10] setPlayerFormationPositions:[formations getStrikerCenterPosition]];
//    [[self getPlayerById:11] setPlayerFormationPositions:[formations getStrikerLeftPosition]];
//    
//    
// //   [self setNewFormationsTest343];
//    
//}
//
//
//
////
//-(void) setFormation431
//{
//    NSLog(@"Team %d, Formation : 4-3-1",[self getTeamId]);
//    [[self getPlayerById:1] setPlayerFormationPositions:[formations getDefenseRightPosition]]; //tempformation for keeper so not null
//    
//    [[self getPlayerById:2] setPlayerFormationPositions:[formations getDefenseRightPosition]];
//    [[self getPlayerById:3] setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
//    [[self getPlayerById:4] setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
//    [[self getPlayerById:5] setPlayerFormationPositions:[formations getDefenseLeftPosition]];
//    
//    [[self getPlayerById:6] setPlayerFormationPositions:[formations getMidfieldCenterRightPosition]];
//    [[self getPlayerById:7] setPlayerFormationPositions:[formations getMidfieldCenterPosition]];
//    [[self getPlayerById:8] setPlayerFormationPositions:[formations getMidfieldCenterLeftPosition]];
//    
//    [[self getPlayerById:9] setPlayerFormationPositions:[formations getStrikerRightPosition]];
//    [[self getPlayerById:10] setPlayerFormationPositions:[formations getStrikerCenterPosition]];
//    [[self getPlayerById:11] setPlayerFormationPositions:[formations getStrikerLeftPosition]];
//
//    
//  //  [self setNewFormationsTest];
//
//}
//
////
//-(void) setFormation431Attacking
//{
//    NSLog(@"Team %d, Formation : 4-3-1 Attacking",[self getTeamId]);
//    [[self getPlayerById:1] setPlayerFormationPositions:[formations getDefenseRightPosition]]; //tempformation for keeper so not null
//    [[self getPlayerById:2] setPlayerFormationPositions:[formations getDefenseRightPosition]];
//    [[self getPlayerById:3] setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
//    [[self getPlayerById:4] setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
//    [[self getPlayerById:5] setPlayerFormationPositions:[formations getDefenseLeftPosition]];
//    
//    [[self getPlayerById:6] setPlayerFormationPositions:[formations getMidfieldCenterRightPosition]];
//    [[self getPlayerById:7] setPlayerFormationPositions:[formations getMidfieldCenterPosition]];
//    [[self getPlayerById:8] setPlayerFormationPositions:[formations getMidfieldCenterLeftPosition]];
//    
//    [[self getPlayerById:9] setPlayerFormationPositions:[formations getStrikerRightPosition]];
//    [[self getPlayerById:10] setPlayerFormationPositions:[formations getStrikerCenterPosition]];
//    [[self getPlayerById:11] setPlayerFormationPositions:[formations getStrikerLeftPosition]];
//    
//  //  [self setNewFormationsTest];
//
//}
////
//
//
//// 433
//-(void) setFormation431Wide
//{
//    NSLog(@"Team %d, Formation : 4-3-1 Wide",[self getTeamId]);
//    [[self getPlayerById:1] setPlayerFormationPositions:[formations getDefenseRightPosition]]; //tempformation for keeper so not null
//    [[self getPlayerById:2] setPlayerFormationPositions:[formations getDefenseRightPosition]];
//    [[self getPlayerById:3] setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
//    [[self getPlayerById:4] setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
//    [[self getPlayerById:5] setPlayerFormationPositions:[formations getDefenseLeftPosition]];
//    
//    [[self getPlayerById:6] setPlayerFormationPositions:[formations getMidfieldRightPosition]];
//    [[self getPlayerById:7] setPlayerFormationPositions:[formations getMidfieldCenterPosition]];
//    [[self getPlayerById:8] setPlayerFormationPositions:[formations getMidfieldLeftPosition]];
//    
//    [[self getPlayerById:9] setPlayerFormationPositions:[formations getStrikerRightPosition]];
//    [[self getPlayerById:10] setPlayerFormationPositions:[formations getStrikerCenterPosition]];
//    [[self getPlayerById:11] setPlayerFormationPositions:[formations getStrikerLeftPosition]];
//    
// //   [self setNewFormationsTest];
//
//}
//
//// 433
//-(void) setFormation431WideAttacking
//{
//    NSLog(@"Team %d, Formation : 4-3-1 Wide Attacking",[self getTeamId]);
//    [[self getPlayerById:1] setPlayerFormationPositions:[formations getDefenseRightPosition]]; //tempformation for keeper so not null
//    [[self getPlayerById:2] setPlayerFormationPositions:[formations getDefenseRightPosition]];
//    [[self getPlayerById:3] setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
//    [[self getPlayerById:4] setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
//    [[self getPlayerById:5] setPlayerFormationPositions:[formations getDefenseLeftPosition]];
//    
//    [[self getPlayerById:6] setPlayerFormationPositions:[formations getMidfieldRightPosition]];
//    [[self getPlayerById:7] setPlayerFormationPositions:[formations getMidfieldCenterPosition]];
//    [[self getPlayerById:8] setPlayerFormationPositions:[formations getMidfieldLeftPosition]];
//    
//    [[self getPlayerById:9] setPlayerFormationPositions:[formations getStrikerRightPosition]];
//    [[self getPlayerById:10] setPlayerFormationPositions:[formations getStrikerCenterPosition]];
//    [[self getPlayerById:11] setPlayerFormationPositions:[formations getStrikerLeftPosition]];
//    
//  //  [self setNewFormationsTest];
//
//
//}
//
//// 442
//
//-(void) setFormation422
//{
//    NSLog(@"Team %d, Formation : 4-4-2",[self getTeamId]);
//    [[self getPlayerById:1] setPlayerFormationPositions:[formations getDefenseRightPosition]]; //tempformation for keeper so not null
//    [[self getPlayerById:2] setPlayerFormationPositions:[formations getDefenseRightPosition]];
//    [[self getPlayerById:3] setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
//    [[self getPlayerById:4] setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
//    [[self getPlayerById:5] setPlayerFormationPositions:[formations getDefenseLeftPosition]];
//    
//    [[self getPlayerById:6] setPlayerFormationPositions:[formations getMidfieldRightPosition]];
//    [[self getPlayerById:7] setPlayerFormationPositions:[formations getMidfieldCenterRightPosition]];
//    [[self getPlayerById:8] setPlayerFormationPositions:[formations getMidfieldCenterLeftPosition]];
//    [[self getPlayerById:9] setPlayerFormationPositions:[formations getMidfieldLeftPosition]];
//    
//    [[self getPlayerById:10] setPlayerFormationPositions:[formations getStrikerRightPosition]];
//    [[self getPlayerById:11] setPlayerFormationPositions:[formations getStrikerLeftPosition]];
//    
//  //  [self setNewFormationsTest];
//
//}
//
//-(void) setFormation422Attacking
//{
//    NSLog(@"Team %d, Formation : 4-4-2 Attacking",[self getTeamId]);
//    [[self getPlayerById:1] setPlayerFormationPositions:[formations getDefenseRightPosition]]; //tempformation for keeper so not null
//    [[self getPlayerById:2] setPlayerFormationPositions:[formations getDefenseRightPosition]];
//    [[self getPlayerById:3] setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
//    [[self getPlayerById:4] setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
//    [[self getPlayerById:5] setPlayerFormationPositions:[formations getDefenseLeftPosition]];
//    
//    [[self getPlayerById:6] setPlayerFormationPositions:[formations getMidfieldCenterRightPosition]];
//    [[self getPlayerById:7] setPlayerFormationPositions:[formations getMidfieldCenterLeftPosition]];
//    
//    [[self getPlayerById:8] setPlayerFormationPositions:[formations getStrikerRightPosition]];
//    [[self getPlayerById:9] setPlayerFormationPositions:[formations getStrikerCenterRightsPosition]];
//    [[self getPlayerById:10] setPlayerFormationPositions:[formations getStrikerCenterLeftPosition]];
//    [[self getPlayerById:11] setPlayerFormationPositions:[formations getStrikerLeftPosition]];
//    
// //   [self setNewFormationsTest];
//
//}
//
//-(void) setFormation341
//{
//    NSLog(@"Team %d, Formation : 3-4-1",[self getTeamId]);
//    [[self getPlayerById:1] setPlayerFormationPositions:[formations getDefenseRightPosition]]; //tempformation for keeper so not null
//    
//    [[self getPlayerById:2] setPlayerFormationPositions:[formations getDefenseRightPosition]];
//    [[self getPlayerById:3] setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
//    [[self getPlayerById:4] setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
//    [[self getPlayerById:5] setPlayerFormationPositions:[formations getDefenseLeftPosition]];
//    
//    [[self getPlayerById:6] setPlayerFormationPositions:[formations getMidfieldRightPosition]];
//    [[self getPlayerById:7] setPlayerFormationPositions:[formations getMidfieldCenterRightPosition]];
//    [[self getPlayerById:8] setPlayerFormationPositions:[formations getMidfieldCenterPosition]];
//    [[self getPlayerById:9] setPlayerFormationPositions:[formations getMidfieldCenterLeftPosition]];
//    [[self getPlayerById:10] setPlayerFormationPositions:[formations getMidfieldLeftPosition]];
//    
//    [[self getPlayerById:11] setPlayerFormationPositions:[formations getStrikerAttackingCenterPosition]];
//    
// //   [self setNewFormationsTest];
//
//}
//
//// 451
//-(void) setFormation341Attacking
//{
//    
//    NSLog(@"Team %d, Formation : 3-4-1 Attacking",[self getTeamId]);
//    [[self getPlayerById:1] setPlayerFormationPositions:[formations getDefenseRightPosition]]; //tempformation for keeper so not null
//
//    [[self getPlayerById:2] setPlayerFormationPositions:[formations getDefenseRightPosition]];
//    [[self getPlayerById:3] setPlayerFormationPositions:[formations getDefenseCenterRightPosition]];
//    [[self getPlayerById:4] setPlayerFormationPositions:[formations getDefenseCenterLeftPosition]];
//    [[self getPlayerById:5] setPlayerFormationPositions:[formations getDefenseLeftPosition]];
//    
//    [[self getPlayerById:6] setPlayerFormationPositions:[formations getMidfieldRightPosition]];
//    [[self getPlayerById:7] setPlayerFormationPositions:[formations getMidfieldCenterRightPosition]];
//    [[self getPlayerById:8] setPlayerFormationPositions:[formations getMidfieldCenterPosition]];
//    [[self getPlayerById:9] setPlayerFormationPositions:[formations getMidfieldCenterLeftPosition]];
//    [[self getPlayerById:10] setPlayerFormationPositions:[formations getMidfieldLeftPosition]];
//    
//    [[self getPlayerById:11] setPlayerFormationPositions:[formations getStrikerAttackingCenterPosition]];
//    
//  //  [self setNewFormationsTest];
//
//}

-(NSMutableArray *) getDefenders {
    NSMutableArray *defenders = [[NSMutableArray alloc] init];
    GameData *gd = [GameData sharedGameDataManager];
    for (PlayerData *player in [[gd getMatchTeam:[self getTeamId]] playersData]) {
        if ([player position] == DEFENDER) {
            [defenders addObject:player];
        }
    }
    return defenders;
}

-(NSMutableArray *) getMidfielders {
    NSMutableArray *midfielders = [[NSMutableArray alloc] init];
    GameData *gd = [GameData sharedGameDataManager];
    for (PlayerData *player in [[gd getMatchTeam:[self getTeamId]] playersData]) {
        if ([player position] == MIDFIELD) {
            [midfielders addObject:player];
        }
    }
    return midfielders;
}

-(NSMutableArray *) getStrikers {
    NSMutableArray *strikers = [[NSMutableArray alloc] init];
    GameData *gd = [GameData sharedGameDataManager];
    for (PlayerData *player in [[gd getMatchTeam:[self getTeamId]] playersData]) {
        if ([player position] == STRIKER) {
            [strikers addObject:player];
        }
    }
    return strikers;
}

-(NSMutableArray *) getDefenderLineup :(int)defenders {
    int numDefendersPicked=0;
    
    NSLog(@">>>Number of Defnders to choose : %d", defenders);
    
    //
    NSMutableArray *chosenDefenders = [[NSMutableArray alloc] init];
    NSMutableArray *allDefenders = [self getDefenders];
    int numDefenderToChoseFrom = (int)[allDefenders count];
    NSLog(@">>>Number of Defnders to choose from  : %d", numDefenderToChoseFrom);
    
    while (numDefendersPicked < defenders) {
        int randomDefender = [Util random:numDefenderToChoseFrom];
        
        PlayerData *defender = [allDefenders objectAtIndex:randomDefender];
        //if (![chosenDefendersId containsObject: defender]) {
        if (![self playerAlreadyExists: chosenDefenders: defender]) {
    
            [chosenDefenders addObject:defender];
            NSLog(@"*** New defender found : %@" , [defender playerName]);
            numDefendersPicked++;
        } else {
            NSLog(@"*** Defender : %@ already selected" , [defender playerName]);
        }
    }
    
    return chosenDefenders;

}




+(void) resetTeamLineup :(TeamData *)currentTeam :(int) originalTeamIndex {
    
    //int playerIndex =0;
    TeamData *originalTeam = [[GameData sharedGameDataManager] getOriginalTeam:originalTeamIndex];
    int numPlayers = (int)[[[GameData sharedGameDataManager] getTeams] count] ;
    
    for (int playerIndex =1; playerIndex < numPlayers ; playerIndex++) {
        NSLog(@">>PLayer index : %d", playerIndex);
        PlayerData *pd = [[currentTeam playersData] objectAtIndex: playerIndex];
        [currentTeam swapPlayers:playerIndex :[originalTeam getPlayerIdByName:[pd playerName]]];
     }
}


+(void) resetAllTeamsToOriginalPLayerLineup {
    
    int teamIndex =0;
    for (TeamData *td in [[GameData sharedGameDataManager] getTeams] ) {
        [self resetTeamLineup :td : teamIndex];
        teamIndex++;
    }
}


-(bool) playerAlreadyExists:(NSMutableArray *)playerList :(PlayerData *)player {
    
    if ([playerList count] == 0)
    {
        return false;
    }
    
    for (PlayerData * existingPlayer in playerList) {
        if ([[existingPlayer playerName] isEqualToString:[player playerName]]) {
            return true;
        }
    }
    
    return false;
}


-(NSMutableArray *) getMidfieldersLineup :(int)midfielders {
    int numMidfieldersPicked=0;
    
    NSLog(@">>>Number of Midfielders to choose : %d", midfielders);
    
    //
    NSMutableArray *chosenMidfielders = [[NSMutableArray alloc] init];
    NSMutableArray *allMidfielders= [self getMidfielders];
    int numMidfieldersToChoseFrom = (int)[allMidfielders count];
    NSLog(@">>>Number of Midfielders to choose from  : %d", numMidfieldersToChoseFrom);
    
    while (numMidfieldersPicked < midfielders) {
        int randomMidfielderId = [Util random:numMidfieldersToChoseFrom];
        
        PlayerData *randomPlayer = [allMidfielders objectAtIndex:randomMidfielderId];
//        if (![chosenMidfieldersId  containsObject: randomPlayer]) {
        if (![self playerAlreadyExists: chosenMidfielders: randomPlayer]) {
            [chosenMidfielders addObject:randomPlayer];
            NSLog(@"*** New midfielder found : %@" , [randomPlayer playerName]);
            numMidfieldersPicked++;
        } else {
            NSLog(@"*** Midfielder : %@ already selected" , [randomPlayer playerName]);
        }
    }
    
    return chosenMidfielders;
    
}

-(NSMutableArray *) getStrikersLineup :(int)strikers {
    int numStrikersPicked=0;
    
    NSLog(@">>>Number of Strikers to choose : %d", strikers);
    
    //
    NSMutableArray *chosenStrikers = [[NSMutableArray alloc] init];
    NSMutableArray *allStrikers= [self getStrikers];
    int numStrikersToChoseFrom = (int)[allStrikers count];
    NSLog(@">>>Number of Strikers to choose from  : %d", numStrikersToChoseFrom);
    
    while (numStrikersPicked < strikers) {
        int randomStrikerId = [Util random:numStrikersToChoseFrom];
        
        PlayerData *randomPlayer = [allStrikers objectAtIndex:randomStrikerId];
        if (![self playerAlreadyExists: chosenStrikers: randomPlayer]) {
            [chosenStrikers addObject:randomPlayer];
            NSLog(@"*** New striker found : %@" , [randomPlayer playerName]);
            numStrikersPicked++;
        } else {
            NSLog(@"*** Striker : %@ already selected" , [randomPlayer playerName]);
        }
    }
    
    return chosenStrikers;
}

-(void) doAutoPlayerLineupSwap :(NSMutableArray *) chosenLineup {
    
    //
    GameData *gd = [GameData sharedGameDataManager];
    //[[gd getMatchTeam:[self getTeamId]]  swapPlayers :<#(int)#> :<#(int)#>
    
    // get existing player at position x - eg 2 and swap with lineup player 2
    // only if current player at position x  (e.g 2 isn't the same player
    //TeamData *team = [gd getMatchTeam:[self getTeamId]];
    
    
    
    NSLog(@"\n-----BEFORE ----------------------------");
    
    for (PlayerData *p in [[gd getMatchTeam:[self getTeamId]] playersData] ) {
        NSLog(@">> Player : %@", [p playerName]);
        
    }
    
  
    
    //int originalPlayerId = [[team playersData] objectAtIndex: 2] pl;
    [[gd getMatchTeam:[self getTeamId]] swapPlayers:1 : [self getPlayerLineupPositionId:[chosenLineup objectAtIndex:0]]];
    [[gd getMatchTeam:[self getTeamId]] swapPlayers:2 : [self getPlayerLineupPositionId:[chosenLineup objectAtIndex:1]]];
    [[gd getMatchTeam:[self getTeamId]] swapPlayers:3 : [self getPlayerLineupPositionId:[chosenLineup objectAtIndex:2]]];
    [[gd getMatchTeam:[self getTeamId]] swapPlayers:4 : [self getPlayerLineupPositionId:[chosenLineup objectAtIndex:3]]];
    [[gd getMatchTeam:[self getTeamId]] swapPlayers:5 : [self getPlayerLineupPositionId:[chosenLineup objectAtIndex:4]]];
    [[gd getMatchTeam:[self getTeamId]] swapPlayers:6 : [self getPlayerLineupPositionId:[chosenLineup objectAtIndex:5]]];
    [[gd getMatchTeam:[self getTeamId]] swapPlayers:7 : [self getPlayerLineupPositionId:[chosenLineup objectAtIndex:6]]];
    [[gd getMatchTeam:[self getTeamId]] swapPlayers:8 : [self getPlayerLineupPositionId:[chosenLineup objectAtIndex:7]]];
    [[gd getMatchTeam:[self getTeamId]] swapPlayers:9 : [self getPlayerLineupPositionId:[chosenLineup objectAtIndex:8]]];
    [[gd getMatchTeam:[self getTeamId]] swapPlayers:10 : [self getPlayerLineupPositionId:[chosenLineup objectAtIndex:9]]];
    
    
    NSLog(@"\n-----AFTER ----------------------------");
    
    for (PlayerData *p in [[gd getMatchTeam:[self getTeamId]] playersData] ) {
        NSLog(@">> Player : %@", [p playerName]);
        
    }
}



-(void) createRandomLineup: (int) defenders :(int) midfielders : (int) strikers {
    
    NSLog(@">>>Number of Defnders to choose : %d", defenders);
    NSLog(@">>>Number of Midfielders to choose : %d", midfielders);
    NSLog(@">>>Number of Strikers to choose : %d", midfielders);
    
    //
    NSMutableArray *chosenDefenders = [self getDefenderLineup:defenders];
    NSMutableArray *chosenMidfielders = [self getMidfieldersLineup:midfielders];
    NSMutableArray *chosenStrikers = [self getStrikersLineup:strikers];
    
    
    NSLog(@"\n----------------------------------------");
    
    for (PlayerData * player in chosenDefenders) {
        NSLog(@">>> Defender : %@", [player playerName]);
    }
    
    for (PlayerData * player in chosenMidfielders) {
        NSLog(@">>> Midfielder : %@", [player playerName]);
    }
    
    for (PlayerData * player in chosenStrikers) {
        NSLog(@">>> Strikers : %@", [player playerName]);
    }
    
    // once we have all the players do a swap
    // go through existing player data, find id and swap?
    
    NSMutableArray *fullLineup = [[NSMutableArray alloc] init];

    
    [fullLineup addObjectsFromArray:chosenDefenders];
    [fullLineup addObjectsFromArray:chosenMidfielders];
    [fullLineup addObjectsFromArray:chosenStrikers];
    

    [self doAutoPlayerLineupSwap:fullLineup];
    
}

-(int) getPlayerLineupPositionId : (PlayerData *)player {
    
    GameData *gd = [GameData sharedGameDataManager];
    TeamData *team = [gd getMatchTeam:[self getTeamId]];

    int currentLineupPos=0;
    for (PlayerData *playerData in [team playersData]) {
        if ([[playerData playerName] isEqualToString: [player playerName]]) {
            return currentLineupPos;
        }
            
        currentLineupPos++;
    }
    
    return 0;
}





//
-(void) pickRandomFormation
{
    int rand = [Util random:5];
    
    switch(rand)
    {
        case 0:
            [self set343];
            [self createRandomLineup:3:4:3];
            break;
            
        case 1:
            [self set442];
            [self createRandomLineup:3:4:3];

            break;
            
        case 2:
            [self set433];
            [self createRandomLineup:4:3:3];
            break;
            
        case 3:
            [self set451];
            [self createRandomLineup:4:5:1];
            break;
            
        case 4:
            [self set424];
            [self createRandomLineup:4:2:4];
            break;
            
        default:
            break;
    }
    //    if ([Util random5050])
    //    {
    //        CCLOG(@">> Formation picked: 323");
    //        [self setFormation431];
    //    }
    //    else
    //    {
    //        CCLOG(@">> Formation picked: 332");
    //        [self setFormation431Wide];
    //    }
}

@end

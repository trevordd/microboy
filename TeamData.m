//
//  TeamData.m
//  mySoccer
//
//  Created by Trevor Delves on 11/11/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TeamData.h"


#define TEAM_NAME_INDEX             0
#define TEAM_SHORT_NAME_INDEX       1
#define KIT_MAIN_COLOUR_INDEX       2
#define KIT_SECOND_COLOUR_INDEX     3
#define KIT_SLEEVE_COLOUR_INDEX     4
#define KIT_SHORTS_COLOUR_INDEX     5


@implementation TeamData

@synthesize teamName;
@synthesize shortTeamName;
@synthesize stripMainColour;
@synthesize stripSecondColour;
@synthesize stripSleevesColour;
@synthesize shortsColour;
@synthesize playersData;

-(id)initTest
{
    return self;
}

-(id) initWithNames:(NSMutableArray *)names team:(NSString *)tName abrTeam:(NSString *)aName
{
    if( (self=[super init] )) {
        
        // playerNames = [NSMutableArray arrayWithArray:names];
        playerNames = [[NSMutableArray alloc] initWithArray:names];
        teamName = tName;
        shortTeamName = aName;
    }
	//[self release];
	return self;
}


-(id) initWithNamesAndStats:(NSMutableArray *)names :(NSMutableArray *)stats team:(NSString *)tName abrTeam:(NSString *)aName
{
    if( (self=[super init] )) {
        
        // playerNames = [NSMutableArray arrayWithArray:names];
        playerNames = [[NSMutableArray alloc] initWithArray:names];
        playersData = [[NSMutableArray alloc] initWithArray:stats];
        teamName = tName;
        shortTeamName = aName;
    }
    //[self release];
    return self;
}


-(id) initWithStats:(NSMutableArray *)stats team:(NSString *)tName abrTeam:(NSString *)aName
{
    if( (self=[super init] )) {
        
        // playerNames = [NSMutableArray arrayWithArray:names];
        playersData = [[NSMutableArray alloc] initWithArray:stats];
        teamName = tName;
        shortTeamName = aName;
    }
    //[self release];
    return self;
}


-(id) initWithTeaminfoAndStats :(NSMutableArray *)teamInfo  :(NSMutableArray *)stats {
    
    
    /* TeamInfo (NSMutableArray
     - Team Name
     - Team Abrv Name
     - Kit Main Colour
     - Kit Second Colour
     - Kit Sleeve Colour
     */
    
    if( (self=[super init] )) {
        
        // team name
        self.teamName = (NSString *) [teamInfo objectAtIndex:TEAM_NAME_INDEX];
        self.shortTeamName = (NSString *) [teamInfo objectAtIndex:TEAM_SHORT_NAME_INDEX];
       
        // kit
        self.stripMainColour =  [(NSNumber *) [teamInfo objectAtIndex:KIT_MAIN_COLOUR_INDEX] intValue];
        self.stripSecondColour= [(NSNumber*) [teamInfo objectAtIndex:KIT_SECOND_COLOUR_INDEX] intValue];
        self.stripSleevesColour= [(NSNumber*) [teamInfo objectAtIndex:KIT_SLEEVE_COLOUR_INDEX] intValue];
        self.shortsColour= [(NSNumber*) [teamInfo objectAtIndex:KIT_SHORTS_COLOUR_INDEX] intValue];
        
        // stats
        playersData = [[NSMutableArray alloc] initWithArray:stats];
    }
    //[self release];
    return self;

    
    
}

//
-(void) setPlayerNames:(NSMutableArray *)pNames
{
    playerNames = pNames;
}


//
//-(NSMutableArray *) getPlayerNames
//{
//    return playerNames;
//}

//
//-(NSMutableArray *) getPlayersData
//{
//    return playersData;
//}


//
-(int) getPlayerIdByNameOld:(NSString*)name {
    
    int i=0;
    for (NSString *pName in playerNames) {
        if ( [pName isEqualToString:name]) {
            return i;
        }
        i++;
    }
    
    // else
    return -1;
}


-(NSString *) getPlayersSurname:(NSString *) fullName
{
    NSString *surname = [fullName substringFromIndex:2];
    return surname;
}


//
-(int) getPlayerIdByName:(NSString*)name {
    
    int i=0;
    for (PlayerData *pData in playersData) {
        //if ( [[pData playerName] isEqualToString:name]) {
        if ( [name hasSuffix:[pData playerName]] || [name hasSuffix:[self getPlayersSurname:[pData playerName]]] ) {
            return i;
        }
        i++;
    }
    
    // else
    return -1;
}

//
//
-(NSString *) getPlayerName:(int) index
{
    return [[playersData objectAtIndex:index] playerName];
}


-(NSString *) getPlayerSurname:(int) index
{
    NSString *fullName = [[playersData objectAtIndex:index] playerName] ;
    NSString *surname = nil;
    if ([fullName containsString:@"."]) {
        surname = [fullName substringFromIndex:2];
    } else {
        surname = fullName;
    }
    return surname;
}

//
-(NSString *) getPlayerNameOld:(int) index
{
    return [playerNames objectAtIndex:index];
}


//
-(void)swapPlayers:(int)player1 :(int)player2
{
    [playersData exchangeObjectAtIndex:player1 withObjectAtIndex:player2];
}

//
-(void)swapPlayersNew:(int)player1 :(int)player2
{
    [playersData exchangeObjectAtIndex:player1 withObjectAtIndex:player2];
}



@end

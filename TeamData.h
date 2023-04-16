//
//  TeamData.h
//  mySoccer
//
//  Created by Trevor Delves on 11/11/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerData.h"
#import "PlayerStats.h"

@interface TeamData : NSObject {
    NSString *teamName;
    NSString *shortTeamName; //
    NSMutableArray *playerNames;
    NSMutableArray *playersData;

    int stripMainColour;
    int stripSecondColour;
    int stripSleeveColour;
    int shortsColour;
    
    // StripMainColour
    // StripSecondaryColour
    // StripSleevesColour
    // Shorts Color
    //
}

@property (strong, nonatomic) NSString *teamName;
@property (strong, nonatomic) NSString *shortTeamName;
@property (nonatomic,readwrite,strong) NSMutableArray *playersData;
@property (nonatomic) int stripMainColour;
@property (nonatomic) int stripSecondColour;
@property (nonatomic) int stripSleevesColour;
@property (nonatomic) int shortsColour;



-(id) initTest;
-(id) initWithNames:(NSMutableArray *)names team:(NSString *)tName abrTeam:(NSString *)aName;
-(id) initWithNamesAndStats:(NSMutableArray *)names :(NSMutableArray *)stats team:(NSString *)tName abrTeam:(NSString *)aName;
-(id) initWithStats:(NSMutableArray *)stats team:(NSString *)tName abrTeam:(NSString *)aName;
-(id) initWithTeaminfoAndStats :(NSMutableArray *)teamInfo  :(NSMutableArray *)stats;


-(NSString *) getPlayerName:(int) index;
-(NSString *) getPlayerSurname:(int) index;

-(void)swapPlayers:(int)player1 :(int)player2;
-(int) getPlayerIdByName:(NSString*)name;
//-(void) setPlayerName:(NSString *) name;

@end

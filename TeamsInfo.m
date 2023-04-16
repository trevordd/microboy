//
//  TeamsInfo.m
//  MicroSoccer5
//
//  Created by Trevor Delves on 09/04/2016.
//  Copyright © 2016 Apportable. All rights reserved.
//


#import "TeamsInfo.h"

@implementation TeamsInfo



+(NSMutableArray *) getEnglandTeamInfo {
    NSMutableArray *englandTeamInfo = [NSMutableArray arrayWithObjects : ENGLAND_TEAM_INFO, nil];
    return englandTeamInfo;
}

//
+(NSMutableArray *) getFranceTeamInfo {
    NSMutableArray *franceTeamInfo = [NSMutableArray arrayWithObjects : FRANCE_TEAM_INFO, nil];
    return franceTeamInfo;
}

+(NSMutableArray *) getItalyTeamInfo {
    NSMutableArray *italyTeamInfo = [NSMutableArray arrayWithObjects : ITALY_TEAM_INFO, nil];
    return italyTeamInfo;
}

+(NSMutableArray *) getSpainTeamInfo {
    NSMutableArray *spainTeamInfo = [NSMutableArray arrayWithObjects : SPAIN_TEAM_INFO, nil];
    return spainTeamInfo;
}

+(NSMutableArray *) getBrazilTeamInfo {
    NSMutableArray *brazilTeamInfo = [NSMutableArray arrayWithObjects : BRAZIL_TEAM_INFO, nil];
    return brazilTeamInfo;
}

+(NSMutableArray *) getHollandTeamInfo {
    NSMutableArray *hollandTeamInfo = [NSMutableArray arrayWithObjects : HOLLAND_TEAM_INFO, nil];
    return hollandTeamInfo;
}

+(NSMutableArray *) getArgentinaTeamInfo {
    NSMutableArray *argentinaTeamInfo = [NSMutableArray arrayWithObjects : ARGENTINA_TEAM_INFO, nil];
    return argentinaTeamInfo;
}

+(NSMutableArray *) getGermanyTeamInfo {
    NSMutableArray *germanyTeamInfo = [NSMutableArray arrayWithObjects : GERMANY_TEAM_INFO, nil];
    return germanyTeamInfo;
}

+(NSMutableArray *) getGhanaTeamInfo {
    NSMutableArray *ghanaTeamInfo = [NSMutableArray arrayWithObjects : GHANA_TEAM_INFO, nil];
    return ghanaTeamInfo;
}

+(NSMutableArray *) getPortugalTeamInfo {
    NSMutableArray *portugalTeamInfo = [NSMutableArray arrayWithObjects : PORTUGAL_TEAM_INFO, nil];
    return portugalTeamInfo;
}


+(NSMutableArray *) getBelgiumTeamInfo {
    NSMutableArray *belgiumTeamInfo = [NSMutableArray arrayWithObjects : BELGIUM_TEAM_INFO, nil];
    return belgiumTeamInfo;
}

+(NSMutableArray *) getIvoryCoastTeamInfo {
    NSMutableArray *ivoryCoastInfo = [NSMutableArray arrayWithObjects : IVORYCOAST_TEAM_INFO, nil];
    return ivoryCoastInfo;
}

+(NSMutableArray *) getJapanTeamInfo {
    NSMutableArray *japanInfo = [NSMutableArray arrayWithObjects : JAPAN_TEAM_INFO, nil];
    return japanInfo;
}

+(NSMutableArray *) getUsaTeamInfo {
    NSMutableArray *usaInfo = [NSMutableArray arrayWithObjects : USA_TEAM_INFO, nil];
    return usaInfo;
}

+(NSMutableArray *) getWalesTeamInfo {
    NSMutableArray *walesInfo = [NSMutableArray arrayWithObjects : WALES_TEAM_INFO, nil];
    return walesInfo;
}

+(NSMutableArray *) getEnglandPlayers {
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: ENGLAND_PLAYER_STATS18, nil];
    
    //
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                          playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                          playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                          playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                          nil];
    return playerStats;
}



+(NSMutableArray *) getFrancePlayers {
 
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: FRANCE_PLAYER_STATS18, nil];
    
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                   playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                   playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                   playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                   nil];
    return playerStats;
}



+(NSMutableArray *) getItalyPlayers {
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: ITALY_PLAYER_STATS18, nil];
    
    
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                   playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                   playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                   playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                   nil];
    return playerStats;
}


+(NSMutableArray *) getSpainPlayers {
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: SPAIN_PLAYER_STATS18, nil];
    
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                   playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                   playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                   playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                   nil];
    return playerStats;
}


+(NSMutableArray *) getHollandPlayers {
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: HOLLAND_PLAYER_STATS18, nil];
    
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                   playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                   playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                   playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                   nil];
    
    return playerStats;
}


+(NSMutableArray *) getBrazilPlayers {
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: BRAZIL_PLAYER_STATS18, nil];
    
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                   playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                   playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                   playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                   nil];
    
    return playerStats;
}


+(NSMutableArray *) getArgentinaPlayers {
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: ARGENTINA_PLAYER_STATS18, nil];
    
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                   playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                   playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                   playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                   nil];
    return playerStats;
}


+(NSMutableArray *) getGermanyPlayers {
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: GERMANY_PLAYER_STATS18, nil];
    
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                   playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                   playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                   playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                   nil];
   
    return playerStats;
}


+(NSMutableArray *) getGhanaPlayers {
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: GHANA_PLAYER_STATS18, nil];
    
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                   playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                   playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                   playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                   nil];
  
    return playerStats;
}


+(NSMutableArray *) getPortugalPlayers {
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: PORTUGAL_PLAYER_STATS18, nil];
    
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                   playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                   playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                   playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                   nil];
    
    return playerStats;
}


+(NSMutableArray *) getBelgiumPlayers {
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: BELGIUM_PLAYER_STATS18, nil];
    
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                   playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                   playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                   playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                   nil];
    
    return playerStats;
}


+(NSMutableArray *) getIvoryCoastPlayers {
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: IVORYCOAST_PLAYER_STATS18, nil];
    
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                   playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                   playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                   playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                   nil];
    
    return playerStats;
}

+(NSMutableArray *) getJapanPlayers {
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: JAPAN_PLAYER_STATS18, nil];
    
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                   playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                   playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                   playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                   nil];
    
    return playerStats;
}


+(NSMutableArray *) getUsaPlayers {
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: USA_PLAYER_STATS18, nil];
    
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                   playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                   playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                   playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                   nil];
    
    return playerStats;
}

+(NSMutableArray *) getWalesPlayers {
    //
    NSMutableArray *playerStats1 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS1, nil];
    NSMutableArray *playerStats2 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS2, nil];
    NSMutableArray *playerStats3 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS3, nil];
    NSMutableArray *playerStats4 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS4, nil];
    NSMutableArray *playerStats5 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS5, nil];
    NSMutableArray *playerStats6 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS6, nil];
    NSMutableArray *playerStats7 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS7, nil];
    NSMutableArray *playerStats8 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS8, nil];
    NSMutableArray *playerStats9 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS9, nil];
    NSMutableArray *playerStats10 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS10, nil];
    NSMutableArray *playerStats11 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS11, nil];
    NSMutableArray *playerStats12 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS12, nil];
    NSMutableArray *playerStats13 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS13, nil];
    NSMutableArray *playerStats14 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS14, nil];
    NSMutableArray *playerStats15 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS15, nil];
    NSMutableArray *playerStats16 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS16, nil];
    NSMutableArray *playerStats17 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS17, nil];
    NSMutableArray *playerStats18 = [NSMutableArray arrayWithObjects: WALES_PLAYER_STATS18, nil];
    
    //
    PlayerData * playerData1 = [[PlayerData alloc] initWithStats:playerStats1];
    PlayerData * playerData2 = [[PlayerData alloc] initWithStats:playerStats2];
    PlayerData * playerData3 = [[PlayerData alloc] initWithStats:playerStats3];
    PlayerData * playerData4 = [[PlayerData alloc] initWithStats:playerStats4];
    PlayerData * playerData5 = [[PlayerData alloc] initWithStats:playerStats5];
    PlayerData * playerData6 = [[PlayerData alloc] initWithStats:playerStats6];
    PlayerData * playerData7 = [[PlayerData alloc] initWithStats:playerStats7];
    PlayerData * playerData8 = [[PlayerData alloc] initWithStats:playerStats8];
    PlayerData * playerData9 = [[PlayerData alloc] initWithStats:playerStats9];
    PlayerData * playerData10 = [[PlayerData alloc] initWithStats:playerStats10];
    PlayerData * playerData11 = [[PlayerData alloc] initWithStats:playerStats11];
    PlayerData * playerData12 = [[PlayerData alloc] initWithStats:playerStats12];
    PlayerData * playerData13 = [[PlayerData alloc] initWithStats:playerStats13];
    PlayerData * playerData14 = [[PlayerData alloc] initWithStats:playerStats14];
    PlayerData * playerData15 = [[PlayerData alloc] initWithStats:playerStats15];
    PlayerData * playerData16 = [[PlayerData alloc] initWithStats:playerStats16];
    PlayerData * playerData17 = [[PlayerData alloc] initWithStats:playerStats17];
    PlayerData * playerData18 = [[PlayerData alloc] initWithStats:playerStats18];
    
    //
    NSMutableArray *playerStats = [NSMutableArray arrayWithObjects :
                                   playerData1,playerData2,playerData3,playerData4,playerData5,playerData6,
                                   playerData7,playerData8,playerData9,playerData10,playerData11,playerData12,
                                   playerData13,playerData14,playerData15,playerData16,playerData17,playerData18,
                                   nil];
    
    return playerStats;
}



@end
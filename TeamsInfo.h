//
//  TeamInfo.h
//  MicroSoccer5
//
//  Created by Trevor Delves on 09/04/2016.
//  Copyright © 2016 Apportable. All rights reserved.
//
//
//

#ifndef TeamsInfo_h
#define TeamsInfo_h

#import <Foundation/Foundation.h>
#import "PlayerData.h"

#import "England.h"


@interface TeamsInfo : NSObject {
   
    
}

+(NSMutableArray *) getEnglandPlayers;
+(NSMutableArray *) getEnglandTeamInfo;

+(NSMutableArray *) getFrancePlayers;
+(NSMutableArray *) getFranceTeamInfo;

+(NSMutableArray *) getItalyPlayers;
+(NSMutableArray *) getItalyTeamInfo;

+(NSMutableArray *) getSpainPlayers;
+(NSMutableArray *) getSpainTeamInfo;

+(NSMutableArray *) getBrazilPlayers;
+(NSMutableArray *) getBrazilTeamInfo;

+(NSMutableArray *) getHollandPlayers;
+(NSMutableArray *) getHollandTeamInfo;

+(NSMutableArray *) getArgentinaPlayers;
+(NSMutableArray *) getArgentinaTeamInfo;

+(NSMutableArray *) getGermanyPlayers;
+(NSMutableArray *) getGermanyTeamInfo;

+(NSMutableArray *) getGhanaPlayers;
+(NSMutableArray *) getGhanaTeamInfo;

//+(NSMutableArray *) getGermanPlayers;
//+(NSMutableArray *) getGermanTeamInfo;

+(NSMutableArray *) getPortugalPlayers;
+(NSMutableArray *) getPortugalTeamInfo;

+(NSMutableArray *) getBelgiumPlayers;
+(NSMutableArray *) getBelgiumTeamInfo;

+(NSMutableArray *) getJapanPlayers;
+(NSMutableArray *) getJapanTeamInfo;

+(NSMutableArray *) getUsaPlayers;
+(NSMutableArray *) getUsaTeamInfo;

+(NSMutableArray *) getIvoryCoastPlayers;
+(NSMutableArray *) getIvoryCoastTeamInfo;

+(NSMutableArray *) getWalesPlayers;
+(NSMutableArray *) getWalesTeamInfo;

@end
    
#endif /* TeamsInfo_h */

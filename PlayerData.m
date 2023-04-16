//
//  PlayerData.m
//  MicroSoccer5
//
//  Created by Trevor Delves on 09/04/2016.
//  Copyright © 2016 Apportable. All rights reserved.
//
//

#import "PlayerData.h"

#define NAME_INDEX              0
#define SKIN_INDEX              1
#define HAIR_INDEX              2
#define POSITION_INDEX          3
#define SPEED_INDEX             4
#define SKILL_INDEX             5
#define STRENGTH_INDEX          6
#define SLIDING_INDEX           7
#define SHOT_POWER_INDEX        8
#define SHOT_ACCURACY_INDEX     9



@implementation PlayerData

@synthesize playerName;
@synthesize position;
@synthesize skinColour;
@synthesize hairColour;
@synthesize speed;
@synthesize strength;
@synthesize skill;
@synthesize sliding;
@synthesize shotPower;
@synthesize shotAccuracy;



-(id) initWithStats:(NSMutableArray *)stats {
    if( (self=[super init] )) {
        
        self.playerName=(NSString *) [stats objectAtIndex:NAME_INDEX];
        self.skinColour=[(NSNumber*) [stats objectAtIndex:SKIN_INDEX] intValue];
        self.hairColour=[(NSNumber*) [stats objectAtIndex:HAIR_INDEX] intValue];
        self.position=  [(NSNumber *) [stats objectAtIndex:POSITION_INDEX] intValue];
        self.speed=     [(NSNumber*) [stats objectAtIndex:SPEED_INDEX]  intValue];
        self.skill= [(NSNumber*)[stats objectAtIndex:SKILL_INDEX] intValue];
        self.strength= [(NSNumber*)[stats objectAtIndex:STRENGTH_INDEX] intValue];
        self.sliding= [(NSNumber*)[stats objectAtIndex:SLIDING_INDEX] intValue];
        self.shotPower= [(NSNumber*)[stats objectAtIndex:SHOT_POWER_INDEX] intValue];
        self.shotAccuracy= [(NSNumber*)[stats objectAtIndex:SHOT_ACCURACY_INDEX] intValue];
    
    }
    
    //[self release];
    return self;
}

@end

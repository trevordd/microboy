//
//  PlayerData.h
//  MicroSoccer5
//
//  Created by Trevor Delves on 09/04/2016.
//  Copyright © 2016 Apportable. All rights reserved.
//

#ifndef PlayerData_h
#define PlayerData_h

#import <Foundation/Foundation.h>

//enum stripType {FULL,SLEEVES, STRIPES};
//enum skinColour {WHITE, LIGHT_BROWN, DARK_BROWN};
//enum hairColour {BLACK, BROWN, GINGER};
//

@interface PlayerData : NSObject {
    //NSMutableArray *playerStats;
    NSString *playerName;
    int position;
    
    int skinColour;
    int hairColour;

    int speed;
    int strength;
    int skill;
    int sliding;
    int shotPower;
    int shotAccuracy;
    
    // add keeper info?
      
    
    // StripType
    // StripMainColour
    // StripSecondaryColour
    // Shorts Color
    
    /* Player Data
     
     - Name
     - Skin Color
     - Hair Color
     - Position
     - Speed
     - Skill
     - Strength
     - Sliding
     - Shooting Power
     - Shooting Accuracy
     
     */
}

@property (strong, nonatomic) NSString *playerName;
@property (nonatomic) int position;
@property (nonatomic) int skinColour;
@property (nonatomic) int hairColour;
@property (nonatomic) int speed;
@property (nonatomic) int strength;
@property (nonatomic) int skill;
@property (nonatomic) int sliding;
@property (nonatomic) int shotPower;
@property (nonatomic) int shotAccuracy;



-(id) initWithStats:(NSMutableArray *)stats;

@end
#endif /* PlayerData_h */










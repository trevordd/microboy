//
//  Formation.h
//  mySoccer
//
//  Created by Trevor Delves on 09/01/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "FormationPosition.h"



@interface Formation : NSObject {
    NSMutableArray *strikerRightPositions;
    NSMutableArray *strikerCenterRightPositions;
    NSMutableArray *strikerCenterLeftPositions;
    NSMutableArray *strikerCenterPositions;
    NSMutableArray *strikerLeftPositions;
    
    NSMutableArray *strikerAttackingRightPositions;
    NSMutableArray *strikerAttackingCenterRightPositions;
    NSMutableArray *strikerAttackingCenterLeftPositions;
    NSMutableArray *strikerAttackingCenterPositions;
    NSMutableArray *strikerAttackingLeftPositions;
    
    NSMutableArray *midfieldRightPositions;
    NSMutableArray *midfieldCenterLeftPositions;
    NSMutableArray *midfieldCenterPositions;
    NSMutableArray *midfieldCenterRightPositions;
    NSMutableArray *midfieldLeftPositions;
    
    NSMutableArray *defenseRightPositions;
    NSMutableArray *defenseCenterRightPositions;
    NSMutableArray *defenseCenterPositions;
    NSMutableArray *defenseCenterLeftPositions;
    NSMutableArray *defenseLeftPositions; 
    
    NSMutableArray *lineUpPositionsFaceUp;
    NSMutableArray *lineUpPositionsFaceDown;
    
    FormationPosition *leftBack;
    FormationPosition *leftCenterBack;
    FormationPosition *middleCenterBack;
    FormationPosition *rightCenterBack;
    FormationPosition *rightBack;
    
    FormationPosition *leftMidfied;
    FormationPosition *leftCenterMidfield;
    FormationPosition *middleCenterMidfield;
    FormationPosition *rightCenterMidfield;
    FormationPosition *rightMidfield;
    
    FormationPosition *leftStriker;
    FormationPosition *leftCenterStriker;
    FormationPosition *middleCenterStriker;
    FormationPosition *rightCenterStriker;
    FormationPosition *rightStriker;
}

@property (strong, nonatomic) FormationPosition *leftBack;
@property (strong, nonatomic) FormationPosition *leftCenterBack;
@property (strong, nonatomic) FormationPosition *middleCenterBack;
@property (strong, nonatomic) FormationPosition *rightCenterBack;
@property (strong, nonatomic) FormationPosition *rightBack;

@property (strong, nonatomic) FormationPosition *leftMidfied;
@property (strong, nonatomic) FormationPosition *leftCenterMidfield;
@property (strong, nonatomic) FormationPosition *middleCenterMidfield;
@property (strong, nonatomic) FormationPosition *rightCenterMidfield;
@property (strong, nonatomic) FormationPosition *rightMidfield;

@property (strong, nonatomic) FormationPosition *leftStriker;
@property (strong, nonatomic) FormationPosition *leftCenterStriker;
@property (strong, nonatomic) FormationPosition *middleCenterStriker;
@property (strong, nonatomic) FormationPosition *rightCenterStriker;
@property (strong, nonatomic) FormationPosition *rightStriker;



+(int) getZone:(CGPoint)pos;
+(int) getReverseZone:(CGPoint)pos;
-(void) setPositions;
-(NSMutableArray *)getStrikerCenterLeftPosition;
-(NSMutableArray *)getStrikerCenterRightsPosition;
-(NSMutableArray *)getStrikerRightPosition;
-(NSMutableArray *)getStrikerCenterPosition;
-(NSMutableArray *)getStrikerLeftPosition;

-(NSMutableArray *)getStrikerAttackingCenterLeftPosition;
-(NSMutableArray *)getStrikerAttackingCenterRightsPosition;
-(NSMutableArray *)getStrikerAttackingRightPosition;
-(NSMutableArray *)getStrikerAttackingCenterPosition;
-(NSMutableArray *)getStrikerAttackingLeftPosition;

-(NSMutableArray *)getMidfieldRightPosition;
-(NSMutableArray *)getMidfieldCenterRightPosition;
-(NSMutableArray *)getMidfieldCenterPosition;
-(NSMutableArray *)getMidfieldCenterLeftPosition;
-(NSMutableArray *)getMidfieldLeftPosition;

-(NSMutableArray *)getDefenseRightPosition;
-(NSMutableArray *)getDefenseCenterRightPosition;
-(NSMutableArray *)getDefenseCenterPosition;
-(NSMutableArray *)getDefenseCenterLeftPosition;
-(NSMutableArray *)getDefenseLeftPosition;

-(void) setLineupPositionsFacingUp;
-(void) setLineupPositionsFacingDown;

-(void) setLineupPositionsFacingUp433;
-(void) setLineupPositionsFacingDown433;

-(void) setLineupPositionsFacingUp424;
-(void) setLineupPositionsFacingDown424;

-(void) setLineupPositionsFacingUp442;
-(void) setLineupPositionsFacingDown442;

-(void) setLineupPositionsFacingUp451;
-(void) setLineupPositionsFacingDown451;

-(void) setLineupPositionsFacingUp343;
-(void) setLineupPositionsFacingDown343;

-(NSMutableArray *)getLineupPositionsFacingUp;
-(NSMutableArray *)getLineupPositionsFacingDown;

//-(NSMutableArray *)getLineupPositionsFacingUp433;
//-(NSMutableArray *)getLineupPositionsFacingDown433;



@end
